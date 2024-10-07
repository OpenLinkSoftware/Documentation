<div id="fn_connection_vars" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

connection_vars — Retrieve all connection variables

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_connection_vars" class="funcsynopsis">

|                                 |      |
|---------------------------------|------|
| `any `**`connection_vars`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_connection_vars" class="refsect1">

## Description

This function returns all stored session variables in an array with
name/value pairs.

Connection variables do not persist across sessions, one may maintain
persistence of variables by storing them in a database table: see the
<a href="ch-webappdevelopment.html#wssessman" class="link"
title="14.1.4. Session Management">Session Variables</a> Section.

</div>

<div id="ret_connection_vars" class="refsect1">

## Return Types

Array of name-value pairs of all connection variables.

</div>

<div id="examples_connection_vars" class="refsect1">

## Examples

<div id="ex_connection_vars" class="example">

**Example 24.52. Retrieving Connection Variables**

<div class="example-contents">

``` programlisting
  <?vsp
    declare ses_vars any;
    ses_vars := connection_vars ();
    update session set s_vars = serialize (ses_vars) where s_id = get_keyword ('sid', params);
  ?>
```

</div>

</div>

  

</div>

<div id="seealso_connection_vars" class="refsect1">

## See Also

<a href="fn_connection_get.html" class="link"
title="connection_get">connection_get</a>

<a href="fn_connection_set.html" class="link"
title="connection_set">connection_set</a>

<a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set">connection_vars_set</a>

</div>

</div>
