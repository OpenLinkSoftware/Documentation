<div id="clusterprogrammingvirtdbandrepl" class="section">

<div class="titlepage">

<div>

<div>

## 10.8. Cluster, Virtual Database and Replication

</div>

</div>

</div>

Clustering has no relation to any virtual database, transactional or
snapshot replication mechanism on Virtuoso.

Transactional replication is not supported with clustering. Snapshot
replication will work.

Virtual database operations work identically with single process
Virtuoso databases. All operations on remote tables are done by the
cluster node running the SQL statement. For purposes of symmetry, it is
desirable to have all the remote data sources defined for all server
processes so that they can be used interchangeably.

An external transaction monitor is not supported with cluster. A
Virtuoso cluster could be seen as an XA resource manager but the XA
logic is not connected to the cluster transaction logic.

</div>
