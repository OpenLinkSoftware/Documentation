<div id="fn_dict_dec_or_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_dec_or_remove — Decrement a counter in a dictionary of counters or
deletes it if it becomes zero or negative.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_dec_or_remove" class="funcsynopsis">

|                                 |                                    |
|---------------------------------|------------------------------------|
| ` `**`dict_dec_or_remove`**` (` | inout `dict ` dictionary ,         |
|                                 | in `key ` any ,                    |
|                                 | in `value_decrement ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_dec_or_remove" class="refsect1">

## Description

The function checks whether *`dict `* contains *`key `* . If it isn't so
then the function checks the datatype of the value associated with the
key. An error 42000 is signalled in case of non-integer value or a
negative integer value. If the value is positive and greater than
*`value_decrement`* then *`value_decrement`* is subtracted from it and
the result become the new value associated with *`key`* in *`dict`* . If
the value is positive and less than or equal to *`value_decrement`* then
*`key`* is removed from *`dict`* . If key is not in the dictionary then
the dictionary remains unchanged.

Informally, the function reverts the effect of `dict_inc_or_add ` .

</div>

<div id="params_dict_dec_or_remove" class="refsect1">

## Parameters

<div id="id86230" class="refsect2">

### dict

Dictionary of counters. The NULL value is equivalent to an empty
dictionary.

</div>

<div id="id86233" class="refsect2">

### key

Key of a dictionary item to process.

</div>

<div id="id86236" class="refsect2">

### value decrement

A nonnegative integer (typically 1) that is subtracted from the value
associated with *`key `* .

</div>

</div>

<div id="ret_dict_dec_or_remove" class="refsect1">

## Return Types

The function returns the changed value associated with the *`key `* , or
zero in any other case.

</div>

<div id="seealso_dict_dec_or_remove" class="refsect1">

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
