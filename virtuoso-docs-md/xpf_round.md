<div>

<div>

</div>

<div>

## Name

round — Returns the integer that is the nearest to the argument.

</div>

<div>

## Synopsis

<div>

|                           |                    |
|---------------------------|--------------------|
| `integer `**`round`**` (` | `num ` number `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the number that is closest to the argument and that
is an integer. If there are two such numbers, then the one that is
closest to positive infinity is returned. If the argument is NaN, then
NaN is returned. If the argument is positive infinity, then positive
infinity is returned. If the argument is negative infinity, then
negative infinity is returned.

</div>

<div>

## Parameters

<div>

### num

The value to be rounded

</div>

</div>

<div>

## Return Types

</div>

<div>

## Examples

<div>

**Example 24.616. **

<div>

The following expressions are true:

``` screen
round(2.4) = 2
round(2.5) = 3
round(2.6) = 3
round(-2.4) = -3
round(-2.5) = -2
round(-2.6) = -2
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_floor.html" class="link" title="floor">floor()</a>
<a href="xpf_ceiling.html" class="link" title="ceiling">ceiling()</a>

</div>

</div>
