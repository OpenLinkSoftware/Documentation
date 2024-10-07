<div id="fn_connection_id" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

connection_id — get connection identifier

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_connection_id" class="funcsynopsis">

|                            |      |
|----------------------------|------|
| ` `**`connection_id`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_connection_id" class="refsect1">

## Description

This function returns a string uniquely identifying the connection in
this server instance. It is usually a combination of server's port
number and a serial number of the client.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                           |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                      |
|                              | The value returned is usually not useful in HTTP invocation context (VSP or SOAP), since consecutive requests by the same client will typically not be on the same connection the way the server sees it. |

</div>

</div>

<div id="ret_connection_id" class="refsect1">

## Return Values

A <span class="type">VARCHAR </span> connection identifier.

</div>

<div id="examples_connection_id" class="refsect1">

## Examples

<div id="ex_connection_id" class="example">

**Example 24.49. Return The Current Connection ID**

<div class="example-contents">

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
