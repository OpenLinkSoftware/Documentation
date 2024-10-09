<div>

<div>

</div>

<div>

## Name

sysutcdatetime — returns current datetime in GMT timezone with adjusted
fractional part of seconds

</div>

<div>

## Synopsis

<div>

|                             |                                          |
|-----------------------------|------------------------------------------|
| ` `**`sysutcdatetime`**` (` | in `fraction_microseconds ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns current datetime, like
<a href="fn_now.html" class="link" title="now"><code
class="function">now() </code></a> , but fractional part of seconds can
be adjusted by providing the number of "microseconds" as the argument.

The function is similar to
<a href="fn_curdatetime.html" class="link" title="curdatetime"><code
class="function">curdatetime()</code></a> but the returned datetime is
in GMT timezone.

</div>

<div>

## Parameters

<div>

### fraction_microseconds

Microseconds.

</div>

</div>

<div>

## Return Types

A <span class="type">DATETIME </span> timestamp.

</div>

<div>

## Errors

`sysutcdatetime ` does not return errors.

</div>

<div>

## Examples

<div>

**Example 24.66. Get a timestamp**

<div>

Get a timestamp in human-readable form.

``` screen
SQL> select sysutcdatetime();
DATETIME
2015-05-04 13:11:30.701568
No. of rows in result: 1

SQL>select sysutcdatetime(1);
DATETIME
2015-05-04 13:11:41
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div>

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

<a href="fn_curdatetime.html" class="link" title="curdatetime"><code
class="function">curdatetime </code></a>

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
