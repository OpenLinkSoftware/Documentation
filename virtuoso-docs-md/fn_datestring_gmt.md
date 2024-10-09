<div>

<div>

</div>

<div>

## Name

datestring_GMT — convert a timestamp to external format string in GMT

</div>

<div>

## Synopsis

<div>

|                             |                        |
|-----------------------------|------------------------|
| ` `**`datestring_GMT`**` (` | in `dt ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Converts the local datetime to GMT and returns its external
representation as a string.

</div>

<div>

## Parameters

<div>

### dt

A <span class="type">datetime </span> value.

</div>

</div>

<div>

## Return values

A <span class="type">VARCHAR </span> containing the external
representation.

</div>

<div>

## Examples

<div>

**Example 24.75. Example with datestring_GMT**

<div>

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

<div>

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
