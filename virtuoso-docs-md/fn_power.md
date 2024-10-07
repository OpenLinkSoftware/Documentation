<div id="fn_power" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

power — return value of expression raised to specified power.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_power" class="funcsynopsis">

|                    |                               |
|--------------------|-------------------------------|
| ` `**`power`**` (` | in `x ` double precision ,    |
|                    | in `y ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_power" class="refsect1">

## Description

`power ` raises x to the yth power and returns the value as a IEEE
64-bit float.

</div>

<div id="params_power" class="refsect1">

## Parameters

<div id="id99628" class="refsect2">

### x

<span class="type">double precision </span>

</div>

<div id="id99632" class="refsect2">

### y

<span class="type">double precision </span>

</div>

</div>

<div id="ret_power" class="refsect1">

## Return Values

`power ` returns a IEEE 64-bit float.

</div>

<div id="examples_power" class="refsect1">

## Examples

<div id="ex_power" class="example">

**Example 24.246. Stored Procedure Example**

<div class="example-contents">

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

<div id="seealso_power" class="refsect1">

## See Also

<a href="fn_log.html" class="link" title="log"><code
class="function">log </code></a>

</div>

</div>
