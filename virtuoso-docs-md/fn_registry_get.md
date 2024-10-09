<div>

<div>

</div>

<div>

## Name

registry_get — Returns a current value of a registry setting

</div>

<div>

## Synopsis

<div>

|                                  |                         |
|----------------------------------|-------------------------|
| `varchar `**`registry_get`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`registry_get ` is used to retrieve values stored within database
registry.

</div>

<div>

## Parameters

<div>

### name

Name of the registry setting

</div>

</div>

<div>

## Return Values

A string value associated to the registry by registry_set. If the
variable does not exist, a 0 (zero) is returned.

</div>

<div>

## Examples

<div>

**Example 24.313. Setting and Retrieving Registry Settings**

<div>

``` programlisting
SQL> select registry_get('var_demo');
callret
VARCHAR
__________________________________________________________________

NULL

SQL> registry_set('var_demo', 'some arb data');

SQL> select registry_get('var_demo');
callret
VARCHAR
__________________________________________________________________

some arb data
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_registry_get_all.html" class="link"
title="registry_get_all"><code
class="function">registry_get_all </code></a>

<a href="fn_registry_name_is_protected.html" class="link"
title="registry_name_is_protected"><code
class="function">registry_name_is_protected </code></a>

<a href="fn_registry_set.html" class="link" title="registry_set"><code
class="function">registry_set </code></a>

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
