<div id="fn_sql_columns" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_columns — get column information from table on a remote DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_columns" class="funcsynopsis">

|                                |                            |
|--------------------------------|----------------------------|
| `vector `**`sql_columns`**` (` | in `dsn ` varchar ,        |
|                                | in `qualifier ` varchar ,  |
|                                | in `owner ` varchar ,      |
|                                | in `table_name ` varchar , |
|                                | in `column ` varchar `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_columns" class="refsect1">

## Description

This function corresponds to the ODBC catalog call of similar name. It
and related functions are used by the virtual database to query remote
data dictionaries.

The dsn argument must refer to a dsn previously defined by
`vd_remote_data_source` or ATTACH TABLE.

For instance, the qualifier argument corresponds to the szTableQualifier
and cbTableQualifier arguments of an ODBC catalog function. The SQL NULL
value corresponds to the C NULL value. The arguments can contain %
signs, which are interpreted as in LIKE.

</div>

<div id="params_sql_columns" class="refsect1">

## Parameters

As defined in ODBC API for the corresponding catalog call.

</div>

<div id="ret_sql_columns" class="refsect1">

## Return Types

As defined in ODBC API for the corresponding catalog call.

This function returns an array, with one element for each row of the
result set. Each row is represented as an array with one element for
each column.

</div>

<div id="examples_sql_columns" class="refsect1">

## Examples

<div id="ex_sql_columns" class="example">

**Example 24.393. Simple example**

<div class="example-contents">

``` screen
dbg_obj_print (sql_columns ('Local Virtuoso', 'Demo', NULL, 'Orders', NULL));
->
(
("Demo" "demo" "Orders" "OrderID" 4 "INTEGER" 10 10 <DB NULL> 2 1 <DB NULL> <DB NULL> 4 <DB NULL> 10 1 1 )
("Demo" "demo" "Orders" "CustomerID" 12 "VARCHAR" 5 5 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 5 2 2 )
("Demo" "demo" "Orders" "EmployeeID" 4 "INTEGER" 10 10 <DB NULL> 2 1 <DB NULL> <DB NULL> 4 <DB NULL> 10 3 3 )
("Demo" "demo" "Orders" "OrderDate" 11 "DATETIME" 19 19 <DB NULL> 2 1 <DB NULL> <DB NULL> 11 3 19 4 4 )
("Demo" "demo" "Orders" "RequiredDate" 9 "DATE" 10 10 <DB NULL> 2 1 <DB NULL> <DB NULL> 9 1 10 5 5 )
("Demo" "demo" "Orders" "ShippedDate" 11 "DATETIME" 19 19 <DB NULL> 2 1 <DB NULL> <DB NULL> 11 3 19 6 6 )
("Demo" "demo" "Orders" "ShipVia" 4 "INTEGER" 10 10 <DB NULL> 2 1 <DB NULL> <DB NULL> 4 <DB NULL> 10 7 7 )
("Demo" "demo" "Orders" "Freight" 8 "DOUBLE PRECISION" 16 16 <DB NULL> 2 1 <DB NULL> <DB NULL> 8 <DB NULL> 16 8 8 )
("Demo" "demo" "Orders" "ShipName" 12 "VARCHAR" 40 40 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 40 9 9 )
("Demo" "demo" "Orders" "ShipAddress" 12 "VARCHAR" 60 60 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 60 10 10 )
("Demo" "demo" "Orders" "ShipCity" 12 "VARCHAR" 15 15 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 15 11 11 )
("Demo" "demo" "Orders" "ShipRegion" 12 "VARCHAR" 15 15 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 15 12 12 )
("Demo" "demo" "Orders" "ShipPostalCode" 12 "VARCHAR" 10 10 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 10 13 13 )
("Demo" "demo" "Orders" "ShipCountry" 12 "VARCHAR" 15 15 <DB NULL> 2 1 <DB NULL> <DB NULL> 12 <DB NULL> 15 14 14 )
)
```

</div>

</div>

  

</div>

<div id="seealso_sql_columns" class="refsect1">

## See Also

<a href="fn_sql_data_sources.html" class="link"
title="sql_data_sources"><code
class="function">sql_data_sources </code></a> ,
<a href="fn_sql_columns.html" class="link" title="sql_columns"><code
class="function">sql_columns </code></a>
<a href="fn_sql_primary_keys.html" class="link"
title="sql_primary_keys"><code
class="function">sql_primary_keys </code></a> ,
<a href="fn_sql_gettypeinfo.html" class="link"
title="sql_gettypeinfo"><code
class="function">sql_gettypeinfo</code></a> ,
<a href="fn_sql_statistics.html" class="link"
title="sql_statistics"><code class="function">sql_statistics</code></a>
, <a href="fn_sql_tables.html" class="link" title="sql_tables"><code
class="function">sql_tables</code></a> .

</div>

</div>
