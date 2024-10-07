<div id="sampleconf" class="section">

<div class="titlepage">

<div>

<div>

## 21.5. Sample Configuration

</div>

</div>

</div>

This section describes how to set up disks and I/O for a sample run. To
begin with, the scaling rule is 12.5 tpmC per warehouse. This means that
in order to measure 1000 tpmC you must have a 1000 / 12.5 = 81
warehouses. These take about 100 MB apiece.

The benchmark's working set consists of the STOCK and CUSTOMER tables of
each warehouse and of the ITEM table of the database. Other tables are
accessed more or less sequentially, i.e. inserts to end or deletes from
start. There is a particular distribution of hits for the STOCK and
CUSTOMER rows of each warehouse, leading to a specific working set
within each.

The 160 day rule requires a disk configuration sufficient for
accumulating 160 days worth of transactions at the reported rate. For
practical reasons we will ignore this rule here. To just run the
benchmark for the required 20 minutes we will need about twice the space
of the initial data. Let's assume we have an initial database of 8 GB
and have another 16 GB for working space, a total of 24 GB. This is 6 4
GB disks or 12 2 GB ones.

Let's now look at the relationship between CPU and disk usage. The New
Order transaction, which mostly defines the benchmark's working set
consists of an average of 10 updates to the STOCK table, which mostly
cause disk reads, 10 reads of the ITEM table which is always in cache,
10 ascending ORDER_LINE inserts, 1 ascending ORDERS insert and 1
CUSTOMER read plus a DISTRICT update and WAREHOUSE read.

If this happens entirely in RAM this takes about 10 milliseconds on a
200 MHz Pentium Pro, 13 on an Ultra SPARC and so on. Which is roughly as
long a one random disk seek takes.

Because the scaling rule limits RAM to cover only 10% to 20% of the
working set, the STOCK updates will miss the cache most of the time.
This with a transaction mix of New Orders only, we would need about 8
disk seeks to be in progress concurrently in order to feed one CPU. The
other transactions are either more local or repeat the New Order access
profile. Thus we end up needing about 5 concurrent 10 msec disks for one
Power PC 604 and almost double for a 200 MHz Pentium Pro.

For our 24 GB configuration we may as well divide it over as many
stripes as we have disks. For 6 4 GB disks, we would have:

``` screen
[Striping]
Segment1 = 24G,  /disk1/tpcc-1-1.db = q1, /disk2/tpcc-1-2.db = q2,  /disk3/tpcc-1-3.db = q3,  /disk4/tpcc-1-4.db = q4,  /disk5/tpcc-1-5.db = q5,  /disk6/tpcc-1-6.db = q6
```

Assuming we have file systems. Note the I/O queue names q1...q6, meaning
that each stripe gets processed on a separate thread for I/O.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                      |
|:--------------------------:|:-------------------------------------|
| ![\[Tip\]](images/tip.png) | See                                  |
|                            | Disk Configuration for more on this. |

</div>

Your Virtuoso may or may not support raw devices. If it does, they are
specified here.

For the other configuration parameters, we will have sufficient RAM
configured for the DBMS, counting 8.5K of RAM for each buffer. For 512
MB of RAM, we would have about 25000 buffers. The maximum dirty
parameter is more tricky. A low number causes unnecessary writing and a
high value causes the number of clean buffers at any time being too low,
causing an imperfect match of the read working set. The read-only set is
only the ITEM table, about 20 MB.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                              |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                        |
|                              | Note that about half of the available RAM can efficiently be allocated to the database, allocating all RAM may result in swapping due to the OS's disk caching. In terms of kernel tuning, if one can decrease the OS cache, one may increase the RAM utilizable by the DBMS without the OS's disk cache getting in the way. |

</div>

The Stock Level transaction reads lines written by recent New Order
transactions, which are likely to be in RAM and still dirty. The reads
and updates of CUSTOMER are random and generally speaking what is read
is also likely to be or have been updated. We could start with a guess
of 70% maximum dirty, i.e. a value of 70000 for 100000 buffers.

The checkpoint remap should be as large as possible and the unremap
quota should be small. The benchmark does practically no sequential
reads and therefore does not care about disk locality. No limit on
remapping means that a checkpoint can be made in the time it takes to
flush the disk cache. This is done in the background, so that the atomic
checkpoint time is limited to the time it takes to write out those
buffers that became dirty while the first sweep was in progress.

Thus we could have:

``` screen
MaxCheckpointRemap = 2000000
UnremapQuota = 3000
```

</div>
