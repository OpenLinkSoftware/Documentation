<div id="fn_gvector_digit_sort" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

gvector_digit_sort — Performs a stable "digit" sort of a given array.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_gvector_digit_sort" class="funcsynopsis">

|                                 |                                   |
|---------------------------------|-----------------------------------|
| ` `**`gvector_digit_sort`**` (` | inout `data ` vector ,            |
|                                 | in `elements_in_group ` integer , |
|                                 | in `key_idx_in_group ` integer ,  |
|                                 | in `sort_ascending ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_gvector_digit_sort" class="refsect1">

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
by associated values, the *`key_idx_in_group`* is 1.

The performed sorting is stable. It means that it will not permutate
groups in vain: it will preserve the relative order of any two groups
that have equal keys. Using this property, one may sort groups by a
"secondary" key and then by "primary" key. E.g., if each group contain
elements for country code and province code then it is possible to make
two-field sorting by sorting first by province and then by country; that
will work even if province codes are not globally unique (say, if
they're enumerated from 1 in each country).

This function supports only integer values of sorting keys. To sort by
strings, floating-point numbers etc., use
<a href="fn_gvector_sort.html" class="link" title="gvector_sort"><code
class="function">gvector_sort</code></a> (). However, out of these two
similar functions, only gvector_digit_sort() is stable-sort.

</div>

<div id="params_gvector_digit_sort" class="refsect1">

## Parameters

<div id="id90294" class="refsect2">

### data

A group vector (gvector) to sort.

</div>

<div id="id90297" class="refsect2">

### elements_in_group

The number of vector elements in every group, usually 1, should be in
range 1 to 1024.

</div>

<div id="id90300" class="refsect2">

### key_idx_in_group

Zero-based position of key element in group, should be nonnegative and
less than *`elements_in_group `* .

</div>

<div id="id90304" class="refsect2">

### sort_ascending

Direction of sorting, nonzero for ascending sort, zero for descending.

</div>

</div>

<div id="ret_gvector_digit_sort" class="refsect1">

## Return Types

The function returns number of groups in the *`data `* vector .

</div>

<div id="seealso_gvector_digit_sort" class="refsect1">

## See Also

<a href="fn_gvector_sort.html" class="link" title="gvector_sort"><code
class="function">gvector_sort() </code></a>

<a href="fn_rowvector_digit_sort.html" class="link"
title="rowvector_digit_sort"><code
class="function">rowvector_digit_sort() </code></a>

</div>

</div>
