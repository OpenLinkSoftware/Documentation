<div>

<div>

</div>

<div>

## Name

dayofweek — get day of week from a datetime

</div>

<div>

## Synopsis

<div>

|                        |                        |
|------------------------|------------------------|
| ` `**`dayofweek`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`dayofweek ` takes a <span class="type">datetime </span> and returns an
<span class="type">integer </span> containing a number representing the
day of week of the datetime.

</div>

<div>

## Parameters

<div>

### dt

A <span class="type">datetime </span> .

</div>

</div>

<div>

## Return Values

An <span class="type">INTEGER </span> containing number of the day of
week.

</div>

<div>

## Examples

<div>

**Example 24.84. Simple example**

<div>

Get current day of week.

``` screen
SQL> select dayofweek(now());
callret
INTEGER
_______________________________________________________________________________

6
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dayname.html" class="link" title="dayname"><code
class="function">dayname </code></a> ,
<a href="fn_monthname.html" class="link" title="monthname"><code
class="function">monthname</code></a> ,
<a href="fn_dayofmonth.html" class="link" title="dayofmonth"><code
class="function">dayofmonth</code></a> ,
<a href="fn_dayofyear.html" class="link" title="dayofyear"><code
class="function">dayofyear</code></a> ,
<a href="fn_quarter.html" class="link" title="quarter"><code
class="function">quarter</code></a> ,
<a href="fn_week.html" class="link" title="week"><code
class="function">week</code></a> ,
<a href="fn_month.html" class="link" title="month"><code
class="function">month</code></a> , `year` ,
<a href="fn_hour.html" class="link" title="hour"><code
class="function">hour</code></a> ,
<a href="fn_minute.html" class="link" title="minute"><code
class="function">minute</code></a> ,
<a href="fn_second.html" class="link" title="second"><code
class="function">second</code></a> ,
<a href="fn_timezone.html" class="link" title="timezone"><code
class="function">timezone</code></a>

</div>

</div>
