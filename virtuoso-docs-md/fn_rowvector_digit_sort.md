<div>

<div>

</div>

<div>

## Name

rowvector_digit_sort — Performs a stable "digit" sort of a given array
of arrays.

</div>

<div>

## Synopsis

<div>

|                                   |                                   |
|-----------------------------------|-----------------------------------|
| ` `**`rowvector_digit_sort`**` (` | inout `data ` vector ,            |
|                                   | in `key_idx_in_row ` integer ,    |
|                                   | in `sort_ascending ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function gets an vector that contains uniform arrays ("rows") as
items, such as a result set produced by
<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec </code></a> (). One element of each row is a key
of sorting; it is identified by its zero-based position within the row,
*`key_idx_in_row`* (if the *`data`* vector is a result set then N-th
elements of all rows are from N-th column of the result set). The
sorting procedure edits *`data`* and reorders rows in such a way that
their keys become ordered ascending or descending, depending on
*`sort_ascending`* flag.

The performed sorting is stable. It means that it will not permutate
rows in vain: it will preserve the relative order of any two rows that
have equal keys. Using this property, one may sort a result set by a
"secondary sorting columns", starting with less significant and then by
"primary sorting column". E.g., if each row contain elements for country
code and province code then it is possible to make two-column sorting by
sorting first by province and then by country; that will work even if
province codes are not globally unique (say, if they're enumerated from
1 in each country).

This function supports only integer values of sorting keys.

</div>

<div>

## Parameters

<div>

### data

A vector of rows to sort.

</div>

<div>

### key_idx_in_row

Zero-based position of key element in row, should be nonnegative and
less than the length of each row.

</div>

<div>

### sort_ascending

Direction of sorting, nonzero for ascending sort, zero for descending.

</div>

</div>

<div>

## Return Types

The function returns the length of the *`data `* vector.

</div>

<div>

## See Also

<a href="fn_gvector_digit_sort.html" class="link"
title="gvector_digit_sort"><code
class="function">gvector_digit_sort() </code></a>

<a href="fn_gvector_sort.html" class="link" title="gvector_sort"><code
class="function">gvector_sort() </code></a>

</div>

</div>
