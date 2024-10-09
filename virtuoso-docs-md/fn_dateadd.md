<div>

<div>

</div>

<div>

## Name

dateadd — arithmetic add to a date

</div>

<div>

## Synopsis

<div>

|                      |                          |
|----------------------|--------------------------|
| ` `**`dateadd`**` (` | in `unit ` string ,      |
|                      | in `number ` integer ,   |
|                      | in `date ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

dateadd adds a positive or negative quantity of units to a date (in the
internal date time format), and returns a new date so formed. The unit
is specified as a string and can be one of the following: 'second',
'minute', 'hour', 'day', 'month', or 'year'. Use datestring to convert
the result to a human-readable string.

</div>

<div>

## Parameters

<div>

### unit

String value denoting the unit to use in the addition.

</div>

<div>

### number

Integer number of *`unit `* units to be added.

</div>

<div>

### date

Datetime value to which the *`number `* of *`unit `* s is to be added

</div>

</div>

<div>

## Examples

<div>

**Example 24.70. Simple date addition**

<div>

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

<div>

## See Also

<a href="fn_datediff.html" class="link" title="datediff">datediff</a> ,
<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,">datestring</a> ,
<a href="fn_stringdate.html" class="link"
title="stringdate">stringdate</a>

</div>

</div>
