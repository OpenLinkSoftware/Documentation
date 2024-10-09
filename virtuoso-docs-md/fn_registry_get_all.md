<div>

<div>

</div>

<div>

## Name

registry_get_all — Returns a vector of all registry settings

</div>

<div>

## Synopsis

<div>

|                                     |      |
|-------------------------------------|------|
| `vector `**`registry_get_all`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns a vector of even length that contains two elements
for every registry setting that is now stored in the database: the name
and the current value of the setting. The order of 'name-value' pairs in
the resulting vector may vary from call to call. To search such a vector
by a setting name, the vector can be passed as a second argument to the
function `get_keyword` ().

The returned vector is a full copy of the content of the registry. To
change the actual registry, use `registry_set` .

</div>

<div>

## Return Types

The function returns a vector of even length.

</div>

<div>

## See Also

<a href="fn_registry_get.html" class="link" title="registry_get"><code
class="function">registry_get </code></a>

<a href="fn_registry_set.html" class="link" title="registry_set"><code
class="function">registry_set </code></a>

<a href="fn_registry_name_is_protected.html" class="link"
title="registry_name_is_protected"><code
class="function">registry_name_is_protected </code></a>

<a href="fn_registry_remove.html" class="link"
title="registry_remove"><code
class="function">registry_remove </code></a>

<a href="fn_sequence_get_all.html" class="link"
title="sequence_get_all"><code
class="function">sequence_get_all </code></a>

<a href="fn_sequence_next.html" class="link" title="sequence_next"><code
class="function">sequence_next </code></a>

<a href="fn_sequence_set.html" class="link" title="sequence_set"><code
class="function">sequence_set </code></a>

<a href="fn_sequence_remove.html" class="link"
title="sequence_remove"><code
class="function">sequence_remove </code></a>

</div>

</div>
