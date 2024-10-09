<div>

<div>

</div>

<div>

## Name

floor — Round a number to negative infinity.

</div>

<div>

## Synopsis

<div>

|                    |                               |
|--------------------|-------------------------------|
| ` `**`floor`**` (` | in `x ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`floor ` calculates the largest integer smaller than or equal to *`x `*
.

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

`floor ` returns a 32-bit <span class="type">integer </span> .

</div>

<div>

## Examples

<div>

**Example 24.118. Simple Examples**

<div>

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

<div>

## See also

<a href="fn_ceiling.html" class="link" title="ceiling"><code
class="function">ceiling </code></a>

</div>

</div>
