<div id="fn_dvector" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

lvector , fvector , dvector — return an array of either long, float or
double

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_lvector" class="funcsynopsis">

|                           |               |
|---------------------------|---------------|
| `array `**`lvector`**` (` | `elt1 ` ,     |
|                           | `.... ` ,     |
|                           | `elt-n ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_fvector" class="funcsynopsis">

|                           |               |
|---------------------------|---------------|
| `array `**`fvector`**` (` | `elt1 ` ,     |
|                           | `.... ` ,     |
|                           | `elt-n ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dvector" class="funcsynopsis">

|                           |               |
|---------------------------|---------------|
| `array `**`dvector`**` (` | `elt1 ` ,     |
|                           | `.... ` ,     |
|                           | `elt-n ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dvector" class="refsect1">

## Description

These functions are like vector but return an array of either long,
float or double whereas vector returns a generic, untyped array.

<div id="ex_dvector" class="example">

**Example 24.96. Examples:**

<div class="example-contents">

``` programlisting
aref (lvector (1, 2), 1) = 1    is true.
```

</div>

</div>

  

</div>

</div>
