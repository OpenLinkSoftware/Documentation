<div id="xpf_min" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

min — Returns minimum value among all its arguments.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_min" class="funcsynopsis">

|                        |                  |
|------------------------|------------------|
| `number `**`min`**` (` | `arg1 ` any ,    |
|                        | `arg2 ` any ,    |
|                        | `... ` ,         |
|                        | `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_min" class="refsect1">

## Description

The function returns the minimum value among all values in all its
arguments, For each node in every argument node-set, it converts the
string-value of the node to a number. If some arguments are not
node-sets, they are converted to numbers. The minimum number found is
returned.

This function is not a part of XPATH 1.0 standard library.

</div>

<div id="xpf_params_min" class="refsect1">

## Parameters

<div id="id128201" class="refsect2">

### argI

A node-set of nodes whose string values must be converted to numbers and
added to the result, or single value.

</div>

</div>

<div id="xpf_ret_min" class="refsect1">

## Return Types

<div id="id128207" class="table">

**Table 24.149. Errors signalled by min()**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                              | Description                                                                                             |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF04 </span> | <span class="errortext">Nonempty sequence of values expected as argument of XPATH function min(); min() of nothing is senseless </span> | This happens if the function is called without arguments, or with all arguments set to empty node-sets. |

</div>

</div>

  

</div>

<div id="xpf_examples_min" class="refsect1">

## Examples

<div id="xpf_ex_min" class="example">

**Example 24.602. **

<div class="example-contents">

``` screen
min(/report[@type="daily-sales"]/total)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_min" class="refsect1">

## See Also

<a href="xpf_sum.html" class="link" title="sum">sum</a>
<a href="xpf_avg.html" class="link" title="avg">avg</a>
<a href="xpf_max.html" class="link" title="max">max</a>

</div>

</div>
