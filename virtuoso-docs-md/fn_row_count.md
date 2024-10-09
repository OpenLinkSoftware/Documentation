<div>

<div>

</div>

<div>

## Name

row_count — returns number of rows affected by the previous DML
statement in a procedure body

</div>

<div>

## Synopsis

<div>

|                               |      |
|-------------------------------|------|
| `integer `**`row_count`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the count of rows affected by the previous DML
statement in a procedure body. The scope is local to the procedure.
Calling this from ODBC will always return 0. This is the PL equivalent
of the SQLRowCount ODBC function. The count is set after any in-line
searched or positioned update, insert or delete. This is also set by the
exec function. The count stays set until overwritten by the next DML
operation. This is not set by rexecute.

</div>

<div>

## Return Types

An integer representing the number of affected rows from a previous
query.

</div>

</div>
