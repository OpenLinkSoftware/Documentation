<div>

<div>

</div>

<div>

## Name

exec_next — Get next result from a result set

</div>

<div>

## Synopsis

<div>

|                                       |                              |
|---------------------------------------|------------------------------|
| `integer retcode `**`exec_next`**` (` | in `cursor_handle ` long ,   |
|                                       | out `sql_state ` varchar ,   |
|                                       | out `sql_error ` varchar ,   |
|                                       | out `row_array ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Use `exec_next() ` to iterate over a result set produced by a statement
run with <a href="fn_exec.html" class="link" title="exec"><code
class="function">exec </code></a> .

|                                                                                                        |
|--------------------------------------------------------------------------------------------------------|
| open a cursor with <a href="fn_exec.html" class="link" title="exec">exec</a> .                         |
| loop over the results with exec_next                                                                   |
| if exec_next does not return an error or SQL_NO_DATA_FOUND continue the loop with exec_next, otherwise |
| close the cursor with exec_close                                                                       |

</div>

<div>

## Parameters

<div>

### cursor_handle

The <span class="type">long </span> cursor handle as obtained from
exec().

</div>

<div>

### row_array

An output <span class="type">vector </span> that will contain the result
columns.

</div>

<div>

### sql_state

Optional <span class="type">varchar </span> output parameter for SQL
state.

</div>

<div>

### sql_error

Optional <span class="type">varchar </span> output parameter for any
error message.

</div>

</div>

<div>

## Return Values

All data is returned in output parameters.

</div>

<div>

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a> ,
<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close()</code></a> .

</div>

</div>
