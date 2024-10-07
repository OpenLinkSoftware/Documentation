<div id="fn_sequence_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sequence_set — Sets and returns the state of a sequence object.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sequence_set" class="funcsynopsis">

|                                  |                         |
|----------------------------------|-------------------------|
| `integer `**`sequence_set`**` (` | in `name ` varchar ,    |
|                                  | in `state ` integer ,   |
|                                  | in `mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sequence_set" class="refsect1">

## Description

The function sets and returns the state of a sequence object. The
*`mode`* specifies whether a check for order of values should be made.
If *`mode`* equals 0, the state is set regardless of the previous state.
If *`mode`* is non-zero, the state is changed only if the new state is
greater than the previous state. This gives some (weak) protection from
occasional 'rewind' the sequence back to values that are already in use.

</div>

<div id="params_sequence_set" class="refsect1">

## Parameters

<div id="id109386" class="refsect2">

### name

The server-wide name of a sequence.

</div>

<div id="id109389" class="refsect2">

### state

A new state of the sequence.

</div>

<div id="id109392" class="refsect2">

### mode

Flags if a new state of the sequence should be ignored if it is less
than the current one.

</div>

</div>

<div id="ret_sequence_set" class="refsect1">

## Return Types

The function returns an integer that is equal to what the next call to
`sequence_next` () will return.

</div>

<div id="examples_sequence_set" class="refsect1">

## Examples

<div id="ex_sequence_set" class="example">

**Example 24.368. Different modes of sequence_set()**

<div class="example-contents">

The sequence of calls demonstrates various calls of `sequence_set ` ().

``` screen
select sequence_set ('sample', 5, 0);
5

1 Rows. -- 0 msec.

select sequence_next ('sample');
5

1 Rows. -- 0 msec.

select sequence_next ('sample');
6

1 Rows. -- 0 msec.

-- This has no effect because current state(6) is greater than 2.
select sequence_set ('sample', 2, 1);
7

1 Rows. -- 0 msec.

select sequence_next ('sample');
7

1 Rows. -- 0 msec.

-- But this change has effect:
select sequence_set ('sample', 2, 0);
2

1 Rows. -- 0 msec.

select sequence_next ('sample');
2

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div id="seealso_sequence_set" class="refsect1">

## See Also

<a href="sequenceobjects.html" class="link"
title="9.16. Sequence Objects">Sequence Objects</a>

<a href="fn_sequence_get_all.html" class="link"
title="sequence_get_all"><code
class="function">sequence_get_all </code></a>

<a href="fn_sequence_next.html" class="link" title="sequence_next"><code
class="function">sequence_next </code></a>

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
