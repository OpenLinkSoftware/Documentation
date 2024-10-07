<div id="spasviewsandtables" class="section">

<div class="titlepage">

<div>

<div>

## 9.22. Stored Procedures as Views & Derived Tables

</div>

</div>

</div>

Virtuoso allows using a stored procedure result set in place of a table.
A view may also be defined as a stored procedure. This provides smooth
integration to external procedural logic in queries.

When a procedure appears as a table, the procedure is called and its
result set is inserted into a temporary space. Processing continues from
that point on as if the data came from a table.

Queries involving procedure views or derived tables are subject to
normal join order selection. For this purpose it is possible to
associate a cost to a procedure used in a procedure view or derived
table. If the option (order) clause is given at the end of the select,
joins are done left to right. If a procedure is in the leftmost position
in the from it will be called once for the query, if it is in the second
position it will be called once for every row of the leftmost table that
passes selection criteria applicable to it and so on.

Procedures used as tables can get parameters from the query. These
parameters are expressed in the containing select's where clause as
column = expression, where column is a parameter name of the procedure
table.

A procedure derived table is of the form:

``` programlisting
q_table_name '(' column_commalist ')' '(' column_def_commalist ')' alias
```

The first column commalist is the parameter list. The second
column_def_list is a description of the result set, as in a CREATE TABLE
statement. The correlation name alias is required if the procedure
occurs as a derived table, with no view definition.

A procedure view is declared as follows:

``` programlisting
CREATE procedure VIEW new_table_name
    AS q_table_name '(' column_commalist ')' '(' column_def_commalist ')'
```

The columns in the column definition list should correspond to the
procedure's result set columns. The columns are explicit in the view so
as to be able to interpret the view definition and to be able to compile
procedures and queries using the view before the procedure itself is
defined. Thus the procedure need be defined only at time of execution,
not at time of definition.

The meta-data returned by ODBC catalog calls for a procedure view will
show the columns as they were declared, just like a regular view.
Procedure views are never updatable.

<div id="proctabparams" class="section">

<div class="titlepage">

<div>

<div>

### 9.22.1. Procedure Table Parameters

</div>

</div>

</div>

If there is a condition that is in the top level set of AND'ed
conditions in the table expression's WHERE clause and if it is an
equality condition and if it references a parameter of a procedure table
and if the other side of the equality does not reference the procedure
table or a table to the right of it, then this condition is considered a
parameter. This means that the condition is not actually evaluated but
rather that the other side of the equality is evaluated before calling
the procedure and that the value returned is passed to the procedure as
an input parameter in the position indicated by the name in the
parameter list of the view or derived table.

If the procedure table is referenced in an explicit join, as in outer or
inner join syntax, only equalities in the join condition (ON clause) are
eligible to specify a parameter. Equalities in the enclosing query's
WHERE phrase will be considered tests on the results, not parameters.

The parameter names in the procedure view's or derived table's parameter
list do not have to be names in the output columns, although this will
often be the case. The number of parameters in the parameter list in the
view or derived table must match that in the procedure definition but
the names do not have to be the same. Only input parameters are
supported.

If a parameter is specified but no applicable predicate is found, a NULL
value is passed.

</div>

</div>
