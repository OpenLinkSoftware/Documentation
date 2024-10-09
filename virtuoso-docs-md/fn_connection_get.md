<div>

<div>

</div>

<div>

## Name

connection_get — Get connection variable

</div>

<div>

## Synopsis

<div>

|                                |                         |
|--------------------------------|-------------------------|
| `any `**`connection_get`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`connection_get ` is used to retrieve values stored within the current
connection context. See <a href="fn_connection_set.html" class="link"
title="connection_set"><code class="function">connection_set</code></a>
for a more detailed discussion of connection variables.

</div>

<div>

## Parameters

<div>

### name

Name of the connection variable

</div>

</div>

<div>

## Return Values

A value associated to the connection by connection_set in the datatype
of the original value. If the variable does not exist, a NULL is
returned.

</div>

<div>

## Examples

<div>

**Example 24.48. Setting and Retrieving Connection Variables**

<div>

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

<div>

## See Also

<a href="fn_connection_set.html" class="link"
title="connection_set">connection_set</a>

</div>

</div>
