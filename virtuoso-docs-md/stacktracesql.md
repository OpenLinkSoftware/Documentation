<div>

<div>

<div>

<div>

### 11.20.2. Stack Trace Reporting On Sql Error Generation

</div>

</div>

</div>

When an exception occurs the Virtuoso server has the ability to provide
information about the procedure call stack. It appends the call stack
information to the error message text. There are also line numbers
besides each level of the call stack which are a Virtuoso/PL procedure.
The line numbers mark the beginning of the innermost compound statement.

The call stack reporting mode is controlled by the
"CallstackOnException" option in the
<span class="emphasis">*Parameters*</span> section of the Virtuoso INI
file .

This parameter takes the following values:

|                                                                      |
|----------------------------------------------------------------------|
| 0 (default) - Call stack reporting disabled.                         |
| 1 - Call stack is reported but does not include values of arguments. |
| 2 - Call stack is reported and contains all available information.   |

Call stack reporting can be a security hole because it can demonstrate
internal logic of the system to the end user; this is especially
important for dynamic web pages. Mode 2 is especially insecure because
it may print values of function arguments that may contain confidential
information.

Some client applications are unable to handle long error messages
properly. Client-side APIs for ODBC and similar protocols assume that
client should allocate a buffer for error message string and then ask
the API to save the message string to the specified buffer of the
specified size. Not all client applications work properly if a message
does not fit in the buffer. If an client application you use reports an
empty string instead of error message or displays a message like 'Error
message is too long' then you may wish to decrease the value of the
"CallstackOnException" option to keep messages shorter.

</div>
