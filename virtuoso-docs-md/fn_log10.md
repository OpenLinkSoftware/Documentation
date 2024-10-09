<div>

<div>

</div>

<div>

## Name

log10 — Calculate 10-based logarithms

</div>

<div>

## Synopsis

<div>

|                    |                               |
|--------------------|-------------------------------|
| ` `**`log10`**` (` | in `x ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`log10 ` calculates the 10-based logarithm of its argument and returns
it as a IEEE 64-bit float.

</div>

<div>

## Parameters

<div>

### x

<span class="type">double precision </span>

</div>

</div>

<div>

## Return Values

Double precision.

</div>

<div>

## Examples

<div>

**Example 24.208. Simple Examples**

<div>

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

<div>

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
