<div>

<div>

</div>

<div>

## Name

DB.DBA.SPARQL_EVAL_TO_ARRAY — Local execution of SPARQL via SPARQL
protocol, produces a vector of vectors of SQL values.

</div>

<div>

## Synopsis

<div>

|                                          |                            |
|------------------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_EVAL_TO_ARRAY`**` (` | in `query ` varchar ,      |
|                                          | in `dflt_graph ` varchar , |
|                                          | in `maxrows ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Local execution of SPARQL via SPARQL protocol, produces a result set of
SQL values.

</div>

<div>

## Parameters

<div>

### query

text of SPARQL query to execute.

</div>

<div>

### dflt_graph

default graph IRI, if not NULL then this overrides what is specified in
query

</div>

<div>

### maxrows

limit on numbers of rows that should be returned.

</div>

</div>

<div>

## Return Types

any

</div>

<div>

## Examples

<div>

**Example 24.303. Simple Use**

<div>

``` screen
SQL> select DB.DBA.SPARQL_EVAL_TO_ARRAY('SELECT * WHERE {?s ?p ?o}','http://example/bookStore' ,2);
callret
VARCHAR
_______________________________________________________________________________

vector(0x00ae6874,0x00ae6844)

1 Rows. -- 10 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT </code></a>

<a href="fn_rdf_triples_to_rdf_xml_text.html" class="link"
title="DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT"><code
class="function">DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT </code></a>

<a href="fn_sparql_eval.html" class="link"
title="DB.DBA.SPARQL_EVAL"><code
class="function">DB.DBA.SPARQL_EVAL </code></a>

</div>

</div>
