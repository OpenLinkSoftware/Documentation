<div>

<div>

<div>

<div>

### 13.6.4. Notes on the Sample's Dynamics

</div>

</div>

</div>

When the network initially starts all the publications are at level 0
and in sync. When transactions are fed into the network at a
sufficiently slow rate all the servers get to process all transactions
in real time. Note that the structure is such that every server does
everybody else's work in addition to its own. Thus the insertion rate of
the network can't be expected to be higher than that of an individual
server. However read load can be spread across servers, so that this
type of configuration is effective for balancing query load but not for
balancing update load.

As we increase the transaction rate at each server we reach a point at
which the queue of locally committed but un-replicated transactions
grows faster than the other servers will absorb the feed. The servers
will each eventually disconnect all synced replication to stop the queue
from growing. Once the queue that no longer grows goes empty the
subscribers get disconnected. At this point all servers only process
their own load without any other distraction.

Next each server will notice that it is disconnected from the network
and will attempt a resync as a result of the periodic scheduled call to
log_sync. Each server will then re-establish a connection to every other
server and start resyncing. This will lead to the network being again in
sync if the per server transaction rate slows down sufficiently to allow
replicators to catch up. If this does not happen the syncing can stay in
progress indefinitely, until it either reaches sync or is terminated.

Typically a server's capacity for processing local transactions is
greater than its capacity for replaying replication feed. This is
because one thread is responsible for all replay activity while many
threads can process local transactions.

The net result of this scheduling policy is that even a heavily
replicated network will scale to high peak loads and will automatically
return to sync state as soon as the peak is over. If guaranteed
transaction level synchronicity must be maintained between servers then
the application should not be written using transactional replication
but rather with distributed transactions, where each commit makes sure
the transaction is fully processed on each participant before returning
to the client. This is however up to several times slower and will stop
the entire network if a single node fails.

</div>
