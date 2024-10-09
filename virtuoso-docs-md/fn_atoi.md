<div>

<div>

</div>

<div>

## Name

atoi — Convert a string to an integer

</div>

<div>

## Synopsis

<div>

|                   |                       |
|-------------------|-----------------------|
| ` `**`atoi`**` (` | in `arg ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

atoi returns its argument as an integer. If the string cannot be parsed
and converted to a valid integer, a value 0 is returned.

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

The string converted to an integer. If the string is a number then the
absolute value of the literal will be returned as an integer. Otherwise
0 is returned.

</div>

<div>

## Examples

<div>

**Example 24.18. Simple examples**

<div>

``` screen
SQL> select atoi('1.23456789');
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 5 msec.

SQL> select atoi ('Cadena de los patos amarillos');
callret
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

` `<a href="fn_atof.html" class="link" title="atof"><code
class="function">atof</code></a>` `

</div>

</div>
