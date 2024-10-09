<div>

<div>

</div>

<div>

## Name

now — returns the current transaction timestamp

</div>

<div>

## Synopsis

<div>

|                  |      |
|------------------|------|
| ` `**`now`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Now returns the timestamp associated with current transaction as a
<span class="type">DATETIME</span> . This value is guaranteed to differ
from the timestamp of any other transaction.

</div>

<div>

## Examples

<div>

**Example 24.227. Get a timestamp**

<div>

Get a timestamp in human-readable form.

``` screen
SQL> select datestring(now()), cast (now() as VARCHAR);
callret                   callret
VARCHAR                   VARCHAR
_______________________________________________________________________________

2001-10-08 16:31:49.000000  2001-10-08 16:31:49.000000

1 Rows. -- 99 msec.
```

</div>

</div>

  

<div>

**Example 24.228. Table example**

<div>

Store update time in a column

``` screen
SQL> update test_table set TIME_CHANGED = now();

Done. -- 37 msec.
SQL> select cast (TIME_CHANGED as VARCHAR) from test_table;
callret
VARCHAR
_______________________________________________________________________________

2001-10-08 16:34:28.000000

1 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div>

## Parameters

`now ` has no parameters.

</div>

<div>

## Return Types

A <span class="type">DATETIME </span> timestamp.

</div>

<div>

## Errors

`now ` does not return errors.

</div>

<div>

## See Also

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring() </code></a> ,
<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">casting</a> ,
<a href="fn_curdate.html" class="link" title="curdate"><code
class="function">curdate()</code> , <code
class="function">curdatetime()</code> , <code
class="function">curtime()</code></a>

</div>

</div>
