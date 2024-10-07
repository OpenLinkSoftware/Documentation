<div id="transactiontimeout" class="section">

<div class="titlepage">

<div>

<div>

### 9.24.3. transaction_timeout

</div>

</div>

</div>

This allows setting a timeout for the current transaction. The value
must be an integer count of milliseconds from the beginning of the
transaction. The transaction is deemed to begin when the first client
statement executes inside it or, if the transaction starts from a commit
work or rollback work statement in PL, from the time of this statement.
If the transaction does not commit or rollback within so many
milliseconds of its beginning, it is liable to get terminated, which is
signalled to any code running inside the transaction as a SQL state
S1T00. When this is signalled the transaction is set into an
uncommittable state and must be rolled back. When the timeoutg elapses,
all locks and uncommitted state belonging to the transaction are freed.

This setting remains in effect until the transaction terminates. Any
timeout for a next transaction must be set separately. This feature can
be used for enforcing maximum running times on operations. The timeout
will take effect also if the transaction holds no locks. This setting
corresponds to the Virtuoso ODBC extension SQL_TXN_TIMEOUT statement
option.o

</div>
