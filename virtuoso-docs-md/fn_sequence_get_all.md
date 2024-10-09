<div>

<div>

</div>

<div>

## Name

sequence_get_all — Returns a vector of states of all sequence objects

</div>

<div>

## Synopsis

<div>

|                                     |      |
|-------------------------------------|------|
| `vector `**`sequence_get_all`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns a vector of even length that contains two elements
for every sequence object that is now stored in the database: the name
and the current state. The order of 'name-state' pairs in the resulting
vector may vary from call to call. To search such a vector by a setting
name, the vector can be passed as a second argument to the function
`get_keyword` ().

Changes in the returned vector will not alter sequence objects of the
database. To change actual sequence objects, use `sequence_set` ().

</div>

<div>

## Return Types

The function returns a vector of even length.

</div>

<div>

## See Also

<a href="sequenceobjects.html" class="link"
title="9.16. Sequence Objects">Sequence Objects</a>

<a href="fn_sequence_next.html" class="link" title="sequence_next"><code
class="function">sequence_next </code></a>

<a href="fn_sequence_set.html" class="link" title="sequence_set"><code
class="function">sequence_set </code></a>

<a href="fn_sequence_remove.html" class="link"
title="sequence_remove"><code
class="function">sequence_remove </code></a>

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
