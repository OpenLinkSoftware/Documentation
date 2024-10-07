<div id="fn_dict_to_vector" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_to_vector — Returns a get_keyword style vector of all items stored
in the given dictionary.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_to_vector" class="funcsynopsis">

|                                   |                            |
|-----------------------------------|----------------------------|
| `vector `**`dict_to_vector`**` (` | inout `dict ` dictionary , |
|                                   | in `destructive ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_to_vector" class="refsect1">

## Description

The function returns an array of all data stored in the given
dictionary, every pair is represented as two consecutive element of the
resulting array. Thus the dictionary of N pairs is converted into a
vector of length 2N where keys are at positions 0, 2, 4, ..., 2N-1 and
corresponding dependent data are at positions 1, 3, 5, ..., 2N. If keys
are all scalars of same type then
<a href="fn_get_keyword.html" class="link" title="get_keyword"><code
class="function">get_keyword</code></a> function can be used to search
in the resulting array.

If the *`destructive`* parameter is 1 or 2 then the function may avoid
copying of keys and values to the resulting array by moving them out
from the dictionary. This is faster but the dictionary will become empty
at the end of operation. The *`destructive`* parameter equal to 1 does
not have any effect if the dictionary is used as a value of more than
one variable. Thus it is safe to make this parameter equal to 1 as soon
as the variable passed to the function as *`dict`* is no longer in use
after the function call and there's no need to inspect the whole program
to check if other variables may be affected. The parameter equal to 2
ignores the presence of multiple variables so the operation may cause
unexpected results in other fragments of code that share the dictionary.

</div>

<div id="params_dict_to_vector" class="refsect1">

## Parameters

<div id="id87184" class="refsect2">

### dict

The dictionary to scan.

</div>

<div id="id87187" class="refsect2">

### destructive

Flag that indicates whether the dictionary can be cleaned during the
operation (0 = never clean, 1 = only if there is no other variables, 2 =
clean unconditionally).

</div>

</div>

<div id="ret_dict_to_vector" class="refsect1">

## Return Types

The function returns a vector of even length.

</div>

<div id="seealso_dict_to_vector" class="refsect1">

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
