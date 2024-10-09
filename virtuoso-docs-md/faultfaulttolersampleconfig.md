<div>

<div>

<div>

<div>

### 6.4.2. Sample Configuration

</div>

</div>

</div>

We will take a minimal example of a fault tolerant setup with 4 server
processes, grouped in two groups of two mutually mirroring servers. The
word host here refers to a single server process. How these are
distributed over physical hardware is a separate question. Each host
(i.e. server process) has exclusive control over its database files. Two
processes may not share files.

``` programlisting
create cluster DUP default group ("Host1", "Host2"), group ("Host3", "Host4");
```

Each group clause in the statement defines a set of mutually
replicating, interchangeable processes. The cluster is operational as
long as at least one process for each group is available. If all the
processes in one group are down, the tables created in the cluster will
not be available in their entirety. Even if some fragment of a table
were unavailable, the remaining fragments are still available for
transactions that concern only them.

For all tables or indices created in a cluster with fault tolerance,
partitioning is applied for determining which group of the groups listed
in the create cluster statement gets which individual entry. After this,
all the hosts that make up the group are guaranteed to hold a copy of
said entry at the commit of each transaction.

Regardless of the definition of logical clusters, there are global
functions at the level of the physical cluster which need to be
replicated for fault tolerance. For these functions include resolving
distributed deadlocks and allocating sequence ranges. See the discussion
of sequences in the cluster programming guide for more on this. These
global functions are handled by a single process called the master. To
keep a standby master that is synchronously kept in sync with the first
master, one can define multiple master processes, as follows:

``` programlisting
Master = Host1
Master2 = Host2
```

These lines in the cluster.ini files of the servers constituting the
cluster mean that if Host1 is available, it will perform the functions
of the master and if it is not available, these functions go to Host2.
If both are available, then Host1 does the work and synchronously
updates Host2 before returning the results to the requesting host.

To create a table or index in a specific logical cluster, one uses the
cluster option in alter index or create index. For example:

``` programlisting
create table T1 (row_no int primary key, string1 varchar);
alter index  t1 on t1 partition cluster DUP (row_no int (0hexffff00));
create index string1 on t1 partition cluster DUP (string1 varchar (5));
```

These statements define that t1 will be kept in duplicate copies spread
as declared for logical cluster DUP. Partitioning can be altered only
when the table concerned is empty. To make an existing non-replicated
table into a replicated one, use alter table rename, as follows:

``` programlisting
create table T1 (row_no int primary key, string1 varchar);
alter index  t1 on t1 partition (row_no int (0hexffff00));
create index string1 on t1 partition  (string1 varchar (5));
```

The table is created in the default logical cluster, which by default is
not replicated. Now fill the table with a large amount of data. Then do
the move over to replicated storage with minimum effect on overall
server availability, follow the below steps:

``` programlisting
drop index string2;
alter table t1 rename t1_old;

create table T1 (row_no int primary key, string1 varchar);
alter index  t1 on t1 partition cluster DUP (row_no int (0hexffff00));
create index string1 on t1 partition cluster DUP (string1 varchar (5));

log_enable (2);
```

This turns on row autocommit and disables logging for the session. This
is necessary, as otherwise the statements below will abort due to
running out of rollback space if the table is large. Disabling logging
also saves some extra time.

``` programlisting
insert into t1 select * from t1_old;
delete from t1_old;
drop table t1_old;
```

First deleting the contents and then dropping the table shortens the
global atomic section that corresponds to dropping the table. Otherwise
all servers would be unavailable also for the time of deleting the
content, which might take long.

Finally:

``` programlisting
cl_exec (checkpoint');
```

Makes the operation permanent. All the above work would be lost in the
event of any failure since it was done without logging.

``` programlisting
log_enable (1);
```

Restores default transaction and logging behavior to the session.

If T1 were very large, e.g. 100's of G or more, then one could do
checkpoint after each step so as not to keep a full copy of all indices
of t1 in the old and new versions simultaneously. Dropping an index or
deleting rows actually frees the space at the next checkpoint. One could
also write a procedure for copying the table in parts and run many such
copies in parallel for different parts of the table. This would have
obvious advantages for moving terabytes of data.

</div>
