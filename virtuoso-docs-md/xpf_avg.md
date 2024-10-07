<div id="xpf_avg" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

avg — Returns average value of all its arguments.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_avg" class="funcsynopsis">

|                        |                  |
|------------------------|------------------|
| `number `**`avg`**` (` | `arg1 ` any ,    |
|                        | `arg2 ` any ,    |
|                        | `... ` ,         |
|                        | `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_avg" class="refsect1">

## Description

The function returns the average of all values in all its arguments, For
each node in every argument node-set, it converts the string-value of
the node to a number and adds the result to the sum. If some arguments
are not node-sets, they are converted to numbers first and added to the
sum. Then sum is divided by number of values added and the result is
returned.

This function is not a part of XPATH 1.0 standard library.

</div>

<div id="xpf_params_avg" class="refsect1">

## Parameters

<div id="id126089" class="refsect2">

### argI

A node-set of nodes whose string values must be converted to numbers and
added to the result, or single value.

</div>

</div>

<div id="xpf_ret_avg" class="refsect1">

## Return Types

<div id="id126095" class="table">

**Table 24.138. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                                 | Description                                                                                             |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF06 </span> | <span class="errortext">Nonempty sequence of values expected as argument(s) of XPATH function avg(); avg() of nothing is senseless </span> | This happens if the function is called without arguments, or with all arguments set to empty node-sets. |

</div>

</div>

  

</div>

<div id="xpf_examples_avg" class="refsect1">

## Examples

<div id="xpf_ex_avg" class="example">

**Example 24.565. **

<div class="example-contents">

``` screen
avg(/report[@type="daily-sales"]/total)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_avg" class="refsect1">

## See Also

<a href="xpf_sum.html" class="link" title="sum">sum</a>
<a href="xpf_max.html" class="link" title="max">max</a>
<a href="xpf_min.html" class="link" title="min">min</a>

</div>

</div>
