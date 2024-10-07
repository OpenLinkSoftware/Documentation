<div id="xpf_ceiling" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ceiling — Returns the smallest integer that is not less than the
argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_ceiling" class="funcsynopsis">

|                             |                    |
|-----------------------------|--------------------|
| `integer `**`ceiling`**` (` | `num ` number `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_ceiling" class="refsect1">

## Description

This function returns the smallest (closest to negative infinity) number
that is not less than the argument and that is an integer. In other
words, it "rounds up" the given value.

</div>

<div id="xpf_params_ceiling" class="refsect1">

## Parameters

<div id="id126189" class="refsect2">

### num

The value to be "rounded up"

</div>

</div>

<div id="xpf_ret_ceiling" class="refsect1">

## Return Types

</div>

<div id="xpf_examples_ceiling" class="refsect1">

## Examples

<div id="xpf_ex_ceiling" class="example">

**Example 24.567. **

<div class="example-contents">

The following expressions are true:

``` screen
ceiling(2.5) = 3
ceiling(2) = 2
ceiling(-2.5) = -2
ceiling(-2) = -2
```

</div>

</div>

  

</div>

<div id="xpf_seealso_ceiling" class="refsect1">

## See Also

<a href="xpf_floor.html" class="link" title="floor">floor()</a>
<a href="xpf_round.html" class="link" title="round">round()</a>

</div>

</div>
