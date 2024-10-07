<div id="procedures_transactions" class="section">

<div class="titlepage">

<div>

<div>

## 11.14. Procedures and Transactions

</div>

</div>

</div>

A procedure call executed by a client is just like any other SQL
statement. It executes in the context of the client's active
transaction. If the connection is in autocommit mode the transaction is
automatically committed if the procedure returns successfully and rolled
back if the procedure returns with an error. If the connection is in
manual commit mode, a possible procedure error has no effect on the
client's transaction, unless the error is a transaction error, e.g.
timeout or deadlock.

For best performance, we recommend using procedures in autocommit mode.
In this way, a single client-server exchange will suffice to carry out
the whole transaction. This will also conveniently roll back the
transaction if the procedure exited as a result of an unhandled SQLSTATE
or a 'not found' condition.

Procedures can commit or rollback transactions using commit work and
rollback work statements.

</div>
