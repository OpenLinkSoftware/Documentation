<div id="fn_monthname" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

monthname — get name of month from a datetime

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_monthname_01" class="funcsynopsis">

|                        |                        |
|------------------------|------------------------|
| ` `**`monthname`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_monthname" class="refsect1">

## Description

`monthname ` takes a <span class="type">datetime </span> and returns a
<span class="type">string </span> containing name of the month
represented by the datetime

</div>

<div id="params_monthname" class="refsect1">

## Parameters

<div id="id96787" class="refsect2">

### dt

A <span class="type">datetime </span> .

</div>

</div>

<div id="ret_monthname" class="refsect1">

## Return Values

A <span class="type">VARCHAR </span> containing name of the month.

</div>

<div id="examples_monthname" class="refsect1">

## Examples

<div id="ex_monthname" class="example">

**Example 24.221. Simple example**

<div class="example-contents">

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

<div id="seealso_monthname" class="refsect1">

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
