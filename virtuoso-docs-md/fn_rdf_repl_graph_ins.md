<div>

<div>

</div>

<div>

## Name

RDF_REPL_GRAPH_INS — Inserts graph to RDF publication.

</div>

<div>

## Synopsis

<div>

|                                 |                          |
|---------------------------------|--------------------------|
| ` `**`RDF_REPL_GRAPH_INS`**` (` | in `graph ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function inserts graph to enabled RDF Replication. The graphs in
this replication can be more than one.

</div>

<div>

## Parameters

<div>

### graph

Graph URI to be inserted.

</div>

</div>

<div>

## Example

<div>

**Example 24.355. Insert graph to RDF replication**

<div>

``` screen
SQL> DB.DBA.RDF_RDF_REPL_GRAPH_INS ('http://test.org');
```

</div>

</div>

  

<div>

**Example 24.356. Replicate all graphs**

<div>

To replicate all graphs ( except the system graph
http://www.openlinksw.com/schemas/virtrdf# ), one should use
http://www.openlinksw.com/schemas/virtrdf#rdf_repl_all as graph IRI:

``` programlisting
SQL> DB.DBA.RDF_RDF_REPL_GRAPH_INS ('http://www.openlinksw.com/schemas/virtrdf#rdf_repl_all');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_repl_start.html" class="link"
title="RDF_REPL_START"><code
class="function">RDF_REPL_START() </code></a>

<a href="fn_rdf_repl_stop.html" class="link" title="RDF_REPL_STOP"><code
class="function">RDF_REPL_STOP() </code></a>

<a href="fn_rdf_repl_sync.html" class="link" title="RDF_REPL_SYNC"><code
class="function">RDF_REPL_SYNC() </code></a>

<a href="fn_rdf_repl_graph_del.html" class="link"
title="RDF_REPL_GRAPH_DEL"><code
class="function">RDF_RDF_REPL_GRAPH_DEL() </code></a>

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
