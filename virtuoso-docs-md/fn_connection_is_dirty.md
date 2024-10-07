<div id="fn_connection_is_dirty" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

connection_is_dirty — check if current session connection variables have
been altered

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_connection_is_dirty" class="funcsynopsis">

|                                         |      |
|-----------------------------------------|------|
| `integer `**`connection_is_dirty`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_connection_is_dirty" class="refsect1">

## Description

This function is used to determine if the session variables have changed
between a call to <a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set"><code
class="function">connection_vars_set</code></a> and current point of
execution. A call to <a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set">connection_vars_set</a> will cause
subsequent calls to `connection_is_dirty` to return true.

The function is useful in postprocessing functions for making
conditional storage of session variables in a database table.

</div>

<div id="ret_connection_is_dirty" class="refsect1">

## Return Values

An <span class="type">INTEGER </span> indicating true (1) or false (0).

</div>

<div id="examples_connection_is_dirty" class="refsect1">

## Examples

<div id="ex_connection_is_dirty_1" class="example">

**Example 24.50. Checking Connection Variables**

<div class="example-contents">

``` programlisting
  <?vsp
    declare rc integer;
    connection_vars_set ();
    rc := connection_is_dirty (); -- rc is equal to 0
    connection_set ('ID', 14);
    rc := connection_is_dirty (); -- rc is equal to 1
  ?>
```

</div>

</div>

  

</div>

<div id="seealso_connection_is_dirty" class="refsect1">

## See Also

<a href="fn_connection_get.html" class="link"
title="connection_get">connection_get</a>

<a href="fn_connection_set.html" class="link"
title="connection_set">connection_set</a>

<a href="fn_connection_vars.html" class="link"
title="connection_vars">connection_vars</a>

<a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set">connection_vars_set</a>

</div>

</div>
