<div id="fn_curdatetime" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

curdatetime — returns current datetime with adjusted fractional part of
seconds

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_curdatetime_01" class="funcsynopsis">

|                          |                                          |
|--------------------------|------------------------------------------|
| ` `**`curdatetime`**` (` | in `fraction_microseconds ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_curdatetime" class="refsect1">

## Description

The function returns current datetime, like
<a href="fn_now.html" class="link" title="now"><code
class="function">now() </code></a> , but fractional part of seconds can
be adjusted by providing the number of "microseconds" as the argument.

</div>

<div id="params_curdatetime" class="refsect1">

## Parameters

<div id="id83694" class="refsect2">

### fraction_microseconds

Microseconds.

</div>

</div>

<div id="ret_curdatetime" class="refsect1">

## Return Types

A <span class="type">DATETIME </span> timestamp.

</div>

<div id="errors_curdatetime" class="refsect1">

## Errors

`curdatetime ` does not return errors.

</div>

<div id="examples_curdatetime" class="refsect1">

## Examples

<div id="ex_curdatetime_1" class="example">

**Example 24.63. Get a timestamp**

<div class="example-contents">

Get a timestamp in human-readable form.

``` screen
SQL> select curdatetime();
DATETIME
2015-05-04 09:02:05.242215
No. of rows in result: 1

SQL>select curdatetime(1);
DATETIME
2015-05-04 09:02:47
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_curdatetime" class="refsect1">

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

<a href="fn_current_timestamp.html" class="link"
title="current_timestamp"><code
class="function">current_timestamp </code></a>

<a href="fn_curdatetimeoffset.html" class="link"
title="curdatetimeoffset"><code
class="function">curdatetimeoffset </code></a>

<a href="fn_curutcdatetime.html" class="link"
title="curutcdatetime"><code class="function">curutcdatetime </code></a>

<a href="fn_sysutcdatetime.html" class="link"
title="sysutcdatetime"><code class="function">sysutcdatetime </code></a>

<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">casting</a>

<a href="fn_curdate.html" class="link" title="curdate"><code
class="function">curdate() </code> , <code
class="function">curdatetime() </code> , <code
class="function">curtime() </code></a>

</div>

</div>