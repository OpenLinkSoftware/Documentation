<div>

<div>

<div>

<div>

### 1.4.30. What level of ACID properties is supported?

</div>

</div>

</div>

Virtuoso supports all 4 isolation levels from dirty read to
serializable, for both relational and RDF data.

The recommended default isolation is read-committed, which offers a
clean historical read of data that has uncommitted updates. This mode is
similar to the Oracle default isolation and guarantees that no
uncommitted data is seen, and that no read will block waiting for a lock
held by another client.

There is transaction logging and roll forward recovery, with two phase
commit used in Virtuoso Cluster if an update transaction modifies more
than one server.

For RDF workloads which typically are not transactional and have large
bulk loads, we recommend running in a "row autocommit" mode without
transaction logging. This virtually eliminates log contention but still
guarantees consistent results of multithreaded bulk loads.

Setting this up requires some consultancy and custom development but is
well worthwhile for large projects.

</div>
