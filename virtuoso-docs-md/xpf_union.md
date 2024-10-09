<div>

<div>

</div>

<div>

## Name

union — Returns an union of two or more sets

</div>

<div>

## Synopsis

<div>

|                            |                        |
|----------------------------|------------------------|
| `sequence `**`union`**` (` | `set1 ` sequence ,     |
|                            | `set2 ` sequence ... , |
|                            | `setN` sequence`)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns an unordered sequence that consists of all distinct
items from all given sets.

All duplicates are removed, including duplicate occurrences of same
value in one sequence, thus the function works exactly as
<a href="xpf_distinct.html" class="link" title="distinct"><code
class="function">distinct() </code></a> when only one parameter is
passed.

</div>

<div>

## Parameters

<div>

### setI

Sequence that contains items of the resulting union.

</div>

</div>

<div>

## Return Types

The function returns an unordered sequence of distinct values.

</div>

<div>

## See Also

<a href="xpf_intersect.html" class="link" title="intersect"><code
class="function">intersect </code></a>

<a href="xpf_except.html" class="link" title="except"><code
class="function">except </code></a>

</div>

</div>
