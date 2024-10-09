<div>

<div>

<div>

<div>

### 18.5.8. SQL Exceptions

</div>

</div>

</div>

``` programlisting
caddr_t srv_make_error (char *code, char *msg);
void sqlr_error (char *code, char *msg,...);
void sqlr_resignal (caddr_t err);
```

An error object is a three element array of type `DV_ARRAY_OF_POINTER` ,
consisting of the number 3, the SQL state and the message. The control
flow in case of errors signalled inside VSEs is a longjmp to an outer
context, typically that of the calling stored procedure or top level
query. The condition is there handled or sent to the next level up,
ultimately to the ODBC, JDBC or Web client. Executing a SQL statement
inside a VSE always returns and never exits the VSE by longjmp. Thus the
VSE gets a first look at all SQL errors caused by statements executed by
it.

sqlr_error is the normal function for signaling a SQL state. It takes a
5 character SQL state, a printf format string and optional arguments, a
la printf.

sqlr_resignal is used to throw a condition to the next level handler.
This is typically done when executing a query which returns an error and
the error is sent up to the caller of the VSE.

srv_make_error makes the error structure. The expression

sqlr_resignal (srv_make_error ("12345", "message")); is equivalent to
sqlr_error ("12345", "message");

<div>

|                              |                                                         |
|:----------------------------:|:--------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                    |
|                              | srv_make_error does not take the printf-type arguments. |

</div>

By convention a NULL pointer indicates no error. sqlr_resignal (NULL) is
an error.

The macros:

``` programlisting
#define ERR_STATE(err)  (((caddr_t*) err)[1])
#define ERR_MESSAGE(err)  (((caddr_t*) err)[2])
```

can be used to read an error returned by a statement.

</div>
