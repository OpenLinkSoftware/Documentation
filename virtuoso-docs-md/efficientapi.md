<div>

<div>

<div>

<div>

### 7.3.7. Efficient Use of API

</div>

</div>

</div>

DO NOT USE SQLExecDirect. If a statement is executed more than once it
is much faster to prepare the statement with SQLPrepare and then use
SQLExecute repeatedly. The system only compiles the statement once,
therefore there is no parsing overhead for repeatedly compiling the same
text.

Array parameters for insert, update or single row selects are about
twice as fast as the same operations on a single parameter set.

The OR connective in SQL can result in slow queries with extensive
locking.

Autocommit should be used when possible, i.e. make the last statement of
a transaction autocommitting to avoid having to commit the transaction
as a separate operation.

</div>
