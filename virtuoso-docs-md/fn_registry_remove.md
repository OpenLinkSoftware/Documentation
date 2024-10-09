<div>

<div>

</div>

<div>

## Name

registry_remove — Remove a variable from registry

</div>

<div>

## Synopsis

<div>

|                              |                         |
|------------------------------|-------------------------|
| ` `**`registry_remove`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function removes a given variable from registry, so future calls of
registry_get returns zero.

Some registry variables are used solely by internal server routines so
they should not be changed by any application. Nobody can remove such a
"protected" variable even if some of them can be updated by DBA.

</div>

<div>

## Parameters

<div>

### name

Name of variable to be removed.

</div>

</div>

<div>

## Return Types

The function returns the last saved value of a variable or zero if the
specified variable does not exists.

</div>

<div>

## Errors

<div>

**Table 24.74. Errors signalled by registry_set**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                        | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function registry_remove needs a string as argument 1, not an arg of \[datatype\] </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR485 </span> | <span class="errortext">Function registry_remove can not remove protected registry variable \[name\]. </span>     |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.316. Creation and Removal of a Registry Variable**

<div>

This sequence of operations demonstrates that `registry_remove ` reverts
the effect of `registry_set ` .

``` screen
> select registry_get ('my_variable');
0

> select registry_set ('my_variable', 'my_value');
1

> select registry_get ('my_variable');
my_value

> select registry_remove ('my_variable');
my_value

> select registry_get ('my_variable');
0
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_registry_set.html" class="link" title="registry_set"><code
class="function">registry_set </code></a>

<a href="fn_registry_get.html" class="link" title="registry_get"><code
class="function">registry_get </code></a>

<a href="fn_registry_name_is_protected.html" class="link"
title="registry_name_is_protected"><code
class="function">registry_name_is_protected </code></a>

<a href="fn_registry_get_all.html" class="link"
title="registry_get_all"><code
class="function">registry_get_all </code></a>

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
