<div id="fn_msec_time" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

msec_time — Get number of milliseconds from system epoch

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_msec_time" class="funcsynopsis">

|                        |          |     |
|------------------------|----------|-----|
| ` `**`msec_time`**` (` | `void)`; |     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_msec_time" class="refsect1">

## Description

`msec_time ` returns the number of milliseconds since system epoch. It
is useful for benchmarking purposes, timing operations, etc.

</div>

<div id="params_msec_time" class="refsect1">

## Parameters

<div id="id96848" class="refsect2">

### No parameters

The function does not take parameters.

</div>

</div>

<div id="ret_msec_time" class="refsect1">

## Return Values

A 32-bit <span class="type">integer </span> no. of milliseconds since
system epoch.

</div>

<div id="examples_msec_time" class="refsect1">

## Examples

<div id="ex_msec_time_1" class="example">

**Example 24.222. Simple example**

<div class="example-contents">

Time a function

``` screen
create procedure
fib (in n integer)
{
  if (n <= 2) return 1;
  return fib (n - 1) + fib (n - 2);
}
;

create procedure
time_fib (in n integer)
{
  declare t,i integer;
  declare msg varchar;

  result_names (msg);

  t := msec_time();
  i := fib (n);
  result (sprintf ('fib (%d) is %d, got it in %d milliseconds.',
               n, i, msec_time() - t));
}
;

SQL> time_fib(10);
msg
VARCHAR NOT NULL
_______________________________________________________________________________

fib (10) is 55, got it in 10 milliseconds.

1 Rows. -- 21 msec.
```

</div>

</div>

  

</div>

<div id="seealso_msec_time" class="refsect1">

## See Also

<a href="fn_now.html" class="link" title="now"><code
class="function">now </code></a>

</div>

</div>
