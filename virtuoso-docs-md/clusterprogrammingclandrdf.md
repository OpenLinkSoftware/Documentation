<div id="clusterprogrammingclandrdf" class="section">

<div class="titlepage">

<div>

<div>

## 10.7. Cluster and RDF

</div>

</div>

</div>

The RDF tables are partitioned by default on any fresh clustered
database. Thus RDF operations are not affected by clustering.

For RDF loading, use the single-threaded load functions
DB.DBA.RDF_LOAD_RDFXML and DB.DBA.TTLP. These should essentially always
be run in row autocommit mode and without logging. Thus do log_enable
(2) on the connection before invoking these functions.

Running these functions in the default transactional mode will load
within the current transaction. This will cause widespread locking and
will run out of rollback space after some millions of triples. This has
a strict transactional semantic but is not generally relevant in RDF
applications.

Integrity between all tables and indices is guaranteed after loading the
file completes, also in non-transactional mode. After all loading is
complete, do a single explicit checkpoint with cl_exec ('checkpoint');

This will guarantee that the disk based image is complete. Automatic
checkpoints during non-transactional file loads may have half-files and
possibly partial triples in the checkpointed state.

For all SPARUL operations, row autocommit mode is likewise recommended.

Logging is not needed if one makes a manual global checkpoint after any
bulk import or update operations. Logging will be useful if one has a
continuous feed of smaller files, even if transactional semantics were
not needed.

For best import speed, run one or two parallel streams of load commands
on each cluster node. Split the data to be loaded into approximately
equal chunks and load each with a call to DB.DBA.RDF_LOAD_RDFXML or
DB.DBA.TTLP. There is no point in using the \_MT variants of these
functions on a cluster.

A single load will process about 10000 triples with only about 5 cluster
round trips. Still, more of the work is done by the node doing the
parsing than by other nodes. To get best use of total throughput, divide
the load commands over the cluster nodes. Lock contention will be
minimal if the loads are in row autocommit mode. If they are
transactional, deadlocks are quite probable due to indeterminate locking
order and large transaction size. As a general rule, do not mix
transactions and RDF.

</div>
