<div id="fn_current_timestamp" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

current_timestamp — returns the current transaction timestamp

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_current_timestamp" class="funcsynopsis">

|                                |      |
|--------------------------------|------|
| ` `**`current_timestamp`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_current_timestamp" class="refsect1">

## Description

Now returns the timestamp associated with current transaction as a
<span class="type">DATETIME </span> .

The function name refer to one function ( alias of
<a href="fn_now.html" class="link" title="now"><code
class="function">now() </code></a> ) that returns the timestamp of
current transaction. It is the datetime of the beginning of current
transaction with the fractional part of seconds replaced with serial
number of a transaction within the second. If `TimezonelessDatetimes=0`
then the time has local timezone offset (as it was set at the time of
last server start); otherwise it is timezoneless.

</div>

<div id="params_current_timestamp" class="refsect1">

## Parameters

`current_timestamp ` has no parameters.

</div>

<div id="ret_current_timestamp" class="refsect1">

## Return Types

A <span class="type">DATETIME </span> timestamp.

</div>

<div id="errors_current_timestamp" class="refsect1">

## Errors

`current_timestamp ` does not return errors.

</div>

<div id="examples_current_timestamp" class="refsect1">

## Examples

<div id="ex_current_timestamp" class="example">

**Example 24.62. Simple example**

<div class="example-contents">

``` screen
SQL>select current_timestamp ;
DATETIME
 2015-05-05 03:36:41.225581
```

</div>

</div>

  

</div>

<div id="seealso_current_timestamp" class="refsect1">

## See Also

<a href="fn_now.html" class="link" title="now"><code
class="function">now </code></a>

<a href="fn_timezone.html" class="link" title="timezone"><code
class="function">timezone </code></a>

<a href="fn_forget_timezone.html" class="link"
title="forget_timezone"><code
class="function">forget_timezone </code></a>

<a href="fn_is_timezoneless.html" class="link"
title="is_timezoneless"><code
class="function">is_timezoneless </code></a>

<a href="fn_adjust_timezone.html" class="link"
title="adjust_timezone"><code
class="function">adjust_timezone </code></a>

<a href="fn_rdf_now_impl.html" class="link" title="rdf_now_impl"><code
class="function">rdf_now_impl </code></a>

<a href="fn_curdatetime.html" class="link" title="curdatetime"><code
class="function">curdatetime </code></a>

<a href="fn_curdatetimeoffset.html" class="link"
title="curdatetimeoffset"><code
class="function">curdatetimeoffset </code></a>

<a href="fn_curutcdatetime.html" class="link"
title="curutcdatetime"><code class="function">curutcdatetime </code></a>

<a href="fn_sysutcdatetime.html" class="link"
title="sysutcdatetime"><code class="function">sysutcdatetime </code></a>

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring() </code></a>

<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">casting</a>

<a href="fn_curdate.html" class="link" title="curdate"><code
class="function">curdate() </code> , <code
class="function">curdatetime() </code> , <code
class="function">curtime() </code></a>

</div>

</div>
