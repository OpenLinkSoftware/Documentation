<div id="fn_abs" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

abs — Return the absolute value of a number

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_abs" class="funcsynopsis">

|                  |                    |
|------------------|--------------------|
| ` `**`abs`**` (` | in `num ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_abs" class="refsect1">

## Description

`abs ` returns the absolute value of its argument.

</div>

<div id="params_abs" class="refsect1">

## Parameters

<div id="id80267" class="refsect2">

### num

<span class="type">Numeric </span> value whose absolute value is to be
returned

</div>

</div>

<div id="ret_abs" class="refsect1">

## Return Types

Same as parameter type.

</div>

<div id="examples_abs" class="refsect1">

## Examples

<div id="ex_abs" class="example">

**Example 24.11. Simple example**

<div class="example-contents">

Get absolute values of several numeric values

``` screen
SQL> select cast (abs (-2.343) as numeric),
  cast(abs (0) as numeric),
  cast (abs (3.1415) as numeric);

callret          callret         callret
DECIMAL          DECIMAL         DECIMAL
_________________________________________

2.343            0               3.1415

1 Rows. -- 5 msec.
      
```

</div>

</div>

  

</div>

</div>
