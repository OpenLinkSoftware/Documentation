<div id="fn_mod" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

mod — returns the modulus of its arguments

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_mod" class="funcsynopsis">

|                  |                         |
|------------------|-------------------------|
| ` `**`mod`**` (` | `dividend ` integer ,   |
|                  | `divisor ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_06" class="refsect1">

## Description

mod returns the modulus (i.e. remainder) of the division
dividend/divisor. If the divisor is zero the SQL error 22012 "Division
by zero" is generated.

``` screen
mod(35,3)           -> 2
mod(35,-3)          -> 2
mod(-35,3)          -> -2
mod(-35,-3)         -> -2
mod(3,35)           -> 3
mod(0,7)            -> 0
mod(60,3)           -> 0
```

</div>

</div>
