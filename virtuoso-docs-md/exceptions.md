<div id="exceptions" class="section">

<div class="titlepage">

<div>

<div>

## 11.6. Exception Semantics

</div>

</div>

</div>

Exceptions are of two types: Not Found and SQLSTATE. A not found
exception occurs when a select - into or open statement finds no row or
when a fetch statement reads past the last row of a cursor. A SQLSTATE
exception may result from any operation, typically a manipulative SQL
statement. The SQLSTATE '4001', deadlock is an example of this. A
user-written procedure may signal a user defined exception with the
signal function.

Virtuoso/PL supports PSM 96 style exception handlers. These allow
catching specific SQL states or ranges of SQL states, invoking a
specific block of code when the state is signalled from within the scope
of the handler. The handler may propagate the exception to an outer
handler or transfer control to any appropriate point in the containing
procedure.

An unhandled exception will cause the procedure where it is detected to
return the exception to its caller. If the caller is another procedure
that has a handler for the specified exception that procedure invokes
the handler. If the caller is a call statement issued by a client, the
client gets the SQLSTATE and the SQLExecute function called by the
client returns SQL_ERROR and the client application may retrieve the
SQLSTATE and message with the SQLError function.

A SQLSTATE is any short string used to identify an error or exception
condition. The system itself generates certain predefined SQLSTATE's for
error conditions. Applications may add other states.

See the DECLARE HANDLER, whenever statement and signal function for an
example of exception handling.

</div>
