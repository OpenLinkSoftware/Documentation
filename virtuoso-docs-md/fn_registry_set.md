<div>

<div>

</div>

<div>

## Name

registry_set — Associates a value to the name in the Database registry

</div>

<div>

## Synopsis

<div>

|                           |                          |
|---------------------------|--------------------------|
| ` `**`registry_set`**` (` | in `name ` varchar ,     |
|                           | in `value ` varchar ,    |
|                           | in `force ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This associates a value to the name in the Database registry. The name
should be a string and the value must be also string.

Registry settings are kept in Database, therefore they are persistent.

Some registry variables are used solely by internal server routines so
they should not be set by any application. Some of these "protected"
variables can be updated by DBA only (in built-in Virtuoso/PL routines)
whereas some can not be updated by any Virtuoso/PL routine at all. If
the function is called by DBA then a third argument can be specified to
indicate how the function should try to update such a variable, but you
will probably never use this feature.

</div>

<div>

## Parameters

<div>

### name

<span class="type">VARCHAR </span> name to associate the value with.

</div>

<div>

### value

*`value `* to be stored. Must be of <span class="type">VARCHAR </span>
type. Also if needs to be stored some other datatype it needs to be
serialized (see serialize and deserialize functions).

</div>

<div>

### force

Flag to indicate how the function should try to update protected
variables. The value 0 is to signal an error on such an attempt, 1 is to
try to update and signal an error if failed, 2 is to try to update and
silently return 0 if failed.

</div>

</div>

<div>

## Return Values

The function returns 1 if success, 0 if a (protected) variable value
cannot be changed.

</div>

<div>

## Errors

<div>

**Table 24.73. Errors signalled by registry_set**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                               | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function registry_set needs a string as argument 2, not an arg of \[datatype\] </span>           |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR483 </span> | <span class="errortext">Function registry_set needs nonzero third argument to modify registry variable \[name\]. </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR484 </span> | <span class="errortext">Function registry_set can not modify protected registry variable \[name\]. </span>               |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.315. Setting and Retrieving Registry Setting**

<div>

From SQL

``` screen
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

<a href="fn_registry_get.html" class="link" title="registry_get"><code
class="function">registry_get </code></a>

<a href="fn_registry_name_is_protected.html" class="link"
title="registry_name_is_protected"><code
class="function">registry_name_is_protected </code></a>

<a href="fn_registry_get_all.html" class="link"
title="registry_get_all"><code
class="function">registry_get_all </code></a>

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
