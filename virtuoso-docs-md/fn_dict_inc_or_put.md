<div id="fn_dict_inc_or_put" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_inc_or_put — Creates or increments an integer counter for a given
key and a dictionary.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_inc_or_put" class="funcsynopsis">

|                              |                                    |
|------------------------------|------------------------------------|
| ` `**`dict_inc_or_put`**` (` | inout `dict ` dictionary ,         |
|                              | in `key ` any ,                    |
|                              | in `value_increment ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_inc_or_put" class="refsect1">

## Description

The function checks whether *`dict `* contains *`key `* . If it isn't so
then the function checks the datatype of the value associated with the
key. An error 42000 is signalled in case of non-integer value or a
negative integer value. If the value is positive then
*`value_decrement`* is added to it and the result become the new value
associated with *`key`* in *`dict`* . If key is not in the dictionary
then a new item is added to the *`dict `* in order to associate the
*`key `* with *`value_increment `* .

</div>

<div id="params_dict_inc_or_put" class="refsect1">

## Parameters

<div id="id86461" class="refsect2">

### dict

Dictionary of counters. If the value is NULL then the function
immediately returns zero.

</div>

<div id="id86464" class="refsect2">

### key

Key of a dictionary item to process.

</div>

<div id="id86467" class="refsect2">

### value decrement

A nonnegative integer (typically 1) that is added to the value
associated with *`key `* or used as a starting value of a newly created
counter.

</div>

</div>

<div id="ret_dict_inc_or_put" class="refsect1">

## Return Types

The function returns zero (for NULL *`dict `* ) or the changed (or the
added) value associated with the *`key `* .

</div>

<div id="examples_dict_inc_or_put" class="refsect1">

## Example

<div id="ex_dict_inc_or_put" class="example">

**Example 24.91. Simple Use**

<div class="example-contents">

The function is convenient to deal with multisets, i.e., sets with
repeating elements. In this case the dictionary contains distinct items
as keys and counts of duplicates as associated values. `dict_inc_or_add`
is to add a member, <a href="fn_dict_dec_or_remove.html" class="link"
title="dict_dec_or_remove"><code
class="function">dict_dec_or_remove</code></a> is to remove. The
following example gets an array of multisets and return the sum of them.

``` screen
create function DB.DBA.SUM_MULTISETS (inout msets any) returns any
{
  declare sum_of_msets any;
  sum_of_msets := dict_new (17);
  foreach (any mset in msets) do
    {
      declare iter any;
      declare memb any;
      declare dup_count integer;
      iter := mset; --- unlike dict_duplicate() this does not make copy of mset so it's fast.
      dict_iter_rewind (iter);
      while (dict_iter_next (iter, memb, dup_count))
        dict_inc_or_put (sum_of_msets, memb, dup_count);
    }
  return sum_of_msets;
};
```

</div>

</div>

  

</div>

<div id="seealso_dict_inc_or_put" class="refsect1">

## See Also

<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new() </code></a>

<a href="fn_dict_zap.html" class="link" title="dict_zap"><code
class="function">dict_zap() </code></a>

<a href="fn_dict_put.html" class="link" title="dict_put"><code
class="function">dict_put() </code></a>

<a href="fn_dict_get.html" class="link" title="dict_get"><code
class="function">dict_get() </code></a>

<a href="fn_dict_remove.html" class="link" title="dict_remove"><code
class="function">dict_remove() </code></a>

<a href="fn_dict_dec_or_remove.html" class="link"
title="dict_dec_or_remove"><code
class="function">dict_dec_or_remove() </code></a>

<a href="fn_dict_size.html" class="link" title="dict_size"><code
class="function">dict_size() </code></a>

<a href="fn_dict_duplicate.html" class="link"
title="dict_duplicate"><code
class="function">dict_duplicate() </code></a>

<a href="fn_dict_to_vector.html" class="link"
title="dict_to_vector"><code
class="function">dict_to_vector() </code></a>

<a href="fn_dict_list_keys.html" class="link"
title="dict_list_keys"><code
class="function">dict_list_keys() </code></a>

<a href="fn_dict_destructive_list_rnd_keys.html" class="link"
title="dict_destructive_list_rnd_keys"><code
class="function">dict_destructive_list_rnd_keys() </code></a>

<a href="fn_dict_iter_rewind.html" class="link"
title="dict_iter_rewind"><code
class="function">dict_iter_rewind() </code></a>

<a href="fn_dict_iter_next.html" class="link"
title="dict_iter_next"><code
class="function">dict_iter_next() </code></a>

</div>

</div>
