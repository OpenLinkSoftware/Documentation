<div id="fn_log" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

log — calculate natural logarithm of an expression

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_log" class="funcsynopsis">

|                  |                               |
|------------------|-------------------------------|
| ` `**`log`**` (` | in `x ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_log" class="refsect1">

## Description

`log ` calculates the natural logarithm of its argument and returns it
as a IEEE 64-bit float.

</div>

<div id="params_log" class="refsect1">

## Parameters

<div id="id95827" class="refsect2">

### x

<span class="type">double precision </span>

</div>

</div>

<div id="ret_log" class="refsect1">

## Return Values

`log ` .

</div>

<div id="examples_log" class="refsect1">

## Examples

<div id="ex_log" class="example">

**Example 24.207. Simple Examples**

<div class="example-contents">

``` screen
SQL> select concat ('the LOG of 0.513513 is: ', cast (log (0.513513) as varchar));
callret
VARCHAR
_______________________________________________________________________________

the LOG of 0.513513 is: -0.666480

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_log" class="refsect1">

## See Also

<a href="fn_exp.html" class="link" title="exp"><code
class="function">exp </code></a> ,
<a href="fn_log10.html" class="link" title="log10"><code
class="function">log10</code></a> ,
<a href="fn_power.html" class="link" title="power"><code
class="function">power</code></a> ,
<a href="fn_sqrt.html" class="link" title="sqrt"><code
class="function">sqrt</code></a>

</div>

</div>
