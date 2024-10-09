<div>

<div>

</div>

<div>

## Name

REPL_CREATE_SNAPSHOT_PUB — Create bi-directional snapshot publication

</div>

<div>

## Synopsis

<div>

|                                           |                         |
|-------------------------------------------|-------------------------|
| `None `**`REPL_CREATE_SNAPSHOT_PUB`**` (` | in `item ` varchar ,    |
|                                           | in `type ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This procedure should be used to create a bi-directional snapshot
publication. If the *`item`* parameter is a table then this procedure
creates an updateable snapshot log and generates an updating procedure.

</div>

<div>

## Parameters

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

**Example 24.341. Creating bi-directional snapshot publication**

<div>

The following statement creates bi-directional snapshot publication of
table 'Demo.demo.Shippers':

``` screen
SQL> DB.DBA.REPL_CREATE_SNAPSHOT_PUB ('Demo.demo.Shippers', 2);
      
```

The following statement creates bi-directional snapshot publication of
DAV collection '/DAV/doc':

``` screen
SQL> DB.DBA.REPL_CREATE_SNAPSHOT_PUB ('/DAV/doc', 1);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_repl_create_snapshot_sub.html" class="link"
title="REPL_CREATE_SNAPSHOT_SUB"><code
class="function">REPL_CREATE_SNAPSHOT_SUB() </code></a>

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
class="function">REPL_UPDATE_SNAPSHOT() </code></a>

<a href="fn_repl_snp_server.html" class="link"
title="REPL_SNP_SERVER"><code
class="function">REPL_SNP_SERVER() </code></a>

<a href="fn_repl_server_name.html" class="link"
title="REPL_SERVER_NAME"><code
class="function">REPL_SERVER_NAME() </code></a>

</div>

</div>
