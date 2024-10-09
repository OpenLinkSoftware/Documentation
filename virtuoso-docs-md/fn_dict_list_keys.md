<div>

<div>

</div>

<div>

## Name

dict_list_keys — Returns an array of all keys stored in the given
dictionary.

</div>

<div>

## Synopsis

<div>

|                                   |                            |
|-----------------------------------|----------------------------|
| `vector `**`dict_list_keys`**` (` | inout `dict ` dictionary , |
|                                   | in `destructive ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns an array of all keys stored in the given
dictionary, ignoring dependent parts of key-value pairs. This is
especially useful when dictionary is used to form a set of distinct
keys, when dependent parts are fake (typically zeroes). If the
*`destructive`* parameter is 1 or 2 then the function may avoid copying
of keys to the resulting array by moving them out from the dictionary.
This is faster but the dictionary will become empty at the end of
operation. The *`destructive`* parameter equal to 1 does not have any
effect if the dictionary is used as a value of more than one variable.
Thus it is safe to make this parameter equal to 1 as soon as the
variable passed to the function as *`dict`* is no longer in use after
the function call and there's no need to inspect the whole program to
check if other variables may be affected. The parameter equal to 2
ignores the presence of multiple variables so the operation may cause
unexpected results in other fragments of code that share the dictionary.

The created array can not be longer than the system limit and even if it
is below limit but longer than hundreds of thousands items then memory
allocation can be inefficient. If the dictionary can be large and it is
possible to process the content of the dictionary in parts, consider
using <a href="fn_dict_destructive_list_rnd_keys.html" class="link"
title="dict_destructive_list_rnd_keys"><code
class="function">dict_destructive_list_rnd_keys</code></a> () instead.

</div>

<div>

## Parameters

<div>

### dict

The dictionary to scan

</div>

<div>

### destructive

Flag that indicates whether the dictionary can be cleaned during the
operation (0 = never clean, 1 = only if there is no other variables, 2 =
clean unconditionally).

</div>

</div>

<div>

## Return Types

The function returns a vector.

</div>

<div>

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

<a href="fn_dict_inc_or_put.html" class="link"
title="dict_inc_or_put"><code
class="function">dict_inc_or_put() </code></a>

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
