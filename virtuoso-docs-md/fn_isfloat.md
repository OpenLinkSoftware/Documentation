<div id="fn_isfloat" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

isfloat — returns true if its argument is a float

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_isfloat" class="funcsynopsis">

|                      |                      |
|----------------------|----------------------|
| ` `**`isfloat`**` (` | `arg ` anything `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_isfloat" class="refsect1">

## Description

`isfloat ` returns one if its argument is of type single float, zero
otherwise.

``` screen
isfloat(0.0)        -> 0 (No it is not, because decimal
                literals are by default
                converted to double precision
                numbers)
isfloat(atof('0.0'))    -> 1 (Only with explicit atof we get
                a single float)
```

</div>

</div>
