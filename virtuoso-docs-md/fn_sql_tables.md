<div id="fn_sql_tables" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_tables — get list of tables from remote DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_tables" class="funcsynopsis">

|                               |                              |
|-------------------------------|------------------------------|
| `vector `**`sql_tables`**` (` | in `dsn ` varchar ,          |
|                               | in `qualifier ` varchar ,    |
|                               | in `owner ` varchar ,        |
|                               | in `table_name ` varchar ,   |
|                               | in `tabletype ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sql_tables" class="refsect1">

## Description

This function corresponds to the ODBC catalog call of similar name. It
and related functions are used by the virtual database to query remote
data dictionaries.

The dsn argument must refer to a dsn previously defined by
vd_remote_data_source or ATTACH TABLE.

The qualifier argument corresponds to the szTableQualifier and
cbTableQualifier arguments of an ODBC catalog function. A SQL NULL value
corresponds to the C NULL value. The arguments can contain % signs,
which are interpreted as in LIKE.

</div>

<div id="params_sql_tables" class="refsect1">

## Parameters

As defined in ODBC API for the corresponding catalog call.

</div>

<div id="ret_sql_tables" class="refsect1">

## Return Types

As defined in ODBC API for the corresponding catalog call.

This function returns an array, with one element for each row of the
result set. Each row is represented as an array with one element for
each column.

</div>

<div id="examples_sql_tables" class="refsect1">

## Examples

<div id="ex_sql_tables" class="example">

**Example 24.397. Simple example**

<div class="example-contents">

``` screen
dbg_obj_print (sql_tables ('Local Virtuoso', 'Demo', NULL, NULL, NULL));
->
(
 ("Demo" "demo" "Categories" "TABLE" <DB NULL> )
 ("Demo" "demo" "Customers" "TABLE" <DB NULL> )
 ("Demo" "demo" "Employees" "TABLE" <DB NULL> )
 ("Demo" "demo" "Order_Details" "TABLE" <DB NULL> )
 ("Demo" "demo" "Orders" "TABLE" <DB NULL> )
 ("Demo" "demo" "Products" "TABLE" <DB NULL> )
 ("Demo" "demo" "Shippers" "TABLE" <DB NULL> )
 ("Demo" "demo" "Suppliers" "TABLE" <DB NULL> )
)
```

</div>

</div>

  

</div>

<div id="seealso_sql_tables" class="refsect1">

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
.

</div>

</div>
