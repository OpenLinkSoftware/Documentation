<div id="fn_sparql_eval" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_EVAL — Local execution of SPARQL via SPARQL protocol,
produces a result set of SQL values.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_eval" class="funcsynopsis">

|                                 |                            |
|---------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_EVAL`**` (` | in `query ` varchar ,      |
|                                 | in `dflt_graph ` varchar , |
|                                 | in `maxrows ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_eval" class="refsect1">

## Description

Local execution of SPARQL via SPARQL protocol, produces a result set of
SQL values.

</div>

<div id="params_sparql_eval" class="refsect1">

## Parameters

<div id="id103458" class="refsect2">

### query

text of SPARQL query to execute.

</div>

<div id="id103461" class="refsect2">

### dflt_graph

default graph IRI, if not NULL then this overrides what is specified in
query

</div>

<div id="id103464" class="refsect2">

### maxrows

limit on numbers of rows that should be returned.

</div>

</div>

<div id="ret_sparql_eval" class="refsect1">

## Return Types

any

</div>

<div id="examples_sparql_eval" class="refsect1">

## Examples

<div id="ex_sparql_eval" class="example">

**Example 24.302. Simple Use**

<div class="example-contents">

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

<div id="seealso_sparql_eval" class="refsect1">

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
