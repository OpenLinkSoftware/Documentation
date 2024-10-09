<div>

<div>

</div>

<div>

## Name

atof — Convert a string to single precision float

</div>

<div>

## Synopsis

<div>

|                   |                       |
|-------------------|-----------------------|
| ` `**`atof`**` (` | in `arg ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

atof returns its argument as a single precision floating point. If the
string cannot be parsed and converted to a valid float, a value 0.0 is
returned.

</div>

<div>

## Parameters

<div>

### *`arg `*

A string input parameter

</div>

</div>

<div>

## Return Types

Single precision floating point

</div>

<div>

## Examples

<div>

**Example 24.17. Simple examples**

<div>

``` screen
SQL> select atof('1.23456789');
callret
REAL
_______________________________________________________________________________

1.234568

1 Rows. -- 5 msec.

SQL> select atof ('Cadena de los patos amarillos');
callret
REAL
_______________________________________________________________________________

0.000000

1 Rows. -- 4 msec.

SQL> select atof (sprintf ('%f', 2.3423));
callret
REAL
_______________________________________________________________________________

2.342300

1 Rows. -- 5 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

` `<a href="fn_atoi.html" class="link" title="atoi"><code
class="function">atoi</code></a>` `

</div>

</div>
