<div id="fn_rdf_now_impl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

rdf_now_impl — returns the current transaction timestamp

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_now_impl" class="funcsynopsis">

|                           |      |
|---------------------------|------|
| ` `**`rdf_now_impl`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_now_impl" class="refsect1">

## Description

This function returns the timestamp associated with current transaction
as a <span class="type">DATETIME </span> . The function name refer to
one function ( alias of
<a href="fn_now.html" class="link" title="now"><code
class="function">now()</code></a> ) that returns the timestamp of
current transaction. It is the datetime of the beginning of current
transaction with the fractional part of seconds replaced with serial
number of a transaction within the second. If `TimezonelessDatetimes=0`
then the time has local timezone offset (as it was set at the time of
last server start); otherwise it is timezoneless.

</div>

<div id="params_rdf_now_impl" class="refsect1">

## Parameters

<div id="id83546" class="refsect2">

### 

None

</div>

</div>

<div id="examples_rdf_now_impl" class="refsect1">

## Examples

<div id="ex_rdf_now_impl" class="example">

**Example 24.61. Simple example**

<div class="example-contents">

Get a timestamp in human-readable form:

``` screen
SQL> select rdf_now_impl();
DATETIME
2015-05-04 08:28:18.228407
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_rdf_now_impl" class="refsect1">

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

<a href="fn_current_timestamp.html" class="link"
title="current_timestamp"><code
class="function">current_timestamp </code></a>

<a href="fn_curdatetime.html" class="link" title="curdatetime"><code
class="function">curdatetime </code></a>

<a href="fn_curdatetimeoffset.html" class="link"
title="curdatetimeoffset"><code
class="function">curdatetimeoffset </code></a>

<a href="fn_curutcdatetime.html" class="link"
title="curutcdatetime"><code class="function">curutcdatetime </code></a>

<a href="fn_sysutcdatetime.html" class="link"
title="sysutcdatetime"><code class="function">sysutcdatetime </code></a>

<a href="fn_stringdate.html" class="link" title="stringdate"><code
class="function">stringdate </code></a>

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring </code></a>

</div>

</div>
