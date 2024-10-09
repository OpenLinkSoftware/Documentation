<div>

<div>

</div>

<div>

## Name

monthname — get name of month from a datetime

</div>

<div>

## Synopsis

<div>

|                        |                        |
|------------------------|------------------------|
| ` `**`monthname`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`monthname ` takes a <span class="type">datetime </span> and returns a
<span class="type">string </span> containing name of the month
represented by the datetime

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

A <span class="type">VARCHAR </span> containing name of the month.

</div>

<div>

## Examples

<div>

**Example 24.221. Simple example**

<div>

Get name of current month.

``` screen
SQL> select monthname(now());
callret
VARCHAR
_______________________________________________________________________________

October
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dayname.html" class="link" title="dayname"><code
class="function">dayname </code></a> ,
<a href="fn_monthname.html" class="link" title="monthname"><code
class="function">dayofmonth</code></a> ,
<a href="fn_dayofmonth.html" class="link" title="dayofmonth"><code
class="function">dayofmonth</code></a> ,
<a href="fn_dayofweek.html" class="link" title="dayofweek"><code
class="function">dayofweek</code></a> ,
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
