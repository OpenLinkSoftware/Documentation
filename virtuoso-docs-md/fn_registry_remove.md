<div id="fn_registry_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

registry_remove — Remove a variable from registry

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_registry_remove" class="funcsynopsis">

|                              |                         |
|------------------------------|-------------------------|
| ` `**`registry_remove`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_registry_remove" class="refsect1">

## Description

The function removes a given variable from registry, so future calls of
registry_get returns zero.

Some registry variables are used solely by internal server routines so
they should not be changed by any application. Nobody can remove such a
"protected" variable even if some of them can be updated by DBA.

</div>

<div id="params_registry_remove" class="refsect1">

## Parameters

<div id="id104817" class="refsect2">

### name

Name of variable to be removed.

</div>

</div>

<div id="ret_registry_remove" class="refsect1">

## Return Types

The function returns the last saved value of a variable or zero if the
specified variable does not exists.

</div>

<div id="errors_registry_remove" class="refsect1">

## Errors

<div id="id104825" class="table">

**Table 24.75. Errors signalled by registry_set**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                        | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function registry_remove needs a string as argument 1, not an arg of \[datatype\] </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR485 </span> | <span class="errortext">Function registry_remove can not remove protected registry variable \[name\]. </span>     |             |

</div>

</div>

  

</div>

<div id="examples_registry_remove" class="refsect1">

## Examples

<div id="ex_registry_remove" class="example">

**Example 24.316. Creation and Removal of a Registry Variable**

<div class="example-contents">

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

<div id="seealso_registry_remove" class="refsect1">

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
