<div id="fn_strchr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

strchr — strchr returns a zero-based index to the first occurrence of
the character.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_strchr" class="funcsynopsis">

|                     |                                |
|---------------------|--------------------------------|
| ` `**`strchr`**` (` | `str ` string ,                |
|                     | `char ` string or integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_31" class="refsect1">

## Description

strchr returns a zero-based index to the first occurrence of char. If
char is not found NULL is returned. char can be given either as an
integer ASCII value or a string, in which case the first character of
that string is searched fo.

``` screen
strchr('AbracadabrA','A')
         ->  0 (Found as the first character).
strrchr('AbracadabrA',65)
         -> 10 (Found as the eleventh character)
```

</div>

</div>
