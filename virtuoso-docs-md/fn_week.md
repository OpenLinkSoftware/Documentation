<div id="fn_week" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

week — get number of week from a datetime

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_week_01" class="funcsynopsis">

|                   |                        |
|-------------------|------------------------|
| ` `**`week`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_week" class="refsect1">

## Description

`week ` takes a <span class="type">datetime </span> and returns an
<span class="type">integer </span> containing a number representing the
week of year of the datetime.

</div>

<div id="params_week" class="refsect1">

## Parameters

<div id="id119215" class="refsect2">

### dt

A <span class="type">datetime </span> .

</div>

</div>

<div id="ret_week" class="refsect1">

## Return Values

An <span class="type">INTEGER </span> containing number of the week of
year.

</div>

<div id="examples_week" class="refsect1">

## Examples

<div id="ex_week" class="example">

**Example 24.450. Simple example**

<div class="example-contents">

Get current week of year.

``` screen
SQL> select week (now ());
callret
INTEGER
_______________________________________________________________________________

42
```

</div>

</div>

  

</div>

<div id="seealso_36" class="refsect1">

## See Also

<a href="fn_dayname.html" class="link" title="dayname"><code
class="function">dayname </code></a> ,
<a href="fn_monthname.html" class="link" title="monthname"><code
class="function">monthname</code></a> ,
<a href="fn_dayofmonth.html" class="link" title="dayofmonth"><code
class="function">dayofmonth</code></a> ,
<a href="fn_dayofweek.html" class="link" title="dayofweek"><code
class="function">dayofweek</code></a> ,
<a href="fn_dayofyear.html" class="link" title="dayofyear"><code
class="function">dayofyear</code></a> ,
<a href="fn_quarter.html" class="link" title="quarter"><code
class="function">quarter</code></a> ,
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
