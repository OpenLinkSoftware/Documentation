<div id="isqlcommands" class="section">

<div class="titlepage">

<div>

<div>

### 7.2.2. ISQL Commands

</div>

</div>

</div>

``` programlisting
<SQL_command> &
```

Spawns a new copy of ISQL as a background OS process to execute the
command. The new copy will make its own connection and will terminate
after the command completes. The isql instance which received the
command prompts for the next command without waiting for the spawned
isql instance

``` programlisting
! <command> (;|&)
```

Executes an OS command

``` programlisting
SET <ISQL_OPTION>( |=)<VALUE>
```

sets the ISQL variable or associative array U value, if it is recognized
as such. Otherwise passed to the server.

<div id="id20448" class="example">

**Example 7.1. Examples**

<div class="example-contents">

``` programlisting
SET U{test} 5; sets the associative array U's 'test' to have value of 5
```

</div>

</div>

  

``` programlisting
SHOW [<ISQL_OPTION>]
```

shows the value of an ISQL option, if it is recognized as such.
Otherwise passed to the server.

``` programlisting
NOP
```

no-operation. Useful sometimes in an \$IF command.

``` programlisting
(ECHO|ECHOLN) [STDOUT|STDERR|ERROR_STREAM|BOTH] string1 string2 ...
```

echoes it's arguments into the specifies output stream (defaults to
STDOUT if not specified) If ECHOLN is used it appends a new line after
the last character printed.

``` programlisting
WAIT_FOR_CHILDREN
```

Waits for background ISQL subcommands spawned by specifying an & instead
of ; at the end of the statement.

``` programlisting
LOAD <file_name>
```

Executes each statement of the specified file. Statements end in a
semicolon or at the closing curly brace for procedure or trigger
definitions.

``` programlisting
HELP [<isql-command>]
```

Prints general or command specific help texts.

``` programlisting
(EXIT|QUIT) [NOT]
```

Exits ISQL

EXIT NOT is a NO-OP, allowing statements like: EXIT \$IF \$EQU
\$ARGV\[0\] 10 \$ARGV\[0\] NOT; which exits with exit code 10 if
\$ARGV\[0\] is ten (presumably keeping a some-kind of failure counter)
but otherwise does nothing special, and continues from the next
statement.

``` programlisting
SLEEP [<seconds>]
```

sleeps for the specified number of seconds or until an OS signal
arrives. If seconds is not specified it's considered 0 and the behavior
is OS dependent (the OS sleep function on Unixes, Sleep() in the Windows
API).

``` programlisting
CONNECT [<conn_str>]
```

Without arguments forces the connection to be made with an ordinary way
with SQLConnect and so-far specified connection details. With an
argument uses SQLDriverConnect, giving that argument as a connection
string (e.g. "DSN=Virtuoso;UID=DBA,PWD=DBA") If we are already
connected, then is just NO-OP which is silently ignored.

``` programlisting
TableQualifiers
```

Returns all defined table qualifiers.

``` programlisting
TableOwners
```

Returns existing table owners list.

``` programlisting
TableTypes
```

Returns list of current table types.

``` programlisting
RECONNECT [<User_ID>]
```

If the ISQL is already connected then disconnects. After that it tries
connecting to the same data source, but with using its argument as a
user name. If none specified it gets the user name/password from the UID
and PWD ISQL variables.

``` programlisting
FOREACH [LINE|INTEGER|BLOB|TIMESTAMP|DATE|TIME]
    [FOLLOWING|IN (-|-b|<file_name>)|BETWEEN <n1> <n2>]
    <statement_with_params> <statement_with_params> ... [END]
```

This command executes the \<statement_with_params\> in a loop, after
binding the parameters specified in it to values specified in the
command.

Parameters are specified as follows :

|                                                      |
|------------------------------------------------------|
| ? - an ordinary parameter bound to the foreach value |
| ?C - the count of successful operations              |

|                                                                               |
|-------------------------------------------------------------------------------|
| LINE processes the input line by line                                         |
| INTEGER converts the input into integer and then processes it.                |
| BLOB reads the entire input and sets it as an blob parameter using SQLPutData |
| TIMESTAMP is the same as LINE, bit binds to a TIMESTAMP SQL Type              |
| DATE is the same as LINE, but binds to a DATE SQL Type                        |
| TIME is the same as LINE, bit binds to a TIME SQL Type                        |

|                                                                 |
|-----------------------------------------------------------------|
| IN specifies a set of items terminated by an END                |
| BETWEEN specifies integer set starting from n1 and ending on n2 |
| FOLLOWING as as IN but skips the input till the END keyword     |

<div id="id20495" class="example">

**Example 7.2. Examples:**

<div class="example-contents">

``` programlisting
foreach integer between 1 10 insert into num_tb values (?);
```

Inserts 10 rows from 1 to 10 into the num_tb

``` programlisting
foreach line in my_text_file.txt insert into str_tb (line_no, data) values (?C, ?);
```

Inserts each line of the text file my_text_file.txt into str_tb's data
column and puts line number in line_no column

``` programlisting
foreach blob in my_text_file.txt insert into file_tb values (?);
```

inserts a row into the file_tb with the contents of the my_text_file.txt
as a single blob value.

</div>

</div>

  

``` programlisting
SHUTDOWN
```

Passes this through to the server as a command

``` programlisting
CALL <SQL statement>
```

Tries to bind & print the SQL_RETURN_VALUE and display multiple
resultsets (if any) after executing the statement.

``` programlisting
COLUMNS [<table_mask>][/<column_mask>]
```

Calls SQLColumns ODBC

``` programlisting
TABLES [<table_mask>]
```

Calls SQLTables ODBC

``` programlisting
PRIMARYKEYS [<table_mask>]
```

Calls SQLPrimaryKeys ODBC

``` programlisting
COLUMNPRIVILEGES [<table_mask>]/[<procedure_column_mask>]
```

Calls SQLColumnPrivileges ODBC

``` programlisting
PROCEDURES [<procedure_mask>]
```

Calls SQLProcedures ODBC

``` programlisting
PROCEDURECOLUMNS [<procedure_mask>]/[<procedure_column_mask>]
```

Calls SQLProcedureColumns ODBC

``` programlisting
TABLEPRIVILEGES [<table_mask>]
```

Calls SQLTablePrivileges ODBC

``` programlisting
GETTYPEINFO
```

Calls SQLGetTypeInfo (SQL_ALL_TYPES) ODBC

``` programlisting
STATISTICS [<table_mask>] [/U]
```

Calls SQLStatistics ODBC. U means show only unique indexes otherwise all

``` programlisting
SPECIALCOLUMNS [<table_mask>] [/(B?S?T?N?)]
```

Calls SQLSpecialColumns ODBC.

|                                                                          |
|--------------------------------------------------------------------------|
| B means BEST_ROWID, otherwise ROWVER.                                    |
| S means Session scope, T means transaction scope, otherwise current row. |
| N means No Nulls, otherwise Nullable.                                    |

</div>
