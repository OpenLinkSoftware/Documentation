<div id="fn_stringdate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

stringdate — Convert a string to a datetime

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_stringdate" class="funcsynopsis">

|                         |                        |
|-------------------------|------------------------|
| ` `**`stringdate`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_stringdate" class="refsect1">

## Description

stringdate converts dates and timestamps from text to the internal
<span class="type">DATETIME</span> type.

The external format is: YYYY.MM.DD hh:mm.ss uuuuuu where uuuuuu
represents number of microseconds.

If trailing parts are omitted from the string given to stringdate, they
are assumed to be zero. The three first parts are mandatory. Note that
use of

``` programlisting
cast (x as datetime)
```

is preferred over this function.

</div>

<div id="params_stringdate" class="refsect1">

## Parameters

<div id="id112242" class="refsect2">

### str

A <span class="type">varchar </span> date in human-readable (external)
format.

</div>

</div>

<div id="errors_stringdate" class="refsect1">

## Errors

<div id="id112248" class="table">

**Table 24.81. Errors signalled by `datestring ` and `stringdate `**

<div class="table-contents">

|                                       |                                       |                                                                                 |             |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------|-------------|
| SQLState                              | Error Code                            | Error Text                                                                      | Description |
| <span class="errorcode">22007 </span> | <span class="errorcode">DT006 </span> | <span class="errortext">Cannot convert \<offending string\> to datetime </span> |             |
| <span class="errorcode">22002 </span> | <span class="errorcode">DT007 </span> | <span class="errortext">Nulls not allowed as parameters to stringdate </span>   |             |

</div>

</div>

  

</div>

<div id="examples_04_01" class="refsect1">

## Examples

<div id="ex_stringdate_1" class="example">

**Example 24.406. Stringdate example with datestring_GMT**

<div class="example-contents">

We are at central european time zone CET(GMT+1).

``` screen
SQL> use Demo;

 Done. -- 3 msec.
 SQL> select (datestring_GMT (stringdate ('2000-01-01 22:00')));
 callret
 VARCHAR
 _______________________________________________________________________________

 2000-01-01 21:00:00.000000

 1 Rows. -- 45 msec.
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

<div id="seealso_stringdate" class="refsect1">

## See Also

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring </code></a>

The discussion of <a href="ch-concepts.html#dttimestamp" class="link"
title="TIMESTAMP; DATE &amp; TIME"><span
class="type">TIMESTAMP</span></a> datatype in section
<a href="ch-concepts.html#coredbengine" class="link"
title="5.1. Core Database Engine">Database Concepts</a> of the
documentation.

</div>

</div>
