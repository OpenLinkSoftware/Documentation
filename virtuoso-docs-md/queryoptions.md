<div id="queryoptions" class="section">

<div class="titlepage">

<div>

<div>

### 9.28.2. Query Options

</div>

</div>

</div>

These are effective from Virtuoso 3.0 onwards.

``` programlisting
<sql_option>:
    TABLE OPTION (<table option>,...)

<table option>:
    HASH | LOOP | INDEX index_name | INDEX PRIMARY KEY | INDEX TEXT KEY

<option clause>:
    OPTION (<query_option>,...)

<query_option>:
    ORDER
```

The TABLE OPTION clause can follow a table's correlation name in a FROM
clause. The OPTION clause can appear at the end of the query, after all
ORDER BY and FOR specifications.

The INDEX table option is used to control which index is chosen by the
optimized SQL compiler for a given table (when you want to override the
one chosen automatically).

|                                                                                                                                  |
|----------------------------------------------------------------------------------------------------------------------------------|
| INDEX index_name - selects a named table index (unprefixed - same name as in create index).                                      |
| INDEX PRIMARY KEY - selects the primary key                                                                                      |
| INDEX TEXT KEY - selects the free-text index as a driving one if there's a free-text condition over that table in the statement. |

<div id="ex_optclause" class="example">

**Example 9.46. Use of the OPTION & TABLE OPTION clauses**

<div class="example-contents">

``` programlisting
select count (*) from t1 a, t1 b table option  (hash) where .row_no = b.row_no option(order)
```

This forces the a, b join order and specifies that the join will be a
hash join.

</div>

</div>

  

<div id="ex_optinandjoin" class="example">

**Example 9.47. IN Predicate and Joins**

<div class="example-contents">

Sometimes statements of the form

``` programlisting
select col from t1 where t1.key in (select key from t2)
```

get optimized into a loop over t2 and a nested lookup on t1, as in

``` programlisting
select .... from (select distinct key from t2) f, t1 where t1.key = f.key.
```

This optimization is mostly done when there is an index on t1.key and
the IN subquery selects fewer rows than the other conditions on t1 would
select.

In some cases the developer may wish to explicitly force this
optimization to be made or not to be made. This is done with the LOOP
EXISTS query option, as follows:

``` programlisting
select row_no from t1 where row_no in (select row_no from t1 where fi2 = 2) option (loop exists)
```

will force the IN subquery to become a joined derived table.

``` programlisting
select row_no from t1 where row_no in (select row_no from t1 where fi2 = 2) option (do not loop exists)
```

``` programlisting
select row_no from t1 where row_no in (select row_no from t1 where fi2 = 2 option (do not loop exists))
```

will prevent this optimization. Note that the option (do not loop
exists) can be either in the subquery or in the enclosing query.

The same logic applies to IN predicates in searched update or delete
statements.

</div>

</div>

  

</div>
