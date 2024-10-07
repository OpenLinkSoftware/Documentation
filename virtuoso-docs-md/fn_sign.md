<div id="fn_sign" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sign — returns -1, 0, or 1 depending on the sign of its numerical

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sign" class="funcsynopsis">

|                   |                     |
|-------------------|---------------------|
| ` `**`sign`**` (` | `num ` numeric `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_18" class="refsect1">

## Description

sign returns either -1, 0 or 1 depending whether its numeric argument is
negative, zero or positive.

``` screen
sign(-12)           -> -1
sign(0)             -> 0
sign(910)           -> 1
sign(atof('-1.23456789'))   -> -1
sign(0.0)           -> 0
```

</div>

</div>
