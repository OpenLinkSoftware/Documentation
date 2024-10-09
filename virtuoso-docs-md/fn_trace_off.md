<div>

<div>

</div>

<div>

## Name

trace_off — Disable extra logging for Virtuoso server

</div>

<div>

## Synopsis

<div>

|                               |                              |
|-------------------------------|------------------------------|
| `integer `**`trace_off`**` (` | in `parameter ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

You must have DBA privileges to run that function.

This function is used to disable logging of various information enabled
by default with the TraceOn ini file option or with the trace_on()
function.

</div>

<div>

## Return Types

Upon success zero will be returned, otherwise an error is.

</div>

<div>

## Errors

<div>

**Table 24.82. Errors signalled by `trace_off `**

<div>

| SQLState                              | Error Code                            | Error Text                                                             |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------|
| <span class="errorcode">22005 </span> | <span class="errorcode">SR323 </span> | <span class="errortext">"option" is not valid trace_off option </span> |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.421. Simple example**

<div>

To show users logs to the server and failed user logs

``` screen
 SQL> trace_off ('user_log', 'failed_log');

 Done. -- 0 msec.
 SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_trace_on.html" class="link" title="trace_on"><code
class="function">trace_on() </code></a>

<a href="fn_trace_status.html" class="link" title="trace_status"><code
class="function">trace_status() </code></a>

</div>

</div>
