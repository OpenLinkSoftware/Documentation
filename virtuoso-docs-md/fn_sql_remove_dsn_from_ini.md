<div id="fn_sql_remove_dsn_from_ini" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_remove_dsn_from_ini — removes a DSN from the ODBC registry

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_remove_dsn_from_ini" class="funcsynopsis">

|                                            |                             |
|--------------------------------------------|-----------------------------|
| `vector `**`sql_remove_dsn_from_ini`**` (` | in `dsn ` varchar ,         |
|                                            | in `dsn_type ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_remove_dsn_from_ini" class="refsect1">

## Description

This function corresponds to the ODBC installer call of similar name. It
and related functions are used by the virtual database to handle remote
data sources.

</div>

<div id="params_sql_remove_dsn_from_ini" class="refsect1">

## Parameters

As defined in ODBC Installer API for the corresponding catalog call.

</div>

<div id="ret_sql_remove_dsn_from_ini" class="refsect1">

## Return Types

None.

</div>

<div id="seealso_sql_remove_dsn_from_ini" class="refsect1">

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
