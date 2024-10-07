<div id="xpf_union" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

union — Returns an union of two or more sets

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_union" class="funcsynopsis">

|                            |                        |
|----------------------------|------------------------|
| `sequence `**`union`**` (` | `set1 ` sequence ,     |
|                            | `set2 ` sequence ... , |
|                            | `setN` sequence`)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_union" class="refsect1">

## Description

The function returns an unordered sequence that consists of all distinct
items from all given sets.

All duplicates are removed, including duplicate occurrences of same
value in one sequence, thus the function works exactly as
<a href="xpf_distinct.html" class="link" title="distinct"><code
class="function">distinct() </code></a> when only one parameter is
passed.

</div>

<div id="xpf_params_union" class="refsect1">

## Parameters

<div id="id129697" class="refsect2">

### setI

Sequence that contains items of the resulting union.

</div>

</div>

<div id="xpf_ret_union" class="refsect1">

## Return Types

The function returns an unordered sequence of distinct values.

</div>

<div id="xpf_seealso_union" class="refsect1">

## See Also

<a href="xpf_intersect.html" class="link" title="intersect"><code
class="function">intersect </code></a>

<a href="xpf_except.html" class="link" title="except"><code
class="function">except </code></a>

</div>

</div>
