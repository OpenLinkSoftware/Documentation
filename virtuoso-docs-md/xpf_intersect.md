<div id="xpf_intersect" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

intersect — Returns an intersect of two sets

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_intersect" class="funcsynopsis">

|                                |                       |
|--------------------------------|-----------------------|
| `sequence `**`intersect`**` (` | `set1 ` sequence ,    |
|                                | `set2 ` sequence `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_intersect" class="refsect1">

## Description

The function returns an unordered sequence that consists of all distinct
items such that every of source sequences contains every of the
resulting items.

Duplicates are removed, including duplicate occurrences of same value in
one sequence, the decision whether two values duplicate each other is
made according rules used by
<a href="xpf_distinct.html" class="link" title="distinct"><code
class="function">distinct() </code></a> function.

</div>

<div id="xpf_params_intersect" class="refsect1">

## Parameters

<div id="id127705" class="refsect2">

### set1, set2

Sequence that contains items of the resulting intersect.

</div>

</div>

<div id="xpf_ret_intersect" class="refsect1">

## Return Types

The function returns a sequence of distinct values.

</div>

<div id="xpf_seealso_intersect" class="refsect1">

## See Also

<a href="xpf_union.html" class="link" title="union"><code
class="function">union </code></a>

<a href="xpf_except.html" class="link" title="except"><code
class="function">except </code></a>

</div>

</div>
