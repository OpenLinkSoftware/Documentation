<div id="fn_dict_duplicate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_duplicate — Creates a copy of the given dictionary.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_duplicate" class="funcsynopsis">

|                                       |                            |
|---------------------------------------|----------------------------|
| `dictionary `**`dict_duplicate`**` (` | in `dict ` dictionary `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_duplicate" class="refsect1">

## Description

The function creates a full copy of the given dictionary.

Dictionary objects are always passed by reference, even if dictionary is
passed as an 'in' argument of a function. If value of a variable is a
dictionary and it is assigned to other variable then both variables
refer to the same internal hash table. This function returns a really
independent dictionary object.

This function duplicates the given dictionary but does not duplicate
dictionaries that may be stored in key-value pairs.

</div>

<div id="params_dict_duplicate" class="refsect1">

## Parameters

<div id="id86306" class="refsect2">

### dcit

The dictionary to be duplicated.

</div>

</div>

<div id="ret_dict_duplicate" class="refsect1">

## Return Types

The function returns a new dictionary object.

</div>

<div id="seealso_dict_duplicate" class="refsect1">

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
