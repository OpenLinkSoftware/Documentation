<div id="procexamples" class="section">

<div class="titlepage">

<div>

<div>

### 9.22.6. Procedure Table Examples

</div>

</div>

</div>

``` programlisting
create procedure n_range (in first integer, in  last integer)
{
  declare n, n2 integer;
  n := first;
  result_names (n, n2);
  while (n < last){
    result (n, 2 * n);
    n := n + 1;
  }
}

select n, n2 from n_range (first, last) (n int, n2 int) n
    where first = 2 and last = 12;
```

This returns a set of numbers from 2 to 11 and from 4 to 22.

``` programlisting
select a.n, b.n from n_range (first, last) (n int, n2 int) a,
    n_range (f2, l2) (n int, n2 int) b
  where first = 2 and last = 12 and f2 = a.n - 2 and l2 = a.n + 2;
```

Here we join the second call to the procedure to the first, effectively
passing the output of the left call as parameters to the right call.

``` programlisting
create procedure view n_range as n_range (first, last) (n1 int, n2 decimal);
```

This defines the procedure as a view, so that it can be referenced like
a table.

``` programlisting
select * from n_range a, n_range b where a.first = 1 and a.last = 11
        and b.last = a.n1 + 2 and b.first = a.n1 - 2;
```

This is the previous join but now using the view.

</div>
