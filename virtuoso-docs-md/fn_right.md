<div id="fn_right" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

right — get n rightmost characters of a string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_right" class="funcsynopsis">

|                    |                          |
|--------------------|--------------------------|
| ` `**`right`**` (` | in `str ` string ,       |
|                    | in `count ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_right" class="refsect1">

## Description

right returns the *`count `* rightmost characters of string str.

If count is zero an empty string '' is returned.

If length of str is less than count then a copy of the whole *`str `* is
returned.

</div>

<div id="examples_right" class="refsect1">

## Examples

<div id="ex_right_1" class="example">

**Example 24.364. Simple Example**

<div class="example-contents">

``` screen
right('AbracadabrA',4) -> 'abrA'
```

</div>

</div>

  

</div>

</div>
