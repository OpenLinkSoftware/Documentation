<div>

<div>

</div>

<div>

## Name

`datestring ` , `datestring_gmt ` — convert a datetime from internal to
external date-time representation

</div>

<div>

## Synopsis

<div>

|                         |                          |
|-------------------------|--------------------------|
| ` `**`datestring`**` (` | in `date ` datetime `)`; |

<div>

 

</div>

</div>

<div>

|                             |                          |
|-----------------------------|--------------------------|
| ` `**`datestring_gmt`**` (` | in `date ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`datestring ` and datestring_gmt convert
<span class="type">timestamps</span> or
<span class="type">datetimes</span> from internal to external date-time
representation. The external representation is a human-readable ASCII
string of up to 30 characters.

The external format is: `YYYY-MM-DD hh:mm:ss uuuuuu` where `uuuuuu`
represents microseconds.

<div>

|                              |                                                                |
|:----------------------------:|:---------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                          |
|                              | Using `cast (dt as varchar)` is preferred over `datestring ` . |

</div>

</div>

<div>

## Parameters

<div>

### date

A <span class="type">datetime </span> value.

</div>

</div>

<div>

## Return values

`datestring ` and `datestring_GMT ` return a
<span class="type">varchar</span> .

</div>

<div>

## Examples

<div>

**Example 24.73. Simple Example**

<div>

Get current date in human-readable form.

``` screen
 SQL> select datestring(now());
 callret
 VARCHAR
 _______________________________________________________________________________

 2001-03-01 12:49:59.000000

 1 Rows. -- 585 msec.
```

</div>

</div>

  

<div>

**Example 24.74. A table query example**

<div>

Get orders shipped later than July 3, 1996

``` screen
 SQL> select left (datestring(ShippedDate), 10) from Orders
    where ShippedDate > stringdate ('1996.6.3');
 callret
 VARCHAR
 _______________________________________________________________________________

 1996-06-04
 1996-06-04
 1996-06-05
 1996-06-05
 1996-06-05

 5 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_datestring_gmt.html" class="link"
title="datestring_GMT"><code class="function">datestring_gmt </code></a>
, <a href="fn_stringdate.html" class="link" title="stringdate"><code
class="function">stringdate</code></a>

The discussion of <a href="ch-concepts.html#dttimestamp" class="link"
title="TIMESTAMP; DATE &amp; TIME"><span
class="type">TIMESTAMP</span></a> datatype in section
<a href="ch-concepts.html#coredbengine" class="link"
title="5.1. Core Database Engine">Database Concepts</a> of the
documentation.

</div>

</div>
