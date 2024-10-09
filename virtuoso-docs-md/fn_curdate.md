<div>

<div>

</div>

<div>

## Name

curdate , curtime , curdatetime — get current date and time

</div>

<div>

## Synopsis

<div>

|                              |      |
|------------------------------|------|
| `datetime `**`curdate`**` (` | `)`; |

<div>

 

</div>

</div>

<div>

|                                  |      |
|----------------------------------|------|
| `datetime `**`curdatetime`**` (` | `)`; |

<div>

 

</div>

</div>

<div>

|                          |      |
|--------------------------|------|
| `time `**`curtime`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

These functions return the current date or time as a date, time or
datetime, respectively. Internally they all return the same value but
data type reported to client differs.

</div>

<div>

## Parameters

None.

</div>

<div>

## Return Types

In a result set to client, the column types reported are as follows:
<span class="type">TIME </span> for `curtime ` , <span class="type">DATE
</span> for `curdate ` and <span class="type">DATETIME </span> for
`curdatetime ` .

</div>

<div>

## Errors

These functions do not signal errors.

</div>

<div>

## Examples

<div>

**Example 24.57. Simple example**

<div>

Get current date in different datatypes

``` screen
SQL> select curdate(), curtime(), curdatetime();
callret     callret   callret
DATE        TIME      BINARY
_______________________________________________________________________________

2001.10.12  11:21.51  2001-10-12 11:21:51
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_now.html" class="link" title="now"><code
class="function">now </code></a>

<a href="fn_stringdate.html" class="link" title="stringdate"><code
class="function">stringdate </code></a>

<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring </code></a>

</div>

</div>
