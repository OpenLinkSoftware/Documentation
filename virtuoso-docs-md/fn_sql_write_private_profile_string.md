<div>

<div>

</div>

<div>

## Name

sql_write_private_profile_string — Sets a DSN's attribute value

</div>

<div>

## Synopsis

<div>

|                                                      |                          |
|------------------------------------------------------|--------------------------|
| `integer `**`sql_write_private_profile_string`**` (` | in `dsn ` varchar ,      |
|                                                      | in `type ` varchar ,     |
|                                                      | in `name ` varchar ,     |
|                                                      | in `value ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function corresponds to the ODBC catalog call of similar name. It
and related functions are used by the virtual database to query remote
data dictionaries.

The type argument must be either 'system' or 'user'.

Sets a data source attribute by calling SQLWritePrivateProfileString
from the ODBC Installer API.

</div>

<div>

## Parameters

*`type `* denotes the DSN type.

others are passed to the SQLWritePrivateProfileString

</div>

<div>

## Return Types

Returns the SQL state.

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
