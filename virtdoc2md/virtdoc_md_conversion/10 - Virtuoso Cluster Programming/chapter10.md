# Virtuoso Cluster Programming

# Cluster SQL Execution Model

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

    select o_date
      from nation, customer, order
     where o_custkey = c.custkey
       and c_nationkey = n_nationkey
       and n_name = 'FRANCE';

We presume the indices:

    create index c_nk on customer (c_nationkey) partition (c_nationkey int)
    create index o_ck on orders (o_custkey) partition (c_custkey int);

This gets the order dates for order by customers in France. This is
typically a loop join since this is expected to access a fraction of
orders at random. First we get the n\_nationkey for France. Then we get
the c\_custkey for French customers. This is a sequential read of an
index and produces a set of c\_custkey values. Given these, we join to
orders using the o\_ck index. This index produces a set of o\_orderkey
values for each o\_custkey. These are then used for getting the
o\_date's from the actual order row.

If the batches are large enough, the query will execute in 3 network
round trips: One to get the set of c\_curstkey's for France, one to get
the o\_orderkey's from the o\_custkey's and one for getting the o\_date
for the o\_orderkey's. The nation table for getting the n\_nationkey for
the country name is small and can be replicated on all nodes so this
does not count as a round trip.

The first round trip goes to one partition. The resulting c\_custkey's
will be likely spread over all partitions, so each applicable node gets
a message with multiple lookups of the o\_ck inde, each with a different
o\_custkey value. The replies are collated and this time partitioned by
o\_orderkey and sent as parallel batches to the nodes that hold the
actual order rows.

The batch size is settable but is anyway over 1000 operations. The total
CPU time for running the query is slightly longer than running the query
serially in a single process but the real time is likely shorter because
the load is concurrently carried by multiple processes.

Now, if we just wanted the date of the most recent order from France, we
could write:

    select max (o_date)
      from nation, customer, order
     where o_custkey = c.custkey
       and c_nationkey = n_nationkey
       and n_name = 'FRANCE';

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

    select sum (l_extendedprice)
      from lineitem, orders, customer
     where l_orderkey = o_orderkey
       and o_custkey = c_custkey
       and c_comment like '%fluffily%';

This time we scan customers linearly, lookinf for 'fluffily' in the
comment field. Finding one, we look for the orders. But we are already
in the partition of the c\_custkey and the o\_ck index of orders is
partitioned on this same value, thus we know that the o\_orderkey is in
fact in the same partition, so no round trip is needed. Then we just
send the o\_orderkey to the appropriate partition for l\_orderkey to get
the sum of the extended prices of lines for this customer. At the end of
the query, all nodes hosting lineitems will have their local sum and
these are just added up and returned.

As long as queries are written as joins, they will run with good
parallelism. If they are written as procedure loops and single row
lookups from partitioned tables, performance will be an order of
magnitude worse.

The join type and join order switches work identically with cluster and
single process databases.

# Sequences, Identity and Registry

Sequences and identity columns have a cluster-wide scope. Thus, an
identity column can be used as a primary key and partitioning column and
the system guarantees that there will be no duplicates.

Sequence numbers are signed 64 bit integers.

The sequence numbers are locally ascending on each node. When a cluster
node first requests a sequence number, it is assigned a block of numbers
from which it will assign subsequent numbers. Thus, two nodes will
allocate from different ranges. The global order is not necessarily
ascending but numbers stay unique.

The master node of the cluster keeps a master sequence for each
sequence. This is used for allocating blocks of values. The so called:

    __NEXT__<seq>

The sequence itself holds the local next value. The

    __MAX__<seq>

sequence holds the end of the value range allocated for \<seq\> at the
local node.

Allocating a batch of sequence numbers is synchronously logged on both
the master node and the requesting node. Thus, upon roll forward
recovery, this information survives even if the transaction requesting
the numbers was never committed.

The sequence\_next function has an additional optional argument for
specifying how many values should be requested from the master node at a
time.

    sequence_next (sequence_name[, increment[, batch]])

The increment defaults to 1 and the batch to 1000.

Specifying the batch and increment to be equal will get a globally
ascending sequence order but will need a round trip to the master for
each number.

The registry\_get and related functions operate on purely local content.
As with single process databases, the registry is used for storing some
schema information, sequence values and global application flags.

# SQL Options

For purposes of debugging or writing stored procedures that are
specifically meant to work with local data only, it is useful to disable
cluster functionality.

This is done with the NO CLUSTER table option. This can be used in the
table option clause of a table in a FROM or in an update or delete.

Specially when writing procedures to be called with DAQ, see below, it
us necessary to ensure that the procedures will not access data outside
of the host running them.

