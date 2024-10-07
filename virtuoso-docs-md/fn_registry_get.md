<div id="fn_registry_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

registry_get — Returns a current value of a registry setting

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_registry_get" class="funcsynopsis">

|                                  |                         |
|----------------------------------|-------------------------|
| `varchar `**`registry_get`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_registry_get" class="refsect1">

## Description

`registry_get ` is used to retrieve values stored within database
registry.

</div>

<div id="params_registry_get" class="refsect1">

## Parameters

<div id="id104544" class="refsect2">

### name

Name of the registry setting

</div>

</div>

<div id="ret_registry_get" class="refsect1">

## Return Values

A string value associated to the registry by registry_set. If the
variable does not exist, a 0 (zero) is returned.

</div>

<div id="examples_registry_get" class="refsect1">

## Examples

<div id="ex_registry_var1" class="example">

**Example 24.313. Setting and Retrieving Registry Settings**

<div class="example-contents">

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

<div id="seealso_registry_get" class="refsect1">

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
