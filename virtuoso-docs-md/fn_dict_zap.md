<div>

<div>

</div>

<div>

## Name

dict_zap — Removes all data from the given dictionary

</div>

<div>

## Synopsis

<div>

|                       |                                |
|-----------------------|--------------------------------|
| ` `**`dict_zap`**` (` | inout `dict ` dictionary ,     |
|                       | in `destructive ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function removes all items from the given dictionary.

If the *`destructive`* parameter is 0 or 1 then an error 22023 is
signalled if the dictionary is used as a value of more than one
variable. The parameter equal to 2 forces the function to ignore the
presence of multiple variables; in this case the operation may cause
unexpected results in other fragments of code that share the dictionary.

In most of cases, this function is used specifically for its side effect
on other variables. With only one variable in use, one may simply set
that variable to the value returned by
<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new</code></a> () (or to NULL if the dictionary is
no longer needed). If the dictionary is no longer referenced by any
variable, it is destroyed and the occupied memory is freed. However one
may wish to zap the dictionary in order to not worry about number of
variables that refers to the dictionary, e.g., when dictionary is used
only in some part of a long procedure.

</div>

<div>

## Parameters

<div>

### dict

The dictionary to zap. If it is NULL then the function call has no
effect and returned value is zero.

</div>

<div>

### destructive

Flag that indicates whether the dictionary can be cleaned if multiple
references exist (0 and 1 = zap only if there is no other variables and
signal an error otherwise, 2 = clean unconditionally).

</div>

</div>

<div>

## Return Types

The function returns the number of intems in the dictionary before the
operation.

</div>

<div>

## See Also

<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new() </code></a>

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
