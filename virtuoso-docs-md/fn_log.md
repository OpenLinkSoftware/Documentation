<div>

<div>

</div>

<div>

## Name

log — calculate natural logarithm of an expression

</div>

<div>

## Synopsis

<div>

|                  |                               |
|------------------|-------------------------------|
| ` `**`log`**` (` | in `x ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`log ` calculates the natural logarithm of its argument and returns it
as a IEEE 64-bit float.

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

`log ` .

</div>

<div>

## Examples

<div>

**Example 24.207. Simple Examples**

<div>

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

<div>

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
