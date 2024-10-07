<div id="fn_sequence_next" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sequence_next — Returns the current state of the specified sequence and
increments it by one.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sequence_next" class="funcsynopsis">

|                                   |                                 |
|-----------------------------------|---------------------------------|
| `integer `**`sequence_next`**` (` | in `name ` varchar ,            |
|                                   | in `increment_by ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sequence_next" class="refsect1">

## Description

This function returns the current state of the specified sequence and
atomically increments it by one. The next call will thus return a number
one greater than the previous. The sequence is shared between all
connections and all transactions so an increment that is is made in one
of connection will be seen in other connection immediately. Using a
sequence never involves locking.

</div>

<div id="params_sequence_next" class="refsect1">

## Parameters

<div id="id109261" class="refsect2">

### name

The server-wide name of a sequence.

</div>

<div id="id109264" class="refsect2">

### increment_by

This is to specify how much will be added to the sequence (must be
greater than zero) If not specified defaults to 1.

</div>

</div>

<div id="ret_sequence_next" class="refsect1">

## Return Types

The function returns integer

</div>

<div id="seealso_sequence_next" class="refsect1">

## See Also

<a href="sequenceobjects.html" class="link"
title="9.16. Sequence Objects">Sequence Objects</a>

<a href="fn_sequence_get_all.html" class="link"
title="sequence_get_all"><code
class="function">sequence_get_all </code></a>

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
