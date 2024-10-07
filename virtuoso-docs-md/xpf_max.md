<div id="xpf_max" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

max — Returns maximum value among all its arguments.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_max" class="funcsynopsis">

|                        |                  |
|------------------------|------------------|
| `number `**`max`**` (` | `arg1 ` any ,    |
|                        | `arg2 ` any ,    |
|                        | `... ` ,         |
|                        | `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_max" class="refsect1">

## Description

The function returns the maximum value among all values in all its
arguments, For each node in every argument node-set, it converts the
string-value of the node to a number. If some arguments are not
node-sets, they are converted to numbers. The maximum number found is
returned.

This function is not a part of XPATH 1.0 standard library.

</div>

<div id="xpf_params_max" class="refsect1">

## Parameters

<div id="id128139" class="refsect2">

### argI

A node-set of nodes whose string values must be converted to numbers and
added to the result, or single value.

</div>

</div>

<div id="xpf_ret_max" class="refsect1">

## Return Types

<div id="id128145" class="table">

**Table 24.148. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                              | Description                                                                                             |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF05 </span> | <span class="errortext">Nonempty sequence of values expected as argument of XPATH function max(); max() of nothing is senseless </span> | This happens if the function is called without arguments, or with all arguments set to empty node-sets. |

</div>

</div>

  

</div>

<div id="xpf_examples_max" class="refsect1">

## Examples

<div id="xpf_ex_max" class="example">

**Example 24.601. **

<div class="example-contents">

``` screen
max(/report[@type="daily-sales"]/total)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_max" class="refsect1">

## See Also

<a href="xpf_sum.html" class="link" title="sum">sum</a>
<a href="xpf_avg.html" class="link" title="avg">avg</a>
<a href="xpf_min.html" class="link" title="min">min</a>

</div>

</div>
