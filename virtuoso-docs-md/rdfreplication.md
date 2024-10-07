<div id="rdfreplication" class="section">

<div class="titlepage">

<div>

<div>

## 16.16. RDF Replication

</div>

</div>

</div>

Tables of RDF storage, such as DB.DBA.RDF_QUAD and DB.DBA.RDF_OBJ, can
not be replicated in a usual way, because it's content is cached in
memory in special ways and synchronized with values outside these
tables, such as current values of special sequence objects.

Moreover, same IRI may have different internal IRI_IDs on different
boxes, because the assigned IDs vary if new IRIs appear in data in
different order. Similarly, there will be different IDs of RDF literal,
datatypes and languages, blocking any attempt of one-to-one replication
between RDF storages.

However, a special asynchronous RDF replication makes it possible to
configure a "publisher" Virtuoso instance to keep the log of changes in
some RDF graphs and subscribe some Virtuoso instances to replay all
these changes.

Configuration functions are quite straightforward.

RDF graphs to replicate are all members of
\<http://www.openlinksw.com/schemas/virtrdf#rdf_repl_graph_group\> graph
group. That group can be filled in with graphs like any other graph
group, but it is better to get the advantage of proper security check
made by <a href="fn_rdf_repl_graph_ins.html" class="link"
title="RDF_REPL_GRAPH_INS"><code
class="function">DB.DBA.RDF_REPL_GRAPH_INS()</code></a> that inserts a
graph to the group and <a href="fn_rdf_repl_graph_del.html" class="link"
title="RDF_REPL_GRAPH_DEL"><code
class="function">DB.DBA.RDF_REPL_GRAPH_DEL()</code></a> that removes a
graph from the group.

Only publicly readable graphs can be replicated, an error is signalled
otherwise, and it is better to know about a security issue as early as
possible.

The <a href="fn_rdf_repl_start.html" class="link"
title="RDF_REPL_START"><code
class="function">DB.DBA.RDF_REPL_START()</code></a> function starts the
RDF replication at the publishing side. It creates replication
"publication" named '\_\_rdf_repl' and makes a log file
'\_\_rdf_repl.log' to record changes in replicated graphs. If the
replication has been started before then an error is signalled; passing
value 1 for parameter "quiet" elimintaes the error so the incorrect call
has no effect at all. If the replication is enabled then the value of
registry variable 'DB.DBA.RDF_REPL' indicates the moment of replication
start.

The <a href="fn_rdf_repl_start.html" class="link"
title="RDF_REPL_START"><code
class="function">DB.DBA.RDF_REPL_START()</code></a> function performs a
security check before starting the replication to check.

The
<a href="fn_rdf_repl_stop.html" class="link" title="RDF_REPL_STOP"><code
class="function">DB.DBA.RDF_REPL_STOP()</code></a> stops the RDF
replication at the publishing side. It calls
<a href="fn_repl_unpublish.html" class="link"
title="REPL_UNPUBLISH"><code
class="function">repl_unpublish()</code></a> but does not make empty
reates replication "publication" named '\_\_rdf_repl' and makes a log
file '\_\_rdf_repl.log' to record changes in replicated graphs.

Replication is asynchronous and the order of insertion and removal
operations at the subscriber's side may not match the order at the
publisher. As a result, it is not recommended to make few subscriptions
that writes changes of few publishers into one common graph. A
client-side application can force the synchronuzation by calling
<a href="fn_rdf_repl_sync.html" class="link" title="RDF_REPL_SYNC"><code
class="function">DB.DBA.RDF_REPL_SYNC()</code></a> that acts like
<a href="fn_repl_sync.html" class="link" title="repl_sync"><code
class="function">repl_sync()</code></a> but for an RDF subscription.
<a href="fn_rdf_repl_sync.html" class="link" title="RDF_REPL_SYNC"><code
class="function">DB.DBA.RDF_REPL_SYNC()</code></a> will not only initial
synchronisation but also wait for the end of subscription to guarantee
that the total effect of INSERT and DELETE operations is correct even if
these operations were made in an order that differs from the original
one.

</div>
