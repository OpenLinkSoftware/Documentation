<div>

<div>

</div>

<div>

## Name

sum — Returns sum of all its arguments

</div>

<div>

## Synopsis

<div>

|                        |                  |
|------------------------|------------------|
| `number `**`sum`**` (` | `arg1 ` any ,    |
|                        | `arg2 ` any ,    |
|                        | `... ` ,         |
|                        | `argN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the sum, for each node in every argument node-set,
of the result of converting the string-values of the node to a number.
If some arguments are not node-sets, they are converted to numbers
first.

Note that this definition differs from XPATH 1.0 standard, where sum()
function must have exactly one argument of type node-set. It is
important that other XPATH processors may quietly ignore all arguments
except the first one, producing unexpected results.

Being called without arguments, sum() will return zero.

</div>

<div>

## Parameters

<div>

### argI

A node-set of nodes whose string values must be converted to numbers and
added to the result, or single value.

</div>

</div>

<div>

## Return Types

</div>

<div>

## Examples

<div>

**Example 24.626. **

<div>

``` screen
sum(/bill[@type="sale"]/total,/bill[@type="leasing"]/income)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_avg.html" class="link" title="avg">avg</a>
<a href="xpf_max.html" class="link" title="max">max</a>
<a href="xpf_min.html" class="link" title="min">min</a>

</div>

</div>
