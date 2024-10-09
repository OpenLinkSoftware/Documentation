<div>

<div>

<div>

<div>

### 9.28.4. ANY ORDER

</div>

</div>

</div>

When applied to a select with no aggregation or order by, this causes
the select to produce results in an order that may vary between
consecutive executions and may not correspond to the order of any index.
In a cluster situation, running a query in this manner may be up to
several times more efficient. This is not the default since SQL and
SPARQL require that two consecutive executions of a query return the
same results in the same order even if no order by is specified. Selects
that contain aggregation or order by evaluate the part which generates
input to the aggregation or order in this manner automatically. This
option affects the select at the end of which it occurs and all selects
inside it.

example:

``` programlisting
select a.row_no from t1 a, t1 b wherea.row_no = 1 + b.row_no option (any order);
```

</div>
