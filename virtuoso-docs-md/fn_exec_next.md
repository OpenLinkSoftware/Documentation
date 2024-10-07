<div id="fn_exec_next" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

exec_next — Get next result from a result set

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_exec_next" class="funcsynopsis">

|                                       |                              |
|---------------------------------------|------------------------------|
| `integer retcode `**`exec_next`**` (` | in `cursor_handle ` long ,   |
|                                       | out `sql_state ` varchar ,   |
|                                       | out `sql_error ` varchar ,   |
|                                       | out `row_array ` vector `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_exec_next" class="refsect1">

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

<div id="params_rnext" class="refsect1">

## Parameters

<div id="id87955" class="refsect2">

### cursor_handle

The <span class="type">long </span> cursor handle as obtained from
exec().

</div>

<div id="id87959" class="refsect2">

### row_array

An output <span class="type">vector </span> that will contain the result
columns.

</div>

<div id="id87963" class="refsect2">

### sql_state

Optional <span class="type">varchar </span> output parameter for SQL
state.

</div>

<div id="id87967" class="refsect2">

### sql_error

Optional <span class="type">varchar </span> output parameter for any
error message.

</div>

</div>

<div id="ret_exec_next" class="refsect1">

## Return Values

All data is returned in output parameters.

</div>

<div id="seealso_exec_next" class="refsect1">

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a> ,
<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close()</code></a> .

</div>

</div>
