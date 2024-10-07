<div id="asdec" class="section">

<div class="titlepage">

<div>

<div>

### 9.19.3. Column Aliasing - AS Declaration

</div>

</div>

</div>

Virtuoso supports the AS operator in the selection list of a SELECT
statement. This notation allows declaring a name and optionally a type
and precision for a statement's output column.

The syntax is:

``` screen
as_exp:
Scalar_exp AS NAME opt_data_type
```

For instance, one can write:

``` programlisting
SELECT COUNT (*) AS NUMBEROFROWS FROM XX;
SELECT COUNT (*) AS NUMBEROFROWS INTEGER (2) FROM XX;
SELECT CONCATENATE (COL1, COL2) AS RESULTSTRING VARCHAR (50) FROM XX;
```

The AS expression tells the client to return specified values in the
SQLDescribeCol, SQLColAttribute or equivalent calls. The semantics of
statements is not otherwise affected. An AS expression can appear
anywhere a scalar expression can but the only place where it has an
effect is the selection list of a SELECT statement.

If a data type is given and contains a precision, that precision is
returned to the client as the precision of the column in question.

</div>
