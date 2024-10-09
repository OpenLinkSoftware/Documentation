<div>

<div>

<div>

<div>

# Chapter 10. Virtuoso Cluster Programming

</div>

<div>

<div>

**Abstract**

This chapter contains cluster programming aspects such as explaining the
basics of how SQL queries work on clustered Virtuoso, sql options,
Sequences and identity columns, Distributed Pipe constructions and many
others. It also describes RDF tables partitioning and troubleshooting.

These sections apply to Virtuoso as of version 6.0.

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">10.1. [Cluster SQL Execution
Model](ch-clusterprogramming.html#clusterprogrammingsqlexmod)</span>

<span class="section">10.2. [Sequences, Identity and
Registry](clusterprogrammingseqidenreg.html)</span>

<span class="section">10.3. [SQL
Options](clusterprogrammingsqlopt.html)</span>

<span class="section">10.3.1. [Parallel INSERT
Options](clusterprogrammingsqlopt.html#clusterprogrammingsqloptparinsert)</span>

<span class="section">10.3.2. [INSERT KEY
Option](clusterprogrammingsqloptparinsertkey.html)</span>

<span class="section">10.4. [Calling Procedures in
Cluster](clusterprogrammingcallproc.html)</span>

<span class="section">10.5. [Partition
Functions](clusterprogrammingpartfunc.html)</span>

<span class="section">10.6. [Distributed
Pipe](clusterprogrammingdpipe.html)</span>

<span class="section">10.6.1. [SQL optimization and
Dpipe](clusterprogrammingdpipe.html#clusterprogrammingdpipesqloptimz)</span>

<span class="section">10.7. [Cluster and
RDF](clusterprogrammingclandrdf.html)</span>

<span class="section">10.8. [Cluster, Virtual Database and
Replication](clusterprogrammingvirtdbandrepl.html)</span>

<span class="section">10.9.
[Troubleshooting](clusterprogrammingtrbsht.html)</span>

</div>

<div>

<div>

<div>

<div>

## 10.1. Cluster SQL Execution Model

</div>

</div>

</div>

This section explains the basics of how SQL queries work on clustered
Virtuoso.

Query optimization for cluster is similar to query optimization for a
single process. The main issues of optimization have too do with join
order, index choice and join type.

Still, the performance characteristics of a distributed memory cluster
are radically different from a single process database. Namely, the cost
of a network round trip between nodes, even if these were only different
processes on a shared memory multiprocessor, is between 5 and 50 single
row lookups from a big table, supposing the row being sought for is in
memory. The 5x factor applies when within the same machine, the 50 times
factor applies over 1Gbit ethernet.

From this follows that a single network message must process several
hundred rows and several messages must be concurrently dispatched to
multiple nodes for clustering to yield any benefit in terms of a single
query's processing time.

Of course, a cluster can have essentially unlimited RAM, which is not
the case of a single machine and a network round trip remains faster
than a disk random access. For serial throughput, the disk controller is
several times faster than the network, though. Of course, with large
numbers of concurrent users, the latencies get absorbed and a high
aggregate throughput can be attained.

Still, the first question of any distributed memory system is the
aggregation of messages. This can be done in two complementary ways: By
Sending a large number of simple operations in a single message,
preferably asynchronously to multiple recipients and on the other hand
by putting more complex operations into a message.

Also, a random access pattern can be transformed to a serial access
pattern by using hash join, i.e. making a temporary copy of an index or
part thereof. In this way, the query does not have to go to the data
more than once even if it is used inside a tight loop in the query plan.

We will use the TPC H tables to illustrate some points below:

When performing a loop join, Virtuoso will run as many iterations as
possible in parallel. Consider a join like:

``` programlisting
select o_date
  from nation, customer, order
 where o_custkey = c.custkey
   and c_nationkey = n_nationkey
   and n_name = 'FRANCE';
```

We presume the indices:

``` programlisting
create index c_nk on customer (c_nationkey) partition (c_nationkey int)
create index o_ck on orders (o_custkey) partition (c_custkey int);
```

This gets the order dates for order by customers in France. This is
typically a loop join since this is expected to access a fraction of
orders at random. First we get the n_nationkey for France. Then we get
the c_custkey for French customers. This is a sequential read of an
index and produces a set of c_custkey values. Given these, we join to
orders using the o_ck index. This index produces a set of o_orderkey
values for each o_custkey. These are then used for getting the o_date's
from the actual order row.

If the batches are large enough, the query will execute in 3 network
round trips: One to get the set of c_curstkey's for France, one to get
the o_orderkey's from the o_custkey's and one for getting the o_date for
the o_orderkey's. The nation table for getting the n_nationkey for the
country name is small and can be replicated on all nodes so this does
not count as a round trip.

The first round trip goes to one partition. The resulting c_custkey's
will be likely spread over all partitions, so each applicable node gets
a message with multiple lookups of the o_ck inde, each with a different
o_custkey value. The replies are collated and this time partitioned by
o_orderkey and sent as parallel batches to the nodes that hold the
actual order rows.

The batch size is settable but is anyway over 1000 operations. The total
CPU time for running the query is slightly longer than running the query
serially in a single process but the real time is likely shorter because
the load is concurrently carried by multiple processes.

Now, if we just wanted the date of the most recent order from France, we
could write:

``` programlisting
select max (o_date)
  from nation, customer, order
 where o_custkey = c.custkey
   and c_nationkey = n_nationkey
   and n_name = 'FRANCE';
```

This would evaluate as explained above but would not return the dates
but rather just remember the latest one on each node. At the end, just
the latest dates from each cluster node accessed in the query would be
returned to the node running the query. Further, SQL specifies that
running the same query on the same data is expected to return the same
order of results on consecutive runs, even if no order by is present.
This means that indices must be traversed in order, i.e. the data
received from multiple partitions in indefinite order must be
deterministically assembled to provide a predictable order. This is
important if slicing the result set for example. When returning an
aggregate this condition is relaxed and data can be processed in
whatever order received, thus increasing parallelism.

Another optimization is taking advantage of co-located indices.

``` programlisting
select sum (l_extendedprice)
  from lineitem, orders, customer
 where l_orderkey = o_orderkey
   and o_custkey = c_custkey
   and c_comment like '%fluffily%';
```

This time we scan customers linearly, lookinf for 'fluffily' in the
comment field. Finding one, we look for the orders. But we are already
in the partition of the c_custkey and the o_ck index of orders is
partitioned on this same value, thus we know that the o_orderkey is in
fact in the same partition, so no round trip is needed. Then we just
send the o_orderkey to the appropriate partition for l_orderkey to get
the sum of the extended prices of lines for this customer. At the end of
the query, all nodes hosting lineitems will have their local sum and
these are just added up and returned.

As long as queries are written as joins, they will run with good
parallelism. If they are written as procedure loops and single row
lookups from partitioned tables, performance will be an order of
magnitude worse.

The join type and join order switches work identically with cluster and
single process databases.

</div>

</div>
