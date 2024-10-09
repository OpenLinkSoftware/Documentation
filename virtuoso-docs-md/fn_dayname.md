<div>

<div>

</div>

<div>

## Name

dayname , monthname , dayofmonth , dayofweek , dayofyear , quarter ,
week , month , year , hour , minute , second , timezone — decompose a
datetime to its components

</div>

<div>

## Synopsis

<div>

|                      |                        |
|----------------------|------------------------|
| ` `**`dayname`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                        |                        |
|------------------------|------------------------|
| ` `**`monthname`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                         |                        |
|-------------------------|------------------------|
| ` `**`dayofmonth`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                        |                        |
|------------------------|------------------------|
| ` `**`dayofweek`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                        |                        |
|------------------------|------------------------|
| ` `**`dayofyear`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                      |                        |
|----------------------|------------------------|
| ` `**`quarter`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                   |                        |
|-------------------|------------------------|
| ` `**`week`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                    |                        |
|--------------------|------------------------|
| ` `**`month`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                   |                        |
|-------------------|------------------------|
| ` `**`year`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                   |                        |
|-------------------|------------------------|
| ` `**`hour`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                     |                        |
|---------------------|------------------------|
| ` `**`minute`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                     |                        |
|---------------------|------------------------|
| ` `**`second`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                       |                        |
|-----------------------|------------------------|
| ` `**`timezone`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### *`dt `*

A <span class="type">datetime </span> value.

</div>

</div>

<div>

## Return Values

`monthname ` and `dayname ` return a <span class="type">varchar</span> .
The others return an <span class="type">integer </span> .

</div>

<div>

## Examples

<div>

**Example 24.82. Simple example**

<div>

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

<div>

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
