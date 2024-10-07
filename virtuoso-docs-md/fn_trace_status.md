<div id="fn_trace_status" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

trace_status — show current trace settings

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_trace_status" class="funcsynopsis">

|                               |      |
|-------------------------------|------|
| `void `**`trace_status`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="id114029" class="refsect1">

## Description

You must have DBA privileges to run that function.

This function returns an array of all available trace options and
current status of the traces.

</div>

<div id="examples_trace_status" class="refsect1">

## Examples

<div id="ex_trace_status" class="example">

**Example 24.423. Example**

<div class="example-contents">

This is to show the current state of all trace log options.

``` screen
SQl> create procedure trace_status_show ()
   {
     declare i, l integer;
     declare opt, status varchar;
     declare arr any;
     arr := trace_status();
     i := 0; l := length (arr);
     result_names (opt, status);
     while (i < l)
       {
     result (arr[i], arr[i+1]);
         i := i + 2;
       }
   };

SQL> trace_status_show();
opt                       status
VARCHAR                   VARCHAR
_______________________________________________________________________________

user_log                  off
failed_log                off
compile                   on
ddl_log                   off
client_sql                off
errors                    off
dsn                       off
sql_send                  off
transact                  on
remote_transact           off
exec                      off
soap                      off
```

</div>

</div>

  

</div>

<div id="seealso_trace_status" class="refsect1">

## See Also

<a href="fn_trace_on.html" class="link" title="trace_on"><code
class="function">trace_on() </code></a>

<a href="fn_trace_off.html" class="link" title="trace_off"><code
class="function">trace_off() </code></a>

</div>

</div>
