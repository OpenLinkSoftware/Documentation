<div>

<div>

<div>

<div>

### 7.3.6. Effect of Connection & Statement Options

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Connection Options

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### SQL_AUTOCOMMIT

</div>

</div>

</div>

The autocommit option is set at the connection level and affects every
statement executed after it being set. Setting the option does not
communicate itself with the server and is therefore fast.

Autocommit is on by default. Autocommitting SELECT statements are
executed with read committed isolation. This is appropriate since any
update based on the autocommitting read would be in a different
transaction and hence would block to wait for access to the selected
row. Also re-evaluating a select in autocommit mode would read the data
in a different transaction. Hence there is no point in repeatable read
isolation for autocommitting cursors. Cursors inside procedures have the
normal repeatable read isolation regardless of whether the procedure was
called in autocommit mode.

When an autocommitting statement starts it is executed in the
transaction That is the connection's current transaction when it is
received. Before starting the autocommitting statement sets the
connection's current transaction to a new one. In this manner a client
can issue multiple asynchronous autocommitting statements at the same
time and the statements will execute concurrently, each in its own
transaction.

If array parameters are used in a statement on an autocommitting
connection each parameter row will be processed in its own transaction
in sequential order. Multiple Asynchronous statements must be used to
execute one client's statements in parallel.

To commit or roll back a transaction in manual-commit mode, an
application should call SQLEndTran. Applications should not attempt to
commit or roll back transactions by executing COMMIT or ROLLBACK
statements with SQLExecute or SQLExecDirect. The effects of doing this
are undefined.

</div>

<div>

<div>

<div>

<div>

##### SQL_TXN_ISOLATION

</div>

</div>

</div>

This option allows all the values defined in ODBC,

The isolation of an operation is the property of the operation rather
than of the transaction within which it takes place. Once an operation
has started, e.g. a cursor has been opened, its isolation cannot be
changed.

The value of this option will affect any subsequently executed
statement. Note that setting this option to different values during a
transaction will work, thus a transaction can have cursors with
different isolations although that is presumably not the intention of
the ODBC specification.

See the transaction model for a definition of the different isolation
levels.

A statement in autocommit mode executes in the same transaction as the
previous statement. The transaction is committed when the statement
successfully completes. The next statement in the connection will
execute in the fresh transaction that was associated to the connection
at the start of the previous autocommitting statement.

As a consequence of this multiple concurrent autocommitting transactions
may execute on the same connection at the same time.

Statements executed with array parameters execute each set of parameters
as a separate transaction if the connection is in autocommit mode.

</div>

<div>

<div>

<div>

<div>

##### SQL_ACCESS_MODE

</div>

</div>

</div>

This has the effect of reversing any SQL_CONCUR_LOCK concurrency to
SQL_CONCUR_READ_ONLY. The statement option's value is not changed
though.

</div>

<div>

<div>

<div>

<div>

##### SQL_CURRENT_QUALIFIER

</div>

</div>

</div>

This sets or gets the current qualifier. The initial value is obtained
from the server at connect time. The values reflect the effects of any
USE statements.

</div>

<div>

<div>

<div>

<div>

##### SQL_NO_CHAR_C_ESCAPE (=5002)

</div>

</div>

</div>

This has the same effect as the NO_CHAR_C_ESCAPE option in the SET
statement. It takes boolean int values (0/non-0)

</div>

<div>

<div>

<div>

<div>

##### SQL_CHARSET (=5003)

</div>

</div>

</div>

This has the same effect as the CHARSET option in SET statement. It
takes string values (the name of the character set to use).

</div>

<div>

<div>

<div>

<div>

##### SQL_ENCRYPT_CONNECTION (=5004)

</div>

</div>

</div>

Usable only with the Virtuoso CLI (because the ODBC/iODBC driver manager
does not pass-through the custom options to the driver on
SQLConnect/SQLDriverConnect). When set to the string "1" means use SSL
but no X509 certificates. Setting it to a NULL (default) means no
encryption of the ODBC connection. Any other string is treated as a file
name of one PKCS12 package to get the data from for establishing an
encrypted SSL connection using X509 certificates (see the -E/-X ISQL
options).

</div>

<div>

<div>

<div>

<div>

##### SQL_SHUTDOWN_ON_CONNECT (=5005)

</div>

</div>

</div>

Usable only with the Virtuoso CLI (because the ODBC/iODBC driver manager
does not pass through the custom options to the driver on
SQLConnect/SQLDriverConnect). Shuts down the server on connection after
authenticating the DBA user (see the -K ISQL option).

</div>

</div>

<div>

<div>

<div>

<div>

#### SQLSetStmtOption Statement Options

</div>

</div>

</div>

Virtuoso supports all ODBC 2.x and ODBC 3.x statement options. The
following options are mentioned below due to implementation specific
details.

<div>

<div>

<div>

<div>

##### SQL_CONCURRENCY

</div>

</div>

</div>

The supported values are SQL_CONCUR_READ_ONLY, SQL_CONCUR_LOCK and
SQL_CONCUR_VALUES, the last option is only available for scrollable
cursors. A select statement with SQL_CONCUR_READ_ONLY will make shared
locks when locking for repeatable read or serializable transactions. The
SQL_CONCUR_LOCK for a select statement will cause it to make exclusive
locks, as if it had the FOR UPDATE clause specified.

See the section on scrollable cursors for the effect of
SQL_CONCUR_VALUES. For all statements except scrollable cursors this
value reverts to SQL_CONCUR_READ_ONLY.

Any searched update or delete statements will make exclusive locks in
all cases.

</div>

<div>

<div>

<div>

<div>

##### SQL_MAX_ROWS

</div>

</div>

</div>

This option only affects static cursors.

</div>

<div>

<div>

<div>

<div>

##### SQL_TXN_TIMEOUT

</div>

</div>

</div>

This is an extension that allows setting a time limit on the current
transaction. The time limit starts at the execution of the statement
specifying this option. The transaction will terminate the indicated
number of seconds after the execute whether the statement has completed
or not.

</div>

<div>

<div>

<div>

<div>

##### SQL_PREFETCH_SIZE

</div>

</div>

</div>

This is an extension option that controls how many rows of a forward
only cursor are prefetched by the execute and fetch calls. A high value
is advantageous for long consecutive reads since it cuts down on the
number of client server messages exchanged. On the other hand a large
value can result in unnecessary data transfer and locking if only the
first few rows of a cursor are fetched. A value of -1 will cause the
entire rowset to be fetched at the execute, so that no matter the select
size, only one message is exchanged. The default value is 20. This can
also be set in the virtuoso.ini file.

A select with array parameters will always work as with a
SQL_PREFETCH_SIZE of -1, meaning that all the result sets are computed
and sent to the client by the SQLExecute call that opens the cursor.

</div>

<div>

<div>

<div>

<div>

##### SQL_CURSOR_TYPE

</div>

</div>

</div>

|                 |
|-----------------|
| SQL_KEYSET_SIZE |
| SQL_CONCURRENCY |

The cursor type options should be set before preparing a statement.
Other options may be set at any time. The rowset and prefetch options
should not be modified after executing a SELECT.

</div>

<div>

<div>

<div>

<div>

##### SQL_GETLASTSERIAL

</div>

</div>

</div>

This is an extension that returns the last assigned identity column
value. The return buffer pvParam is of type SQLINTEGER. For this to be
meaningful, the statement in question must be an INSERT into a table
that has an identity column. Note that if there are more than one
identity columns or if triggers make inserts with identity columns the
value will be undefined.

</div>

</div>

</div>
