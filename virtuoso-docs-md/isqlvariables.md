<div id="isqlvariables" class="section">

<div class="titlepage">

<div>

<div>

### 7.2.4. ISQL Variables

</div>

</div>

</div>

These variables are sometimes set as a side effect of executing
statements, e.g. rowcnt and sometimes should be explicitly set by the
user to control the operation of isql, e.g. maxrows.

The variable names are case insensitive. Like in UNIX shells, the
variable name in an expression must be prefixed by a \$ to return its
value. Variables do not have an explicit data type. Like Unix shell
variables they have string values which are sometimes interpreted as
numbers and sometimes as booleans. Generally an on/off choice is
represented by the values ON/OFF. The ON/OFF values are case
insensitive.

<div id="id20575" class="example">

**Example 7.4. Example:**

<div class="example-contents">

``` programlisting
SQL> SET AUTOCOMMIT ON;
SQL> echo $autocommit;
ON
SQL> set U{var} foo;
SQL> echo $u{VAR};
foo
```

Note that the \$u{\<var\>} notation is a general purpose text
substitution macro without arguments. The expansion takes place
regardless of SQL syntactic context.

</div>

</div>

  

<div id="id20579" class="example">

**Example 7.5. Example:**

<div class="example-contents">

``` programlisting
set u{table} SYS_KEYS;
select count (*) from $u{table};
```

</div>

</div>

  

<div id="varref" class="section">

<div class="titlepage">

<div>

<div>

#### Variable Reference

</div>

</div>

</div>

``` programlisting
RETVAL
```

Function called return value

``` programlisting
RETVALLEN
```

Function called return value length

``` programlisting
ROWCNT
```

Number of rows in the last result set. If the statement was an insert,
update or delete this is the number of rows affected.

``` programlisting
COLCNT
```

Number of columns in the last resultset

``` programlisting
ARGC
```

Number of ISQL command line arguments

``` programlisting
I
```

Number of script arguments (after -i)

``` programlisting
LIF
```

Result of the last \$IF

``` programlisting
INPUTLINE
```

Current executed line

``` programlisting
STATE
```

SQL State (defaults to OK)

``` programlisting
SQLSTATE
```

Same as state.

``` programlisting
MESSAGE
```

the SQL error message from the last operation.

``` programlisting
DRIVER
```

The Driver name

``` programlisting
LWE
```

Last ECHO output

``` programlisting
DSN
```

The DSN or host address used/to be used in connecting to the server. Use
this with uid and pwd before the connect or reconnect command to change
the connected server. This is useful for scripts which access multiple
servers.

``` programlisting
UID
```

The User ID used/to be used in connecting to the server

``` programlisting
PWD
```

The Password used/to be used in connecting to the server

``` programlisting
ERRORS
```

The current stream for errors (STDIN, STDOUT, STDERR or a file name)

``` programlisting
PROMPT
```

Prints the PROMPT or not

``` programlisting
EMPTY
```

The current empty string value

``` programlisting
VERSION
```

ISQL version

``` programlisting
BLOBS
```

When ON binds prints the BLOB resultset values when printing the
resultset. Otherwise prints 'BLOB x chars'

``` programlisting
ECHO
```

When ON prints the commands to the standard output before executing

``` programlisting
BANNER
```

When ON prints the column names & types banner when printing the
resultset

``` programlisting
TYPES
```

When ON prints the Type information in the resultset's banner

``` programlisting
VERBOSE
```

When ON Prints the Timing row after the resultset output

``` programlisting
TIMESTOSTRINGS
```

When ON binds the SQL_DATE, SQL_TIME & SQL_TIMESTAMP columns to strings

``` programlisting
TRAILING_NEWLINES
```

When ON prints new line after the row's end

``` programlisting
DEADLOCK_RETRIES
```

How many times to retry the statement if deadlock occurred

``` programlisting
MACRO_SUBSTITUTION
```

When ON ISQL does understand & process \$ macros

``` programlisting
IGNORE_PARAMS
```

When ON passes the ? through to the server instead of returning an error
for unbound ?

``` programlisting
BIND_RETURN_VALUES
```

When ON binds a buffer to SQL_RETURN_VALUE

``` programlisting
AUTOCOMMIT
```

When ON ISQL executes statements in autocommit mode. By default isql
executes statements in manual commit mode, following each execution with
a SQLTransact call to commit. The difference is not visible most of the
time.

``` programlisting
ACCESSMODE
```

Sets the ODBC access mode (RW, RO)

``` programlisting
TIMEOUT
```

ODBC Query timeout

``` programlisting
MAXROWS
```

Print only the first so many rows. If 0 - unlimited.

``` programlisting
CURRENT_QUALIFIER
```

Prints the current ODBC SQLGetInfo client Qualifier

``` programlisting
INFO_DATABASE_NAME
```

Prints the current ODBC SQLGetInfo Database name

``` programlisting
INFO_USER_NAME
```

Prints the current ODBC SQLGetInfo user name

``` programlisting
INFO_GETDATA_EXTENSTIONS
```

Prints the current ODBC SQLGetInfo SQLGetData extensions flag

``` programlisting
COMMAND_TEXT_ON_ERROR
```

When OFF ISQL does not print the text of the command in the error
messages

</div>

</div>
