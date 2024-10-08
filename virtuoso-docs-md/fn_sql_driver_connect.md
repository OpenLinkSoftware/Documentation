<div>

<div>

</div>

<div>

## Name

sql_driver_connect — Tries connecting using supplied connection string

</div>

<div>

## Synopsis

<div>

|                                        |                             |
|----------------------------------------|-----------------------------|
| `integer `**`sql_driver_connect`**` (` | in `conn_str ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calls SQLDriverConnect with the supplied connection string
and immediately disconnects after the call.

</div>

<div>

## Parameters

As described in the SQLDriverConnect in connection string

</div>

<div>

## Return Types

Returns the SQL return code (or exception on an ODBC error).

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
