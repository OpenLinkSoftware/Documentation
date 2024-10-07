<div id="clusterprogrammingseqidenreg" class="section">

<div class="titlepage">

<div>

<div>

## 10.2. Sequences, Identity and Registry

</div>

</div>

</div>

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

``` programlisting
__NEXT__<seq>
```

The sequence itself holds the local next value. The

``` programlisting
__MAX__<seq>
```

sequence holds the end of the value range allocated for \<seq\> at the
local node.

Allocating a batch of sequence numbers is synchronously logged on both
the master node and the requesting node. Thus, upon roll forward
recovery, this information survives even if the transaction requesting
the numbers was never committed.

The sequence_next function has an additional optional argument for
specifying how many values should be requested from the master node at a
time.

``` programlisting
sequence_next (sequence_name[, increment[, batch]])
```

The increment defaults to 1 and the batch to 1000.

Specifying the batch and increment to be equal will get a globally
ascending sequence order but will need a round trip to the master for
each number.

The registry_get and related functions operate on purely local content.
As with single process databases, the registry is used for storing some
schema information, sequence values and global application flags.

</div>
