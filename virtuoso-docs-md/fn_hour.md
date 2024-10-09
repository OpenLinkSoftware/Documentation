<div>

<div>

</div>

<div>

## Name

hour — get hour from a datetime

</div>

<div>

## Synopsis

<div>

|                   |                        |
|-------------------|------------------------|
| ` `**`hour`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`hour ` takes a <span class="type">datetime </span> and returns an
<span class="type">integer </span> containing a number representing the
hour of the datetime.

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

An <span class="type">INTEGER </span> containing the hour.

</div>

<div>

## Examples

<div>

**Example 24.150. Simple example**

<div>

Get current hour.

``` screen
SQL> select hour (now ());
callret
INTEGER
_______________________________________________________________________________

21
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dayname.html" class="link" title="dayname"><code
class="function">dayname </code></a> ,
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
<a href="fn_minute.html" class="link" title="minute"><code
class="function">minute</code></a> ,
<a href="fn_second.html" class="link" title="second"><code
class="function">second</code></a> ,
<a href="fn_timezone.html" class="link" title="timezone"><code
class="function">timezone</code></a>

</div>

</div>
