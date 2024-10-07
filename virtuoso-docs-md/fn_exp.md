<div id="fn_exp" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

exp — calculate exponent

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_exp" class="funcsynopsis">

|                  |                               |
|------------------|-------------------------------|
| ` `**`exp`**` (` | in `x ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_exp" class="refsect1">

## Description

The function raises e to the power of *`x `* , it works with double
precision floating point numbers, converts its argument to an IEEE
64-bit float and returns a result of that type.

</div>

<div id="params_exp" class="refsect1">

## Parameters

<div id="id88288" class="refsect2">

### x

<span class="type">double precision </span>

</div>

</div>

<div id="ret_exp" class="refsect1">

## Return Values

`exp ` returns a IEEE 64-bit <span class="type">float </span> .

</div>

<div id="examples_exp" class="refsect1">

## Examples

<div id="ex_exp" class="example">

**Example 24.107. Simple Examples**

<div class="example-contents">

``` screen
SQL> select concat ('the EXP of 0.513513 is: ', cast (exp (0.513513) as varchar));
callret
VARCHAR
_______________________________________________________________________________

the EXP of 0.513513 is: 1.671152

1 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div id="seealso_exp" class="refsect1">

## See Also

<a href="fn_log.html" class="link" title="log"><code
class="function">log </code></a> ,
<a href="fn_log10.html" class="link" title="log10"><code
class="function">log10</code></a> ,
<a href="fn_power.html" class="link" title="power"><code
class="function">power</code></a> ,
<a href="fn_sqrt.html" class="link" title="sqrt"><code
class="function">sqrt</code></a> ,

</div>

</div>
