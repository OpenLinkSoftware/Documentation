<div id="fn_lcase" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

lcase — Converts string argument to lower case

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_lcase" class="funcsynopsis">

|                    |                    |
|--------------------|--------------------|
| ` `**`lcase`**` (` | `str ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_lcase" class="refsect1">

## Description

lcase returns a copy of string str with all the uppercase alphabetical
characters converted to corresponding lowercase letters. This includes
also the diacritic letters present in the ISO 8859/1 standard in range
192 - 222 decimal, excluding the character 223, German double-s which
stays the same.

lower is an alias for lcase.

``` screen
lcase('AbracadabrA')  -> 'abracadabra'
```

</div>

</div>
