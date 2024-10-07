<div id="fn_dict_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dict_get — Returns the dependent part that corresponds to the given key
in the given dictionary.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dict_get" class="funcsynopsis">

|                          |                              |
|--------------------------|------------------------------|
| `any `**`dict_get`**` (` | in `dict ` dictionary ,      |
|                          | in `key ` any ,              |
|                          | in `default_value ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dict_get" class="refsect1">

## Description

The function returns the dependent part that corresponds to the given
key in the given dictionary. The function returns *`default_value`* if
the dictionary does not contain a pair whose key is equivalent to the
given one. When only two arguments are passed to the function the
default value is integer zero.

</div>

<div id="params_dict_get" class="refsect1">

## Parameters

<div id="id86377" class="refsect2">

### dict

Dictionary object to search in.

</div>

<div id="id86380" class="refsect2">

### key

Key whose dependent part should be found.

</div>

<div id="id86383" class="refsect2">

### default_value

The default value to be returned if the key is not found in the
dictionary.

</div>

</div>

<div id="ret_dict_get" class="refsect1">

## Return Types

The function can return a value of any type.

</div>

<div id="seealso_dict_get" class="refsect1">

## See Also

<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new() </code></a>

<a href="fn_dict_zap.html" class="link" title="dict_zap"><code
class="function">dict_zap() </code></a>

<a href="fn_dict_put.html" class="link" title="dict_put"><code
class="function">dict_put() </code></a>

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
