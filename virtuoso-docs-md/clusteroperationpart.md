<div>

<div>

<div>

<div>

### 6.3.4. Partitioning

</div>

</div>

</div>

All databases in a cluster share precisely the same schema. Any DDL
operations take effect on all nodes simultaneously.

The tables can be of one of three types:

<div>

- Partitioned: A row of a partitioned table resides in exactly one
  partition, according to the values of its partitioning columns. Each
  partition is stored at least once in the cluster but may be kept in
  multiple replicas if so configured. All indices of a partitioned table
  must specify partitioning but need not be partitioned in the same way.
  The data tables of an application will typically be partitioned.

- Replicated: The table and its contents exist in identical form on all
  nodes. Queries are answered from local data and updates go to all
  nodes. This is the case with schema tables, for example but can be
  used for application tables also.

- Local: The table exists on all nodes but each node has purely local
  content and all queries and updates to the table refer only to local
  content. This is the case for some configuration tables with only
  local scope, such as specifying web service end points.

</div>

Partitioning an index means that different hosts store different parts
of the index. For each partitioned index one or more partitioning
columns must be declared. Also each partitioned index is always held in
its totality in a logical cluster. A logical cluster is a subset of the
machines composing the physical cluster declared in cluster.ini. Usually
the logical and physical cluster are the same.

The logical cluster additionally declares how partitions are to be
replicated. It is namely possible to declare that a specific partition
be stored in multiple identical copies.

There are two predefined logical clusters: REPLICATED and \_\_ALL. If a
table's indices specify the REPLICATED cluster in their partitioning
declaration, the data will be maintained in identical copies on all
nodes.

The \_\_ALL cluster is the default logical cluster for any partitioned
table. Using this, each row will go to exactly one place, balanced over
the set of nodes declared in the cluster.ini file.

Basic applications do not need to declare their own cluster since the
default one is most often applicable.

<div>

<div>

<div>

<div>

#### CREATE CLUSTER Statement

</div>

</div>

</div>

``` programlisting
CREATE CLUSTER <name> DEFAULT <group>[ [,...]

group: GROUP (<host>[,...])
```

A logical cluster has a single global name and it consists of one or
more host groups. Each host group is given a partition of whatever
object that is stored in the logical cluster. Each host of a host group
replicates the partition assigned to this host group.

One logical cluster is predefined. It is called replicated and it
consists of one group which has all the hosts of the physical cluster.
The replicated logical cluster is used for storing any schema tables.
This causes all schema information to be identically stored on all nodes
of the physical cluster.

If a table is created on a clustered Virtuoso and no partitioning is
declared, the table exists on all nodes with independent content on
each. This is generally not desirable since the same query will return
different data depending on which host runs it.

For performance, it is best to replicate any short, seldom changing
lookup tables on all hosts.

<span class="emphasis">*Example*</span>

``` programlisting
create cluster C2 default group ("Host1"), group ("Host2"), group ("Host3"), group ("Host4") ;
```

This would declare a logical cluster identical to the default \_\_ALL
cluster if the cluster.ini specified hosts 1 - 4.

The REPLICATED cluster could be declared as follows:

``` programlisting
create cluster C3 default group ("Host1", "Host2", "Host3", Host4");
```

</div>

<div>

<div>

<div>

<div>

#### ALTER INDEX and CREATE INDEX Statements and Partitioning

</div>

</div>

</div>

The ALTER INDEX statement is used for declaring the partitioning of an
index. For a non-primary key index, the corresponding CREATE INDEX can
also declare the partitioning. If one index of a table is partitioned,
all indices of the table must be partitioned. If no partitioning is
declared, the table will exist on all nodes but will have independent
content on each. Partitioning of a key must be set when the key is
empty. Thus, to create a partitioned table, first create the table and
declare partitioning for its primary key.

The name of the primary key index is the same as that of the table. If
the table has no explicit primary key, it has an implicit one, named
after the table and having the invisible \_IDN column as single key
part. This may be used as a partitioning key.

If clustering is not enabled, partitioning can still be declared but it
will have no effect. Thus a single application DDL file can be used for
clustered and single process versions of the application schema.

``` programlisting
ALTER INDEX <index-name> ON <table-name> PARTITION [CLUSTER <cluster-name>] (<col-spec>[,...])

col-spec : <column-name> <type> [<options>]

type: INT | VARCHAR

options: (<mask>) | (<length>, <mask>)
```

The PARTITION declaration may occur at the end of a create index
statement. This causes the index to be created, partitioned and then
filled. Otherwise it would not be possible to add indices to non-empty
tables.

All or part of a partitioning column's value can be used for calculating
a index entry hash which then determines which host group of the logical
cluster gets to store the index entry. There are two types of hashing,
integer and varchar. Integer applies to integer like types such as
integer and bigint and iri id and varchar applies to anything else.
Floating point columns or decimals should not be used for partitioning.
Large objects or UDT's cannot be used for partitioning.

For an integer partitioning, the mask is a bitmask applied to the number
before extracting the part that is used for the hash. A mask of
0hexffff00 will use the second and third least significant bytes for
hashing, thus values 0-255 will hash to the same, values 256-512 to the
same and so on. The value 0hex1000000 will again hash to the same as 0.

Having consecutive integers hash to the same will cause them to go to
the same host group and become physically adjacently which is good for
key compression. If no mask is specified 0hexffff is used, meaning that
each consecutive number gets a different hash, based on the low 16 bits
of the number.

For a varchar partitioned column, the default is to calculate a hash
based on all bytes of the string. For purposes of key compression, it
may be good to put strings with a common prefix in the same partition.

The option consists of two integers, the length and the mask. If the
length is positive, the length first characters are used for the hash.
If the string is shorter than length, all characters are used. If the
length is negative, we take the absolute value of the length and use all
bytes of the string except the length last ones. If the string is
shorter than -length, all the bytes are used. A length of -1 means to
use all bytes except the last one, a length of 2 means to use the 2
first characters only.

The string's hash value is a large integer. The mask controls how many
bits of this hash are used for the hash of the index entry.

<span class="emphasis">*Example*</span>

``` programlisting
create table part (id int, code int, str varchar);
alter index part on part partition (id int (0hexffff00));

create index str on part (str) partition (str varchar (-1));
-- for the primary key, hash all values differing in the low byte together.
-- for str, hash all values differing only in the last character together.

create table part_code (code int primary key, description varchar);
alter index part_code on part_code cluster replicated;
```

This declares a lookup table for describing the values of the code
column of the part table. This is replicated on all nodes of the
cluster. Note that no partitioning columns need be specified since no
matter the partition key the row would end up on all nodes regardless.

</div>

</div>
