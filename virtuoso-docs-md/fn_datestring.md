<div id="fn_datestring" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

`datestring ` , `datestring_gmt ` — convert a datetime from internal to
external date-time representation

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_datestring" class="funcsynopsis">

|                         |                          |
|-------------------------|--------------------------|
| ` `**`datestring`**` (` | in `date ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_datestring_gmt" class="funcsynopsis">

|                             |                          |
|-----------------------------|--------------------------|
| ` `**`datestring_gmt`**` (` | in `date ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_datestring" class="refsect1">

## Description

`datestring ` and datestring_gmt convert
<span class="type">timestamps</span> or
<span class="type">datetimes</span> from internal to external date-time
representation. The external representation is a human-readable ASCII
string of up to 30 characters.

The external format is: `YYYY-MM-DD hh:mm:ss uuuuuu` where `uuuuuu`
represents microseconds.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                |
|:----------------------------:|:---------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                          |
|                              | Using `cast (dt as varchar)` is preferred over `datestring ` . |

</div>

</div>

<div id="params_datestring" class="refsect1">

## Parameters

<div id="id84294" class="refsect2">

### date

A <span class="type">datetime </span> value.

</div>

</div>

<div id="ret_datestring" class="refsect1">

## Return values

`datestring ` and `datestring_GMT ` return a
<span class="type">varchar</span> .

</div>

<div id="examples_datestring" class="refsect1">

## Examples

<div id="ex_datestring_1" class="example">

**Example 24.73. Simple Example**

<div class="example-contents">

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

  

<div id="ex_datestring_2" class="example">

**Example 24.74. A table query example**

<div class="example-contents">

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

<div id="seealso_datestring" class="refsect1">

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
