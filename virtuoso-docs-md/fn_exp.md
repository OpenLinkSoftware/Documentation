<div>

<div>

</div>

<div>

## Name

exp — calculate exponent

</div>

<div>

## Synopsis

<div>

|                  |                               |
|------------------|-------------------------------|
| ` `**`exp`**` (` | in `x ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function raises e to the power of *`x `* , it works with double
precision floating point numbers, converts its argument to an IEEE
64-bit float and returns a result of that type.

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

`exp ` returns a IEEE 64-bit <span class="type">float </span> .

</div>

<div>

## Examples

<div>

**Example 24.107. Simple Examples**

<div>

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

<div>

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
