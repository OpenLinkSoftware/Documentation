<div id="xpf_empty" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

empty — Returns true if given argument is an empty sequence, false if it
is any single value or nonempty sequence.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_empty" class="funcsynopsis">

|                           |                 |
|---------------------------|-----------------|
| `boolean `**`empty`**` (` | `seq ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_empty" class="refsect1">

## Description

Returns true if given argument is an empty sequence, false if it is any
single value or nonempty sequence.

</div>

<div id="xpf_params_empty" class="refsect1">

## Parameters

<div id="id127073" class="refsect2">

### seq

Sequence of values to be checked.

</div>

</div>

<div id="xpf_ret_empty" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_errors_empty" class="refsect1">

## Errors

This function never returns any errors

</div>

<div id="xpf_examples_empty" class="refsect1">

## Examples

<div id="xpf_ex_empty" class="example">

**Example 24.583. **

<div class="example-contents">

``` screen
if(empty(//table),'There are no tables in context node','There is at least one table')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_empty" class="refsect1">

## See Also

<a href="xpf_count.html" class="link" title="count">count()</a>

</div>

</div>
