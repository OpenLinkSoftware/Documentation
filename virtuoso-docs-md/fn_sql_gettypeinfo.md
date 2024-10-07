<div id="fn_sql_gettypeinfo" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_gettypeinfo — return type information from a remote DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_gettypeinfo" class="funcsynopsis">

|                                    |                         |
|------------------------------------|-------------------------|
| `vector `**`sql_gettypeinfo`**` (` | in `dsn ` varchar ,     |
|                                    | in `type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_29" class="refsect1">

## Description

You can use the functions described here to find out information about
the remote datasources that you are using. These could be especially
useful in Virtuoso PL later on if you are not able to know everything
about the remote tables ahead of time for the ATTACH TABLE statement.
statement

These SQL functions correspond to the ODBC catalog calls of similar
name.

The dsn argument must refer to a dsn previously defined by
vd_remote_data_source or ATTACH TABLE.

By default information for all the data types supported by the remote is
returned. The optional type argument (defaults to SQL_ALL_TYPES) limits
the information returned to cover only the ODBC type number supplied.

These functions return an array, with one element for each row of the
result set. Each row is represented as an array with one element for
each column.

``` screen
dbg_obj_print (sql_gettypeinfo ('Local Virtuoso'));
->
(
 ("character" 1 2000 "'" "'" "length" 1 1 3 0 0 0 "varchar" <DB NULL> <DB NULL> )
 ("numeric" 2 40 "" "" "precision,scale" 1 1 2 0 0 0 "numeric" 0 15 )
 ("decimal" 3 40 "" "" "precision,scale" 1 1 2 0 0 0 "decimal" 0 15 )
 ("integer" 4 10 "" "" <DB NULL> 1 1 2 0 0 0 "integer" 0 10 )
 ("smallint" 5 3 "" "" <DB NULL> 1 1 2 0 0 0 "smallint" <DB NULL> <DB NULL> )
 ("smallint" -7 3 "" "" <DB NULL> 1 1 2 0 0 0 "smallint" <DB NULL> <DB NULL> )
 ("float" 6 16 "" "e0" <DB NULL> 1 1 2 0 0 0 "double precision" <DB NULL> <DB NULL> )
 ("real" 7 16 "" "e0" <DB NULL> 1 1 2 0 0 0 "real" <DB NULL> <DB NULL> )
 ("double precision" 8 16 "" "e0" <DB NULL> 1 1 2 0 0 0 "double precision" <DB NULL> <DB NULL> )
 ("varchar" 12 2000 "'" "'" "length" 1 1 3 0 0 0 "varchar" <DB NULL> <DB NULL> )
 ("long varchar" -1 2147483647 "'" "'" <DB NULL> 1 1 0 0 0 0 "long varchar" <DB NULL> <DB NULL> )
 ("long varbinary" -4 2147483647 "'" "'" <DB NULL> 1 1 0 0 0 0 "long varbinary" <DB NULL> <DB NULL> )
 ("datetime" 11 19 "{ts" "}" <DB NULL> 1 1 3 0 0 0 "datetime" <DB NULL> <DB NULL> )
 ("timestamp" -2 10 "0x" <DB NULL> <DB NULL> 0 0 2 0 0 0 "timestamp" <DB NULL> <DB NULL> )
 ("time" 10 8 "{t" "}" <DB NULL> 1 1 2 0 0 0 "time" <DB NULL> <DB NULL> )
 ("date" 9 10 "{d" "}" <DB NULL> 1 1 2 0 0 0 "date" <DB NULL> <DB NULL> )
 ("binary" -2 2000 "0x" "" "length" 1 1 2 0 0 0 "varbinary" <DB NULL> <DB NULL> )
 ("varbinary" -3 2000 "0x" "" "length" 1 1 2 0 0 0 "varbinary" <DB NULL> <DB NULL> )
 ("nchar" -8 1000 "N'" "'" "length" 1 1 3 0 0 0 "nvarchar" <DB NULL> <DB NULL> )
 ("nvarchar" -9 1000 "N'" "'" "length" 1 1 3 0 0 0 "nvarchar" <DB NULL> <DB NULL> )
 ("long nvarchar" -10 1073741823 "N'" "'" <DB NULL> 1 1 0 0 0 0 "long nvarchar" <DB NULL> <DB NULL> )
)
```

</div>

<div id="seealso_sql_gettypeinfo" class="refsect1">

## See Also

<a href="fn_sql_data_sources.html" class="link"
title="sql_data_sources"><code
class="function">sql_data_sources </code></a> ,
<a href="fn_sql_columns.html" class="link" title="sql_columns"><code
class="function">sql_columns </code></a>
<a href="fn_sql_primary_keys.html" class="link"
title="sql_primary_keys"><code
class="function">sql_primary_keys </code></a> ,
<a href="fn_sql_statistics.html" class="link"
title="sql_statistics"><code class="function">sql_statistics</code></a>
, <a href="fn_sql_tables.html" class="link" title="sql_tables"><code
class="function">sql_tables</code></a> .

</div>

</div>
