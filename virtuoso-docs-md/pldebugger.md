<div id="pldebugger" class="section">

<div class="titlepage">

<div>

<div>

## 11.21. Procedure Language Debugger

</div>

</div>

</div>

Virtuoso has step by step PL debugging capabilities and a call stack
trace option. When Virtuoso is running with a console or with stdout
going somewhere like a file you can print debug messages directly to
that using
<a href="fn_dbg_printf.html" class="link" title="dbg_printf"><code
class="function">dbg_printf()</code></a> and
<a href="fn_dbg_obj_print.html" class="link" title="dbg_obj_print"><code
class="function">dbg_obj_print()</code></a> functions.

Procedure source code can be written to an ASCII file using any
text/programming editor. This file can be loaded into
<a href="configuringvirtuosoclients.html#isql" class="link"
title="Native Virtuoso Interactive SQL Query (ISQL)">ISQL</a> using the
load command or directly from the command line using the ISQL batch
mode:

``` programlisting
isql data-source user password file
```

ISQL can then be used to test the procedures functionality. Procedures
can return result sets to ISQL for data debugging purposes too. When
dealing with results sets in ISQL remember to call procedures using the
`CALL` keyword to ensure that ISQL outputs all result sets:

``` programlisting
CALL procedure(arguments);
```

The PL procedure debugger allows you to execute procedures step-by step,
or stop execution based upon a predefined condition within Virtuoso/PL
procedure(s). This feature is not intended for SQL statements debugging.
SQL statements are treated as atomic units of execution, it is not
possible to step into these. It is possible to step over a procedure
which loops over a cursor, though. Procedures are compiled with extra
information for debugging, thus the speed of execution may be somewhat
reduced. It is possible to step in or step over statements, however this
does not apply to SQL statements. In order to start debugging on some
event, breakpoints are required. The breakpoints can be global or
temporary. The global breakpoint means the process will stop with or
without a debug session. The temporary breakpoints are to stop execution
only in the current debug session.

Procedure debugging can be activated in two ways. You can instruct
Virtuoso to enable debugging information for all procedures using the
PLDebug parameter in the Virtuoso INI file, or for selected procedures
by including a special comment "`--pl_debug+` " at the top of the
procedure. Debug information is visible only from a debugging tool such
as ISQL

ISQL can be used as a procedure debugging tool. ISQL is started in debug
mode using the -D switch:

``` programlisting
isql <host:port> dba <dba-password> -D
```

Debugging of the server is restricted to dba privileged accounts for
security reasons. The summary of the debug commands available can be
viewed from typing help in the debugger. The following list will be
shown:

``` screen
DEBUG> help
OpenLink Interactive PL Debugger (Virtuoso).

Available commands:
    BREAK procedure_name [line number] - Set breakpoint at specified line or PL function
    NEXT  - Step program, proceeding through PL subroutine calls.
    INFO (THREAD|CLIENT|BREAK) - Generic command for showing things about the program/process being debugged.
        THREAD - Running threads
        CLIENT - Connected SQL/ODBC clients
        BREAK - Active breakpoints
    ATTACH thread_id|client_id - Attach to a running process.
    STEP  - Step PL program until it reaches a different source line.
    LIST [procedure name] [line number] - List specified procedure or line.
    WHERE  - Print backtrace of all stack frames.
    CONTINUE  - Continue PL program being debugged after breakpoint.
    PRINT variable_name - Print value of variables or arguments.
    SET variable_name new_value - Assign a specified value to a variable.
    DELETE ([breakpoint_number]|[procedure_name] [line_number]) - Delete some breakpoints.
    FRAME frame_number - Select and print a stack frame.
    FINISH  - Execute until returns.
    UNTIL line_number - Execute until the program reaches a source line greater than the current.
```

There are two debug modes: local, for issuing local breakpoints and step
commands; global, for making global breakpoints.

There are two console or screen modes to debug/attach-to. These are: the
global console, which allows you to issue the INFO, ATTACH, BREAK,
DELETE commands; the local console, which once attached (using the
ATTACH command) via the global console becomes local and all possible
commands are available.

There are two syntaxes for specifying breakpoint locations,
`BREAK FFFF NNN` and `BREAK FFFF` where FFFF is a name of a procedure.

Local breakpoints will interrupt execution only if there is a connected
debug session. Global break points will cause the process to stop
regardless.

The source identification and line number output can be controlled with
a special comment in the PL code. This can be useful when you want to
alter the compilers notion of the current file and line number.
`--src FILENAME:LINENUMBER` can be used to reset the counters to the
specified filename and line number. This is also useful for handling
test coverage output - see the next section.

