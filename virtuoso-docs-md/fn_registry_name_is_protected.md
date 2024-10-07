<div id="fn_registry_name_is_protected" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

registry_name_is_protected — The function checks if a given registry
variable is read-only or protected from occasional changes.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_registry_name_is_protected" class="funcsynopsis">

|                                         |                         |
|-----------------------------------------|-------------------------|
| ` `**`registry_name_is_protected`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_registry_name_is_protected" class="refsect1">

## Description

Some registry variables are used solely by internal server routines so
they should not be changed by any application. Some of these "protected"
variables can be updated by DBA only (in built-in Virtuoso/PL routines)
whereas some can not be updated by any Virtuoso/PL routine at all.

The function gets a variable name as a parameter and returns zero if
such a variable variable can be created/modified/removed by any
application, one if a variable can be modified by DBA but can not be
removed and two if the variable can not be altered even by DBA.

The returned value does not indicate that the variable exists or not
exists. The name of not yet existing variable can be protected anyway to
prevent future misuse of an variable by an application.

The name of any protected variable starts with two underscores. It can
be a good idea to not start names of application-specific registry
variable with two underscores to ensure compatibility with future
versions of Virtuoso Server.

</div>

<div id="params_registry_name_is_protected" class="refsect1">

## Parameters

<div id="id104651" class="refsect2">

### name

The name of registry variable to check.

</div>

</div>

<div id="ret_registry_name_is_protected" class="refsect1">

## Return Types

The function returns an integer

</div>

<div id="examples_registry_name_is_protected" class="refsect1">

## Examples

<div id="ex_registry_name_is_protected" class="example">

**Example 24.314. Two checks of variable names**

<div class="example-contents">

One name can be used by any application, other is for internal use in
the FTP server:

``` screen
> select registry_name_is_protected ('my_example');
0

> select registry_name_is_protected ('__next_free_port');
1
```

</div>

</div>

  

</div>

<div id="seealso_registry_name_is_protected" class="refsect1">

## See Also

<a href="fn_registry_get.html" class="link" title="registry_get"><code
class="function">registry_get </code></a>

<a href="fn_registry_get_all.html" class="link"
title="registry_get_all"><code
class="function">registry_get_all </code></a>

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
