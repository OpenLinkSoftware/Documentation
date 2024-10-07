<div id="xpf_round" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

round — Returns the integer that is the nearest to the argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_round" class="funcsynopsis">

|                           |                    |
|---------------------------|--------------------|
| `integer `**`round`**` (` | `num ` number `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_round" class="refsect1">

## Description

The function returns the number that is closest to the argument and that
is an integer. If there are two such numbers, then the one that is
closest to positive infinity is returned. If the argument is NaN, then
NaN is returned. If the argument is positive infinity, then positive
infinity is returned. If the argument is negative infinity, then
negative infinity is returned.

</div>

<div id="xpf_params_round" class="refsect1">

## Parameters

<div id="id128855" class="refsect2">

### num

The value to be rounded

</div>

</div>

<div id="xpf_ret_round" class="refsect1">

## Return Types

</div>

<div id="xpf_examples_round" class="refsect1">

## Examples

<div id="xpf_ex_round" class="example">

**Example 24.616. **

<div class="example-contents">

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

<div id="xpf_seealso_round" class="refsect1">

## See Also

<a href="xpf_floor.html" class="link" title="floor">floor()</a>
<a href="xpf_ceiling.html" class="link" title="ceiling">ceiling()</a>

</div>

</div>
