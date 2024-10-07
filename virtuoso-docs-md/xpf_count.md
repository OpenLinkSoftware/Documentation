<div id="xpf_count" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

count — Returns the number of values in the sequence.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_count" class="funcsynopsis">

|                           |                 |
|---------------------------|-----------------|
| `integer `**`count`**` (` | `seq ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_count" class="refsect1">

## Description

Returns 1 if the argument is a single value or a count of elements in
the given sequence of values.

This function must be called with an argument, it do nothing with
context. To count nodes in context node-set, use last().

</div>

<div id="xpf_params_count" class="refsect1">

## Parameters

<div id="id126425" class="refsect2">

### seq

Sequence of values to be counted.

</div>

</div>

<div id="xpf_ret_count" class="refsect1">

## Return Types

Integer

</div>

<div id="xpf_errors_count" class="refsect1">

## Errors

This function never returns any errors

</div>

<div id="xpf_examples_count" class="refsect1">

## Examples

<div id="xpf_ex_count" class="example">

**Example 24.573. **

<div class="example-contents">

``` screen
count(//*)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_count" class="refsect1">

## See Also

<a href="xpf_empty.html" class="link" title="empty">empty()</a>
<a href="xpf_last.html" class="link" title="last">last()</a>

</div>

</div>
