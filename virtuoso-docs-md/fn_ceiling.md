<div>

<div>

</div>

<div>

## Name

ceiling — Round a number to positive infinity.

</div>

<div>

## Synopsis

<div>

|                      |                               |
|----------------------|-------------------------------|
| ` `**`ceiling`**` (` | in `x ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`ceiling ` calculates the smallest integer greater than or equal to
*`x `* .

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

`ceiling ` returns a 32-bit <span class="type">integer </span> .

</div>

<div>

## Examples

<div>

**Example 24.30. Simple Examples**

<div>

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

<div>

## See Also

<a href="fn_floor.html" class="link" title="floor"><code
class="function">floor </code></a>

</div>

</div>
