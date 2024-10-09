<div>

<div>

</div>

<div>

## Name

datediff — get difference of 2 dates

</div>

<div>

## Synopsis

<div>

|                       |                           |
|-----------------------|---------------------------|
| ` `**`datediff`**` (` | in `unit ` string ,       |
|                       | in `date1 ` datetime ,    |
|                       | in `date2 ` datetime `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

datediff subtracts date1 from date2 and returns the difference as an
integer in the specified units.

</div>

<div>

## Parameters

<div>

### unit

The resulting unit name as a string. May be 'millisecond', 'second',
'minute', 'hour', 'day', 'month', or 'year'

</div>

<div>

### date1

The <span class="type">datetime </span> value that will be subtracted
from *`date2 `*

</div>

<div>

### date2

The <span class="type">datetime </span> value *`date1 `* is subtracted
from

</div>

</div>

<div>

## Return Values

Difference of *`date1 `* and *`date2 `* as an <span class="type">integer
</span> .

</div>

<div>

## Errors

<div>

**Table 24.16. Errors signalled by `datediff `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                      | Description                                           |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">DT002 </span> | <span class="errortext">Bad unit in datediff: \>offending unit string\< </span> | The unit given was not one of the units listed above. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.71. A simple example**

<div>

Get hour difference of 1996.10.10 and 1996.10.11.

``` screen
SQL> SELECT datediff ('hour',  stringdate ('1996.10.10'), stringdate ('1996.10.11'));
callret
INTEGER
_________________________________________________________________________
24

1 Rows. -- 57 msec.
```

</div>

</div>

  

<div>

**Example 24.72. Demo DB example**

<div>

Get average order processing time in days

``` screen
SQL> use "Demo";
SQL> SELECT avg (datediff ('day', "OrderDate", "ShippedDate"))
  as "Avg_Processing_Time" from "Orders" where "ShippedDate" is not null;
Avg_Processing_Time
INTEGER
_________________________________________________________________________
8

1 Rows. -- 11 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dateadd.html" class="link" title="dateadd"><code
class="function">dateadd </code></a> ,
<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring</code></a>

</div>

</div>
