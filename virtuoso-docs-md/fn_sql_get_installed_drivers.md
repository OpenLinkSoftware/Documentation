<div>

<div>

</div>

<div>

## Name

sql_get_installed_drivers — get column information from table on a
remote DSN

</div>

<div>

## Synopsis

<div>

|                                              |      |
|----------------------------------------------|------|
| `vector `**`sql_get_installed_drivers`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function corresponds to the ODBC Installer call of similar name. It
and related functions are used by the virtual database to query remote
data sources.

</div>

<div>

## Parameters

None

</div>

<div>

## Return Types

As defined in ODBC API for the corresponding catalog call.

This function returns an array of varchars.

</div>

<div>

## Examples

<div>

**Example 24.400. Simple example**

<div>

``` screen
dbg_obj_print (sql_get_installed_drivers ());
->
(
 "OpenLink Generic 32 Bit Driver v4.0"
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
