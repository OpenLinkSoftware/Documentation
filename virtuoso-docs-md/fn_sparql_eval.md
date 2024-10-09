<div>

<div>

</div>

<div>

## Name

DB.DBA.SPARQL_EVAL — Local execution of SPARQL via SPARQL protocol,
produces a result set of SQL values.

</div>

<div>

## Synopsis

<div>

|                                 |                            |
|---------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_EVAL`**` (` | in `query ` varchar ,      |
|                                 | in `dflt_graph ` varchar , |
|                                 | in `maxrows ` integer `)`; |

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

**Example 24.302. Simple Use**

<div>

``` screen
SQL>DB.DBA.SPARQL_EVAL('SELECT * WHERE {?s ?p ?o}','http://example/bookStore' ,10);
s                     p              o
VARCHAR               VARCHAR        VARCHAR
_______________________________________________________________________________

http://example/book3  http://purl.org/dc/elements/1.1/title  Fundamentals
http://example/book3  http://purl.org/dc/elements/1.1/date   2002-01-01T00:00:00
http://example/book2  http://purl.org/dc/elements/1.1/title  Design notes
http://example/book2  http://purl.org/dc/elements/1.1/date   2001-01-01T00:00:00

4 Rows. -- 30 msec.
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

<a href="fn_sparql_eval_to_array.html" class="link"
title="DB.DBA.SPARQL_EVAL_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_EVAL_TO_ARRAY </code></a>

</div>

</div>
