<div>

<div>

</div>

<div>

## Name

gvector_sort — Performs quicksort of a given array.

</div>

<div>

## Synopsis

<div>

|                           |                                   |
|---------------------------|-----------------------------------|
| ` `**`gvector_sort`**` (` | inout `data ` vector ,            |
|                           | in `elements_in_group ` integer , |
|                           | in `key_idx_in_group ` integer ,  |
|                           | in `sort_ascending ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function gets an vector that consists of groups of elements. All
groups are of equal size, namely *`elements_in_group`* , so the total
length of *`data`* vector should be whole multiple of
*`elements_in_group`* . One element of each group is a key of sorting;
it is identified by its zero-based position within the group,
*`key_idx_in_group`* . The sorting procedure edits *`data`* and reorders
groups in such a way that their keys become ordered ascending or
descending, depending on *`sort_ascending`* flag.

The simplest case is plain sorting of a uniform array. In this case
every element is an individual group, *`elements_in_group`* is 1 and
*`key_idx_in_group`* is 0.

Other popular case is sorting of result of
<a href="fn_dict_to_vector.html" class="link"
title="dict_to_vector"><code class="function">dict_to_vector</code></a>
(). In this case, every item of the original dictionary is represended
in the vector by a pair of elements (*`elements_in_group`* is 2), so to
sort items by their keys, the *`key_idx_in_group`* is 0 and to sort them
by associated values, the *`key_idx_in_group `* is 1.

Similarly, *`elements_in_block `* is 2 for arrays like "lines" or
"params" of a VSP page.

</div>

<div>

## Parameters

<div>

### data

A group vector (gvector) to sort.

</div>

<div>

### elements_in_group

The number of vector elements in every group, usually 1, should be in
range 1 to 1024.

</div>

<div>

### key_idx_in_group

Zero-based position of key element in group, should be nonnegative and
less than *`elements_in_group `* .

</div>

<div>

### sort_ascending

Direction of sorting, nonzero for ascending sort, zero for descending.

</div>

</div>

<div>

## Return Types

The function returns number of groups in the *`data `* vector .

</div>

<div>

## See Also

<a href="fn_gvector_digit_sort.html" class="link"
title="gvector_digit_sort"><code
class="function">gvector_digit_sort() </code></a>

<a href="fn_rowvector_digit_sort.html" class="link"
title="rowvector_digit_sort"><code
class="function">rowvector_digit_sort() </code></a>

</div>

</div>
