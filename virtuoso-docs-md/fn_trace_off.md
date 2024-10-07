<div id="fn_trace_off" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

trace_off — Disable extra logging for Virtuoso server

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_trace_off" class="funcsynopsis">

|                               |                              |
|-------------------------------|------------------------------|
| `integer `**`trace_off`**` (` | in `parameter ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="id113873" class="refsect1">

## Description

You must have DBA privileges to run that function.

This function is used to disable logging of various information enabled
by default with the TraceOn ini file option or with the trace_on()
function.

</div>

<div id="ret_trace_off" class="refsect1">

## Return Types

Upon success zero will be returned, otherwise an error is.

</div>

<div id="errors_trace_off" class="refsect1">

## Errors

<div id="id113882" class="table">

**Table 24.83. Errors signalled by `trace_off `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                             |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------|
| <span class="errorcode">22005 </span> | <span class="errorcode">SR323 </span> | <span class="errortext">"option" is not valid trace_off option </span> |

</div>

</div>

  

</div>

<div id="examples_trace_off" class="refsect1">

## Examples

<div id="ex_trace_off" class="example">

**Example 24.421. Simple example**

<div class="example-contents">

To show users logs to the server and failed user logs

``` screen
 SQL> trace_off ('user_log', 'failed_log');

 Done. -- 0 msec.
 SQL>
```

</div>

</div>

  

</div>

<div id="seealso_trace_off" class="refsect1">

## See Also

<a href="fn_trace_on.html" class="link" title="trace_on"><code
class="function">trace_on() </code></a>

<a href="fn_trace_status.html" class="link" title="trace_status"><code
class="function">trace_status() </code></a>

</div>

</div>
