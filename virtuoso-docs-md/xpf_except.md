<div id="xpf_except" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

except — Returns a difference of two sets

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_except" class="funcsynopsis">

|                             |                       |
|-----------------------------|-----------------------|
| `sequence `**`except`**` (` | `set1 ` sequence ,    |
|                             | `set2 ` sequence `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_except" class="refsect1">

## Description

The function returns an unordered sequence that consists of all distinct
items from the first sequence that are missing in the second sequence.

Duplicate values from *`set1 `* are removed, the decision whether two
values duplicate each other is made according rules used by
<a href="xpf_distinct.html" class="link" title="distinct"><code
class="function">distinct() </code></a> function.

</div>

<div id="xpf_params_except" class="refsect1">

## Parameters

<div id="id127212" class="refsect2">

### set1

Sequence that contains items that can occur in the resulting set.

</div>

<div id="id127215" class="refsect2">

### set2

Sequence that contains items that can not occur in the resulting set.

</div>

</div>

<div id="xpf_ret_except" class="refsect1">

## Return Types

The function returns an unordered sequence of distinct values.

</div>

<div id="xpf_seealso_except" class="refsect1">

## See Also

<a href="xpf_union.html" class="link" title="union"><code
class="function">union </code></a>

<a href="xpf_intersect.html" class="link" title="intersect"><code
class="function">intersect </code></a>

</div>

</div>
