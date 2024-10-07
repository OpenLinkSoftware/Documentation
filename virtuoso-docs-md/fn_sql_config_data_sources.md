<div id="fn_sql_config_data_sources" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_config_data_sources — Configures a remote DSN as in the DSN
attribute string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_config_data_sources" class="funcsynopsis">

|                                            |                           |
|--------------------------------------------|---------------------------|
| `vector `**`sql_config_data_sources`**` (` | in `driver ` varchar ,    |
|                                            | in `type ` varchar ,      |
|                                            | in `attrib ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_config_data_sources" class="refsect1">

## Description

This function creates or modifies a user or system data source based on
the semicolon separated list of DSN attributes.

The type argument must be either 'system' or 'user'.

Configures the data source by calling
SQLWriteDSNToIni/SQLWritePrivateProfileString/SQLSetConfigMode from the
ODBC Installer API.

</div>

<div id="params_sql_config_data_sources" class="refsect1">

## Parameters

*`driver `* is the Driver name passed to SQLWriteDSNToIni.

</div>

<div id="ret_sql_config_data_sources" class="refsect1">

## Return Types

Returns the ODBC status code.

</div>

<div id="seealso_sql_config_data_sources" class="refsect1">

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
