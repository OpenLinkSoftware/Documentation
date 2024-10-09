<div>

<div>

<div>

<div>

## 11.20. Handling Conditions In Virtuoso/PL Procedures

</div>

</div>

</div>

Condition handlers determine the behavior of a Virtuoso/PL procedure
when a condition occurs. You can declare one or more condition handlers
in your Virtuoso/PL procedure for general SQL conditions or specific
SQLSTATE values.

If a statement in your procedure raises an SQLEXCEPTION condition and
you declared a handler for the specific SQLSTATE or SQLEXCEPTION
condition the server passes control to that handler.

If a statement in your Virtuoso/PL procedure raises an SQLEXCEPTION
condition, and you have not declared a handler for the specific SQLSTATE
or the SQLEXCEPTION condition, the server passes the exception to the
calling procedure (if any). If the procedure call is at the top-level,
then the exception is signalled to the calling client.

Handlers are active only for the duration of the enclosing compound
statement. When an exception is thrown outside the handler's scope then
this handler is never called.

<div>

<div>

<div>

<div>

### 11.20.1. Declaring Condition Handlers

</div>

</div>

</div>

The general form of handler declaration is:

``` programlisting
DECLARE <handler_type> HANDLER FOR
    <condition> [, <condition [...]]
    <sql_procedure_statement>;
```

For compatibility handlers can be declared also as :

``` programlisting
WHENEVER <condition> [GOTO <label>|DEFAULT];
```

When Virtuoso raises a condition that matches the \<condition\>, the
\<sql_procedure_statement\> gets executed and when (and if) it finishes
the execution continues according to the \<handler_type\>.

``` programlisting
<handler_type>
```

<span class="emphasis">*CONTINUE*</span> - Specifies that after
\<sql_procedure_statement\> completes, execution continues with the
statement after the statement which caused the error.

<span class="emphasis">*EXIT*</span> - Specifies that after
\<sql_procedure_statement\> completes, execution continues after the end
of the compound statement that contains the declaration of the handler.

``` programlisting
<condition>
```

<span class="emphasis">*NOT FOUND*</span> - Identifies any condition
that results in SQL STATE = SQL_NO_DATA_FOUND (+100)

<span class="emphasis">*SQLEXCEPTION*</span> - Identifies all character
SQL STATEs excluding ones starting with '01', '02' and '00'

<span class="emphasis">*SQLWARNING*</span> - Identifies character SQL
STATEs starting with '01'. This is a shortcut for SQLSTATE '01\*'

<span class="emphasis">*SQLSTATE \[VALUE\]
'\<sql_state_mask\>'*</span> - Identifies character SQL STATEs. The
\<sql_state_mask\> can be a full 5 character value or 0-4 characters
followed by an '\*'. When a '\*' is present then any SQL STATE signal
led which starts with the same characters as the \<sql_state_mask\>
before the '\*' will cause that handler to execute. For example the
exception with SQL state '42S22' will match all the following

``` programlisting
SQLSTATE <conditions> :
SQLSTATE '*' SQLSTATE '42*'
SQLSTATE '42S22'
```

<div>

|                              |                                                                                          |
|:----------------------------:|:-----------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                    |
|                              | Handler's call priority is determined by the number of matching characters in this mask. |

</div>

``` programlisting
<sql_procedure_statement>
```

This can be any allowed Virtuoso/PL statement as well as an compound
statement. This statement is executed in the same procedure context as
the procedure body itself, so any labels and variables in the procedure
body can be used and RETURN causes the procedure to end. No handler is
active while the \<sql_procedure_statement\> is executed. So any
exception raised is passed directly to the procedure caller. The
\<sql_procedure_statement\> can be empty resulting in the
\<handler_type\> action being taken right after setting the
\_\_SQL_STATE & \_\_SQL_MESSAGE variables.

When multiple active handlers \<condition\>s match the exception being
raised Virtuoso chooses the closest to the statement raised the
exception that has a largest call priority. This means that if an
exception is there are two handlers with condition SQLSTATE '4\*' and
SQLSTATE '42\*' and an exception with SQL STATE '42S22' is raised the
handler with \<condition\> '42\*' will be called.

``` programlisting
WHENEVER <condition> GOTO <label>
```

is an equivalent of:

``` programlisting
DECLARE EXIT HANDLER FOR <condition> GOTO label.
```

``` programlisting
WHENEVER <condition> DEFAULT
```

is equivalent of:

``` programlisting
DECLARE EXIT HANDLER FOR <condition> RESIGNAL;
```

The following examples demonstrate simple common handlers:

<span class="emphasis">*CONTINUE handler:*</span> The handler assigns a
value of 1 to a local variable at_end when a NOT FOUND condition is
raised. The execution then continues with the statement after the
signal.

``` programlisting
create procedure test1 ()
{
  declare at_end integer;

  at_end := 0;
  declare continue handler for NOT FOUND at_end := 1;

  result_names (at_end);

  result (at_end);
  signal (100);
  result (at_end);
}
```

When this procedure gets executed it returns the following result set :

``` screen
0
1
```

<span class="emphasis">*EXIT handler:*</span> The handler assigns a
value of 2 to a local variable at_end when a NOT_FOUND condition is
raised. The execution then continues with the statement after the
compound statement containing the signal.

``` programlisting
create procedure test2 ()
{
  declare at_end integer;

  result_names (at_end);

  at_end := 0;
  declare exit handler for NOT FOUND at_end := 1;

    {
      result (at_end);
      signal (100);
      result (3);
    }
  result (at_end);
}
```

When this procedure gets executed it returns the following result set :

``` screen
0
1
```

``` programlisting
__SQL_STATE and __SQL_MESSAGE variables.
```

All Virtuoso/PL procedure have two variables implicitly declared :

``` programlisting
declare __SQL_STATE any;
declare __SQL_MESSAGE varchar;
```

Initially they are set to 0.

When an exception is raised these variables are set as follows :

``` programlisting
__SQL_STATE gets the SQL STATE (character string or integer 100 for NOT FOUND)
__SQL_MESSAGE gets the SQL MESSAGE (character) or NULL if no message.
```

Their values are preserved until the next exception overwrites them.

``` programlisting
RESIGNAL statement

Syntax :
RESIGNAL [ '<new_sql_state>' ]

RESIGNAL  is a shortcut for    signal (__SQL_STATE, __SQL_MESSAGE)
RESIGNAL '<new_sql_state>' is a shortcut for     signal ('<new_sql_state>', __SQL_MESSAGE);
```

This statement resignals the current exception to the caller of the
procedure.

</div>

</div>
