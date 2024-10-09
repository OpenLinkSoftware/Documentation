<div>

<div>

</div>

<div>

## Name

SERV_QUEUE_TOP — Retrieve target website and store within Virtuoso

</div>

<div>

## Synopsis

<div>

|                                   |                                   |
|-----------------------------------|-----------------------------------|
| `WS.WS. `**`SERV_QUEUE_TOP`**` (` | in `target ` varchar ,            |
|                                   | in `WebDAV_collection ` varchar , |
|                                   | in `update ` integer ,            |
|                                   | in `debug ` integer ,             |
|                                   | in `function_hook ` varchar ,     |
|                                   | in `data ` any `)`;               |

<div>

 

</div>

</div>

</div>

<div>

## Description

Web Robot site retrieval can be performed with the WS.WS.SERV_QUEUE_TOP
PL function integrated in to the Virtuoso server.

To run multiple walking robots all you simply need to do is kick them
off from separate ODBC/SQL connections and all robots will walk together
without overlapping.

From a VSP interface, after calling the retrieval function you may call
<a href="fn_http_flush.html" class="link"
title="http_flush">http_flush</a> to keep running tasks in the server
and allowing the user agent to continue with other tasks.

</div>

<div>

## Parameters

<div>

### target

URI to target site.

</div>

<div>

### WebDAV_collection

Local WebDAV collection to copy the content to.

</div>

<div>

### update

Flag to set updatable, can be 1 or 0 for on or off respectably.

</div>

<div>

### debug

Debug flag, must be set to 0

</div>

<div>

### function_hook.

Fully qualified PL function hook name. If not supplied or NULL then the
default function will be used.

</div>

<div>

### data

application dependent data, usually an array, is passed to the PL
function hook to perform next queue entry extraction. In our example we
use an array with names of non-desired sites.

</div>

</div>

<div>

## Examples

<div>

**Example 24.370. Retrieve External Sites**

<div>

``` programlisting
WS.WS.SERV_QUEUE_TOP (
  'www.foo.com', 'sites/www_foo_com', 0, 0, 'DB.DBA.my_hook',
    vector ('www.skip.me','www.bar.com')
);
```

</div>

</div>

  

</div>

</div>
