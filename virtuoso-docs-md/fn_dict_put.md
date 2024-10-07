<div id="fn_dict_put" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_put — Adds a key-value pair to a dictionary

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_put" class="funcsynopsis">

|                          |                            |
|--------------------------|----------------------------|
| `int `**`dict_put`**` (` | inout `dict ` dictionary , |
|                          | in `key ` any ,            |
|                          | in `value ` any `)`;       |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_put" class="refsect1">

## Description

The function adds or updates a key-value pair in the given dictionary.
If the dictionary contains a pair with the key part equivalent to the
given one then old value is replaced with a new one. Otherwise, a new
pair is added to the dictionary.

</div>

<div id="params_dict_put" class="refsect1">

## Parameters

<div id="id86965" class="refsect2">

### dict

The dictionary to be updated or extended.

</div>

<div id="id86968" class="refsect2">

### key

The key part of the dictionary pair to be added or updated.

</div>

<div id="id86971" class="refsect2">

### value

The dependent part of the pair.

</div>

</div>

<div id="ret_dict_put" class="refsect1">

## Return Types

The function returns the total number of pairs stored in the dictionary
as counted after the modification.

</div>

<div id="seealso_dict_put" class="refsect1">

## See Also

<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new() </code></a>

<a href="fn_dict_zap.html" class="link" title="dict_zap"><code
class="function">dict_zap() </code></a>

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
