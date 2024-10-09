<div>

<div>

</div>

<div>

## Name

msec_time — Get number of milliseconds from system epoch

</div>

<div>

## Synopsis

<div>

|                        |          |     |
|------------------------|----------|-----|
| ` `**`msec_time`**` (` | `void)`; |     |

<div>

 

</div>

</div>

</div>

<div>

## Description

`msec_time ` returns the number of milliseconds since system epoch. It
is useful for benchmarking purposes, timing operations, etc.

</div>

<div>

## Parameters

<div>

### No parameters

The function does not take parameters.

</div>

</div>

<div>

## Return Values

A 32-bit <span class="type">integer </span> no. of milliseconds since
system epoch.

</div>

<div>

## Examples

<div>

**Example 24.222. Simple example**

<div>

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

<div>

## See Also

<a href="fn_now.html" class="link" title="now"><code
class="function">now </code></a>

</div>

</div>
