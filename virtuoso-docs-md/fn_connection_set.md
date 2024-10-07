<div id="fn_connection_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

connection_set — Associates a value to the name in the context of the
present connection

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_connection_set" class="funcsynopsis">

|                             |                      |
|-----------------------------|----------------------|
| ` `**`connection_set`**` (` | in `name ` varchar , |
|                             | in `value ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_connection_set" class="refsect1">

## Description

This associates a value to the name in the context of present
connection. The name should be a string and the value can be any data
type except blob, open cursor or an XML entity. If the value is an array
it may not contain the restricted types.

Connection variable setting is not logged and information stored will be
lost when the connection is closed. The value can be retrieved by any
future statement executing within the same connection. Connection
variables can be used as a global variable mechanism for stored
procedures, the scope being the client connection.

In the case of VSP or SOAP this mechanism cannot be used to pass
information between requests by the same client. It will however, be
useful for having 'global variables' between procedures called within
the same HTTP request. Note that this mechanism is used to provide
persistent HTTP session variables in some cases but this works through
special before and after code which stores the values set with this
function into an external session structure. In this sense this function
itself has nothing to do with web session management although it can be
used as a component for such.

</div>

<div id="params_connection_set" class="refsect1">

## Parameters

<div id="id82817" class="refsect2">

### name

<span class="type">VARCHAR </span> name to associate the value with.

</div>

<div id="id82821" class="refsect2">

### value

*`value `* to be stored. May be any data type except
<span class="type">LOB</span> , open cursor or XML entity. If the value
is an <span class="type">array </span> , it may not contain the
restricted types.

</div>

</div>

<div id="ret_connection_set" class="refsect1">

## Return Values

None

</div>

<div id="errors_connection_set" class="refsect1">

## Errors

<div id="id82832" class="table">

**Table 24.16. Errors signalled by connection_set**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                    | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR049 </span> | <span class="errortext">Data type is not suitable for storage into a global variable (connection_set) </span> |             |

</div>

</div>

  

</div>

<div id="id82850" class="refsect1">

## Examples

<div id="ex_connection_set" class="example">

**Example 24.51. Setting and Retrieving Connection Variables**

<div class="example-contents">

From SQL

``` screen
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

From a VSP page

``` screen
  <?vsp
    declare id integer;
    id := 12;
    connection_set ('ID', id);
    connection_set ('saved_request' , lines);
  ?>
```

</div>

</div>

  

</div>

<div id="seealso_connection_set" class="refsect1">

## See Also

<a href="fn_connection_get.html" class="link"
title="connection_get">connection_get</a>

<a href="fn_connection_is_dirty.html" class="link"
title="connection_is_dirty">connection_is_dirty</a>

<a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set">connection_vars_set</a>

</div>

</div>
