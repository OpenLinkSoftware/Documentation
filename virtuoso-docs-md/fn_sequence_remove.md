<div>

<div>

</div>

<div>

## Name

sequence_remove — Removes a sequence object

</div>

<div>

## Synopsis

<div>

|                              |                         |
|------------------------------|-------------------------|
| ` `**`sequence_remove`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function removes a sequence object created before by `sequence_set `
or `sequence_next ` .

</div>

<div>

## Parameters

<div>

### name

The name of the sequence object to be deleted.

</div>

</div>

<div>

## Return Types

The function returns integer one if the sequence object is removed, zero
if there was no object with the specified name.

</div>

<div>

## Examples

<div>

**Example 24.367. Creation and Removal of a Sequence Object**

<div>

This sequence of operations demonstrates how `sequence_remove ` reverts
the effect of `sequence_next ` .

``` screen
> select sequence_next ('my_sequence');
0

> select sequence_next ('my_sequence');
1

> select sequence_next ('my_sequence');
2

> select sequence_remove ('my_sequence');
1

> select sequence_next ('my_sequence');
0
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="sequenceobjects.html" class="link"
title="9.16. Sequence Objects">Sequence Objects</a>

`sequence_get `

<a href="fn_sequence_get_all.html" class="link"
title="sequence_get_all"><code
class="function">sequence_get_all </code></a>

<a href="fn_sequence_next.html" class="link" title="sequence_next"><code
class="function">sequence_next </code></a>

<a href="fn_registry_get.html" class="link" title="registry_get"><code
class="function">registry_get </code></a>

<a href="fn_registry_get_all.html" class="link"
title="registry_get_all"><code
class="function">registry_get_all </code></a>

<a href="fn_registry_set.html" class="link" title="registry_set"><code
class="function">registry_set </code></a>

<a href="fn_registry_name_is_protected.html" class="link"
title="registry_name_is_protected"><code
class="function">registry_name_is_protected </code></a>

<a href="fn_registry_remove.html" class="link"
title="registry_remove"><code
class="function">registry_remove </code></a>

</div>

</div>