<div id="pldbgexample" class="example">

**Example 11.16. Debugging simple procedures**

<div class="example-contents">

Consider the following PL procedures:

``` programlisting
create procedure
db.dba.test_proc1 (in b varchar)
{
  --pl_debug+
   declare c integer;
   c := 0;
   for select u_id, u_name from sys_users do
     {
       c := u_id;
     }

   c := vector (1);

   c := test_proc2 ();

   return c;
};

create procedure
db.dba.test_proc2 ()
{
  --pl_debug+
  declare x, y any;
  x := 1;
  if (x = 1)
     {
       y := x + 1;
     }
   else
     {
       y := 2;
     }
   return y;
};
```

Here is a simple debugging session on the above procedures:

``` programlisting
$ isql localhost:1111 dba dba -D
Debug session established to localhost:1111
```

Display the test procedures to familiarize yourself with the lines and
their line numbers.

``` programlisting
DEBUG> list db.dba.test_proc1;
1 create procedure
2 test_proc1 (in b varchar)
3 {
4   --pl_debug+
5   declare c integer;
6   c := 0;
7   for select u_id, u_name from sys_users do
8     {
9       c := u_id;
10     }

DEBUG> list db.dba.test_proc1 11;
11
12   c := vector (1);
13
14   c := test_proc2 ();
15
16   return c;
17 }
18
19
20
```

put a break after for select statement.

``` programlisting
DEBUG> break db.dba.test_proc1 11
Breakpoint at: procedure DB.DBA.test_proc1, line 11
```

Now, start another ISQL session to Virtuoso and run the procedure that
we are debugging, DB.DBA.test_proc1(''), and wait for it to hit the
breakpoint. Back to the debug ISQL, get the list of breakpoints:

``` programlisting
DEBUG> info thre
@1111:4 in DB.DBA.test_proc1 () at 11
```

attach to thread of interest:

``` programlisting
DEBUG> attach @1111:4
1111:4
```

Find out where it stopped:

``` programlisting
DEBUG> where
#0 DB.DBA.test_proc1 () at 11
#1 ?? () at 0
```

print the value of 'c' now, and continue step by step

``` programlisting
DEBUG> print c
$25 "c" INTEGER (189) 4
DEBUG> next
11
DEBUG> print c
$25 "c" INTEGER (189) 4
DEBUG> next
12   c := vector (1);
DEBUG> print c
$25 "c" ARRAY_OF_POINTER (193) (1 )
DEBUG> next
13
```

step into the test_proc2 procedure:

``` programlisting
DEBUG> step
14   c := test_proc2 ();
```

examine the stack

``` programlisting
DEBUG> where
#0 DB.DBA.test_proc2 () at 4
#1 DB.DBA.test_proc1 () at 14
#2 ?? () at 0
```

step through the test_proc2 procedure

``` programlisting
DEBUG> next
7   x := 1;
DEBUG> next
8   if (x = 1)
DEBUG> next
10       y := x + 1;
DEBUG> next
11     }
DEBUG> print y
$25 "y" INTEGER (189) 2
```

set the 'y' to be 100

``` programlisting
DEBUG> set y 100
The 'y' is set to '100'.
DEBUG> next
16   return y;
DEBUG> print c
$25 "c" INTEGER (189) 100
```

continue the execution

``` programlisting
DEBUG> cont
Execution resumed
DEBUG>
```

</div>

</div>

  

<div id="pldbgplcoverage" class="section">

<div class="titlepage">

<div>

<div>

### 11.21.1. Branch Coverage

</div>

</div>

</div>

The Virtuoso ini file contains a parameter in \[Parameters\] section
called TestCoverage whose value is the name of an XML file that will
accumulate test coverage data.

The PLDebug switch controls the type of debugging enabled:

|                                                                                                                                                                                |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*PLDebug = 0*</span> - default debugging information and test coverage disabled.                                                                        |
| <span class="emphasis">*PLDebug = 1*</span> - debugging information enabled.                                                                                                   |
| <span class="emphasis">*PLDebug = 2*</span> - debugging information enabled, test coverage data will be written to file specified in TestCoverage Virtuoso ini file parameter. |

If the test coverage file is specified the initial state of the
accumulation is read from the coverage file if one exists. If the file
does not exist then coverage starts from scratch.

The format of the file for store/restore of coverage data is:

