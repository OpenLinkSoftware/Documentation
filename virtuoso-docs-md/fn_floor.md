<div id="fn_floor" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

floor — Round a number to negative infinity.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_floor" class="funcsynopsis">

|                    |                               |
|--------------------|-------------------------------|
| ` `**`floor`**` (` | in `x ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_floor" class="refsect1">

## Description

`floor ` calculates the largest integer smaller than or equal to *`x `*
.

</div>

<div id="params_floor" class="refsect1">

## Parameters

<div id="id89185" class="refsect2">

### x

<span class="type">double precision </span>

</div>

</div>

<div id="ret_floor" class="refsect1">

## Return Values

`floor ` returns a 32-bit <span class="type">integer </span> .

</div>

<div id="examples_floor" class="refsect1">

## Examples

<div id="ex_floor" class="example">

**Example 24.118. Simple Examples**

<div class="example-contents">

``` screen
SQL> select floor (-0.513513), floor (0.513513), floor (123.4567);
callret   callret   callret
INTEGER   INTEGER   INTEGER
_______________________________________________________________________________

-1        0         123

1 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div id="seealso_floor" class="refsect1">

## See also

<a href="fn_ceiling.html" class="link" title="ceiling"><code
class="function">ceiling </code></a>

</div>

</div>
