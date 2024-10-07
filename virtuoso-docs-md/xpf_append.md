<div id="xpf_append" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

append — Creates an sequence of all items from given sequences.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_append" class="funcsynopsis">

|                             |                       |
|-----------------------------|-----------------------|
| `sequence `**`append`**` (` | `seq1 ` sequence ,    |
|                             | `seq2 ` sequence ,    |
|                             | `... ` ,              |
|                             | `seqN ` sequence `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_append" class="refsect1">

## Description

This function calculates all given arguments from left to right, and
creates a sequence which contains all items of the first calculated
sequence, then all items of the second calculated sequence and so on,
preserving the order of items from every sequence. The result is
identical to the result of XQUERY "comma operator".

This function is not a part of XPATH 1.0 or XQUERY 1.0 libraries of
standard functions.

</div>

<div id="xpf_params_append" class="refsect1">

## Parameters

<div id="id126002" class="refsect2">

### SeqI

The sequence of items to be placed into the resulting sequence

</div>

</div>

<div id="xpf_ret_append" class="refsect1">

## Return Types

Sequence

</div>

<div id="xpf_examples_append" class="refsect1">

## Examples

<div id="xpf_ex_append" class="example">

**Example 24.563. **

<div class="example-contents">

``` screen
append(/abstract, /chapter, /appendix/section)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_append" class="refsect1">

## See Also

<a href="xpf_tuple.html" class="link" title="tuple">tuple</a>

</div>

</div>
