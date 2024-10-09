<div>

<div>

<div>

<div>

## 11.23. Vectored Execution and Query Parallelization

</div>

</div>

</div>

Note: This feature only applies to Virtuoso 7.0 and later.

Vectored execution means executing queries or stored procedures
simultaneously on multiple sets of parameters. Further, when a query
contains a <span class="emphasis">*JOIN*</span> , a single invocation of
the query will, with vectored execution, execute every consecutive
<span class="emphasis">*JOIN*</span> step with multiple inputs. When
every stage of a query's evaluation is performed on a large number of
intermediate result rows at a time, two benefits are obtained:

<div>

1.  The interpretation overhead disappears and

2.  Locality of reference in

    <span class="emphasis">*JOINs*</span>

    can be better exploited.

</div>

For example, with a <span class="emphasis">*JOIN*</span> like:

``` programlisting
SELECT  COUNT(*)
  FROM  part,
        lineitem
 WHERE  l_partkey = p_partkey
   AND     p_size < 23
OPTION  ( LOOP, ORDER );
```

the outermost <span class="emphasis">*LOOP*</span> of the query will
look for parts with <span class="emphasis">*p_size \< 23*</span> . The
part keys of these are used as lookup keys for an index on
<span class="emphasis">*l_partkey*</span> in
<span class="emphasis">*lineitem*</span> . This index translates these
values into values of the primary key,
<span class="emphasis">*l_orderkey*</span> ,
<span class="emphasis">*l_linenumber*</span> , which is then used to get
the data row with the price and discount. When each of these steps is
done with tens of thousands of values at the same time, the SQL
interpretation overhead is almost completely eliminated and locality can
be exploited when accessing nearby rows. The chance of hitting nearby
rows also increases when the size of the intermediate result batch
increases.

<div>

<div>

<div>

<div>

### 11.23.1. Automatic Query Parallelization

</div>

</div>

</div>

If a query does not modify data, executes in
<span class="emphasis">*READ COMMITTED*</span> isolation, and contains
some form of aggregation or <span class="emphasis">*ORDER BY*</span> ,
it can be automatically parallelized. Parallelization typically splits
the query's outermost <span class="emphasis">*LOOP*</span> into
approximately equal size chunks, which are independently evaluated each
on its own thread. The results are merged together when all are ready,
and are combined in an aggregation or <span class="emphasis">*ORDER
BY*</span> . This is entirely transparent to the user.

</div>

</div>
