<div id="fn_ceiling" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ceiling — Round a number to positive infinity.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ceiling" class="funcsynopsis">

|                      |                               |
|----------------------|-------------------------------|
| ` `**`ceiling`**` (` | in `x ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ceiling" class="refsect1">

## Description

`ceiling ` calculates the smallest integer greater than or equal to
*`x `* .

</div>

<div id="params_ceiling" class="refsect1">

## Parameters

<div id="id81632" class="refsect2">

### x

<span class="type">double precision </span>

</div>

</div>

<div id="ret_ceiling" class="refsect1">

## Return Values

`ceiling ` returns a 32-bit <span class="type">integer </span> .

</div>

<div id="examples_ceiling" class="refsect1">

## Examples

<div id="ex_ceiling" class="example">

**Example 24.30. Simple Examples**

<div class="example-contents">

``` screen
SQL> select ceiling (12.3456), ceiling (-12.3456), ceiling (0.513513);
callret   callret   callret
INTEGER   INTEGER   INTEGER
_______________________________________________________________________________

13        -12       1

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_ceiling" class="refsect1">

## See Also

<a href="fn_floor.html" class="link" title="floor"><code
class="function">floor </code></a>

</div>

</div>
