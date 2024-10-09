<div>

<div>

<div>

<div>

### 9.19.10. The TOP SELECT Option

</div>

</div>

</div>

``` programlisting
query_term :  SELECT opt_top selection ....

opt_top :  opt_all_distinct [ TOP INTNUM ]
    |  opt_all_distinct [ TOP SKIPINTNUM, INTNUM ]
    |  opt_all_distinct [ TOP (num_scalar_exp) ]
    |  opt_all_distinct [ TOP (skip_num_scalar_exp, num_scalar_exp) ]
opt_all_distinct : [ ALL | DISTINCT ]
```

The TOP n phrase can follow an optional ALL or DISTINCT keyword in a
SELECT, either at top level or inside a query term of an expression or
subquery. The query with the TOP option will generate at most the
indicated number of result rows.

The scope of TOP is the query in question. For example

``` programlisting
select top 3 row_no from t1 best union select top 3 row_no + 1 from t1;
```

Will always return 4 rows assuming there are at least 3 rows in T1.

The optional SKIPINTNUM parameter lets you offset the selection by
SKIPINTNUM number of rows. If you have a ten-row table and
`select top 2 from this_table` you get the first two rows,
`select top 2, 2 from this_table` will return the third and fourth rows
only, instead.

</div>
