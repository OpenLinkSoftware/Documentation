<div>

<div>

<div>

<div>

## 6.4. Virtuoso Cluster Fault Tolerance

</div>

<div>

<div>

**Abstract**

This chapter discusses fault tolerance and how to configure it. The
following aspects are covered:

</div>

</div>

</div>

</div>

<div>

- Setting up a fault tolerant logical cluster inside a physical cluster.
  Creating tables and indices for fault tolerance.

- Interpreting status and error messages and managing failures and
  recovery.

- Optimizing a schema for fault tolerance: For read-intensive workloads,
  the work can be profitably split among many copies of the same
  partition.

- RDF specifics relating to fault tolerance.

- Splitting a cluster so that one copy of the partitions does bulk load
  while another serves online queries.

</div>

<div>

<div>

<div>

<div>

### 6.4.1. Introduction

</div>

</div>

</div>

Virtuoso Cluster supports optional fault tolerance by storing partitions
in more than one copy if desired. This is a cluster-only feature,
providing for transparent fail-over with fully transactional semantics.
This feature is in no way related to the other forms of replication
discussed in the Virtuoso documentation. This feature can be used for
load balancing of read-intensive workloads and for fault tolerance of
arbitrary workloads in a tightly coupled cluster. This feature is not
suited for synchronizing geographically distributed copies.

Fault tolerance is enabled at the level of logical cluster. Making the
logical cluster \_\_ALL fault tolerant has the effect of making all the
normally non fault tolerant database objects into fault tolerant ones.

</div>

</div>
