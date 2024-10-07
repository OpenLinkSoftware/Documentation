<div id="fn_left" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

left — returns substring taken from left of string argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_left" class="funcsynopsis">

|                   |                       |
|-------------------|-----------------------|
| ` `**`left`**` (` | `str ` string ,       |
|                   | `count ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_left" class="refsect1">

## Description

left returns a subsequence of string str, taking count characters from
the beginning of the string.

If count is zero an empty string '' is returned.

If length of str is less than count then a copy of the whole str is
returned.

``` screen
left('AbracadabrA',4) -> 'Abra'
```

</div>

</div>
