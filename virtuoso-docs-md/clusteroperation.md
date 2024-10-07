<div id="clusteroperation" class="section">

<div class="titlepage">

<div>

<div>

## 6.3. Virtuoso Cluster Operation

</div>

<div>

<div class="abstract">

**Abstract**

This chapter describes setting up and operating Virtuoso on a cluster of
computers. The section on Virtuoso cluster programming documents the SQL
extensions specific to cluster application development.

These sections apply to Virtuoso as of version 6.0.

Clustering primarily offers greatly increased scalability for large
databases without requiring application changes. The database is divided
over a number of servers, of which all provide transparent access to the
same data.

</div>

</div>

</div>

</div>

<div id="clusteroperationgeneral" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.1. General

</div>

</div>

</div>

Virtuoso can be run in cluster mode where one logical database is served
by a collection of server processes spread over a cluster of machines.

The cluster's composition is declared in a cluster.ini file which is to
be in the starting directory of each of the servers composing the
cluster. This file declares the hosts and listening ports of all
processes composing the cluster and which of these processes is the
local process and which the master.

A cluster has a single master process which is the only one allowed to
run DDL operations and which is responsible for distributed deadlock
resolution. In all other respects, all server processes of the cluster
are interchangeable.

The set of processes declared in the cluster.ini files is called the
physical cluster.

Each cluster server process has its own database and log files and is
solely responsible for these. All configuration fields in virtuoso.ini
and related files apply to the process whose ini file this is and their
meaning is not modified by clustering.

Specifically, the SQL client and HTTP and other listening ports of each
process are declared as usual and are used as usual. A cluster server
process has additionally a cluster listening port that is used for
cluster communications. This may not be connected to by anything except
other processes of the same physical cluster. The cluster listener ports
of all processes are declared in cluster.ini and all processes must
specify the same information.

<div id="clusteroperationgeneralclusterinifields" class="section">

<div class="titlepage">

<div>

<div>

#### cluster.ini fields

</div>

</div>

</div>

The below is a sample cluster.ini file declaring a physical cluster of 4
processes.

``` programlisting
[Cluster]
Threads = 100
ThisHost = Host1
Master = Host1
ReqBatchSize = 100
BatchesPerRPC = 4
BatchBufferBytes = 20000
LocalOnly = 2

Host1 = box1:2222
Host2 = box2:2223
Host3 = box3:2224
Host4 = box4:2225

Host1-1 = box1-1:12222
Host2-1 = box2-1:12223
Host3-1 = box3-1:12224
Host4-1 = box4-1:12225
```

The lines Host1 ... Host4 declare the listening ports of each process.
The line ThisHost = 1 declares that this process is Host1, hence cluster
listener at box1:2222 box1 - box4 and box1-1 - box4-1 are machine names
that must be resolvable in the local context. IP numbers can also be
used. Mentioning a host several times declares additional interfaces for
the host. Any of these interfaces may be used for cluster connection to
the Virtuoso server at the host. Thus Host1 = gives the first interface,
Host1-1 the second and so on. This is useful since servers most often
have multiple network interfaces and Virtuoso balances the traffic among
these interfaces if multiple interfaces are provided. Each host will
listen at all the host:port numbers mentioned and other hosts will
decide which interface to use based on load.

The Threads line gives the maximum number of threads that will be made
for serving requests from other hosts of the cluster. This is in
addition to any other threads reserved in any other ini files.

The Threads line gives the maximum number of threads that will be made
for serving requests from other hosts of the cluster. This is in
addition to any other threads reserved in any other ini files.

The other fields should be left at the values shown.

</div>

</div>

</div>
