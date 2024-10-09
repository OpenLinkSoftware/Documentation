<div>

<div>

</div>

<div>

## Name

sql_special_columns — get special column information from table on a
remote DSN

</div>

<div>

## Synopsis

<div>

|                                        |                             |
|----------------------------------------|-----------------------------|
| `vector `**`sql_special_columns`**` (` | in `dsn ` varchar ,         |
|                                        | in `qualifier ` varchar ,   |
|                                        | in `owner ` varchar ,       |
|                                        | in `table_name ` varchar ,  |
|                                        | in `scope ` integer ,       |
|                                        | in `nullable ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function corresponds to the ODBC catalog call of similar name. It
and related functions are used by the virtual database to query remote
data dictionaries.

First argument of the ODBC SQLSpecialColumns is always SQL_BEST_ROWID.

The dsn argument must refer to a dsn previously defined by
`vd_remote_data_source()` or ATTACH TABLE.

For instance, the qualifier argument corresponds to the szTableQualifier
and cbTableQualifier arguments of an ODBC catalog function. The SQL NULL
value corresponds to the C NULL value. The arguments can contain %
signs, which are interpreted as in LIKE.

</div>

<div>

## Parameters

As defined in ODBC API for the corresponding catalog call.

</div>

<div>

## Return Types

As defined in ODBC API for the corresponding catalog call.

This function returns an array, with one element for each row of the
result set. Each row is represented as an array with one element for
each column.

</div>

<div>

## Examples

<div>

**Example 24.398. Simple example**

<div>

``` screen
dbg_obj_print (sql_special_columns ('Local Virtuoso', 'Demo', 'demo', 'Orders', 0, 0));
->
(
 (0ld "OrderID" 4 "INTEGER" 10 10 <DB NULL> 1 )
)
```

</div>

</div>

  

</div>

<div>

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
