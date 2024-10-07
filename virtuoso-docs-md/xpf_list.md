<div id="xpf_list" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

list — Selects the first item of every argument sequence and returns the
sequence of the selected items

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_list" class="funcsynopsis">

|                           |                       |
|---------------------------|-----------------------|
| `sequence `**`list`**` (` | `seq1 ` sequence ,    |
|                           | `seq2 ` sequence ,    |
|                           | `... ` ,              |
|                           | `seqN ` sequence `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_list" class="refsect1">

## Description

This function calculates all given arguments from left to right, and
creates a sequence which contains the first item of the first calculated
sequence, then the first item of the second calculated sequence and so
on. If the value of an argument is not a sequence, but a scalar, the
scalar is treated as one-element sequence so it is added into the
result. If the value of an argument is an empry sequence, nothing is
added into the result (unlike function
<a href="xpf_tuple.html" class="link" title="tuple">tuple()</a> that
adds an empty string in this case).

This function is not a part of XPATH 1.0 or XQUERY 1.0 libraries of
standard functions.

</div>

<div id="xpf_params_list" class="refsect1">

## Parameters

<div id="id128059" class="refsect2">

### SeqI

The sequence of items, first of its items will be used as I-tn item of
the resulting sequence

</div>

</div>

<div id="xpf_ret_list" class="refsect1">

## Return Types

Sequence

</div>

<div id="xpf_examples_list" class="refsect1">

## Examples

<div id="xpf_ex_list" class="example">

**Example 24.599. **

<div class="example-contents">

Compose a sequence of the first title in the document, then the first
abstract, then the first introduction

``` screen
list(/title, /abstract, /intro)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_list" class="refsect1">

## See Also

<a href="xpf_append.html" class="link" title="append">append()</a>
<a href="xpf_tuple.html" class="link" title="tuple">tuple()</a>

</div>

</div>
