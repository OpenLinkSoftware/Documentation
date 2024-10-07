<div id="fn_datestring_gmt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

datestring_GMT — convert a timestamp to external format string in GMT

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_datestring_gmt_01" class="funcsynopsis">

|                             |                        |
|-----------------------------|------------------------|
| ` `**`datestring_GMT`**` (` | in `dt ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_datestring_gmt" class="refsect1">

## Description

Converts the local datetime to GMT and returns its external
representation as a string.

</div>

<div id="params_datestring_gmt" class="refsect1">

## Parameters

<div id="id84344" class="refsect2">

### dt

A <span class="type">datetime </span> value.

</div>

</div>

<div id="ret_datestring_gmt" class="refsect1">

## Return values

A <span class="type">VARCHAR </span> containing the external
representation.

</div>

<div id="examples_datestring_gmt" class="refsect1">

## Examples

<div id="ex_datestring_gmt" class="example">

**Example 24.75. Example with datestring_GMT**

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
```

</div>

</div>

  

</div>

<div id="seealso_datestring_gmt" class="refsect1">

## See Also

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring </code></a> ,
<a href="fn_stringdate.html" class="link" title="stringdate"><code
class="function">stringdate</code></a>

The discussion of <a href="ch-concepts.html#dttimestamp" class="link"
title="TIMESTAMP; DATE &amp; TIME"><span
class="type">TIMESTAMP</span></a> datatype in section
<a href="ch-concepts.html#coredbengine" class="link"
title="5.1. Core Database Engine">Database Concepts</a> of the
documentation.

</div>

</div>
