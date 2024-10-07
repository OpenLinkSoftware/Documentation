<div id="fn_sequence_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sequence_remove — Removes a sequence object

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sequence_remove" class="funcsynopsis">

|                              |                         |
|------------------------------|-------------------------|
| ` `**`sequence_remove`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sequence_remove" class="refsect1">

## Description

The function removes a sequence object created before by `sequence_set `
or `sequence_next ` .

</div>

<div id="params_sequence_remove" class="refsect1">

## Parameters

<div id="id109319" class="refsect2">

### name

The name of the sequence object to be deleted.

</div>

</div>

<div id="ret_sequence_remove" class="refsect1">

## Return Types

The function returns integer one if the sequence object is removed, zero
if there was no object with the specified name.

</div>

<div id="examples_sequence_remove" class="refsect1">

## Examples

<div id="ex_sequence_remove" class="example">

**Example 24.367. Creation and Removal of a Sequence Object**

<div class="example-contents">

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

<div id="seealso_sequence_remove" class="refsect1">

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
