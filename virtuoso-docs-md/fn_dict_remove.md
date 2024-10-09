<div>

<div>

</div>

<div>

## Name

dict_remove — Removes the given key and associated dependent value from
the given dictionary.

</div>

<div>

## Synopsis

<div>

|                             |                            |
|-----------------------------|----------------------------|
| `int `**`dict_remove`**` (` | inout `dict ` dictionary , |
|                             | inout `key ` any `)`;      |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function removes the given key and the associated dependent value
from the given dictionary. If the key-value pair is found (and removed)
the function returns 1. If the dictionary does not contain a key
equivalent to the given one the function returns zero.

</div>

<div>

## Parameters

<div>

### dict

Dictionary object to process.

</div>

<div>

### key

Key of a key-value pair that should be removed from the dictionary.

</div>

</div>

<div>

## Return Types

Integer flag indicating if a key-value pair has been found and removed.

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
