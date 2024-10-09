<div>

<div>

</div>

<div>

## Name

dict_iter_rewind — Resets the iterator before fetching keys and values
by dict_iter_next()

</div>

<div>

## Synopsis

<div>

|                               |                               |
|-------------------------------|-------------------------------|
| ` `**`dict_iter_rewind`**` (` | inout `dict ` dictionary `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The dictionary is always passed by reference, due to its (potentialy
big) size. The reference variable contains not only pointer to the whole
dictionary but also a forward-only iterator (a "cursor") that can be
used to retrieve items of the dictionary one after the other. The
function sets the iterator to the very first item of the dictionary.

</div>

<div>

## Parameters

<div>

### dict

The reference to a dictionary to use as an iterator

</div>

</div>

<div>

## Return Types

The function returns an integer that is the expected number of items in
the dictionary; the value may not match to the number of items retrieved
later by dict_iter_next() if a dictionary is edited by some thread.

</div>

<div>

## Example

<div>

**Example 24.93. Simplest read throughout the dictionary.**

<div>

The procedure creates a dictionary, puts couple of items into it and
then print them to the server's console

``` screen
create function dict_iterator_test ()
{
  declare dict, dkey, dvalue any;
  dict := dict_new (10);
  dict_put (dict, 'a', 1); dict_put (dict, 'b', 2);
  dict_iter_rewind (dict);
  while (dict_iter_next (dict, dkey, dvalue))
    dbg_obj_princ (' key is ' dkey, ', corresponding value is ', dvalue);
}
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new </code></a>

<a href="fn_dict_zap.html" class="link" title="dict_zap"><code
class="function">dict_zap </code></a>

<a href="fn_dict_put.html" class="link" title="dict_put"><code
class="function">dict_put </code></a>

<a href="fn_dict_get.html" class="link" title="dict_get"><code
class="function">dict_get </code></a>

<a href="fn_dict_remove.html" class="link" title="dict_remove"><code
class="function">dict_remove </code></a>

<a href="fn_dict_inc_or_put.html" class="link"
title="dict_inc_or_put"><code
class="function">dict_inc_or_put </code></a>

<a href="fn_dict_dec_or_remove.html" class="link"
title="dict_dec_or_remove"><code
class="function">dict_dec_or_remove </code></a>

<a href="fn_dict_size.html" class="link" title="dict_size"><code
class="function">dict_size </code></a>

<a href="fn_dict_duplicate.html" class="link"
title="dict_duplicate"><code class="function">dict_duplicate </code></a>

<a href="fn_dict_to_vector.html" class="link"
title="dict_to_vector"><code class="function">dict_to_vector </code></a>

<a href="fn_dict_list_keys.html" class="link"
title="dict_list_keys"><code class="function">dict_list_keys </code></a>

<a href="fn_dict_destructive_list_rnd_keys.html" class="link"
title="dict_destructive_list_rnd_keys"><code
class="function">dict_destructive_list_rnd_keys </code></a>

<a href="fn_dict_iter_next.html" class="link"
title="dict_iter_next"><code class="function">dict_iter_next </code></a>

</div>

</div>
