<div id="fn_rdf_repl_graph_del" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

RDF_REPL_GRAPH_DEL — Deletes graph from RDF publication.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_repl_graph_del" class="funcsynopsis">

|                                 |                          |
|---------------------------------|--------------------------|
| ` `**`RDF_REPL_GRAPH_DEL`**` (` | in `graph ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_repl_graph_del" class="refsect1">

## Description

This function deletes graph from RDF Replication.

</div>

<div id="params_rdf_repl_graph_del" class="refsect1">

## Parameters

<div id="id108412" class="refsect2">

### graph

Graph URI to be deleted.

</div>

</div>

<div id="examples_rdf_repl_graph_del" class="refsect1">

## Example

<div id="ex_rdf_repl_graph_del" class="example">

**Example 24.357. Delete graph from RDF replication**

<div class="example-contents">

``` screen
SQL> DB.DBA.RDF_RDF_REPL_GRAPH_DEL ('http://test.org');
```

</div>

</div>

  

</div>

<div id="seealso_rdf_repl_graph_del" class="refsect1">

## See Also

<a href="fn_rdf_repl_start.html" class="link"
title="RDF_REPL_START"><code
class="function">RDF_REPL_START() </code></a>

<a href="fn_rdf_repl_stop.html" class="link" title="RDF_REPL_STOP"><code
class="function">RDF_REPL_STOP() </code></a>

<a href="fn_rdf_repl_sync.html" class="link" title="RDF_REPL_SYNC"><code
class="function">RDF_REPL_SYNC() </code></a>

<a href="fn_rdf_repl_graph_ins.html" class="link"
title="RDF_REPL_GRAPH_INS"><code
class="function">RDF_REPL_GRAPH_INS() </code></a>

<a href="fn_sub_schedule.html" class="link" title="sub_schedule"><code
class="function">sub_schedule() </code></a>

<a href="fn_repl_disconnect.html" class="link"
title="repl_disconnect"><code
class="function">repl_disconnect() </code></a>

<a href="fn_repl_grant.html" class="link" title="REPL_GRANT"><code
class="function">repl_grant() </code></a>

<a href="fn_repl_new_log.html" class="link" title="repl_new_log"><code
class="function">repl_new_log() </code></a>

<a href="fn_repl_pub_add.html" class="link" title="REPL_PUB_ADD"><code
class="function">repl_pub_add() </code></a>

<a href="fn_repl_pub_init_image.html" class="link"
title="REPL_PUB_INIT_IMAGE"><code
class="function">repl_pub_init_image() </code></a>

<a href="fn_repl_pub_remove.html" class="link"
title="REPL_PUB_REMOVE"><code
class="function">repl_pub_remove() </code></a>

<a href="fn_repl_publish.html" class="link" title="REPL_PUBLISH"><code
class="function">repl_publish() </code></a>

<a href="fn_repl_revoke.html" class="link" title="REPL_REVOKE"><code
class="function">repl_revoke() </code></a>

<a href="fn_repl_sched_init.html" class="link"
title="REPL_SCHED_INIT"><code
class="function">repl_sched_init() </code></a>

<a href="fn_repl_server.html" class="link" title="REPL_SERVER"><code
class="function">repl_server() </code></a>

<a href="fn_repl_server_rename.html" class="link"
title="repl_server_rename"><code
class="function">repl_server_rename() </code></a>

<a href="fn_repl_stat.html" class="link" title="REPL_STAT"><code
class="function">repl_stat() </code></a>

<a href="fn_repl_status.html" class="link" title="repl_status"><code
class="function">repl_status() </code></a>

<a href="fn_repl_subscribe.html" class="link"
title="REPL_SUBSCRIBE"><code
class="function">repl_subscribe() </code></a>

<a href="fn_repl_sync.html" class="link" title="repl_sync"><code
class="function">repl_sync() </code></a>

<a href="fn_repl_sync_all.html" class="link" title="repl_sync_all"><code
class="function">repl_sync_all() </code></a>

<a href="fn_repl_text.html" class="link" title="repl_text"><code
class="function">repl_text() </code></a>

<a href="fn_repl_this_server.html" class="link"
title="repl_this_server"><code
class="function">repl_this_server() </code></a>

<a href="fn_repl_unpublish.html" class="link"
title="REPL_UNPUBLISH"><code
class="function">repl_unpublish() </code></a>

<a href="fn_repl_unsubscribe.html" class="link"
title="REPL_UNSUBSCRIBE"><code
class="function">repl_unsubscribe() </code></a>

</div>

</div>