*Examples:*

    select count (*) from x table option (no cluster);
    update x table option (no cluster) set y = y + 1;
    update x set y = 1 where current of cr option (no cluster)
    insert into xx key xx option (no cluster) (c1, c2) values (1, 2);

Note that for positioned (where current of) deletes and updates the
option is at the end. For searched ones it is after the table. Use the
explain () function to see the compilation of statements to make sure
about the locus of execution. If a table is to be accessed across the
cluster, this is indicated in the output.

All other SQL options work as with single server databases.

## Parallel INSERT Options

Searched updates and deletes can be parallelized as they are written.
However, inserts in loops are not as obviously parallelizable. Therefore
insert has an option for queueing multiple inserts into a queue for
partitioned parallel execution.

The format of the statement is:

    INSERT INTO table [KEY <key>] [OPTION (INTO <daq>) <column list> <values or select>

The DAQ is a distributed async queue object, see section on calling
procedures in cluster. Specifying the INTO daq option partitions the
insert, determining where each key should go and buffers the operation
into the DAQ. When the result of the DAQ is fetched, all the buffered
operations are sent in parallel, as a single message per node concerned.
This is easily tens or hundreds of times more efficient than inserting
row by row. The transactional behavior is controlled by the DAQ, see the
section on calling procedures in cluster. Inserts can mix with other
types of operations in the DAQ. If the DAQ is transactional, any failed
insert, as in the case of uniqueness violation, will make the
transaction uncommittable, preserving integrity.

*Example*

    create procedure ct_fill_daq (in n1 int, in n2 int, in st int := 1)
    {
     declare daq any;
     declare ct int;
     daq := daq (1);
     for (ct := n1; ct < n2; ct:=ct+st)
     {
     insert into CT option (into daq) (ROW_NO, DT) values (ct, cast (ct as varchar) || ' xxxxxxxxxxxxxxx');
     }
     while (daq_next (daq));
    }

## INSERT KEY Option

When indices are partitioned on different columns, indices pertaining to
a single row can be located on different nodes. In special situations,
for example when exploiting co-location of keys from different tables,
one may wish to insert a things index by index. This happens with the
use of partitioned functions with DAQ's. Inserting some indices and not
inserting others will make an inconsistent database, thus even if keys
are inserted separately, all keys should be inserted within the same
transaction or have some other guarantee of getting all inserted. Also,
application code will have to change if the indices change. This is not
considered good practice.

Consider a partition account table and a history table both partitioned
on the same key.

We could make a procedure updating the balance of the account and
recording the event.

    create table acct (id int, balance numeric);
    alter index acct on acct partition (a_id int);
    create table hist (h_id int, ts timestamp, note varchar, primary key (h_id, ts);
    alter index hist on hist partition (h_id int);
    
    create procedure evt (in a_id int, in delta numeric, in note varchar)
    {
     update acct table option (no cluster) set balance = balance + delta where id = a_id;
     insert into hist key hist option (no cluster) (h_id, note) values (a_id, note);
    )

Such a procedure would be called on a particular partition using a DAQ
In practice, the RDF store uses single key operations for atomically
reserving ID's for IRI's, for example..

# Calling Procedures in Cluster

Normally, all interprocess communication in the cluster is transparent.
In special cases, the developer may wish to execute a given procedure on
a given host of the cluster. This is typically the case when there is
affinity between data and logic.

A regular stored procedure or trigger is executed on the host where it
is invoked. With the distributed async queue (DAQ) system one can
execute procedures on specified remote hosts.

Procedures invoked over DAQ are restricted to dealing with data that is
held on the host where they execute. Generic procedures or triggers may
use any data from anywhere.

The DAQ offers a mechanism corresponding to the map operation of the
map-reduce paradigm. The DAQ may or may not be transactional. In the
transactional mode, all the invocations are enlisted into a distributed
transaction. The transaction is to be committed separately. The
non-transactional DAQ will not enlist operations into a distributed
transaction and will automatically commit after each procedure that
executes without error and rollback after each procedure that terminates
in an error.

A DAQ is created with the SQL function daq ().

    daq (in is_txn int) returns any

This returns a DAQ object. The object may be passed by value or
reference but cannot be returned to a SQL client or passed to another
thread or persisted in a table. The DAQ object is a handle for making
remote procedure calls and getting their results.

    daq_call ( in daq any,
               in part_table varchar,
               in part_key varchar,
               in proc varchar,
               in args any,
               in is_update int) returns any

This function applies proc to the vectors of args on the host determined
by using the partitioning of part\_key of part\_table designated by
args.

Let us suppose that the index part\_key of part\_table has its 1st and
2nd key part as partitioning keys. Then the 1st element (index 0) of
args would be used as the value of the 1st key part and the 2nd element
as value of the 2nd key part for determining the relevant partition.

Thus the argument list must be congruent with the layout of the
partitioning key. The table or partition key is not referenced
otherwise, it is just used for deciding which host gets the call.

If the partition is stored in multiple places, the is\_update flag
decides whether all will get the call or if only one is picked.

After the host(s) that will get the call are known, the call is queued
for execution. The daq\_call function returns a vector of two elements.
The first is the sequence number of the call. This can be used for
associating results to calls. The second element is the list of hosts
that got the call.

Each call on each host will produce one or more results. These results
are accessed with the daq\_next function.

    daq_next (in daq any) returns any

This function returns a result from one of the calls queued on the daq.

The return value can be one of the following:

  - 0 - This means that all results have been returned and no more data
    is available.

  - vector with request number, host number and response.

The response is one of:

  - Vector with 1 as 0th element - The function returned a result set
    row. The row is a nested vector as next element.

  - Vector with 2 as 0th element. The next element is the return value
    of the function, the function executed with no error.

  - Vector with 3 as 0th element. The next element is a vector
    describing the SQL error that terminated the function. The error is
    a nested vector with the constant 3, the SQL state and the text of
    the message.

If the DAQ is transactional, the first error on the remote host
terminates processing. This makes the distributed transaction
uncommittable, thus rolling it back at the next transact.

If the DAQ is not transactional, all requests are processed and the
state is committed after each function call as a local single phase
commit on the processing host. if the function signals an error, the
transaction is locally rolled back.

There is no guaranteed order of execution. The calls are buffered until
the first call to daq\_next. daq\_next will return whatever data is
first available. If no data from cluster peers is available, it will
execute requests that were assigned to the local host. These are
executed on the calling thread.

*Example*

    create procedure daq_results (in daq any)
    {
     declare row any;
     for (;;)
     {
     row := daq_next (daq);
     if (0 = row)
     return;
     dbg_obj_print (row);
     }
    }
    
    create procedure clexec_srv (in str varchar)
    {
     exec (str);
    }
    
    create procedure clexec (in str varchar)
    {
     declare d any;
     d := daq (0);
     daq_call (d, 'DB.DBA.SYS_COLS', 'SYS_COLS_BY_NAME', 'DB.DBA.CLEXEC_SRV', vector (str), 1);
     daq_results (d);
    }

The clexec procedure will execute the given SQL string on all hosts of
the cluster. It returns after all have completed.

# Partition Functions

Given a key and a set of values, the partition function can determine
which cluster nodes hold the value.

    partition_list ( in table_name varchar,
                     in key_name varchar,
                     in list any,
                     in is_update int)

The table name is a case sensitive full name of a table as it appears in
SYS\_KEYS. The key\_name is the case sensitive name of the index. The
values are key part values in the index order. The is\_update, if
non-zero, specifies that if the value is stored in multiple places, all
are to be returned, otherwise just one is picked at random, preferring
the local if there is a local copy of the partition.

The value is a list of node numbers, corresponding to the Host\<n\>
entries in the cluster.ini file.

*Example:*

    select partition_list ('DB.DBA.CT', 'CT', vector (2), 1);

# Distributed Pipe

A distributed pipe is a single construct that can be used for map-reduce
and stream transformation. It is a further development of the DAQ.

A dpipe is an object which accepts a series of input rows and generates
an equal amount of output rows. It may or may not preserve order and it
may or may not be transactional. The input row of a dpipe is a tuple of
values. To each element of the tuple corresponds a transformation. The
transformation is expressed as a partitioned SQL function, basically a
function callable by daq\_call, with arguments specifying the partition
where it is to be run. The output row is formed by gathering together
the transformation results of each element of the input tuple.

Conceptually, this is like a map operation, like running several DAQ's,
one for each column of the dpipe. A transformation function does not
always need to produce a value. It may also produce a second partitioned
function call with new arguments which will be partitioned and scheduled
by the dpipe. Since the second function is independently partitioned,
this may be used for implementing a reduce phase. This phase may then
return a value and/or further functions to be called.

Ultimately, the dpipe functions are all expected to return a value. When
each function of the input row has returned a value, the output row is
ready and can be retrieved. Returning a value is a way for the
application to synchronize with the operation of the dpipe. The dpipe
can be used for mapping values or side effects or both.

The dpipe object is created with the dpipe SQL function. This takes a
set of flags and a list of previously declared dpipe transformation
names. A dpipe transformation is declared by specifying a SQL procedure,
a partitioning key and a set of flags.

The dpipe is fed data with the dpipe\_input function. This takes the
dpipe object and one value per transformation specified when the dpipe
was made. The values can be arrays, so that a transformation function
can logically have multiple arguments. The results of the dpipe are
retrieved with the dpipe\_next function,. This returns a new result row
at each subsequent call until one row has been returned for each input
row. Depending on flags, these may be returned as they become available
or in the original order. Each input is substituted with the
transformation result in the output row. Some transformation can be
identity so as to preserve a row id for correlating inputs and outputs
if they are not processed in order.

After this, the dpipe can be reused. The dpipe is freed when there are
no longer references to it.

Finally, since transformations may, in addition to producing values,
also produce other functions to be called for their effects,
dpipe\_reuse is called to make sure that all these functions are run
until no more operations are left.

## SQL optimization and Dpipe

Calls to SQL functions in queries can be translated to dpipe operations
if a dpipe equivalent is declared. Consider a select statement returning
the values of a user defined function of some column selected in the
query. If this function itself accesses the database, possibly specially
if the data accessed is partitioned, calling the function for each row
and waiting for the result before processing the next row would have a
catastrophic performance impact. The dpipe mechanism allows the
functions to be partitioned by the SQL run time and sent to the
appropriate cluster nodes as large batches. This applies to any
operation that can be expressed as a sequence of steps which will each
run within a single partition.

We take a trivial example:

    create table ct (row_no int primary key, dt varchar);
    alter index CT on CT partition (ROW_NO int (255));
    
    create procedure CT_DT_PIPE (in n int)
    {
     return vector ((select dt from ct table option (no cluster) where row_no = n), 1);
    }
    
    dpipe_define ('CT_DT', 'DB.DBA.CT', 'CT', 'DB.DBA.CT_DT_PIPE', 0);

We can now use statements like:

    select sum (length (ct_dt (row_no))) from ct;

This is equivalent to:

    select sum (length (b.dt))
      from ct a, ct b
      where a.row_no = b.row_no;

The point is that the function call will be mapped into the dpipe
operation of the same name defined in the dpipe\_define. This means that
a large batch of row\_no's is retrieved and for each, the partition
where to invoke the dpipe function is calculated. Then the function
calls are sent in concurrent batches to each of these places, running
the function in parallel, each on the node that has the data of
interest. Getting the value of a column of a partitioned table is a
trivial example but any complex computation might be substituted for
this, including ones that updated the state on the node, with the
proviso that they should not access data from outside the host on which
they run.

Further, because the results are summed into an aggregate, the results
can be processed in the order they come, thus improving parallelism.

# Cluster and RDF

The RDF tables are partitioned by default on any fresh clustered
database. Thus RDF operations are not affected by clustering.

For RDF loading, use the single-threaded load functions
DB.DBA.RDF\_LOAD\_RDFXML and DB.DBA.TTLP. These should essentially
always be run in row autocommit mode and without logging. Thus do
log\_enable (2) on the connection before invoking these functions.

Running these functions in the default transactional mode will load
within the current transaction. This will cause widespread locking and
will run out of rollback space after some millions of triples. This has
a strict transactional semantic but is not generally relevant in RDF
applications.

Integrity between all tables and indices is guaranteed after loading the
file completes, also in non-transactional mode. After all loading is
complete, do a single explicit checkpoint with cl\_exec ('checkpoint');

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
equal chunks and load each with a call to DB.DBA.RDF\_LOAD\_RDFXML or
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

# Cluster, Virtual Database and Replication

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

# Troubleshooting

If an operation seems to hang, see the output of status ().

Check for the presence of the following conditions:

  - The cluster line shows 0% CPU, no message traffic and an unchanging
    number of buffers wired, this is probably a bug. To reset, restart
    the cluster or the offending process if found. Restart is done by
    executing raw\_exit (); over an SQL connection to the process in
    question.

  - The cluster line shows many threads waiting compared to total
    threads. If CPU is 0 and this does not change there could be a
    transaction that holds locks indefinitely. To clear, execute
    txn\_killall (1); . Do this at a node that has local threads
    waiting. This is seen in the Lock Status paragraph of status ('')
    when connected to the node in question.

  - The cluster line shows a changing number in the pfs field. The
    system is swapping and slowed down.

  - If the status () itself hangs, try another process of the cluster.
    See that there is no temporary atomic activity like a long
    checkpoint. If the situation persists there is a bug. The checkpoint
    can be seen by the presence of the checkpinmt\_in\_progress file in
    each server's working directory.

  - To check the integrity of database files, do
    [cl\_exec()](#fn_cl_exec) ('backup ''/dev/null'''); If this returns,
    the databases are OK. If one is found to be corrupt the
    corresponding server exits.

> **Tip**
> 
>   - [Cluster Installation and Config](#clusterstcnf)
> 
>   - [Cluster Operation](#clusteroperation)
> 
>   - [Virtuoso Cluster Fault Tolerance.](#fault)
