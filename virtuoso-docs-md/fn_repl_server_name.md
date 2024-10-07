<div id="fn_repl_server_name" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_SERVER_NAME — Return bi-directional snapshot replication server
name for specified DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_server_name" class="funcsynopsis">

|                                      |                        |
|--------------------------------------|------------------------|
| `varchar `**`REPL_SERVER_NAME`**` (` | in `dsn ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_server_name" class="refsect1">

## Description

This function should be used to determine bi-directional snapshot
replication server name.

</div>

<div id="params_repl_server_name" class="refsect1">

## Parameters

<div id="id107706" class="refsect2">

### item

Dsn is a data source name.

</div>

</div>

<div id="ret_repl_server_name" class="refsect1">

## Return Types

REPL_SERVER_NAME() returns remote server name which can be used in calls
to `REPL_CREATE_SNAPSHOT_SUB()` , `REPL_DROP_SNAPSHOT_SUB()` and
`REPL_INIT_SNAPSHOT_SUB()` functions.

</div>

<div id="examples_repl_server_name" class="refsect1">

## Examples

<div id="ex_repl_server_name" class="example">

**Example 24.348. Obtaining replication server name**

<div class="example-contents">

The following statement demonstrates obtaining replication server name
for server with DSN 'localhost:1121':

``` screen
SQL> select REPL_SERVER_NAME ('localhost:1121');
callret
VARCHAR
_______________________________________________________________________________

demoserver2

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_repl_server_name" class="refsect1">

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

<a href="fn_repl_snp_server.html" class="link"
title="REPL_SNP_SERVER"><code
class="function">REPL_SNP_SERVER() </code></a>

</div>

</div>
