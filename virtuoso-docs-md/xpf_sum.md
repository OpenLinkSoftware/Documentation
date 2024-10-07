<div id="xpf_sum" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sum — Returns sum of all its arguments

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_sum" class="funcsynopsis">

|                        |                  |
|------------------------|------------------|
| `number `**`sum`**` (` | `arg1 ` any ,    |
|                        | `arg2 ` any ,    |
|                        | `... ` ,         |
|                        | `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_sum" class="refsect1">

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

<div id="xpf_params_sum" class="refsect1">

## Parameters

<div id="id129368" class="refsect2">

### argI

A node-set of nodes whose string values must be converted to numbers and
added to the result, or single value.

</div>

</div>

<div id="xpf_ret_sum" class="refsect1">

## Return Types

</div>

<div id="xpf_examples_sum" class="refsect1">

## Examples

<div id="xpf_ex_sum" class="example">

**Example 24.626. **

<div class="example-contents">

``` screen
sum(/bill[@type="sale"]/total,/bill[@type="leasing"]/income)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_sum" class="refsect1">

## See Also

<a href="xpf_avg.html" class="link" title="avg">avg</a>
<a href="xpf_max.html" class="link" title="max">max</a>
<a href="xpf_min.html" class="link" title="min">min</a>

</div>

</div>
