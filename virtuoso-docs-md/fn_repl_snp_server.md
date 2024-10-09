<div>

<div>

</div>

<div>

## Name

REPL_SNP_SERVER — Define bi-directional snapshot replication server name

</div>

<div>

## Synopsis

<div>

|                                     |                        |
|-------------------------------------|------------------------|
| `varchar `**`REPL_SNP_SERVER`**` (` | in `dsn ` varchar ,    |
|                                     | in `uid ` varchar ,    |
|                                     | in `pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function should be used to define a server for bi-directional
snapshot replication.

</div>

<div>

## Parameters

<div>

### dsn

Dsn is a data source name.

</div>

<div>

### uid

Uid is data source user name.

</div>

<div>

### pwd

Uid is data source password.

</div>

</div>

<div>

## Return Types

REPL_SNP_SERVER() returns remote server name which can be used in calls
to `REPL_CREATE_SNAPSHOT_SUB()` , `REPL_DROP_SNAPSHOT_SUB()` and
`REPL_INIT_SNAPSHOT_SUB()` functions.

</div>

<div>

## Examples

<div>

**Example 24.347. Defining bi-directional snapshot replication server**

<div>

The following statement defines bi-directional replication server for
server with DSN 'localhost:1121':

``` screen
SQL> REPL_SNP_SERVER ('localhost:1121', 'dba', 'dba');
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

<a href="fn_repl_drop_snapshot_sub.html" class="link"
title="REPL_DROP_SNAPSHOT_SUB"><code
class="function">REPL_DROP_SNAPSHOT_SUB() </code></a>

<a href="fn_repl_drop_snapshot_pub.html" class="link"
title="REPL_DROP_SNAPSHOT_PUB"><code
class="function">REPL_DROP_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_init_snapshot.html" class="link"
title="REPL_INIT_SNAPSHOT"><code
class="function">REPL_INIT_SNAPSHOT() </code></a>

<a href="fn_repl_update_snapshot.html" class="link"
title="REPL_UPDATE_SNAPSHOT"><code
class="function">REPL_DROP_SNAPSHOT_PUB() </code></a>

<a href="fn_repl_server_name.html" class="link"
title="REPL_SERVER_NAME"><code
class="function">REPL_SERVER_NAME() </code></a>

</div>

</div>
