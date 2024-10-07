<div id="fn_repl_init_snapshot" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_INIT_SNAPSHOT — Initializes a bi-directional snapshot publication

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_init_snapshot" class="funcsynopsis">

|                                     |                             |
|-------------------------------------|-----------------------------|
| `None `**`REPL_INIT_SNAPSHOT`**` (` | in `server ` varchar ,      |
|                                     | in `item ` varchar ,        |
|                                     | in `type ` integer ,        |
|                                     | in `how_many ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_init_snapshot" class="refsect1">

## Description

This procedure should be used to initialize a bi-directional snapshot
publication.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                           |
|:----------------------------:|:------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                     |
|                              | This function should be run on publisher. |

</div>

</div>

<div id="params_repl_init_snapshot" class="refsect1">

## Parameters

<div id="id107512" class="refsect2">

### server

The name of the server defined with `REPL_SNP_SERVER() ` . The name of
the server can be obtained using `REPL_SERVER_NAME()` function.

</div>

<div id="id107517" class="refsect2">

### item

Item is a DAV collection or table name.

</div>

<div id="id107520" class="refsect2">

### type

Type is used to denote the type of Item: 1 if item is a DAV collection,
or 2 if item is a table name.

</div>

<div id="id107523" class="refsect2">

### how_many

This parameter specifies the number of copied rows per transaction
during doing initial copy in table case (when type is 2).

</div>

</div>

<div id="ret_repl_init_snapshot" class="refsect1">

## Return Types

None.

</div>

<div id="examples_repl_init_snapshot" class="refsect1">

## Examples

<div id="ex_repl_init_snapshot" class="example">

**Example 24.345. Initializing bi-directional snapshot subscription**

<div class="example-contents">

The following statement does initial copy of data for bi-directional
snapshot subscription of server with DSN 'localhost:1121' for table
'Demo.demo.Shippers':

``` screen
SQL> DB.DBA.REPL_INIT_SNAPSHOT (REPL_SERVER_NAME ('localhost:1121'), 'Demo.demo.Shippers', 2);
```

</div>

</div>

  

</div>

<div id="seealso_repl_init_snapshot" class="refsect1">

## See Also

<a href="fn_repl_create_snapshot_sub.html" class="link"
title="REPL_CREATE_SNAPSHOT_SUB"><code
class="function">REPL_CREATE_SNAPSHOT_SUB() </code></a>

<a href="fn_repl_create_snapshot_pub.html" class="link"
title="REPL_CREATE_SNAPSHOT_PUB"><code
class="function">REPL_CREATE_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_drop_snapshot_sub.html" class="link"
title="REPL_DROP_SNAPSHOT_SUB"><code
class="function">REPL_DROP_SNAPSHOT_SUB() </code></a>

<a href="fn_repl_drop_snapshot_pub.html" class="link"
title="REPL_DROP_SNAPSHOT_PUB"><code
class="function">REPL_DROP_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_update_snapshot.html" class="link"
title="REPL_UPDATE_SNAPSHOT"><code
class="function">REPL_UPDATE_SNAPSHOT() </code></a>

<a href="fn_repl_snp_server.html" class="link"
title="REPL_SNP_SERVER"><code
class="function">REPL_DROP_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_server_name.html" class="link"
title="REPL_SERVER_NAME"><code
class="function">REPL_DROP_SNAPSHOT_PUB() </code></a>

</div>

</div>
