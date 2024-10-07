<div id="fn_serv_queue_top" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

SERV_QUEUE_TOP — Retrieve target website and store within Virtuoso

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_serv_queue_top" class="funcsynopsis">

|                                   |                                   |
|-----------------------------------|-----------------------------------|
| `WS.WS. `**`SERV_QUEUE_TOP`**` (` | in `target ` varchar ,            |
|                                   | in `WebDAV_collection ` varchar , |
|                                   | in `update ` integer ,            |
|                                   | in `debug ` integer ,             |
|                                   | in `function_hook ` varchar ,     |
|                                   | in `data ` any `)`;               |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_serv_queue_top" class="refsect1">

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

<div id="params_serv_queue_top" class="refsect1">

## Parameters

<div id="id109542" class="refsect2">

### target

URI to target site.

</div>

<div id="id109545" class="refsect2">

### WebDAV_collection

Local WebDAV collection to copy the content to.

</div>

<div id="id109548" class="refsect2">

### update

Flag to set updatable, can be 1 or 0 for on or off respectably.

</div>

<div id="id109551" class="refsect2">

### debug

Debug flag, must be set to 0

</div>

<div id="id109554" class="refsect2">

### function_hook.

Fully qualified PL function hook name. If not supplied or NULL then the
default function will be used.

</div>

<div id="id109557" class="refsect2">

### data

application dependent data, usually an array, is passed to the PL
function hook to perform next queue entry extraction. In our example we
use an array with names of non-desired sites.

</div>

</div>

<div id="examples_serv_queue_top" class="refsect1">

## Examples

<div id="ex_serv_queue_top" class="example">

**Example 24.370. Retrieve External Sites**

<div class="example-contents">

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
