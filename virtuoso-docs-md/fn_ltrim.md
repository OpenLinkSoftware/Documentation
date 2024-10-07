<div id="fn_ltrim" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ltrim — removes specific characters from a string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ltrim" class="funcsynopsis">

|                    |                          |
|--------------------|--------------------------|
| ` `**`ltrim`**` (` | `str ` string ,          |
|                    | `trimchars ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ltrim" class="refsect1">

## Description

ltrim returns a copy of subsequence of string str with all the
characters present in trimchars trimmed off from the beginning. If the
second argument is omitted, it is a space ' ' by default.

rtrim is similar except that it trims from the right.

trim trims from both ends.

``` screen
concat('*',trim('   SIMURG   '),'*') -> '*SIMURG*'
ltrim('AbracadabrA','bAr')  -> 'acadabrA'
rtrim('AbracadabrA','bAr')  -> 'Abracada'
trim('AbracadabrA','bAr')    -> 'acada'
```

</div>

</div>
