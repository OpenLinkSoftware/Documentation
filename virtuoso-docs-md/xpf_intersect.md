<div>

<div>

</div>

<div>

## Name

intersect — Returns an intersect of two sets

</div>

<div>

## Synopsis

<div>

|                                |                       |
|--------------------------------|-----------------------|
| `sequence `**`intersect`**` (` | `set1 ` sequence ,    |
|                                | `set2 ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### set1, set2

Sequence that contains items of the resulting intersect.

</div>

</div>

<div>

## Return Types

The function returns a sequence of distinct values.

</div>

<div>

## See Also

<a href="xpf_union.html" class="link" title="union"><code
class="function">union </code></a>

<a href="xpf_except.html" class="link" title="except"><code
class="function">except </code></a>

</div>

</div>
