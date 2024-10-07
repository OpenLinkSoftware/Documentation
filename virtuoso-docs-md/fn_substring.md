<div id="fn_substring" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

substring — returns a substring of a string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_substring" class="funcsynopsis">

|                        |                        |
|------------------------|------------------------|
| ` `**`substring`**` (` | `str ` string ,        |
|                        | `from ` integer ,      |
|                        | `sublen ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_39" class="refsect1">

## Description

Returns a substring of string str. The start index is 1 based. The
substring is sublen characters long.

This function follows SQL 92.

``` screen
substring('AbracadabrA',1,4) -> 'Abra'
substring('AbracadabrA',5,4) -> 'cada'
substring('AbracadabrA',8,4) -> 'abrA'
```

</div>

</div>
