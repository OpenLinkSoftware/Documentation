<div id="fn_datediff" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

datediff — get difference of 2 dates

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_datediff" class="funcsynopsis">

|                       |                           |
|-----------------------|---------------------------|
| ` `**`datediff`**` (` | in `unit ` string ,       |
|                       | in `date1 ` datetime ,    |
|                       | in `date2 ` datetime `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_datediff" class="refsect1">

## Description

datediff subtracts date1 from date2 and returns the difference as an
integer in the specified units.

</div>

<div id="params_datediff" class="refsect1">

## Parameters

<div id="id84196" class="refsect2">

### unit

The resulting unit name as a string. May be 'millisecond', 'second',
'minute', 'hour', 'day', 'month', or 'year'

</div>

<div id="id84199" class="refsect2">

### date1

The <span class="type">datetime </span> value that will be subtracted
from *`date2 `*

</div>

<div id="id84204" class="refsect2">

### date2

The <span class="type">datetime </span> value *`date1 `* is subtracted
from

</div>

</div>

<div id="ret_datediff" class="refsect1">

## Return Values

Difference of *`date1 `* and *`date2 `* as an <span class="type">integer
</span> .

</div>

<div id="errors_datediff" class="refsect1">

## Errors

<div id="id84217" class="table">

**Table 24.17. Errors signalled by `datediff `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                      | Description                                           |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">DT002 </span> | <span class="errortext">Bad unit in datediff: \>offending unit string\< </span> | The unit given was not one of the units listed above. |

</div>

</div>

  

</div>

<div id="examples_datediff" class="refsect1">

## Examples

<div id="ex_datediff" class="example">

**Example 24.71. A simple example**

<div class="example-contents">

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

  

<div id="ex_datediff_2" class="example">

**Example 24.72. Demo DB example**

<div class="example-contents">

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

<div id="seealso_datediff" class="refsect1">

## See Also

<a href="fn_dateadd.html" class="link" title="dateadd"><code
class="function">dateadd </code></a> ,
<a href="fn_datestring.html" class="link"
title="datestring , datestring_gmt ,"><code
class="function">datestring</code></a>

</div>

</div>
