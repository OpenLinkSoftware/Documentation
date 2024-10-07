<div id="fn_dict_new" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_new — Creates a new dictionary to store key-value pairs.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_new" class="funcsynopsis">

|                                 |                         |
|---------------------------------|-------------------------|
| `dictionary `**`dict_new`**` (` | in `size ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_new" class="refsect1">

## Description

This function creates a new dictionary. A dictionary is a
memory-resident hash table that can store an arbitrary number of
key-value pairs. Both key and dependent part can be of any type,
including vectors. Two keys of different data types are always
considered as different even if SQL '=' operator return 'true', e.g.
integer zero and double precision 0.0 are two different keys. Vectors
are equivalent if their corresponding members are either equal scalars
or equivalent vectors. XML entities are equivalent if they refer to the
same node or attribute in the same document.

Dictionary objects are always passed by reference, even if dictionary is
passed as an 'in' argument of a function. If value of a variable is a
dictionary and it is assigned to other variable then both variables
refer to the same internal hashtable. To create two really independent
dictionary objects, use <a href="fn_dict_duplicate.html" class="link"
title="dict_duplicate"><code
class="function">dict_duplicate ()</code></a> .

</div>

<div id="params_dict_new" class="refsect1">

## Parameters

<div id="id86895" class="refsect2">

### size

The guessed side of hashtable. overestimation of the size will result in
needless memory consumption whereas underscore leads to a bit slower
insertion, because the internal hash table will grow dynamically. The
simplest approach is to omit the parameter at all if you don't know the
number of keys to be stored.

</div>

</div>

<div id="ret_dict_new" class="refsect1">

## Return Types

The function returns a new empty dictionary object.

</div>

<div id="seealso_dict_new" class="refsect1">

## See Also

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
