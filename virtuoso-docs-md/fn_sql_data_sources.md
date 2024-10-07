<div id="fn_sql_data_sources" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_data_sources — get list of available DSNs

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_data_sources" class="funcsynopsis">

|                               |      |
|-------------------------------|------|
| ` `**`sql_data_sources`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sql_data_sources" class="refsect1">

## Description

`sql_data_sources ` is used to get the list of datasources available to
the dsn. It returns a vector of 2 element vectors containing Data source
name and type pairs.

</div>

<div id="params_sql_data_sources" class="refsect1">

## Parameters

As defined in ODBC API for the corresponding catalog call.

</div>

<div id="ret_sql_data_sources" class="refsect1">

## Return Types

As defined in ODBC API for the corresponding catalog call.

A vector containing a 2 element vector for each defined data source with
a <span class="type">string</span> data source name as 1st element and a
<span class="type">string</span> data source type as the 2nd element.

</div>

<div id="examples_sql_data_sources" class="refsect1">

## Examples

<div id="ex_sql_data_sources" class="example">

**Example 24.394. Simple Use**

<div class="example-contents">

``` screen
SQL> select aref (aref (sql_data_sources(), 0), 0);
callret
VARCHAR
_______________________________________________________________________________

Local Virtuoso

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_sql_data_sources" class="refsect1">

## See Also

<a href="fn_sql_columns.html" class="link" title="sql_columns"><code
class="function">sql_columns </code></a><a href="fn_sql_primary_keys.html" class="link"
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
