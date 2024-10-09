<div>

<div>

</div>

<div>

## Name

trace_status — show current trace settings

</div>

<div>

## Synopsis

<div>

|                               |      |
|-------------------------------|------|
| `void `**`trace_status`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

You must have DBA privileges to run that function.

This function returns an array of all available trace options and
current status of the traces.

</div>

<div>

## Examples

<div>

**Example 24.423. Example**

<div>

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

<div>

## See Also

<a href="fn_trace_on.html" class="link" title="trace_on"><code
class="function">trace_on() </code></a>

<a href="fn_trace_off.html" class="link" title="trace_off"><code
class="function">trace_off() </code></a>

</div>

</div>
