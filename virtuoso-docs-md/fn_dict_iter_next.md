<div>

<div>

</div>

<div>

## Name

dict_iter_next — Fetches a pair of key and value from a dictionary
iterator and moves the iterator to the next pair.

</div>

<div>

## Synopsis

<div>

|                             |                            |
|-----------------------------|----------------------------|
| ` `**`dict_iter_next`**` (` | inout `dict ` dictionary , |
|                             | out `ret_key ` any ,       |
|                             | out `ret_value ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function gets the dictionary iterator initialized earlier by
<a href="fn_dict_iter_rewind.html" class="link"
title="dict_iter_rewind"><code
class="function">dict_iter_rewind </code></a> and checks whether the
iterator is still valid and not in conflict with any changes made by
<a href="fn_dict_put.html" class="link" title="dict_put"><code
class="function">dict_put</code></a> or the like. After that, if the
iterator is in the position past the last item of the dictionary then
zero is returned. If the iterator points to some item then *`ret_key`*
and *`ret_value`* parameters are set to the key and value of the current
item, the iterator is advanced to the next position (next item if
present, otherwise past the end of the dictionary) and a nonzero integer
is returned. If *`ret_value`* is a constant or an expression but not a
plain variable then it is left unchanged but no error is signalled, so
if the caller procedure needs only values of keys from dictionary then
any constant like zero can be passed as a third parameter. Similarly,
*`ret_key`* is not necessarily a variable.

Note that the values of *`ret_key`* and *`ret_value`* are left unchanged
if the iterator points past the end of the dictionary. They are not
filled in with NULLs or something like that.

</div>

<div>

## Parameters

<div>

### dict

Dictionary iterator

</div>

<div>

### ret_key

The variable to be filled in with the key of the item. The parameter is
ignored if it is not a plain variable.

</div>

<div>

### ret_value

The variable to be filled in with the value (dependant part) of the
item. The parameter is ignored if it is not a plain variable.

</div>

</div>

<div>

## Return Types

The function returns a nonzero integer if the item is successfully
fetched, zero otherwise

</div>

<div>

## Errors

This function can generate the following errors:

<div>

**Table 24.24. **

<div>

| Error Code                            | Description                                                                                                                                                                                                                                                                                                                |
|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errortext">SR630 </span> Function dict_iter_next() tries to iterate a volatile dictionary changed after last <a href="fn_dict_iter_rewind.html" class="link"                                                                                                                                                  
                                         title="dict_iter_rewind"><code                                                                                                                                                                                                                                                                                              
                                         class="function">dict_iter_rewind </code></a> (). Not every change in the dictionary results in this error. If the dict_iter_next() and <a href="fn_dict_put.html" class="link" title="dict_put"><code                                                                                                                      
                                         class="function">dict_put</code></a> () (or similar function) are both called with same variable passed as *`dict`* parameter then the function might adjust the iterator to match the changed state of the dictionary so it remains valid. In addition, if <a href="fn_dict_put.html" class="link" title="dict_put"><code  
                                         class="function">dict_put</code></a> () changes only the value associated with some key but does not extend the dictionary with a new item then it does not invalidate any iterators.                                                                                                                                       |

</div>

</div>

  

</div>

<div>

## Example

<div>

**Example 24.92. Simplest read throughout the dictionary.**

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

<a href="fn_dict_iter_rewind.html" class="link"
title="dict_iter_rewind"><code
class="function">dict_iter_rewind </code></a>

</div>

</div>
