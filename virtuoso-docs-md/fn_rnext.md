<div>

<div>

</div>

<div>

## Name

rnext — Get next result from a remote result set

</div>

<div>

## Synopsis

<div>

|                                   |                               |
|-----------------------------------|-------------------------------|
| `integer retcode `**`rnext`**` (` | in `cursor_handle ` long ,    |
|                                   | out `row_array ` vector ,     |
|                                   | out `sql_state ` varchar ,    |
|                                   | out `sql_error ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Use `rnext ` in combination with
<a href="fn_rmoreresults.html" class="link" title="rmoreresults"><code
class="function">rmoreresults</code></a> to iterate over a result set
produced by a statement run in a remote data source with
<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a> .

|                                                                                                       |
|-------------------------------------------------------------------------------------------------------|
| open a cursor with <a href="fn_rexecute.html" class="link" title="rexecute">rexecute</a> .            |
| loop over the results with rnext                                                                      |
| if rmoreresults does not return an error or SQL_NO_DATA_FOUND continue the loop with rnext, otherwise |
| close the cursor with rclose                                                                          |

</div>

<div>

## Parameters

<div>

### cursor_handle

The <span class="type">long </span> cursor handle as obtained from
rexecute.

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

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a> ,
<a href="fn_rmoreresults.html" class="link" title="rmoreresults"><code
class="function">rmoreresults</code></a> ,
<a href="fn_rclose.html" class="link" title="rclose"><code
class="function">rclose</code></a> .

</div>

</div>
