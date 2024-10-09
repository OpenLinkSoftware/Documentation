<div>

<div>

</div>

<div>

## Name

REPL_DROP_SNAPSHOT_SUB — Drops a subscription to a bi-directional
snapshot publication

</div>

<div>

## Synopsis

<div>

|                                         |                         |
|-----------------------------------------|-------------------------|
| `None `**`REPL_DROP_SNAPSHOT_SUB`**` (` | in `server ` varchar ,  |
|                                         | in `item ` varchar ,    |
|                                         | in `type ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This procedure drops a subscription to a snapshot publication.

<div>

|                              |                                           |
|:----------------------------:|:------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                     |
|                              | This function should be run on publisher. |

</div>

</div>

<div>

## Parameters

<div>

### server

The name of the server defined with `REPL_SNP_SERVER() ` . The name of
the server can be obtained using `REPL_SERVER_NAME()` function.

</div>

<div>

### item

Item is a DAV collection or table name.

</div>

<div>

### type

Type is used to denote the type of Item: 1 if item is a DAV collection,
or 2 if item is a table name.

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

## Examples

<div>

**Example 24.343. Dropping bi-directional snapshot subscription**

<div>

The following statement drops bi-directional snapshot subscription of
server with DSN 'localhost:1121' for table 'Demo.demo.Shippers':

``` screen
SQL> DB.DBA.REPL_DROP_SNAPSHOT_SUB (REPL_SERVER_NAME ('localhost:1121'), 'Demo.demo.Shippers', 2);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_repl_create_snapshot_sub.html" class="link"
title="REPL_CREATE_SNAPSHOT_SUB"><code
class="function">REPL_CREATE_SNAPSHOT_SUB() </code></a>

<a href="fn_repl_create_snapshot_pub.html" class="link"
title="REPL_CREATE_SNAPSHOT_PUB"><code
class="function">REPL_CREATE_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_drop_snapshot_pub.html" class="link"
title="REPL_DROP_SNAPSHOT_PUB"><code
class="function">REPL_DROP_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_init_snapshot.html" class="link"
title="REPL_INIT_SNAPSHOT"><code
class="function">REPL_INIT_SNAPSHOT() </code></a>

<a href="fn_repl_update_snapshot.html" class="link"
title="REPL_UPDATE_SNAPSHOT"><code
class="function">REPL_UPDATE_SNAPSHOT() </code></a>

<a href="fn_repl_snp_server.html" class="link"
title="REPL_SNP_SERVER"><code
class="function">REPL_SNP_SERVER() </code></a>

<a href="fn_repl_server_name.html" class="link"
title="REPL_SERVER_NAME"><code
class="function">REPL_SERVER_NAME() </code></a>

</div>

</div>
