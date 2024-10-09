<div>

<div>

</div>

<div>

## Name

power — return value of expression raised to specified power.

</div>

<div>

## Synopsis

<div>

|                    |                               |
|--------------------|-------------------------------|
| ` `**`power`**` (` | in `x ` double precision ,    |
|                    | in `y ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`power ` raises x to the yth power and returns the value as a IEEE
64-bit float.

</div>

<div>

## Parameters

<div>

### x

<span class="type">double precision </span>

</div>

<div>

### y

<span class="type">double precision </span>

</div>

</div>

<div>

## Return Values

`power ` returns a IEEE 64-bit float.

</div>

<div>

## Examples

<div>

**Example 24.246. Stored Procedure Example**

<div>

Calculate squares of integers between 2 numbers.

``` screen
SQL> create procedure
calc_pow2s (in _from integer, in _to integer)
{
  declare i integer;
  declare result double precision;

  result_names (i, result);

  i := _from;
  while (i < _to)
   {
     result (i, power (i, 2));
     i := i + 1;
   }
}
;
Done. -- 5 msec.
SQL> calc_pow2s (1, 10);
i                 result
INTEGER NOT NULL  DOUBLE PRECISION NOT NULL
_______________________________________________________________________________

1                                  1.000000
2                                  4.000000
3                                  9.000000
4                                 16.000000
5                                 25.000000
6                                 36.000000
7                                 49.000000
8                                 64.000000
9                                 81.000000

9 Rows. -- 7 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_log.html" class="link" title="log"><code
class="function">log </code></a>

</div>

</div>
