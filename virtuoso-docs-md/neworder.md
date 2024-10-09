<div>

<div>

<div>

<div>

### 21.7.2. New Order

</div>

</div>

</div>

<div>

- Passing parameters

- Using positioned operations

- Using read for update

- Order of locking

- Application-defined SQL STATE

</div>

The new_order procedure implements this transaction. It accepts the
warehouse, district and customer data and the item, quantity and supply
warehouse id for up to ten order lines.

The transaction profile requires this to update the stock level for each
order line, add a row to ORDERS and NEW_ORDER and a row to ORDER_LINE
for each order line. This also reads the customer, updates the district
and reads the warehouse. This all needs to take place as one transaction
with a high integrity requirement.

The procedure begins by updating the stock levels. This is the part with
lowest locality and thus most likely to cause I/O and least likely to
cause lock contention. Most of the transaction's real time will be spent
inside ol_stock. If the order lines are sorted in order of item id, new
order transactions will never deadlock on the stock level part. This
will maximize the number of concurrent new orders on one warehouse.

``` programlisting
    CREATE PROCEDURE OL_STOCK (
        INOUT   OL_I_ID     INTEGER,
        IN  OL_SUPPLY_W_ID  INTEGER,
        IN  OL_QTY      INTEGER,
        OUT AMOUNT      FLOAT)
    {
        IF (OL_I_ID = -1) RETURN;

        DECLARE S_DATA,
        S_DIST_01, S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05,
        S_DIST_06, S_DIST_07, S_DIST_08, S_DIST_09, S_DIST_10 VARCHAR;
        DECLARE S_QUANTITY INTEGER;
        DECLARE I_PRICE FLOAT;

        WHENEVER NOT FOUND GOTO NO_ITEM;

        SELECT I_PRICE INTO I_PRICE FROM ITEM WHERE I_ID = OL_I_ID;

        DECLARE S_CUR CURSOR FOR
        SELECT
            S_QUANTITY, S_DATA,
            S_DIST_01, S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05,
            S_DIST_06, S_DIST_07, S_DIST_08, S_DIST_09, S_DIST_10
        FROM
            STOCK
        WHERE
              S_I_ID = OL_I_ID
          AND S_W_ID = OL_SUPPLY_W_ID;

        WHENEVER NOT FOUND GOTO NO_STOCK;

        OPEN S_CUR (EXCLUSIVE);

        FETCH S_CUR INTO
        S_QUANTITY, S_DATA,
        S_DIST_01, S_DIST_02, S_DIST_03, S_DIST_04, S_DIST_05,
        S_DIST_06, S_DIST_07, S_DIST_08, S_DIST_09, S_DIST_10;

        IF (S_QUANTITY < OL_QTY)
        S_QUANTITY := S_QUANTITY - OL_QTY + 91;
        ELSE
        S_QUANTITY := S_QUANTITY - OL_QTY;

        UPDATE STOCK SET S_QUANTITY = S_QUANTITY WHERE CURRENT OF S_CUR;

        AMOUNT := OL_QTY * I_PRICE;

        RETURN;

    NO_STOCK: SIGNAL ('NOSTK', 'NO STOCK ROW FOUND.');
    NO_ITEM:  SIGNAL ('NOITM', 'NO ITEM ROW FOUND.');
    }
```

This procedure first reads the I_PRICE from ITEM and update the
S_QUANTITY in STOCK. The price of the order line is returned as output
parameter amount.

<div>

<table data-border="0" data-summary="Note: Note">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p>Use inout parameters if possible. The inout (call by reference)
is the fastest way of passing parameters.</p></li>
<li><p>When reading a table with the intention of updating the row
afterwards, use a cursor and positioned update.</p></li>
<li><p>Use the EXCLUSIVE option in opening the cursor. This causes the
read to put an exclusive lock on the row, which eliminates deadlocks
caused by a shared read followed by an update. This deadlocks if there
are more than one readers at the time of the update.</p></li>
<li><p>Use `whenever not found' and signal to signal exceptions (no item
or stock line).</p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

When the stock level for all order lines has been updated this reads the
customer data.

The bottleneck in terms of serialization is the read-update of the
district, where the order gets an O_ID. This must be done as late as
possible but has to precede the inserts, since these will use the O_ID.
Note the exclusive cursor again.

To finish the transaction new_order insert ORDERS, NOW_ORDER and
ORDER_LINE. These are basically in ascending order for each district and
have high locality. Note the call by reference (inout) for ol_insert.

</div>
