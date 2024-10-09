<div>

<div>

</div>

<div>

## Name

sqrt — calculate square root

</div>

<div>

## Synopsis

<div>

|                   |                               |
|-------------------|-------------------------------|
| ` `**`sqrt`**` (` | in `x ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`sqrt ` calculates the square root of its argument and returns it as a
IEEE 64-bit float.

</div>

<div>

## Parameters

<div>

### x

<span class="type">double precision </span>

</div>

</div>

<div>

## Return Values

`sqrt ` returns a IEEE 64-bit float.

</div>

<div>

## Examples

<div>

**Example 24.402. Stored Procedure Example**

<div>

Calculate square roots of integers between 2 numbers.

``` screen
SQL> create procedure
calc_sqrts (in _from integer, in _to integer)
{
  declare i integer;
  declare result double precision;

  result_names (i, result);

  i := _from;
  while (i < _to)
   {
     result (i, sqrt (i));
     i := i + 1;
   }
}
;
(0) (0) (1) (1) (1) (1) (1) (1) (1) (1) (2) (2) (2) (1)
Done. -- 7 msec.
SQL> calc_sqrts(1, 10);
i                 result
INTEGER NOT NULL  DOUBLE PRECISION NOT NULL
_______________________________________________________________________________

1                                  1.000000
2                                  1.414214
3                                  1.732051
4                                  2.000000
5                                  2.236068
6                                  2.449490
7                                  2.645751
8                                  2.828427
9                                  3.000000

9 Rows. -- 3 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_exp.html" class="link" title="exp"><code
class="function">exp </code></a> ,
<a href="fn_log.html" class="link" title="log"><code
class="function">sqrt</code></a> ,
<a href="fn_log10.html" class="link" title="log10"><code
class="function">log10</code></a> ,
<a href="fn_power.html" class="link" title="power"><code
class="function">power</code></a>

</div>

</div>
