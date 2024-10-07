<div id="fn_sql_statistics" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_statistics — retrieve statistics information on remote DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_statistics" class="funcsynopsis">

|                                   |                            |
|-----------------------------------|----------------------------|
| `vector `**`sql_statistics`**` (` | in `dsn ` varchar ,        |
|                                   | in `qualifier ` varchar ,  |
|                                   | in `owner ` varchar ,      |
|                                   | in `table_name ` varchar , |
|                                   | in `is_unique ` integer ,  |
|                                   | in `detail ` integer `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sql_statistics" class="refsect1">

## Description

This SQL function corresponds to the ODBC catalog call of similar name.
It is used to access the data dictionary of remote data sources inside
the ATTACH TABLE process.

The dsn argument must refer to a dsn previously defined by
vd_remote_data_source or ATTACH TABLE.

The qualifier argument corresponds to the szTableQualifier and
cbTableQualifier arguments of an ODBC catalog function. A SQL NULL value
corresponds to the C NULL value. The arguments can contain % signs,
which are interpreted as in LIKE.

These functions return an array, with one element for each row of the
result set. Each row is represented as an array with one element for
each column.

</div>

<div id="params_sql_statistics" class="refsect1">

## Parameters

As defined in ODBC API for the corresponding catalog call.

</div>

<div id="ret_sql_statistics" class="refsect1">

## Return Types

As defined in ODBC API for the corresponding catalog call.

An array with one element for each row of the result set. Each row is
represented as an array with one element for each column.

</div>

<div id="examples_sql_statistics" class="refsect1">

## Examples

<div id="ex_sql_statistics" class="example">

**Example 24.396. Simple Example**

<div class="example-contents">

``` screen
dbg_obj_print (sql_statistics ('Local Virtuoso', 'Demo', NULL, 'Orders', 0, 1));
->
(
 ("Demo" "demo" "Orders" 0 "Demo" "Orders" 3 1 "OrderID" <DB NULL> <DB NULL> <DB NULL> <DB NULL> )
)
```

</div>

</div>

  

</div>

<div id="seealso_sql_statistics" class="refsect1">

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
<a href="fn_sql_tables.html" class="link" title="sql_tables"><code
class="function">sql_tables</code></a> .

</div>

</div>
