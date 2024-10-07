<div id="fn_rmoreresults" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

rmoreresults — move to next result set of rexecute()

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rmoreresults" class="funcsynopsis">

|                           |                              |
|---------------------------|------------------------------|
| ` `**`rmoreresults`**` (` | in `cursor_handle ` long ,   |
|                           | out `sql_state ` varchar ,   |
|                           | out `sql_error ` varchar ,   |
|                           | out `num_cols ` integer ,    |
|                           | out `stmt_meta ` vector `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rmoreresults" class="refsect1">

## Description

This function moves to the next result set when handling result sets
returned by statement executed with rexecute.

</div>

<div id="params_rmoreresults" class="refsect1">

## Parameters

<div id="id108919" class="refsect2">

### cursor_handle

The cursor handle obtained from
<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a>

</div>

<div id="id108924" class="refsect2">

### sql_state

Output parameter for returning SQL state.

</div>

<div id="id108927" class="refsect2">

### sql_error

Output parameter for returning an error message.

</div>

<div id="id108930" class="refsect2">

### num_cols

Output parameter for returning number of columns in a result row.

</div>

<div id="id108933" class="refsect2">

### stmt_meta

The metadata <span class="type">vector </span> as described in
documentation for
<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a> .

</div>

</div>

<div id="seealso_rmoreresults" class="refsect1">

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute </code></a> ,
<a href="fn_rnext.html" class="link" title="rnext"><code
class="function">rnext</code></a> ,
<a href="fn_rclose.html" class="link" title="rclose"><code
class="function">rclose</code></a> .

</div>

</div>
