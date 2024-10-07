<div id="fn_internal_to_sql_type" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

internal_to_sql_type — returns the integer standard SQL type of its
argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_internal_to_sql_type" class="funcsynopsis">

|                                   |                               |
|-----------------------------------|-------------------------------|
| ` `**`internal_to_sql_type`**` (` | `internal_type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_internal_to_sql_type" class="refsect1">

## Description

internal_to_sql_type returns an integer value representing the standard
SQL type converted from internal_type given as its argument.

``` screen
internal_to_sql_type(182)   -> 12 (VARCHAR)
```

</div>

</div>
