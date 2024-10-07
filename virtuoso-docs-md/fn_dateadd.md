<div id="fn_dateadd" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dateadd — arithmetic add to a date

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dateadd" class="funcsynopsis">

|                      |                          |
|----------------------|--------------------------|
| ` `**`dateadd`**` (` | in `unit ` string ,      |
|                      | in `number ` integer ,   |
|                      | in `date ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dateadd" class="refsect1">

## Description

dateadd adds a positive or negative quantity of units to a date (in the
internal date time format), and returns a new date so formed. The unit
is specified as a string and can be one of the following: 'second',
'minute', 'hour', 'day', 'month', or 'year'. Use datestring to convert
the result to a human-readable string.

</div>

<div id="params_dateadd" class="refsect1">

## Parameters

<div id="id84149" class="refsect2">

### unit

String value denoting the unit to use in the addition.

</div>

<div id="id84152" class="refsect2">

### number

Integer number of *`unit `* units to be added.

</div>

<div id="id84156" class="refsect2">

### date

Datetime value to which the *`number `* of *`unit `* s is to be added

</div>

</div>

<div id="examples_dateadd" class="refsect1">

## Examples

<div id="ex_dateadd" class="example">

**Example 24.70. Simple date addition**

<div class="example-contents">

Add 10 days to 1996.10.10.

``` screen
SQL> select dateadd ('day', 10, stringdate ('1996.10.10'));
callret
BINARY
_______________________________________________________________________________

1996-10-20 01:00:00

1 Rows. -- 92 msec.
```

</div>

</div>

  

</div>

<div id="seealso_dateadd" class="refsect1">

## See Also

<a href="fn_datediff.html" class="link" title="datediff">datediff</a> ,
<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,">datestring</a> ,
<a href="fn_stringdate.html" class="link"
title="stringdate">stringdate</a>

</div>

</div>