``` programlisting
<pl_stats>
  <proc name="xxx" calls="nn" file="ff" >
    <line no="xx" ctr="nn" /> ..
    <caller name="nnn" ct="nn" /> ..
  </proc>
  ...
</pl_stats>
```

An example of file:

``` programlisting
<pl_stats>
  <proc name="DB.DBA.pop_get_command" calls="00000133" file="pop3_svr.sql" >
    <line no="000152" ctr="000133" />
    <line no="000153" ctr="000133" />
    <line no="000156" ctr="000133" />
    <caller name="DB.DBA.POP_IF_COMMAND" ct="000070" />
    <caller name="WS.WS.NN_SRV" ct="000063" />
  </proc>
</pl_stats>
```

For the purpose of making a Coverage report the format is extended. The
lct attribute of the \<proc\> element contains a total number of lines
for the procedure. The CDATA sections of the \<line\> element contain
the excerpt of the line in question up to a maximum of 50 characters.

An example of the extended file format (made with cov_store ('ccc.xml',
1)) is:

``` programlisting
<proc name="DB.DBA.pop_is_ok_" calls="00000034" file="pop3_svr.sql" lct="22" >
 <line no="000239" ctr="000034"><![CDATA[6    _idx := pop_atoi (num); ]]></line>
 <line no="000240" ctr="000034"><![CDATA[7    _all := length (_stat); ]]></line>
 <line no="000242" ctr="000034"><![CDATA[9    if ((_idx < 1) or (_idx > _all - 1)) ]]></line>
 <line no="000247" ctr="000034"><![CDATA[14    if (pop_is_deleted (_idx, _stat)) ]]></line>
 <line no="000253" ctr="000034"><![CDATA[20    return 1; ]]></line>
 <caller name="DB.DBA.POP_DELE" ct="000011" />
 <caller name="DB.DBA.POP_RETR" ct="000023" />
</proc>
```

The comment `--src xxxx:yyy` indicates the file xxx and line yyy. This
comment will be added at the end line of each procedure when loading a
file via isql or when generating SQL procedure constants for C code from
sql files. These files and lines will be used for annotating the
coverage report.

The function `cov_load()` is used to cumulatively load a test coverage
file into a running system. Repeatedly calling this allows making a
union of multiple separately obtained coverage files which will all show
in the ultimate report.

The function
`cov_store (in out_file varchar, in add_comments integer := 0) ` is used
to make an XML file for further XSL-T processing with `cov_report()`
(see below) or to make a snapshot of current coverage statistics. The
add_comments parameter is used to add a line info and count, usually it
takes 1 for making the report, so internally it is used with
add_comments equal to 0 to store the cumulative report in the
TestCoverage file.

The function `cov_report (in file varchar, in outdir varchar)` makes the
full coverage report based on the current state and writes it out.

The report consists of a summary file called profile.prof, containing
execution counts and times for individual functions, sorted by self time
as well as by time including called functions. For each distinct file
mentioned in loaded procedures there is a file called
\<outdir\>/\<orgname\>.sql.cov under the server's working directory.
This file contains listings of all procedures from the file, annotated
with line numbers at the start of each line. Each line with executable
code will have an execution count. The line number field has six leading
characters, the exec count is the next six characters, the line follows.
The lines that are not executed are denoted with \## on place of exec
count number.

Procedures that do not have source info associated are listed in name
order in the file unnamed.sql.cov in the same directory.

An example of files generated by cov_report ('ccc.xml', 'cov/') are:

``` programlisting
---->

>> begin <<<----
Lines: 806
TotalLines: 2741
Coverage: 29 %

[times called] [proc name]
    6250 : WS.WS.FINDPARAM
    --- code info
    [line in file] : [how many times executed] : [offset from beginning] [line excerpt]
       664 :   6250 : 5    if (pkey is null)
       665 :     ## : 6      pkey := '';
       666 :  12500 : 7    i := 0; l := length (params);
       667 :   6250 : 8    pkey := rtrim (pkey,': ');
       668 :   6250 : 9    while (i < l)
       670 :  35966 : 11        ret := http_request_header (vector (para
       671 :  35966 : 12        if (ret is not null)
       672 :   3014 : 13          return ret;
       673 :  32952 : 14        i := i + 1;
       675 :   3236 : 16    return '';

    -- caller information
    [time called] [from proc]
         6 : WS.WS.MOVE
         9 : WS.WS.COPY
       267 : WS.WS.UNLOCK
       269 : WS.WS.GET
       982 : WS.WS.PUT
      1028 : WS.WS.LOCK
      3689 : WS.WS.ISLOCKED
..... more sections follow .....
```

</div>

</div>
