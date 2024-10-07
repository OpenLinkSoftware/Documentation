<div id="fn_log10" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

log10 — Calculate 10-based logarithms

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_log10" class="funcsynopsis">

|                    |                               |
|--------------------|-------------------------------|
| ` `**`log10`**` (` | in `x ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_log10" class="refsect1">

## Description

`log10 ` calculates the 10-based logarithm of its argument and returns
it as a IEEE 64-bit float.

</div>

<div id="params_log10" class="refsect1">

## Parameters

<div id="id95871" class="refsect2">

### x

<span class="type">double precision </span>

</div>

</div>

<div id="ret_log10" class="refsect1">

## Return Values

Double precision.

</div>

<div id="examples_log10" class="refsect1">

## Examples

<div id="ex_log10" class="example">

**Example 24.208. Simple Examples**

<div class="example-contents">

``` screen
SQL> select concat ('the LOG10 of 0.513513 is: ', cast (log10 (0.513513) as varchar));
callret
VARCHAR
_______________________________________________________________________________

the LOG10 of 0.513513 is: -0.289449

1 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div id="seealso_04" class="refsect1">

## See Also

<a href="fn_log.html" class="link" title="log"><code
class="function">log </code></a> ,
<a href="fn_exp.html" class="link" title="exp"><code
class="function">exp</code></a> ,
<a href="fn_power.html" class="link" title="power"><code
class="function">power</code></a> ,
<a href="fn_sqrt.html" class="link" title="sqrt"><code
class="function">sqrt</code></a> ,

</div>

</div>
