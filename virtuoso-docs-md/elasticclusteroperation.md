<div>

<div>

<div>

<div>

### 6.3.8. Elastic Cluster Operations

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Initializing

</div>

</div>

</div>

When a set of Virtuoso servers configured as a cluster is first started,
the elastic cluster setup is automatically performed if the cluster.ini
of each host contains the \[ELASTIC\] section as described below. This
is the normal way in which an elastic cluster is initialized.

The <span class="emphasis">*\_\_elastic*</span> option of the create
cluster statement is used for creating an elastic logical cluster.

``` programlisting
create cluster ELASTIC __elastic 2048 4 group (Host1), group (Host2), group (Host3), group (Host4);
```

or:

``` programlisting
create cluster ELASTIC __elastic 2048 4 ALL;
```

This creates an elastic cluster called ELASTIC which initially consists
of 4 host groups. Each host group has a single copy of the data
allocated to the host group. The data is partitioned among the host
groups so that each host group has a separate fraction of the data. The
second variant defaults the host groups from the cluster.ini, so that
each host mentioned is in a host group of its own. The first number
after the <span class="emphasis">*\_\_elastic*</span> clause is the
maximum number of physical slices in the cluster. The second number is
the number of physical slices initially created per host group. In
general each host group should have as many slices as there are hardware
threads on the CPU (s) running the host(s) in the host group.

The name ELASTIC is specially known. If a logical cluster of this name
exists, it is the default logical cluster instead of the non-elastic
<span class="emphasis">*\_\_ALL*</span> cluster in create or alter
statements that specify partitioning.

Database files for an elastic cluster are created in a directory and
striping set that is specified in the cluster.ini file of each host. The
cluster.ini file of each participating host must have this section at
the time of executing the create cluster statement. The section of the
ini file has the name as in the create cluster statement, e.g.:

``` programlisting
[ELASTIC]
Slices = 16
Segment1 = 1024, /data6/dbs/btc1-el.db = q1
Segment2 = 1024, /data2/dbs/btc1-el.db = q2
Segment3 = 1024, /data8/btc1-1/btc1-el.db = q3

[ELASTIC_1]
Segment1 = 1024, /data2/dbs/btc1-d-el.db = q2
```

Note that an elastic cluster may specify multiple segments. Each segment
has an independent striping, as in other segments. When initialized, one
segment is created for each of the slices hostted by the host in
question. The segment may consist of multiple files if striping is
specified. The database files for the segments are named as per the path
and file name in the segment clause, with the slice number appended at
the end, prefixed with a '.'. The files are initially created in the
first segment of the logical cluster. If one wishes to move the files,
one can do so between the segments declared for the cluster when the
server is not running. At the next startup, it will look in all the
segments for slices matching the path name plus .\[0-9\]\*.

Specifying distinct IO queues for distinct devices is useful, as with
other file system layouts.

To move slices between servers, more steps are necessary, see following
sections.

In the example at hand, we specify two sets of files, one labeled
ELASTIC_1. This is useful if one wishes to divide objects among
different types of storage, e.g. disk and ssd. If two cluster names
differ only by having \_\[0-9\]\* tagged at the end or having
\_\[0-9\]\* with different numbers at the end while the rest of the name
is the same, the system will manage these as twins so as to keep the
slices belonging to either collocated. So slice movement and splitting
will be mirrored between the two. If an If two objects share a
partitioning key between such twin clusters operations are assumed to be
colocatable.

The Slices setting specifies how many physical slices are initially
created per host group. For example if a server has 2 CPU sockets with a
8 core 16 thread CPU on each, and two Virtuoso processes are run on each
server, one per NUMA node (CPU socket), it is practical to specify 16
slices per host group. In this way there will be up to 32 threads per
query on the machine, leading to full platform utilization.

After creation, the cluster can be used in the cluster clause of create
index and alter index for specifying that the object in question is to
be created in the elastic cluster.

``` programlisting
create table TE ( row_no int,
                  string1 varchar,
                  string2 varchar,
                  primary key (row_no));
alter index TE on TE partition cluster ELASTIC (row_no int (0hexffff00));
```

The table TE is now allocated in the cluster ELASTIC. Due to default
behavior, the cluster ELASTIC is redundant since objects preferentially
get created in it if it exists. The table is now ready for use. Note
that the bit mask in the partitioning clause of the partitioning key
row_no must specify enough bits to cover the number of logical slices in
the cluster, 2048 in the present case. If this is not the case, some
logical slices will never be used, as there will be less distinct
partitioning hash values than logical slices.

</div>

<div>

<div>

<div>

<div>

#### Adding and Removing Hosts

</div>

</div>

</div>

The number of server processes (hosts) used for managing an elastic
cluster may vary during the cluster's lifetime. If the elastic cluster
keeps partitions in multiple copies, i.e. host groups in the initial
create cluster statement have more than one host, any new host groups
that are added must have the same number of hosts. Each new host of a
new host group must be identically initialized to contain a copy of the
REPLICATED logical cluster of the cluster into which the hosts are
added. This is done by simply copying the non-elastic database file(s)
of any host of the existing cluster. The copy can be made while the
cluster is running.

``` programlisting
cl_add_host_group (in cl_name varchar, in hosts any array) returns int
```

This function adds a host group to an elastic cluster. The host group
must contain the same number of hosts as all the other host groups and
the hosts must not be part of any other host group in this cluster.

The new hosts must be assigned IP addresses in the cluster.ini file of
all presently running hosts. At the time of being added, the hosts in
the new host group must be running and must be initialized to share a
copy of the REPLICATED cluster shared by all hosts of the physical
cluster.

After successful addition:

``` programlisting
cl_remove_host_group (in cl_name varchar, in host varchar)
```

</div>

</div>
