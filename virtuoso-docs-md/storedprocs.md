<div>

<div>

<div>

<div>

## 21.9. Stored Procedures

</div>

</div>

</div>

``` programlisting
--
--  tpcc.sql
--
--  Implementation of the TPC C Benchmark transactions as stored procedures.
--
--  These are for use with the tpcc test driver (tpcc) in the Virtuoso sample
--  directory.  See TPCC.DOC in the virtuoso documentation bundle for comments
--  and instructions.
--
--  Copyright (C) 1998-2024 OpenLink Software.
--  All Rights Reserved.
--
--  The copyright above and this notice must be preserved in all
--  copies of this source code.  The copyright above does not
--  evidence any actual or intended publication of this source code.
--
--  This is unpublished proprietary trade secret of OpenLink Software.
--  This source code may not be copied, disclosed, distributed, demonstrated
--  or licensed except as authorized by OpenLink Software.
--

--  slevel - The transaction procedure for the Stock Level transaction.
--
--  This is executed as an autocommitting history read transaction. The number
--  of STOCK rows where quantity is below th threshold.  The rows are taken
--  from the last 20 orders on a warehouse / district combination.

CREATE PROCEDURE SLEVEL (
    IN W_ID     INTEGER,
    IN D_ID     INTEGER,
    IN THRESHOLD    INTEGER)
{
    DECLARE LAST_O, N_ITEMS INTEGER;

    SELECT D_NEXT_O_ID INTO LAST_O
    FROM DISTRICT
    WHERE
        D_W_ID = W_ID
    AND D_ID = D_ID;

    SELECT COUNT (DISTINCT S_I_ID)
    INTO N_ITEMS
    FROM ORDER_LINE, STOCK
    WHERE
        OL_W_ID = W_ID
    AND OL_D_ID = D_ID
    AND OL_O_ID < LAST_O
    AND OL_O_ID >= LAST_O - 20
    AND S_W_ID = W_ID
    AND S_I_ID = OL_I_ID AND S_QUANTITY < THRESHOLD;

    RESULT_NAMES (N_ITEMS);

    RESULT (N_ITEMS);
}

--
-- c_by_name, call_c_by_name
-- Examples on retrieving CUSTOMER by last name.
-- Functionality open coded in actual transaction procedures.
--

CREATE PROCEDURE C_BY_NAME (
    IN  W_ID        INTEGER,
    IN  D_ID        INTEGER,
    IN  NAME        VARCHAR,
    OUT ID      INTEGER)
{
    DECLARE N, C_COUNT INTEGER;

    DECLARE C_CUR CURSOR FOR
    SELECT C_ID
    FROM CUSTOMER
    WHERE
        C_W_ID = W_ID
    AND C_D_ID = D_ID
    AND C_LAST = NAME
    ORDER BY C_W_ID, C_D_ID, C_LAST, C_FIRST;

    SELECT COUNT (*) INTO C_COUNT
    FROM CUSTOMER
    WHERE
        C_W_ID = W_ID
    AND C_D_ID = D_ID
    AND C_LAST = NAME;

    N := 0;
    OPEN C_CUR;
    WHENEVER NOT FOUND GOTO NOTFOUND;

    WHILE (N <= C_COUNT / 2) {
    FETCH C_CUR INTO ID;
    N := N + 1;
    }
    RETURN;

NOTFOUND:
    SIGNAL ('CNF', 'CUSTOMER NOT FOUND BY NAME');
    RETURN;
}

CREATE PROCEDURE CALL_C_BY_NAME (
    IN W_ID     INTEGER,
    IN D_ID         INTEGER,
    IN C_LAST       VARCHAR)
{
    DECLARE C_ID INTEGER;

    C_BY_NAME (W_ID, D_ID, C_LAST, C_ID);
}

--
-- payment
-- This procedure implements the Payment transaction.
--

CREATE PROCEDURE BC_C_DATA (
    INOUT C_NEW     VARCHAR,
    INOUT C_DATA    VARCHAR)
{
    RETURN (
    CONCATENATE (C_NEW, SUBSEQ (C_DATA, LENGTH (C_NEW), LENGTH (C_DATA))));
}

CREATE PROCEDURE PAYMENT (
    IN _W_ID        INTEGER,
    IN _C_W_ID      INTEGER,
    IN H_AMOUNT     FLOAT,
    IN _D_ID        INTEGER,
    IN _C_D_ID      INTEGER,
    IN _C_ID        INTEGER,
    IN _C_LAST      VARCHAR)
{
    DECLARE
    _C_DATA, _C_FIRST, _C_MIDDLE, _C_STREET_1,  _C_STREET_2, _C_CITY,
    _C_STATE, _C_ZIP, _C_PHONE, _C_CREDIT, _C_CREDIT_LIM, _C_DISCOUNT,
    _C_BALANCE, _C_SINCE, _C_DATA_1, _C_DATA_2 VARCHAR;

    DECLARE
    N, _W_YTD, _D_YTD, _C_CNT_PAYMENT INTEGER;

    DECLARE
    _D_STREET_1, _D_STREET_2, _D_CITY, _D_STATE, _D_ZIP, _D_NAME VARCHAR;

    DECLARE
    _W_STREET_1, _W_STREET_2, _W_CITY, _W_STATE, _W_ZIP, _W_NAME,
    SCREEN_DATA VARCHAR;

    IF (_C_ID = 0) {
    DECLARE NAMECNT INTEGER;
    WHENEVER NOT FOUND GOTO NO_CUSTOMER;

    SELECT COUNT(C_ID) INTO NAMECNT
    FROM CUSTOMER
    WHERE
        C_LAST = _C_LAST
        AND C_D_ID = _D_ID
        AND C_W_ID = _W_ID;

    DECLARE C_BYNAME CURSOR FOR
    SELECT C_ID
    FROM CUSTOMER
    WHERE
        C_W_ID = _C_W_ID
        AND C_D_ID = _C_D_ID
        AND C_LAST = _C_LAST
    ORDER BY
        C_W_ID, C_D_ID, C_LAST, C_FIRST;

    OPEN C_BYNAME (EXCLUSIVE);

    N := 0;
    WHILE (N <= NAMECNT / 2) {
        FETCH C_BYNAME   INTO _C_ID;
        N := N + 1;
    }

    CLOSE C_BYNAME;
    }

    DECLARE C_CR CURSOR FOR
    SELECT
    C_FIRST, C_MIDDLE, C_LAST, C_STREET_1, C_STREET_2, C_CITY,
    C_STATE, C_ZIP, C_PHONE, C_CREDIT, C_CREDIT_LIM, C_DISCOUNT,
    C_BALANCE, C_SINCE, C_DATA_1, C_DATA_2, C_CNT_PAYMENT
    FROM
    CUSTOMER
    WHERE
        C_W_ID = _C_W_ID
    AND C_D_ID = _C_D_ID
    AND C_ID = _C_ID;

    OPEN C_CR (EXCLUSIVE);

    FETCH C_CR INTO
    _C_FIRST, _C_MIDDLE, _C_LAST,
    _C_STREET_1, _C_STREET_2, _C_CITY, _C_STATE, _C_ZIP,
    _C_PHONE, _C_CREDIT, _C_CREDIT_LIM,
    _C_DISCOUNT, _C_BALANCE, _C_SINCE, _C_DATA_1, _C_DATA_2,
    _C_CNT_PAYMENT;

    _C_BALANCE := _C_BALANCE + H_AMOUNT;

    IF (_C_CREDIT = 'BC') {
    UPDATE CUSTOMER
    SET C_BALANCE = _C_BALANCE,
        C_DATA_1 = BC_C_DATA (
        SPRINTF ('%5d%5d%5d%5d%5d%9f',
            _C_ID, _C_D_ID, _C_W_ID, _D_ID, _W_ID, H_AMOUNT),
        _C_DATA_1),
        C_CNT_PAYMENT = _C_CNT_PAYMENT + 1
    WHERE CURRENT OF C_CR;
    SCREEN_DATA := SUBSEQ (_C_DATA_1, 1, 200);
    } ELSE {
    UPDATE CUSTOMER
    SET C_BALANCE = _C_BALANCE, C_CNT_PAYMENT = _C_CNT_PAYMENT + 1
    WHERE CURRENT OF C_CR;
    SCREEN_DATA := ' ';
    }

    DECLARE D_CUR CURSOR FOR
    SELECT D_STREET_1, D_STREET_2, D_CITY, D_STATE, D_ZIP, D_NAME, D_YTD
    FROM DISTRICT
    WHERE
        D_W_ID = _W_ID
    AND D_ID = _D_ID;

    OPEN D_CUR (EXCLUSIVE);

    FETCH D_CUR INTO
    _D_STREET_1,  _D_STREET_2, _D_CITY, _D_STATE, _D_ZIP,  _D_NAME, _D_YTD;

    UPDATE DISTRICT SET D_YTD = _D_YTD + H_AMOUNT WHERE CURRENT OF D_CUR;

    CLOSE D_CUR;

    DECLARE W_CUR CURSOR FOR
    SELECT  W_STREET_1, W_STREET_2, W_CITY, W_STATE, W_ZIP, W_NAME, W_YTD
    FROM WAREHOUSE
    WHERE W_ID = _W_ID;

    OPEN W_CUR (EXCLUSIVE);
    FETCH  W_CUR INTO
    _W_STREET_1, _W_STREET_2, _W_CITY, _W_STATE, _W_ZIP, _W_NAME, _W_YTD;

    UPDATE WAREHOUSE SET W_YTD = _W_YTD + H_AMOUNT;

    DECLARE H_DATA VARCHAR;
    H_DATA := _W_NAME;

    INSERT INTO HISTORY
    (H_C_D_ID, H_C_W_ID, H_C_ID, H_D_ID, H_W_ID, H_DATE, H_AMOUNT, H_DATA)
    VALUES
    (_C_D_ID, _C_W_ID, _C_ID, _D_ID, _W_ID, NOW (), H_AMOUNT, H_DATA);

    RESULT (
    _C_ID, _C_LAST, NOW (), _W_STREET_1, _W_STREET_2, _W_CITY, _W_STATE,
    _W_ZIP, _D_STREET_1, _D_STREET_2, _D_CITY, _D_STATE, _D_ZIP,
    _C_FIRST, _C_MIDDLE, _C_STREET_1, _C_STREET_2, _C_CITY, _C_STATE,
    _C_ZIP, _C_PHONE, _C_SINCE, _C_CREDIT, _C_CREDIT_LIM, _C_DISCOUNT,
    _C_BALANCE, SCREEN_DATA);

    RETURN;

NO_CUSTOMER:
    SIGNAL ('NOCUS', 'NO CUSTOMER IN PAYMENT.');
}

-- ol_stock - Part of the New Order transaction - Set the stock level for
-- an order line.  Compute the price and return it in amount.
--
-- Note - Open the cursor on STOCK as exclusive to avoid deadlocks.
-- Use positioned update on STOCK for speed.
--
-- Fetch the s_dist_01 - 10 columns from STOCK even though they are not used.
-- The test specification requires this. The operation is measurably faster if these
-- are omitted.-- The ORDER LINE is inserted later for better lock concurrency.

CREATE PROCEDURE OL_STOCK (
    IN    _W_ID         INTEGER,
    IN    D_ID          INTEGER,
    INOUT _OL_I_ID      INTEGER,
    IN    _OL_SUPPLY_W_ID   INTEGER,
    IN    QTY           INTEGER,
    OUT   AMOUNT        FLOAT,
    INOUT S_DIST_01     VARCHAR,
    INOUT S_DIST_02     VARCHAR,
    INOUT S_DIST_03     VARCHAR,
    INOUT S_DIST_04     VARCHAR,
    INOUT S_DIST_05     VARCHAR,
    INOUT S_DIST_06     VARCHAR,
    INOUT S_DIST_07     VARCHAR,
    INOUT S_DIST_08     VARCHAR,
    INOUT S_DIST_09     VARCHAR,
    INOUT S_DIST_10     VARCHAR,
    INOUT DIST_INFO     VARCHAR)
{
    IF (_OL_I_ID = 0) RETURN;

    DECLARE _S_DATA VARCHAR;
    DECLARE _S_QUANTITY, _S_CNT_ORDER, _S_CNT_REMOTE INTEGER;

    WHENEVER NOT FOUND GOTO NO_ITEM;

    DECLARE _I_NAME VARCHAR;

    SELECT
    I_PRICE, I_NAME
    INTO
    AMOUNT, _I_NAME
    FROM
    ITEM
    WHERE I_ID = _OL_I_ID;

    DECLARE S_CUR CURSOR FOR
    SELECT
    S_QUANTITY, S_DATA, S_CNT_ORDER, S_CNT_REMOTE,
    S_DIST_01, S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05,
    S_DIST_06, S_DIST_07, S_DIST_08, S_DIST_09, S_DIST_10
    FROM STOCK
    WHERE
        S_I_ID = _OL_I_ID
    AND S_W_ID = _OL_SUPPLY_W_ID;

    WHENEVER NOT FOUND GOTO NO_STOCK;

    OPEN S_CUR (EXCLUSIVE);

    FETCH S_CUR INTO
    _S_QUANTITY, _S_DATA, _S_CNT_ORDER, _S_CNT_REMOTE,
    S_DIST_01, S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05,
    S_DIST_06, S_DIST_07, S_DIST_08, S_DIST_09, S_DIST_10;

    IF (_S_QUANTITY < QTY)
    _S_QUANTITY := _S_QUANTITY - QTY + 91;
    ELSE
    _S_QUANTITY := _S_QUANTITY - QTY;

    IF (_W_ID <> _OL_SUPPLY_W_ID)
    _S_CNT_REMOTE := _S_CNT_REMOTE + 1;

    UPDATE STOCK
    SET
    S_QUANTITY = _S_QUANTITY,
    S_CNT_ORDER = _S_CNT_ORDER + 1,
    S_CNT_REMOTE = _S_CNT_REMOTE
    WHERE CURRENT OF S_CUR;

    IF (D_ID = 1)       DIST_INFO := S_DIST_01;
    ELSE IF (D_ID = 2)  DIST_INFO := S_DIST_02;
    ELSE IF (D_ID = 3)  DIST_INFO := S_DIST_03;
    ELSE IF (D_ID = 4)  DIST_INFO := S_DIST_04;
    ELSE IF (D_ID = 5)  DIST_INFO := S_DIST_05;
    ELSE IF (D_ID = 6)  DIST_INFO := S_DIST_06;
    ELSE IF (D_ID = 7)  DIST_INFO := S_DIST_07;
    ELSE IF (D_ID = 8)  DIST_INFO := S_DIST_08;
    ELSE IF (D_ID = 9)  DIST_INFO := S_DIST_09;
    ELSE IF (D_ID = 10) DIST_INFO := S_DIST_10;

    RESULT (_I_NAME, _S_QUANTITY, 'G', AMOUNT, AMOUNT * QTY);

    AMOUNT := QTY * AMOUNT;

    RETURN;

NO_STOCK:
    SIGNAL ('NOSTK', 'NO STOCK ROW FOUND.');
NO_ITEM:
    SIGNAL ('NOITM', 'NO ITEM ROW FOUND.');
}

--
-- ol_insert - Part of New Order transaction. Insert an ORDER LINE.
--
-- Note use of inout parameters even though they are not modified here.
-- This saves copying the values.

CREATE PROCEDURE OL_INSERT (
    INOUT W_ID          INTEGER,
    INOUT D_ID          INTEGER,
    INOUT O_ID          INTEGER,
    IN    OL_NUMBER     INTEGER,
    INOUT OL_I_ID       INTEGER,
    INOUT OL_QTY        INTEGER,
    INOUT OL_AMOUNT     FLOAT,
    INOUT OL_SUPPLY_W_ID    INTEGER,
    INOUT OL_DIST_INFO      VARCHAR,
    INOUT TAX_AND_DISCOUNT  FLOAT)
{
    IF (OL_I_ID = -1) RETURN;

    OL_AMOUNT := OL_AMOUNT * TAX_AND_DISCOUNT;

    INSERT INTO ORDER_LINE (
    OL_O_ID, OL_D_ID, OL_W_ID, OL_NUMBER, OL_I_ID, OL_SUPPLY_W_ID,
    OL_QUANTITY, OL_AMOUNT, OL_DIST_INFO)
    VALUES (
    O_ID, D_ID, W_ID, OL_NUMBER, OL_I_ID, OL_SUPPLY_W_ID,
    OL_QTY, OL_AMOUNT, OL_DIST_INFO);
}

--
-- cust_info - part of New Order transaction. Return customer info.
--
--

CREATE PROCEDURE CUST_INFO (
    IN    W_ID INTEGER,
    IN    D_ID INTEGER,
    INOUT _C_ID INTEGER,
    INOUT _C_LAST VARCHAR,
    OUT    _C_DISCOUNT FLOAT,
    OUT    _C_CREDIT VARCHAR)
{
    WHENEVER NOT FOUND GOTO ERR;

    SELECT
    C_LAST, C_DISCOUNT, C_CREDIT INTO _C_LAST, _C_DISCOUNT, _C_CREDIT
    FROM
    CUSTOMER
    WHERE
        C_W_ID = W_ID
    AND C_D_ID = D_ID
    AND C_ID = _C_ID;
    RETURN;
ERR:
    SIGNAL ('NOCUS', 'NO CUSTOMER');
}

-- new_order - Top level procedure of New Order transaction.
-- Take a fixed 10 order lines as individually named parameters
-- to stay easily portable.

CREATE PROCEDURE NEW_ORDER (
    IN _W_ID        INTEGER,
    IN _D_ID        INTEGER,
    IN _C_ID        INTEGER,
    IN O_OL_CNT     INTEGER,
    IN O_ALL_LOCAL  INTEGER,
    IN I_ID_1       INTEGER,
    IN S_W_ID_1     INTEGER,
    IN QTY_1        INTEGER,
    IN I_ID_2       INTEGER,
    IN S_W_ID_2     INTEGER,
    IN QTY_2        INTEGER,
    IN I_ID_3       INTEGER,
    IN S_W_ID_3     INTEGER,
    IN QTY_3        INTEGER,
    IN I_ID_4       INTEGER,
    IN S_W_ID_4     INTEGER,
    IN QTY_4        INTEGER,
    IN I_ID_5       INTEGER,
    IN S_W_ID_5     INTEGER,
    IN QTY_5        INTEGER,
    IN I_ID_6       INTEGER,
    IN S_W_ID_6     INTEGER,
    IN QTY_6        INTEGER,
    IN I_ID_7       INTEGER,
    IN S_W_ID_7     INTEGER,
    IN QTY_7        INTEGER,
    IN I_ID_8       INTEGER,
    IN S_W_ID_8     INTEGER,
    IN QTY_8        INTEGER,
    IN I_ID_9       INTEGER,
    IN S_W_ID_9     INTEGER,
    IN QTY_9        INTEGER,
    IN I_ID_10      INTEGER,
    IN S_W_ID_10    INTEGER,
    IN QTY_10       INTEGER)
{
    DECLARE
    OL_A_1, OL_A_2, OL_A_3, OL_A_4, OL_A_5,
    OL_A_6, OL_A_7, OL_A_8, OL_A_9, OL_A_10 INTEGER;
    DECLARE _C_DISCOUNT, _D_TAX, _W_TAX, TAX_AND_DISCOUNT FLOAT;
    DECLARE DATETIME DATE;
    DECLARE  _C_LAST, _C_CREDIT VARCHAR;
    DECLARE _O_ID INTEGER;

    DECLARE
    I_NAME, S_DIST_01, S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05,
    S_DIST_06, S_DIST_07, S_DIST_08, S_DIST_09, S_DIST_10 VARCHAR;
    DECLARE
    DISTI_1, DISTI_2, DISTI_3, DISTI_4, DISTI_5,
    DISTI_6, DISTI_7, DISTI_8, DISTI_9, DISTI_10 VARCHAR;

    DATETIME := NOW ();

    -- DECLARE RESULT ROW FROM OL_STOCK. OPTIONAL.;
    RESULT_NAMES (I_NAME, QTY_1, DISTI_1, OL_A_1, OL_A_2);

    OL_STOCK (
    _W_ID, _D_ID, I_ID_1, S_W_ID_1, QTY_1, OL_A_1, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_1);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_2, S_W_ID_2, QTY_2, OL_A_2, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_2);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_3, S_W_ID_3, QTY_3, OL_A_3, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_3);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_4, S_W_ID_4, QTY_4, OL_A_4, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_4);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_5, S_W_ID_5, QTY_5, OL_A_5, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_5);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_6, S_W_ID_6, QTY_6, OL_A_6, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_6);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_7, S_W_ID_7, QTY_7, OL_A_7, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_7);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_8, S_W_ID_8, QTY_8, OL_A_8, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_8);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_9, S_W_ID_9, QTY_8, OL_A_9, S_DIST_01, S_DIST_02,
    S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07, S_DIST_08,
    S_DIST_09, S_DIST_10, DISTI_9);
    OL_STOCK (
    _W_ID, _D_ID, I_ID_10, S_W_ID_10, QTY_10, OL_A_10, S_DIST_01,
    S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05, S_DIST_06, S_DIST_07,
    S_DIST_08, S_DIST_09, S_DIST_10, DISTI_10);

    CUST_INFO (_W_ID, _D_ID, _C_ID, _C_LAST, _C_DISCOUNT, _C_CREDIT);

    DECLARE  D_CUR CURSOR FOR
    SELECT
    D_TAX, D_NEXT_O_ID
    FROM
    DISTRICT
    WHERE
        D_W_ID = _W_ID
    AND D_ID = _D_ID;

    WHENEVER NOT FOUND GOTO NOWARE;

    OPEN D_CUR (EXCLUSIVE);
    FETCH D_CUR INTO _D_TAX, _O_ID;
    UPDATE DISTRICT SET D_NEXT_O_ID = _O_ID + 1 WHERE CURRENT OF D_CUR;
    CLOSE D_CUR;

    INSERT INTO ORDERS
    (O_ID, O_D_ID, O_W_ID, O_C_ID, O_ENTRY_D, O_OL_CNT, O_ALL_LOCAL)
    VALUES (_O_ID, _D_ID, _W_ID, _C_ID, DATETIME, O_OL_CNT, O_ALL_LOCAL);

    INSERT INTO NEW_ORDER
    (NO_O_ID, NO_D_ID, NO_W_ID)
    VALUES (_O_ID, _D_ID, _W_ID);

    SELECT W_TAX INTO _W_TAX FROM WAREHOUSE WHERE W_ID = _W_ID;

    TAX_AND_DISCOUNT := (1 + _D_TAX + _W_TAX) * (1 - _C_DISCOUNT);

    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 1, I_ID_1, QTY_1, OL_A_1,  S_W_ID_1, DISTI_1,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 2, I_ID_2, QTY_2, OL_A_2,  S_W_ID_2, DISTI_2,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 3, I_ID_3, QTY_3, OL_A_3,  S_W_ID_3, DISTI_3,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 4, I_ID_4, QTY_4, OL_A_4,  S_W_ID_4, DISTI_4,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 5, I_ID_5, QTY_5, OL_A_5,  S_W_ID_5, DISTI_5,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 6, I_ID_6, QTY_6, OL_A_6,  S_W_ID_6, DISTI_6,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 7, I_ID_7, QTY_7, OL_A_7,  S_W_ID_7, DISTI_7,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 8, I_ID_6, QTY_8, OL_A_8,  S_W_ID_8, DISTI_8,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 9, I_ID_9, QTY_9, OL_A_9,  S_W_ID_9, DISTI_9,
    TAX_AND_DISCOUNT);
    OL_INSERT (
    _W_ID, _D_ID, _O_ID, 10, I_ID_10, QTY_10, OL_A_10,  S_W_ID_10, DISTI_10,
    TAX_AND_DISCOUNT);

    END_RESULT ();
    RESULT (_W_TAX, _D_TAX, _O_ID, _C_LAST, _C_DISCOUNT, _C_CREDIT);
    RETURN;

NOWARE:
    SIGNAL ('NOWRE', 'WAREHOUSE OR DISTRICTNOT FOUND.');
}

-- delivery_1 - Top level procedure for the Delivery transaction
--
-- This is called 10 times by the client in each delivery transaction.
-- The rules allow Delivery to be implemented as up to 10 separately committed
-- transactions. This is done to minimize lock duration.

CREATE PROCEDURE DELIVERY_1 (
    IN W_ID     INTEGER,
    IN CARRIER_ID   INTEGER,
    IN D_ID         INTEGER)
{
    DECLARE NO_CUR CURSOR FOR
    SELECT
    NO_O_ID
    FROM
    NEW_ORDER
    WHERE
        NO_W_ID = W_ID
    AND NO_D_ID = D_ID;

    DECLARE DATETIME DATE;
    DECLARE _O_ID, _C_ID INTEGER;
    DECLARE OL_TOTAL FLOAT;
    DATETIME := NOW ();

    OPEN NO_CUR (EXCLUSIVE, PREFETCH 1);
    FETCH NO_CUR INTO _O_ID;
    DELETE FROM NEW_ORDER WHERE CURRENT OF NO_CUR;
    CLOSE NO_CUR;

    DECLARE O_CUR CURSOR FOR
    SELECT
    O_C_ID
    FROM
    ORDERS
    WHERE
        O_W_ID = W_ID
    AND O_D_ID = D_ID
    AND O_ID = _O_ID;

    OPEN O_CUR (EXCLUSIVE);
    FETCH O_CUR INTO _C_ID;
    UPDATE ORDERS SET O_CARRIER_ID = CARRIER_ID WHERE CURRENT OF O_CUR;
    CLOSE O_CUR;

    DECLARE OL_CUR CURSOR FOR
    SELECT
    OL_AMOUNT
    FROM
    ORDER_LINE
    WHERE
        OL_W_ID = W_ID
    AND OL_D_ID = D_ID
    AND OL_O_ID = _O_ID;

    WHENEVER NOT FOUND GOTO LINES_DONE;
    OL_TOTAL := 0.0;
    OPEN OL_CUR (EXCLUSIVE);
    WHILE (1) {
    DECLARE TMP INTEGER;
    FETCH OL_CUR INTO TMP;
    OL_TOTAL := OL_TOTAL + TMP;
    UPDATE ORDER_LINE SET OL_DELIVERY_D = DATETIME WHERE CURRENT OF OL_CUR;
    }
LINES_DONE:
    UPDATE CUSTOMER
    SET
    C_BALANCE = C_BALANCE + OL_TOTAL,
    C_CNT_DELIVERY = C_CNT_DELIVERY + 1
    WHERE
        C_W_ID = W_ID
    AND C_D_ID = D_ID
    AND C_ID = _C_ID;

    RETURN _O_ID;
}

-- ostat - Top level procedure for the Order Status transaction.
--
--

CREATE PROCEDURE OSTAT (
    IN _W_ID        INTEGER,
    IN _D_ID        INTEGER,
    IN _C_ID        INTEGER,
    IN _C_LAST      VARCHAR)
{
    DECLARE _C_FIRST, _C_MIDDLE, _C_BALANCE VARCHAR;
    DECLARE
    _O_ID, _OL_I_ID, _OL_SUPPLY_W_ID, _OL_QUANTITY, _O_CARRIER_ID,
    N INTEGER;
    DECLARE _OL_AMOUNT FLOAT;
    DECLARE _OL_DELIVERY_D, _O_ENTRY_D VARCHAR;

    IF (_C_ID = 0) {
    DECLARE NAMECNT INTEGER;
    WHENEVER NOT FOUND GOTO NO_CUSTOMER;

    SELECT COUNT (*)
    INTO NAMECNT
    FROM CUSTOMER
    WHERE
            C_LAST = _C_LAST
        AND C_D_ID = _D_ID
        AND C_W_ID = _W_ID;

    DECLARE C_BYNAME CURSOR FOR
    SELECT
        C_BALANCE, C_LAST, C_MIDDLE, C_ID
    FROM CUSTOMER
    WHERE
        C_W_ID = _W_ID
        AND C_D_ID = _D_ID
        AND C_LAST = _C_LAST
    ORDER BY
        C_W_ID, C_D_ID, C_LAST, C_FIRST;

    OPEN C_BYNAME;

    N := 0;
    WHILE (N <= NAMECNT / 2) {
        FETCH C_BYNAME INTO _C_BALANCE, _C_FIRST, _C_MIDDLE, _C_ID;
        N := N + 1;
    }

    CLOSE C_BYNAME;
    }  ELSE {
    SELECT
        C_BALANCE, C_FIRST, C_MIDDLE, C_LAST
    INTO
        _C_BALANCE, _C_FIRST, _C_MIDDLE, _C_LAST
    FROM
        CUSTOMER
    WHERE
        C_W_ID = _W_ID
        AND C_D_ID = _D_ID
        AND C_ID = _C_ID;
    }

    WHENEVER NOT FOUND GOTO NO_ORDER;
    SELECT
    O_ID, O_CARRIER_ID, O_ENTRY_D
    INTO
    _O_ID, _O_CARRIER_ID, _O_ENTRY_D
    FROM
    ORDERS
    WHERE
        O_W_ID = _W_ID
    AND O_D_ID = _D_ID
    AND O_C_ID = _C_ID
    ORDER BY
    O_W_ID DESC, O_D_ID DESC, O_C_ID DESC, O_ID DESC;

    DECLARE O_LINE CURSOR FOR
    SELECT
    OL_I_ID, OL_SUPPLY_W_ID, OL_QUANTITY, OL_AMOUNT, OL_DELIVERY_D
    FROM
    ORDER_LINE
    WHERE
        OL_W_ID = _W_ID
    AND OL_D_ID = _D_ID
    AND OL_O_ID = _O_ID;

    WHENEVER NOT FOUND GOTO LINES_DONE;

    OPEN O_LINE;
    RESULT_NAMES (
    _OL_SUPPLY_W_ID, _OL_I_ID, _OL_QUANTITY, _OL_AMOUNT, _OL_DELIVERY_D);
    WHILE (1 = 1) {
    FETCH O_LINE INTO
        _OL_I_ID, _OL_SUPPLY_W_ID, _OL_QUANTITY, _OL_AMOUNT,
        _OL_DELIVERY_D;

    RESULT (
        _OL_SUPPLY_W_ID, _OL_I_ID, _OL_QUANTITY, _OL_AMOUNT,
        _OL_DELIVERY_D);
    }

LINES_DONE:
    END_RESULT ();

    RESULT_NAMES  (
    _C_ID, _C_LAST, _C_FIRST, _C_MIDDLE, _O_ENTRY_D, _O_CARRIER_ID,
    _C_BALANCE, _O_ID);

    RESULT (
    _C_ID, _C_LAST, _C_FIRST, _C_MIDDLE, _O_ENTRY_D, _O_CARRIER_ID,
    _C_BALANCE, _O_ID);

    RETURN;

NO_CUSTOMER:
    SIGNAL ('NOCUS', 'NO CUSTOMER IN ORDER STATUS');

NO_ORDER:
    RETURN 0;
}
```

</div>
