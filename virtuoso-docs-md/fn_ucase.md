<div id="fn_ucase" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ucase — returns upper case version of string argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ucase" class="funcsynopsis">

|                    |                    |
|--------------------|--------------------|
| ` `**`ucase`**` (` | `str ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_47" class="refsect1">

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

<div id="params_15" class="refsect1">

## Parameters

<div id="id114412" class="refsect2">

### str

String to convert to upper case.

</div>

</div>

</div>
