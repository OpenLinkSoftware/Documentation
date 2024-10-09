<div>

<div>

</div>

<div>

## Name

forget_timezone — returns its first argument as a timezoned value

</div>

<div>

## Synopsis

<div>

|                                      |                                    |
|--------------------------------------|------------------------------------|
| `datetime `**`forget_timezone`**` (` | in `dt ` datetime ,                |
|                                      | in `ignore_timezone ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns its first argument as a timezoned value. If the
first argument is timezoneless then it is returned unchanged. If the
first argument is timezoned and second argument is missing or zero then
the result is timezoneless value that "looks like" local time notation.
If the first argument is timezoned and second argument is nonzero then
the value is first made GMT and then it becomes timezoneless.

</div>

<div>

## Parameters

<div>

### dt

Datetime value.

</div>

<div>

### ignore_timezone

Flag

</div>

</div>

<div>

## Examples

<div>

**Example 24.58. Simple example**

<div>

``` screen
SQL> select cast (forget_timezone (cast ('1999-12-31 11:59+02:00' as datetime)) as varchar);
VARCHAR
'1999-12-31 11:59:00'
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

<a href="fn_stringdate.html" class="link" title="stringdate"><code
class="function">stringdate </code></a>

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring </code></a>

</div>

</div>
