<div id="fn_connection_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

connection_get — Get connection variable

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_connection_get" class="funcsynopsis">

|                                |                         |
|--------------------------------|-------------------------|
| `any `**`connection_get`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_connection_get" class="refsect1">

## Description

`connection_get ` is used to retrieve values stored within the current
connection context. See <a href="fn_connection_set.html" class="link"
title="connection_set"><code class="function">connection_set</code></a>
for a more detailed discussion of connection variables.

</div>

<div id="params_connection_get" class="refsect1">

## Parameters

<div id="id82710" class="refsect2">

### name

Name of the connection variable

</div>

</div>

<div id="ret_connection_get" class="refsect1">

## Return Values

A value associated to the connection by connection_set in the datatype
of the original value. If the variable does not exist, a NULL is
returned.

</div>

<div id="examples_connection_get" class="refsect1">

## Examples

<div id="ex_connection_var1" class="example">

**Example 24.48. Setting and Retrieving Connection Variables**

<div class="example-contents">

``` programlisting
SQL> select connection_get('var_demo');
callret
VARCHAR
__________________________________________________________________

NULL

SQL> connection_set('var_demo', 'some arb data');

SQL> select connection_get('var_demo');
callret
VARCHAR
__________________________________________________________________

some arb data
```

In a VSP page...

``` programlisting
  <?vsp
    declare id integer;
    declare saved_req any;
    id := connection_get ('ID');
    saved_req := connection_set ('saved_request');
  ?>
```

</div>

</div>

  

</div>

<div id="seealso_connection_get" class="refsect1">

## See Also

<a href="fn_connection_set.html" class="link"
title="connection_set">connection_set</a>

</div>

</div>
