<div id="fn_connection_vars_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

connection_vars_set — set all connection variables

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_connection_vars_set" class="funcsynopsis">

|                                  |                          |
|----------------------------------|--------------------------|
| ` `**`connection_vars_set`**` (` | in `var_array ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_connection_vars_set" class="refsect1">

## Description

This function clears all connection variables for current session and
sets new ones defined in the array passed as parameter.

Connection variables do not persist across sessions, one may maintain
persistence of variables by storing them in a database table, as
discussed in <a href="ch-webappdevelopment.html#wssessman" class="link"
title="14.1.4. Session Management">Session Variables</a> -section.

</div>

<div id="params_connection_vars_set" class="refsect1">

## Parameters

<div id="id82921" class="refsect2">

### var_array

An <span class="type">array </span> of even number of elements,
containing name-value pairs. NULL, will cause all connection variables
for current connection to be erased.

</div>

</div>

<div id="examples_connection_vars_set" class="refsect1">

## Examples

<div id="ex_connection_vars_set" class="example">

**Example 24.53. Usage**

<div class="example-contents">

``` screen
  <?vsp
    connection_vars_set (vector ('ID', 12));
  ?>
```

</div>

</div>

  

<div id="ex_connection_vars_set2" class="example">

**Example 24.54. Setting and Retrieving Connection Variables**

<div class="example-contents">

``` screen
SQL>connection_vars_set(vector('v1', 'a', 'v2', 1));

Done. -- 0 msec.
SQL> select connection_vars();
callret
VARCHAR
___________________________________________________________________________

vector(0x004e419c,0x004e40c4,0x004dec9c,1)

1 Rows. -- 70 msec.
SQL>select aref(connection_vars(),0),
      aref(connection_vars(), 1),
      aref(connection_vars(), 2),
      aref(connection_vars(), 3);

callret                   callret                   callret                   callret
VARCHAR                   VARCHAR                   VARCHAR                   VARCHAR
_______________________________________________________________________________

v1                        a                         v2                        1

1 Rows. -- 80 msec.
```

</div>

</div>

  

</div>

<div id="seealso_connection_vars_set" class="refsect1">

## See Also

<a href="fn_connection_get.html" class="link"
title="connection_get">connection_get</a>

<a href="fn_connection_set.html" class="link"
title="connection_set">connection_set</a>

<a href="fn_connection_vars.html" class="link"
title="connection_vars">connection_vars</a>

</div>

</div>
