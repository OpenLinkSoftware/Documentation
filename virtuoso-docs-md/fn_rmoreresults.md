<div>

<div>

</div>

<div>

## Name

rmoreresults — move to next result set of rexecute()

</div>

<div>

## Synopsis

<div>

|                           |                              |
|---------------------------|------------------------------|
| ` `**`rmoreresults`**` (` | in `cursor_handle ` long ,   |
|                           | out `sql_state ` varchar ,   |
|                           | out `sql_error ` varchar ,   |
|                           | out `num_cols ` integer ,    |
|                           | out `stmt_meta ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function moves to the next result set when handling result sets
returned by statement executed with rexecute.

</div>

<div>

## Parameters

<div>

### cursor_handle

The cursor handle obtained from
<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a>

</div>

<div>

### sql_state

Output parameter for returning SQL state.

</div>

<div>

### sql_error

Output parameter for returning an error message.

</div>

<div>

### num_cols

Output parameter for returning number of columns in a result row.

</div>

<div>

### stmt_meta

The metadata <span class="type">vector </span> as described in
documentation for
<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a> .

</div>

</div>

<div>

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a> ,
<a href="fn_rnext.html" class="link" title="rnext"><code
class="function">rnext</code></a> ,
<a href="fn_rclose.html" class="link" title="rclose"><code
class="function">rclose</code></a> .

</div>

</div>
