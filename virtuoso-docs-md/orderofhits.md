<div>

<div>

<div>

<div>

### 20.2.9. Order of Hits

</div>

</div>

</div>

Rows from a select where there is a contains predicate and no exact
match of the primary key of the table are produced in the order of the
document id of the free text index if there is no ORDER BY. If there is
an ORDER BY matching an index, the query is evaluated in the order of
that index and each consecutive row in the order of the index is
compared against the free text expression. This is practically never
desirable.

If results are desired in the order of the free text document id, there
MUST BE NO ORDER BY. The DESCENDING option of contains should be used to
produce the reverse order, see contains reference section. If another
sorting order is desired, an ORDER BY can be used but to avoid using an
index the ordering columns should be expressions or ordinal numbers of
result columns.

Therefore:

``` programlisting
select * from article where contains (description, 'sample')
  order by id;
```

Will have the effect of traversing the table in the order of id and
checking each row for free text match. This is practically NEVER good.

To produce the results in order of id instead of dtid it is better to
write

``` programlisting
select id, * from article where contains (description, 'sample')
  order by 1;
```

or

``` programlisting
select * from article where contains (description, 'sample')
  order by id + 0;
```

</div>
