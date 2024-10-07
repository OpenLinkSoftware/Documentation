<div id="fn_row_count" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

row_count — returns number of rows affected by the previous DML
statement in a procedure body

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_row_count" class="funcsynopsis">

|                               |      |
|-------------------------------|------|
| `integer `**`row_count`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_row_count" class="refsect1">

## Description

This function returns the count of rows affected by the previous DML
statement in a procedure body. The scope is local to the procedure.
Calling this from ODBC will always return 0. This is the PL equivalent
of the SQLRowCount ODBC function. The count is set after any in-line
searched or positioned update, insert or delete. This is also set by the
exec function. The count stays set until overwritten by the next DML
operation. This is not set by rexecute.

</div>

<div id="ret_row_count" class="refsect1">

## Return Types

An integer representing the number of affected rows from a previous
query.

</div>

</div>
