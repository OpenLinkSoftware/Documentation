<div>

<div>

</div>

<div>

## Name

except — Returns a difference of two sets

</div>

<div>

## Synopsis

<div>

|                             |                       |
|-----------------------------|-----------------------|
| `sequence `**`except`**` (` | `set1 ` sequence ,    |
|                             | `set2 ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns an unordered sequence that consists of all distinct
items from the first sequence that are missing in the second sequence.

Duplicate values from *`set1 `* are removed, the decision whether two
values duplicate each other is made according rules used by
<a href="xpf_distinct.html" class="link" title="distinct"><code
class="function">distinct() </code></a> function.

</div>

<div>

## Parameters

<div>

### set1

Sequence that contains items that can occur in the resulting set.

</div>

<div>

### set2

Sequence that contains items that can not occur in the resulting set.

</div>

</div>

<div>

## Return Types

The function returns an unordered sequence of distinct values.

</div>

<div>

## See Also

<a href="xpf_union.html" class="link" title="union"><code
class="function">union </code></a>

<a href="xpf_intersect.html" class="link" title="intersect"><code
class="function">intersect </code></a>

</div>

</div>
