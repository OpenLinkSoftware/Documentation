<div id="fn_adjust_timezone" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

adjust_timezone — returns its first argument with unchanged GMT value
but new timezone offset, as it is specified by the second argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_adjust_timezone" class="funcsynopsis">

|                                      |                                    |
|--------------------------------------|------------------------------------|
| `datetime `**`adjust_timezone`**` (` | in `dt ` datetime ,                |
|                                      | in `tz_offset ` integer ,          |
|                                      | in `ignore_timezone ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_adjust_timezone" class="refsect1">

## Description

The function returns its first argument with unchanged GMT value but new
timezone offset, as it is specified by the second argument. If the first
argument is timezoneless and third argument is missing or zero then
error 22023 is signaled. If the first argument is timezoneless and third
argument is nonzero then no error is signaled and the argument is
handled like it is a GMT value.

</div>

<div id="params_adjust_timezone" class="refsect1">

## Parameters

<div id="id83471" class="refsect2">

### dt

Datetime value.

</div>

<div id="id83474" class="refsect2">

### tz_offset

Timezone offset.

</div>

<div id="id83477" class="refsect2">

### ignore_timezone

Flag.

</div>

</div>

<div id="examples_adjust_timezone" class="refsect1">

## Examples

<div id="ex_adjust_timezone" class="example">

**Example 24.60. Simple example**

<div class="example-contents">

``` screen
SQL> SELECT adjust_timezone(cast('2014-12-31 15:00-12:00' as datetime),0,1) ;
DATETIME
2015-01-01 03:00:00
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_adjust_timezone" class="refsect1">

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

<a href="fn_stringdate.html" class="link" title="stringdate"><code
class="function">stringdate </code></a>

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring </code></a>

</div>

</div>
