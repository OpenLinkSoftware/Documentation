<div id="selbreackup" class="section">

<div class="titlepage">

<div>

<div>

### 9.19.12. SELECT BREAKUP

</div>

</div>

</div>

Virtuoso extends the select statement with a breakup option. This option
allows a single row selected by a derived table to be seen as multiple
rows by the enclosing query.

This is specially useful when translating relation tables to RDF. Using
breakup, one can do a single pass over a table and generate multiple
triples, each presented as a separate result row.

The syntax is:

``` programlisting
SELECT BREAKUP breakup_term [, ...] FROM ....
breakup_term ::=

scalar_exp [, scalar_exp...] [WHERE search_condition]
```

Each breakup term is a list of comma separated expressions with an
optional search condition at the end. Each list is treated as a select
list in a union, i.e., they must be of equal length and the leftmost
list must provide a name for each column. This means that an AS
declaration is needed if the expression is not a column.

If a breakup tern has the optional WHERE clause, the condition is
evaluated in the scope of the select, i.e., all that is defined by the
FROM. If the condition is true, the row represented by the breakup term
is added to the result set of the breakup select, otherwise it is
ignored.

A breakup select is only allowed in a derived table or a union or other
set operator term inside a derived table. A top level breakup select is
not allowed. To have a breakup select as the topmost select, simply
write:

``` programlisting
select * from (select breakup .... from ...) f;
```

Breakup cannot be mixed with distinct, top, group by or order by. Again,
to combine these, use nested derived tables.

Breakup operates equally well on local and remote tables. Breakup is
never passed on to a remote but the FROM of a breakup select can consist
of tables from any source.

<div id="id34048" class="example">

**Example 9.36. Examples:**

<div class="example-contents">

``` programlisting
select * from (select breakup (a.row_no, b.fi2) (b.row_no, a.fi3 where a.fi3 is not null)
from r1..t1 a, r1..t1 b
where a.row_no < 10 and b.row_no = a.row_no)f;
```

</div>

</div>

  

This produces 2 rows for each result of the join, except if fi3 is null,
in which case only the first term of the breakup is returned in the
result set.

</div>
