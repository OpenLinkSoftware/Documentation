<div>

<div>

</div>

<div>

## Name

abs — Return the absolute value of a number

</div>

<div>

## Synopsis

<div>

|                  |                    |
|------------------|--------------------|
| ` `**`abs`**` (` | in `num ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`abs ` returns the absolute value of its argument.

</div>

<div>

## Parameters

<div>

### num

<span class="type">Numeric </span> value whose absolute value is to be
returned

</div>

</div>

<div>

## Return Types

Same as parameter type.

</div>

<div>

## Examples

<div>

**Example 24.11. Simple example**

<div>

Get absolute values of several numeric values

``` screen
SQL> select cast (abs (-2.343) as numeric),
  cast(abs (0) as numeric),
  cast (abs (3.1415) as numeric);

callret          callret         callret
DECIMAL          DECIMAL         DECIMAL
_________________________________________

2.343            0               3.1415

1 Rows. -- 5 msec.
      
```

</div>

</div>

  

</div>

</div>
