<div id="fn_upper" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

upper — returns upper case version of string argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_upper" class="funcsynopsis">

|                    |                    |
|--------------------|--------------------|
| ` `**`upper`**` (` | `str ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_48" class="refsect1">

## Description

`ucase ` returns a copy of string str with all the lowercase
alphabetical characters converted to corresponding uppercase letters.
This includes also the diacritic letters present in the ISO 8859/1
standard in range 224 - 254 decimal, excluding the character 255, y
diaeresis, which is not converted to a German double-s.

upper is just an alias for ucase.

``` screen
ucase('AbracadabrA')  -> 'ABRACADABRA'
```

</div>

</div>
