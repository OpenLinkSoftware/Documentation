<div id="fn_curdate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

curdate , curtime , curdatetime — get current date and time

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_curdate" class="funcsynopsis">

|                              |      |
|------------------------------|------|
| `datetime `**`curdate`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_curdatetime" class="funcsynopsis">

|                                  |      |
|----------------------------------|------|
| `datetime `**`curdatetime`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_curtime" class="funcsynopsis">

|                          |      |
|--------------------------|------|
| `time `**`curtime`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_curdate" class="refsect1">

## Description

These functions return the current date or time as a date, time or
datetime, respectively. Internally they all return the same value but
data type reported to client differs.

</div>

<div id="params_curdate" class="refsect1">

## Parameters

None.

</div>

<div id="ret_curdate" class="refsect1">

## Return Types

In a result set to client, the column types reported are as follows:
<span class="type">TIME </span> for `curtime ` , <span class="type">DATE
</span> for `curdate ` and <span class="type">DATETIME </span> for
`curdatetime ` .

</div>

<div id="errors_curdate" class="refsect1">

## Errors

These functions do not signal errors.

</div>

<div id="examples_curdate" class="refsect1">

## Examples

<div id="ex_curdate" class="example">

**Example 24.57. Simple example**

<div class="example-contents">

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

<div id="seealso_curdate" class="refsect1">

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
