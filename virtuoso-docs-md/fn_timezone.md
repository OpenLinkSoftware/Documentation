<div id="fn_timezone" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

timezone — get timezone difference from a datetime

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_timezone_01" class="funcsynopsis">

|                       |                                    |
|-----------------------|------------------------------------|
| ` `**`timezone`**` (` | in `dt ` datetime ,                |
|                       | in `ignore_timezone ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_timezone" class="refsect1">

## Description

The function returns timezone offset of its first argument, as an
integer value in minutes. If the first argument is timezoneless and
second argument is missing or zero then the returned value is NULL. If
the first argument is timezoneless and second argument is nonzero then
the returned value is 0.

</div>

<div id="params_timezone" class="refsect1">

## Parameters

<div id="id113782" class="refsect2">

### dt

A <span class="type">datetime </span> .

</div>

<div id="id113786" class="refsect2">

### ignore_timezone

Flag

</div>

</div>

<div id="examples_timezone" class="refsect1">

## Examples

<div id="ex_timezone" class="example">

**Example 24.420. Simple example**

<div class="example-contents">

Get current timezone.

``` screen
SQL> select timezone (now ());
callret
INTEGER
_______________________________________________________________________________

120
```

</div>

</div>

  

</div>

<div id="seealso_timezone" class="refsect1">

## See Also

<a href="fn_now.html" class="link" title="now"><code
class="function">now </code></a>

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

<a href="fn_dayname.html" class="link" title="dayname"><code
class="function">dayname </code></a>

<a href="fn_dayofmonth.html" class="link" title="dayofmonth"><code
class="function">dayofmonth </code></a>

<a href="fn_dayofweek.html" class="link" title="dayofweek"><code
class="function">dayofweek </code></a>

<a href="fn_dayofyear.html" class="link" title="dayofyear"><code
class="function">dayofyear </code></a>

<a href="fn_quarter.html" class="link" title="quarter"><code
class="function">quarter </code></a>

<a href="fn_week.html" class="link" title="week"><code
class="function">week </code></a>

<a href="fn_month.html" class="link" title="month"><code
class="function">month </code></a>

`year `

<a href="fn_hour.html" class="link" title="hour"><code
class="function">hour </code></a>

<a href="fn_minute.html" class="link" title="minute"><code
class="function">minute </code></a>

<a href="fn_second.html" class="link" title="second"><code
class="function">second </code></a>

</div>

</div>
