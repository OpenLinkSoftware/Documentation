<div id="faultfaulttolermng" class="section">

<div class="titlepage">

<div>

<div>

### 6.4.5. Managing Availability

</div>

</div>

</div>

This section concerns prerelease 3117 amd onwards and is not final.
Later versions have higher level management features but the primitives
discussed here continue to apply.

In its normal state, a cluster has all the constituent processes up and
all state is kept synchronous.

When a host unexpectedly disconnects, the following takes place:

<div class="itemizedlist">

- All transactions which have a write affecting this host become
  uncommittable. The application will see this immediately, as soon as
  it does anything within the transaction.

- All work proceeding at the request of the failed host on other hosts
  is aborted.

- All remaining network connections to the failed host are disconnected.

</div>

If a query was proceeding and it had state on the failing host, the
failure will be reported to the client of the query and the query will
be aborted. A subsequent query, if in read committed isolation, will
automatically avoid the failed host and use surviving ones. Thus, the
application sees a failure as a retryable abort of a transaction or
query.

For update transactions, if all copies of a partition are not online,
the update cannot be made. In order to allow proceeding with updates
even after a failure, the failed host must be declared removed. This
means that if it were to come back on, it would not get any updates or
queries from the other hosts until it was explicitly admitted back into
the cluster.

In version 6.00,3116, enabling updates when all hosts are not online
must be done manually. In other words, read only work will proceed
uninterrupted but updates will be prohibited if all hosts are not
online. Read balancing and re-enabling updates when all hosts have
rejoined the cluster is done automatically.

In order to declare that a host has for the time being left the cluster
or has returned to the cluster after having left it, one uses the
function cl_host_enable ().

For example, suppose a hardware failure that takes multiple processes
(hosts) offline. As long as for each there is at least one surviving
host of the same group (as per create cluster), read operations proceed
normally. But to re-enable writes for the time the failed hardware is
replaced, the operator must inform the cluster that the failed hosts are
not expected to return immediately and that no further reference to them
should be made, specifically, the rest should not attempt to keep them
up to date.

This is done with cl_host_enable. This is a SQL stored procedure. Log in
as dba on a surviving master host and do:

``` programlisting
SQL> cl_host_enable (1, 0);
```

This will abort all the transactions pending at the time and declare
host 1 to be off limits to the rest of the cluster. If Host1 was playing
the role of the master, the master role is automatically transferred to
the next one in the succession.

The succession of master hosts is declared in the cluster.ini with the
settings of Master, Master2, Master3 and so on. All cluster.ini files
must agree.

After this, even though Host1 is now acknowledged offline, updates can
proceed.

To rejoin a recovered host into a cluster, so as to again have an
additional copy of the formerly incompletely replicated partition, one
can do

``` programlisting
SQL>cl_host_enable (1, 1);
```

This states that Host1 is again part of the cluster. This statement must
be executed on an online master node of the cluster, thus not on Host1
itself.

Supposing that the database files of Host1 have been lost in the failure
and that Host1 and Host2 were in the same group. The restore would go by
taking the cluster offline, copying the database files of Host1 to Host1
and starting the database again. Then the dba would issue cl_host_enable
(1) and Host1 would again be available.

To do this without downtime, one may do the following:

<div class="itemizedlist">

- Disable checkpoints on Host2: checkpoint_interval (0); Operations
  continue. Copy the database files of host2 to host1.

- Start host1.

- Put host2 and all hosts with which host2 occurs in the same group in
  read-only mode: cl_read_only (2, 1)

- copy the transaction file of host2 to host1 and replay it with replay
  ().

- rejoin host1 to the cluster with cl_host_enable (1, 1);

- Re-enable updates with cl_read_only (2, 0);

- re-enable checkpoint on host2 with checkpoint_interval (), setting it
  to its previous value. See virtuoso.ini.

</div>

Further versions perform these operations automatically. The above
procedure is error prone. Do not try it unless you understand exactly
why each step is made and what its effects are supposed to be.

</div>
