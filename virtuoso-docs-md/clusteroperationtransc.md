<div id="clusteroperationtransc" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.5. Transactions

</div>

</div>

</div>

A Virtuoso cluster is fully transactional and supports the 4 isolation
levels identically with a single server Virtuoso. Transactions are
committed using single to two phase commit as may be appropriate and
this is transparent to the application program.

Distributed deadlocks are detected and one of the deadlocking
transactions is killed, just as with a single process.

Transactions are logged on the cluster nodes which perform updates
pertaining to the transaction.

A transaction has a single owner connection. Each client connection has
a distinct transaction. From the application program's viewpoint there
is a single thread per transaction. Any parallelization of queries is
transparent.

For roll forward recovery, each node is independent. If a transaction is
found in the log for which a prepare was received but no final commit or
rollback, the recovering node will ask the owner of the transaction
whether the transaction did commit. Virtuoso server processes can
provide this information during roll forward, hence a simultaneous
restart of cluster nodes will not deadlock.

<div id="clusteroperationtranscperfm" class="section">

<div class="titlepage">

<div>

<div>

#### Performance Considerations

</div>

</div>

</div>

A lock wait in a clustered database requires an asynchronous
notification to a monitor node. This is done so that a distributed
deadlock can be detected. Thus the overhead of waiting is slightly
larger than with a single process.

We recommend that read committed be set as the default isolation since
this avoids most waiting. A read committed transaction will show the
last committed state of rows that have exclusive locks and uncommitted
state. This is set as DefaultIsolation = 2.

In the parameters section of each virtuoso.ini file.

</div>

<div id="clusteroperationrowautomode" class="section">

<div class="titlepage">

<div>

<div>

#### Row Autocommit Mode

</div>

</div>

</div>

Virtuoso has a mode where insert/update/delete statements commit after
each row. This is called row autocommit mode and is useful for bulk
operations that need no transactional semantic.

The row autocommit mode is set by executing log_enable (2) or log_enable
(3), for no logging and logging respectively. The setting stays in
effect until set again or for the duration of the connection. Do not
confuse this with the autocommit mode of SQL client connection.

In a clustered database the row autocommit mode is supported but it will
commit at longer intervals in order to save on message latency.
Statements are guaranteed to commit at least once, at the end of the
statement.

A searched update or delete statement in row autocommit mode processes a
few thousand keys between commits, all in a distributed transaction with
2PC. These are liable to deadlock. Since the transaction boundary is not
precisely defined for the application, a row autocommit batch update
must be such that one can distinguish between updated and non-updated if
one must restart after a deadlock. This is of course not an issue if
updating several times makes no difference to the application.

Naturally, since a row can be deleted only once, the problem does not
occur with deletes. Both updates and deletes in row autocommit mode are
guaranteed to keep row integrity, i.e. all index entries of one row will
be in the same transaction.

Naturally, since a row can be deleted only once, the problem does not
occur with deletes. Both updates and deletes in row autocommit mode are
guaranteed to keep row integrity, i.e. all index entries of one row will
be in the same transaction.

A row autocommit insert sends all keys of the row at once and each
commit independently. Hence, a checkpoint may for example cause a
situation where one index of a row is in the checkpoint state and the
other is not.

Thus, a row autocommit insert on a non-empty application table with
transactional semantic is not recommended. This will be useful for bulk
loads into empty tables and the like, though.

</div>

</div>
