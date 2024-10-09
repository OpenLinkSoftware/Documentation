<div>

<div>

</div>

<div>

## Name

signal — Signal an exception in the calling procedure

</div>

<div>

## Synopsis

<div>

|                     |                            |
|---------------------|----------------------------|
| ` `**`signal`**` (` | in `sqlstate ` varchar ,   |
|                     | in `message ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This signals the given SQLSTATE with the message. The calling procedure
will transfer control to the most appropriate local handler. In the
absence of a local handler the procedure terminates and signals the
exception in the scope where it was called from, until there either is a
handler or there are no more calling procedures. If there is no handler
in the entire stack of call contexts the error is signalled to the
client. Handlers can be declared with whenever .. goto and the declare
handler for construct. See the Virtuoso/PL documentation.

``` screen
CREATE PROCEDURE WITHDRAW (IN C_ID VARCHAR, IN DELTA NUMERIC)
{
    DECLARE BAL NUMERIC;

    DECLARE CR CURSOR FOR SELECT C_BALANCE FROM CUSTOMER WHERE C_ID = C_ID;

    WHENEVER NOT FOUND GOTO NOCUSTOMER;

    OPEN CR (EXCLUSIVE);
    FETCH CR INTO BAL;
    IF (BAL > DELTA)
    UPDATE CUSTOMER SET C_BALANCE = BAL - DELTA WHERE CURRENT OF CR;
    ELSE
    SIGNAL ('NOMONEY', 'INSUFFICIENT BALANCE.');

    RETURN;

NOCUSTOMER:
    SIGNAL ('NOCUS', 'BAD CUSTOMER ID');
}
```

</div>

</div>
