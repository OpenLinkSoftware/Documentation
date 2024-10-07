<div id="fn_dayname" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dayname , monthname , dayofmonth , dayofweek , dayofyear , quarter ,
week , month , year , hour , minute , second , timezone — decompose a
datetime to its components

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dayname" class="funcsynopsis">

|                      |                        |
|----------------------|------------------------|
| ` `**`dayname`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_monthname" class="funcsynopsis">

|                        |                        |
|------------------------|------------------------|
| ` `**`monthname`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dayofmonth" class="funcsynopsis">

|                         |                        |
|-------------------------|------------------------|
| ` `**`dayofmonth`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dayofweek" class="funcsynopsis">

|                        |                        |
|------------------------|------------------------|
| ` `**`dayofweek`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dayofyear" class="funcsynopsis">

|                        |                        |
|------------------------|------------------------|
| ` `**`dayofyear`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_quarter" class="funcsynopsis">

|                      |                        |
|----------------------|------------------------|
| ` `**`quarter`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_week" class="funcsynopsis">

|                   |                        |
|-------------------|------------------------|
| ` `**`week`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_month" class="funcsynopsis">

|                    |                        |
|--------------------|------------------------|
| ` `**`month`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_year" class="funcsynopsis">

|                   |                        |
|-------------------|------------------------|
| ` `**`year`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_hour" class="funcsynopsis">

|                   |                        |
|-------------------|------------------------|
| ` `**`hour`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_minute" class="funcsynopsis">

|                     |                        |
|---------------------|------------------------|
| ` `**`minute`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_second" class="funcsynopsis">

|                     |                        |
|---------------------|------------------------|
| ` `**`second`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_timezone" class="funcsynopsis">

|                       |                        |
|-----------------------|------------------------|
| ` `**`timezone`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dayname" class="refsect1">

## Description

These functions decompose a <span class="type">datetime </span> to its
components. These can be used on <span class="type">timestamps </span> ,
<span class="type">datetimes </span> , <span class="type">dates </span>
and <span class="type">times </span> , all being the same internal data
type.

``` programlisting
:  dayname      name of day
:  monthname    name of month
:  dayofmonth   day of month
:  dayofweek    day of week
:  dayofyear    day since start of year
:  quarter      quarter number,
:  week         week number
:  month        month number, starting at 1 for January
:  year         year
:  hour         hour
:  minute       minute
:  second       second
:  timezone     offset from UTC in minutes
```

</div>

<div id="params_dayname" class="refsect1">

## Parameters

<div id="id85766" class="refsect2">

### *`dt `*

A <span class="type">datetime </span> value.

</div>

</div>

<div id="ret_dayname" class="refsect1">

## Return Values

`monthname ` and `dayname ` return a <span class="type">varchar</span> .
The others return an <span class="type">integer </span> .

</div>

<div id="examples_dayname" class="refsect1">

## Examples

<div id="ex_dayname_1" class="example">

**Example 24.82. Simple example**

<div class="example-contents">

``` screen
SQL> select dayname(stringdate('2001-03-02'));
callret
VARCHAR
_______________________________________________________________________________

Friday

1 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div id="seealso_dayname" class="refsect1">

## See Also

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">stringdate </code> , <code
class="function">datestring</code> , <code
class="function">datestring_GMT</code></a> ,
<a href="ch-concepts.html#dttimestamp" class="link"
title="TIMESTAMP; DATE &amp; TIME">The <span
class="type">TIMESTAMP</span> datatype</a>

</div>

</div>
