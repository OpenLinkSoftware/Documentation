<div>

<div>

</div>

<div>

## Name

sparql_to_sql_text — Converts a sparql query directly to SQL.

</div>

<div>

## Synopsis

<div>

|                                        |                           |
|----------------------------------------|---------------------------|
| `varchar `**`sparql_to_sql_text`**` (` | in `squery ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `sparql_to_sql_text() ` function can be used to convert a SPARQL
query directly to the SQL it would be executed as.

</div>

<div>

## Parameters

<div>

### squery

The sparql query to be converted.

</div>

</div>

<div>

## Return Types

A string will be returned containing the converted sparql query.

</div>

<div>

## Examples

<div>

**Example 24.69. Using the sparql_to_sql_text() function**

<div>

This simple example shows how to covert sparql query in SQL:

``` programlisting
SQL> select sparql_to_sql_text('select * where {?s ?p ?o}');
sparql_to_sql_text
VARCHAR
_______________________________________________________________________________

SELECT __id2i ( /*retval[*/ "s-1-1-t0"."S" /* s */ /*]retval*/ ) AS /*tmpl*/ "s",
  __id2i ( /*retval[*/ "s-1-1-t0"."P" /* p */ /*]retval*/ ) AS /*tmpl*/ "p",
  __ro2sq ( /*retval[*/ "s-1-1-t0"."O" /* o */ /*]retval*/ ) AS /*tmpl*/ "o"
FROM DB.DBA.RDF_QUAD AS "s-1-1-t0"
OPTION (QUIETCAST)

1 Rows. -- 15 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_sparql_eval_to_array.html" class="link"
title="DB.DBA.SPARQL_EVAL_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_EVAL_TO_ARRAY </code></a>

<a href="fn_sparql_eval.html" class="link"
title="DB.DBA.SPARQL_EVAL"><code
class="function">DB.DBA.SPARQL_EVAL </code></a>

<a href="fn_sparql_rdb2rdf_codegen.html" class="link"
title="DB.DBA.SPARQL_RDB2RDF_CODEGEN"><code
class="function">DB.DBA.SPARQL_RDB2RDF_CODEGEN </code></a>

<a href="fn_sparql_rdb2rdf_list_tables.html" class="link"
title="DB.DBA.SPARQL_RDB2RDF_LIST_TABLES"><code
class="function">DB.DBA.SPARQL_RDB2RDF_LIST_TABLES </code></a>

<a href="fn_sparql_rexec.html" class="link"
title="DB.DBA.SPARQL_REXEC"><code
class="function">DB.DBA.SPARQL_REXEC </code></a>

<a href="fn_sparql_rexec_to_array.html" class="link"
title="DB.DBA.SPARQL_REXEC_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_REXEC_TO_ARRAY </code></a>

<a href="fn_sparql_rexec_with_meta.html" class="link"
title="DB.DBA.SPARQL_REXEC_WITH_META"><code
class="function">DB.DBA.SPARQL_REXEC_WITH_META </code></a>

<a href="fn_sparql_select_known_graphs.html" class="link"
title="DB.DBA.SPARQL_SELECT_KNOWN_GRAPHS"><code
class="function">DB.DBA.SPARQL_SELECT_KNOWN_GRAPHS </code></a>

</div>

</div>
