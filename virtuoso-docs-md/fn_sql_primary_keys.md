<div id="fn_sql_primary_keys" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_primary_keys — get primary key information about a table on a remote
DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_primary_keys" class="funcsynopsis">

|                                     |                               |
|-------------------------------------|-------------------------------|
| `vector `**`sql_primary_keys`**` (` | in `dsn ` varchar ,           |
|                                     | in `qualifier ` varchar ,     |
|                                     | in `owner ` varchar ,         |
|                                     | in `table_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sql_primary_keys" class="refsect1">

## Description

You can use the functions described here to find out information about
the remote datasources that you are using. These could be especially
useful in Virtuoso PL later on if you are not able to know everything
about the remote tables ahead of time for the ATTACH TABLE statement.
statement

These SQL functions correspond to the ODBC catalog calls of similar
name. These are used to access the data dictionary of remote data
sources inside the ATTACH TABLE process.

The dsn argument must refer to a dsn previously defined by
vd_remote_data_source or ATTACH TABLE.

For instance, the qualifier argument corresponds to the szTableQualifier
and cbTableQualifier arguments of an ODBC catalog function. A SQL NULL
value corresponds to the C NULL value. The arguments can contain %
signs, which are interpreted as in LIKE.

These functions return an array, with one element for each row of the
result set. Each row is represented as an array with one element for
each column.

</div>

<div id="params_sql_primary_keys" class="refsect1">

## Parameters

<div id="id111412" class="refsect2">

### dsn

The data source name <span class="type">string </span>

</div>

<div id="id111416" class="refsect2">

### qualifier

Qualifier <span class="type">string </span> . May contain wildcards as
in 'De%'.

</div>

<div id="id111420" class="refsect2">

### owner

Table owner <span class="type">string </span> . May contain wildcard
characters in 'Dem%'.

</div>

<div id="id111424" class="refsect2">

### table_name

Table name <span class="type">string </span> . May contain wildcard
characters in 'Cust%'.

</div>

</div>

<div id="ret_sql_primary_keys" class="refsect1">

## Return Types

As defined in ODBC API for the corresponding catalog call.

An array, with one element for each row of the result set. Each row is
represented as an array with one element for each column.

</div>

<div id="examples_sql_primary_keys" class="refsect1">

## Examples

<div id="ex_sql_primary_keys" class="example">

**Example 24.395. Simple Example**

<div class="example-contents">

``` screen
dbg_obj_print (sql_primary_keys ('Local Virtuoso', 'Demo', NULL, 'Orders'));
->
(
 ("Demo" "demo" "Orders" "OrderID" 1 "Orders" "Demo" "demo" "Orders" )
)
```

</div>

</div>

  

</div>

<div id="seealso_sql_primary_keys" class="refsect1">

## See Also

<a href="fn_sql_data_sources.html" class="link"
title="sql_data_sources"><code
class="function">sql_data_sources </code></a> ,
<a href="fn_sql_columns.html" class="link" title="sql_columns"><code
class="function">sql_columns </code></a>
<a href="fn_sql_gettypeinfo.html" class="link"
title="sql_gettypeinfo"><code
class="function">sql_gettypeinfo </code></a> ,
<a href="fn_sql_statistics.html" class="link"
title="sql_statistics"><code class="function">sql_statistics</code></a>
, <a href="fn_sql_tables.html" class="link" title="sql_tables"><code
class="function">sql_tables</code></a> .

</div>

</div>
