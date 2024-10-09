<div>

<div>

</div>

<div>

## Name

connection_vars — Retrieve all connection variables

</div>

<div>

## Synopsis

<div>

|                                 |      |
|---------------------------------|------|
| `any `**`connection_vars`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns all stored session variables in an array with
name/value pairs.

Connection variables do not persist across sessions, one may maintain
persistence of variables by storing them in a database table: see the
<a href="ch-webappdevelopment.html#wssessman" class="link"
title="14.1.4. Session Management">Session Variables</a> Section.

</div>

<div>

## Return Types

Array of name-value pairs of all connection variables.

</div>

<div>

## Examples

<div>

**Example 24.52. Retrieving Connection Variables**

<div>

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

<div>

## See Also

<a href="fn_connection_get.html" class="link"
title="connection_get">connection_get</a>

<a href="fn_connection_set.html" class="link"
title="connection_set">connection_set</a>

<a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set">connection_vars_set</a>

</div>

</div>
