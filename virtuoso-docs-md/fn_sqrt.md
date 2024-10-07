<div id="fn_sqrt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sqrt — calculate square root

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sqrt" class="funcsynopsis">

|                   |                               |
|-------------------|-------------------------------|
| ` `**`sqrt`**` (` | in `x ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_30" class="refsect1">

## Description

`sqrt ` calculates the square root of its argument and returns it as a
IEEE 64-bit float.

</div>

<div id="params_07" class="refsect1">

## Parameters

<div id="id112044" class="refsect2">

### x

<span class="type">double precision </span>

</div>

</div>

<div id="ret_02_01" class="refsect1">

## Return Values

`sqrt ` returns a IEEE 64-bit float.

</div>

<div id="examples_08" class="refsect1">

## Examples

<div id="ex_sqrt" class="example">

**Example 24.402. Stored Procedure Example**

<div class="example-contents">

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

<div id="seealso_14" class="refsect1">

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
