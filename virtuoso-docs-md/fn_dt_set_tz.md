<div>

<div>

</div>

<div>

## Name

dt_set_tz — modifies the timezone component of a datetime

</div>

<div>

## Synopsis

<div>

|                        |                       |
|------------------------|-----------------------|
| ` `**`dt_set_tz`**` (` | in `dt ` datetime ,   |
|                        | in `tz ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This modifies the timezone component of a datetime. The value remains
equal for purposes of comparison but will look different when converted
to a string. The timezone component is an offset from UTC in minutes. It
can be retrieved with the timezone function.

Timezoneless: The function returns its first argument with unchanged GMT
value but new timezone offset. Unlike
<a href="fn_adjust_timezone.html" class="link"
title="adjust_timezone"><code
class="function">adjust_timezone()</code></a> , if the argument is
timezoneless then no error is signaled.

</div>

<div>

## Parameters

<div>

### dt

The original <span class="type">DATETIME </span> .

</div>

<div>

### tz

<span class="type">INTEGER </span> new timezone offset.

</div>

</div>

<div>

## Return Types

A <span class="type">DATETIME </span> with the new timezone set

</div>

</div>
