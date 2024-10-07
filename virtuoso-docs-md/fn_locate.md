<div id="fn_locate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

locate — returns the starting position of the first occurrence of an
substring in a string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_locate" class="funcsynopsis">

|                            |                             |
|----------------------------|-----------------------------|
| `integer `**`locate`**` (` | in `string_exp1 ` varchar , |
|                            | in `string_exp2 ` varchar , |
|                            | in `start ` integer `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_locate" class="refsect1">

## Description

Returns the starting position of the first occurrence of string_exp1
within string_exp2. The search for the first occurrence of string_exp1
begins with the first character position in string_exp2 unless the
optional argument, start, is specified. If start is specified, the
search begins with the character position indicated by the value of
start. The first character position in string_exp2 is indicated by the
value 1. If string_exp1 is not found within string_exp2, the value 0 is
returned.

</div>

</div>
