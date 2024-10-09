<div>

<div>

</div>

<div>

## Name

dict_destructive_list_rnd_keys — Returns all or some keys from the given
dictionary

</div>

<div>

## Synopsis

<div>

|                                             |                               |
|---------------------------------------------|-------------------------------|
| ` `**`dict_destructive_list_rnd_keys`**` (` | inout `dict ` dictionary ,    |
|                                             | in `batch_size ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns an array of keys stored in the given dictionary,
ignoring dependent parts of key-value pairs, but unlike
<a href="fn_dict_list_keys.html" class="link"
title="dict_list_keys"><code class="function">dict_list_keys</code></a>
it may return only some keys, not all, and it always remove the returned
keys from the dictionary. The returned array is *`batch_size`* items
long (if the dictionary is big enough to fill it).

The order of items returned (and hence the content of the dictionary
after function call) is undefined. It is not randomized artificially but
it may vary from run to run depending on barely predictable factors. As
a result, the most typical use of the function is calling it in a loop
that ends when the size of returned array falls down to zero indicating
that the dictionary is exausted.

</div>

<div>

## Parameters

<div>

### dict

The dictionary where result keys come from.

</div>

<div>

### batch_size

The maximum size of array to be constructed. The value can not be less
than 65535 and more than the maximum allowed length of array (1250000
for 64-bit machines, 25000000 for 32-bit machines). All other equal, it
is preferable to keep it below 200000.

</div>

</div>

<div>

## Return Types

The function always returns an array; the array is empty if *`dict `* is
NULL or an empty dictionary.

</div>

<div>

## Example

<div>

**Example 24.94. Simple Use**

<div>

The function gets a dictionary with RDF triples stored as keys and
inserts all these triples into a given graph.

``` screen
create function DB.DBA.INSERT_DICT_IN_GRAPH (in graph_iri varchar, in triples_dict any) returns varchar
{
  declare triples any;
  declare ins_count integer;
  ins_count := 0;
  while (dict_size (triples_dict) > 0)
    {
      triples := dict_destructive_list_rnd_keys (triples_dict, 80000);
      DB.DBA.RDF_INSERT_TRIPLES (graph_iri, triples, 1);
      ins_count := ins_count + length (triples);
    }
  return sprintf ('The function INSERT_DICT_IN_GRAPH has inserted %d triples in graph <%s>',
    ins_count, graph_iri );
}
;
```

</div>

</div>

  

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

<a href="fn_dict_iter_rewind.html" class="link"
title="dict_iter_rewind"><code
class="function">dict_iter_rewind() </code></a>

<a href="fn_dict_iter_next.html" class="link"
title="dict_iter_next"><code
class="function">dict_iter_next() </code></a>

</div>

</div>
