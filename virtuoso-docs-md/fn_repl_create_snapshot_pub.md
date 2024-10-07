<div id="fn_repl_create_snapshot_pub" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_CREATE_SNAPSHOT_PUB — Create bi-directional snapshot publication

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_create_snapshot_pub" class="funcsynopsis">

|                                           |                         |
|-------------------------------------------|-------------------------|
| `None `**`REPL_CREATE_SNAPSHOT_PUB`**` (` | in `item ` varchar ,    |
|                                           | in `type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_create_snapshot_pub" class="refsect1">

## Description

This procedure should be used to create a bi-directional snapshot
publication. If the *`item`* parameter is a table then this procedure
creates an updateable snapshot log and generates an updating procedure.

</div>

<div id="params_repl_create_snapshot_pub" class="refsect1">

## Parameters

<div id="id107245" class="refsect2">

### item

Item is a DAV collection or table name.

</div>

<div id="id107248" class="refsect2">

### type

Type is used to denote the type of Item: 1 if item is a DAV collection,
or 2 if item is a table name.

</div>

</div>

<div id="ret_repl_create_snapshot_pub" class="refsect1">

## Return Types

None.

</div>

<div id="examples_repl_create_snapshot_pub" class="refsect1">

## Examples

<div id="ex_repl_create_snapshot_pub" class="example">

**Example 24.341. Creating bi-directional snapshot publication**

<div class="example-contents">

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

<div id="seealso_repl_create_snapshot_pub" class="refsect1">

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
