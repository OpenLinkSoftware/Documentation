<div id="faultfaulttolertransactions" class="section">

<div class="titlepage">

<div>

<div>

### 6.4.3. Transactions

</div>

</div>

</div>

Replication of partitions is entirely synchronous and transactional,
with two phase commit. Replicated partitions show serializable semantics
insofar the transactions dealing with replicated partitions are in
serializable isolation.

These processes are transparent to the developer and administrator. One
can program as one would in the case of a non-clustered database. The
below has bearing mostly on optimization.

A read with read committed isolation can be done in any copy of a
partition. Read committed reads make no locks nor do they wait for
locks. For uncommitted updated rows, they show the pre-update state.
Thus read committed can be freely load balanced over all copies of a
partition.

A read with repeatable or serializable isolation will always be done on
the first copy of a partition. This is done so as to have proper
serialization of locking. If a row is locked for repeatable read and
another transaction wishes to lock it for update, the latter will wait.
Thus, transactions with locking resolve locking issues on the first copy
of each partition. The first copy is the copy of the partition held by
the first process mentioned in the partition's group clause of a create
cluster. If the process is not available, the role of the first copy
falls on the second, third and so on. If no host of the hosts mentioned
in the group clause is available, the operation cannot be performed. We
will later define what we mean by available.

Updates to replicated partitions are performed concurrently on all the
copies of the partition. Updates are replicated as they are made, not at
time of commit, hence there is almost no added latency arising from
keeping replicated partitions: When one is ready to commit, all are.

Distributed deadlock detection is handled by the master host. In the
event of its failure, the function is taken over by the first node to be
available in the sequence of master succession, as indicated above.

</div>
