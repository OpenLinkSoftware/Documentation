<div id="twopcimplementation" class="section">

<div class="titlepage">

<div>

<div>

## 11.15. Distributed Transaction & Two Phase Commit

</div>

</div>

</div>

2PC is an acronym for 2 Phase Commit. This is a protocol by which data
being committed to a database is committed in two phases. In the first
phase, the transaction processor checks that all parts of the
transaction can be committed. In the second phase, all parts of the
transaction are committed. If any part of the transaction indicates in
the first phase that it cannot be committed, the second phase does not
occur. ODBC does not support two-phase commits.

Transactions in SQL databases are expected to have "ACID" features:
Atomicity, Consistency, Isolation, Durability. A two-phase commit (2PC)
protocol is needed for guaranteeing ACID properties of transactions
which involve changing data in more than one database. This can be the
case in a transaction involving tables attached from other databases or
explicit access to remote databases with rexecute().

The 2PC protocol needs to have a third party Distributed Transaction
Coordinator (DTC). Virtuoso supports Microsoft Transaction Server (or MS
DTC).

There are two ways of using MTS-driven distributed transactions in
Virtuoso. Virtuoso either initiates the transaction, or it responds to a
transaction.

<div id="twopc_send" class="section">

<div class="titlepage">

<div>

<div>

### 11.15.1. Initiating Distributed Transactions

</div>

</div>

</div>

In this case the transactions are initiated by Virtuoso itself. This
causes all remote connections of linked tables to be automatically
enlisted in a distributed transaction controlled by MTS. To enable this,
Virtuoso's transaction must be set to a special state with the 'SET'
statement as follows:

``` programlisting
SET MTS_2PC=1;
```

This statement turns distributed transaction support on. All
transactions started on remote databases shall automatically be enlisted
as branches of a distributed transaction managed by MS DTC. The effect
of SET, in this case, lasts until the commit or rollback of the
transaction. The SET statement should be at the beginning of the
transaction, before any distributed operations are undertaken.

Example of money transfer from one attached table to another:

``` programlisting
CREATE PROCEDURE TWOPC_TRANSFER_MONEY(IN person_id INTEGER)
{
  IF (MTS_STATUS('MTS') = 'disconnected') -- check connection to MS DTC
  {
    MTS_CONNECT(0); -- connect to MS DTC
  }
  SET MTS_2PC=1; --  transaction of this procedure is now in distributed
  MTS_SET_TIMEOUT (1000); -- 1sec timeout on distributed transactions
  UPDATE linked_account1 SET amount=amount+100 WHERE id=person_id;
  UPDATE linked_account2 SET amount=amount-100 WHERE id=person_id;
  commit work;
}
```

This money transfer is under 2PC control of MTS. If one of the two
participating databases crashes (or rolls back due to deadlock or
timeout), Virtuoso will roll back the whole distributed transaction.

Note that if a transaction modifies the local Virtuoso database, and not
more than one remote database, 2 phase commit is not needed for
guaranteeing integrity.

Deadlocks are detected for local transactions using a wait graph.
Deadlocks are detected for distributed transactions based on timeouts.
Use <a href="fn_mts_set_timeout.html" class="link"
title="mts_set_timeout">mts_set_timeout()</a> for explicitly setting a
timeout. See MS DTC for a definition of timeouts.

</div>

</div>
