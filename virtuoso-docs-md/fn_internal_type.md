<div id="fn_internal_type" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

internal_type — returns internal integer datatype of its argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_internal_type" class="funcsynopsis">

|                            |                      |
|----------------------------|----------------------|
| ` `**`internal_type`**` (` | `arg ` anything `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_01" class="refsect1">

## Description

internal_type returns an integer value representing the internal type of
its argument. These values are the same as what Virtuoso uses in the
column COL_DTP of the system table SYS_COLS for keeping the track of the
default types of each column of each table.

``` screen
internal_type(space(5))     -> 182 (A long string)
```

</div>

</div>
