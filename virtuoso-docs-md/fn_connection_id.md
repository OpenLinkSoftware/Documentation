<div>

<div>

</div>

<div>

## Name

connection_id — get connection identifier

</div>

<div>

## Synopsis

<div>

|                            |      |
|----------------------------|------|
| ` `**`connection_id`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns a string uniquely identifying the connection in
this server instance. It is usually a combination of server's port
number and a serial number of the client.

<div>

|                              |                                                                                                                                                                                                           |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                      |
|                              | The value returned is usually not useful in HTTP invocation context (VSP or SOAP), since consecutive requests by the same client will typically not be on the same connection the way the server sees it. |

</div>

</div>

<div>

## Return Values

A <span class="type">VARCHAR </span> connection identifier.

</div>

<div>

## Examples

<div>

**Example 24.49. Return The Current Connection ID**

<div>

``` screen
SQL> select connection_id();
callret
VARCHAR
__________________________________

1111:4
```

</div>

</div>

  

</div>

</div>
