<div>

<div>

<div>

<div>

### 7.2.3. ISQL Macro Substitution

</div>

</div>

</div>

Before executing commands ISQL expands macros in statement text. The
following macros and macro related commands are available:

|                                                  |
|--------------------------------------------------|
| \$LOADEXPR - the current script startup command  |
| \$LINENO - the current line number               |
| \$YYYYMMDD - the current date in the same format |
| \$HHMMSS - the current time in the same format   |

``` programlisting
$IF <cond> <THEN_RESULT> [<ELSE_RESULT>]
```

If the condition evaluates to non-empty and is not the literal 0 the
value of the \$IF is the \<THEN_RESULT\> else the \<ELSE_RESULT\>.

``` programlisting
$(+|-) <arg1> <arg2>
```

result is the addition or substitution of the arg1 and arg2

``` programlisting
$LAST[<n>]
```

an array of the last resultset row

``` programlisting
$ARGV[<n>]
```

an array of the command line arguments

``` programlisting
$U[<name>]
```

prints the user associative array U value for the name \<name\>

``` programlisting
$<ISQL_Variable>
```

returns the value of that variable

``` programlisting
$LT <v1> <v2>
```

returns 1 if the \<v1\> is lower that \<v2\>, empty otherwise

``` programlisting
$GT <v1> <v2>
```

returns 1 if the \<v1\> is greater than \<v2\>, empty otherwise

``` programlisting
$GTE <v1> <v2>
```

returns 1 if the \<v1\> is greater or equal than \<v2\>, empty otherwise

``` programlisting
$LTE <v1> <v2>
```

returns 1 if the \<v1\> is lower or equal than \<v2\>, empty otherwise

``` programlisting
$EQU <v1> <v2>
```

returns 1 if the \<v1\> is equal to \<v2\>, empty otherwise

``` programlisting
$NEQ <v1> <v2>
```

returns 1 if the \<v1\> is not equal to \<v2\>, empty otherwise

<div>

**Example 7.3. Examples:**

<div>

``` programlisting
ECHO $IF $EQU 1 2 "True" "False";
```

prints "False" to the standard output

``` programlisting
EXIT $IF $NEQ 1 2 NOT;
```

never exits

``` programlisting
ECHO $IF $EQU $ARGV[1] 1 "One" $IF $EQU $ARGV[1] "Two" "Unknown;
```

prints the "one" on 1 as arg 1, "two" on 2 as arg 1 otherwise "Unknown"

</div>

</div>

  

</div>
