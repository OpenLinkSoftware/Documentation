<div id="fn_rdf_load_rdfa" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_LOAD_RDFA — Parses the content of RDF embedded as RDFa text
as a sequence of separate RDF triples.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_load_rdfa" class="funcsynopsis">

|                                   |                              |
|-----------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_LOAD_RDFA`**` (` | in `rdfa_text ` varchar ,    |
|                                   | in `omt_top_rdf ` varchar ,  |
|                                   | in `graph_uri ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_load_rdfa" class="refsect1">

## Description

Parses the content of RDF embedded as RDFa text as a sequence of
separate RDF triples.

</div>

<div id="params_rdf_load_rdfa" class="refsect1">

## Parameters

<div id="id100823" class="refsect2">

### rdfa_text

text of document containing RDFa data

</div>

<div id="id100826" class="refsect2">

### omt_top_rdf

base IRI to resolve relative IRIs

</div>

<div id="id100829" class="refsect2">

### graph_uri

the IRI of destination graph

</div>

</div>

<div id="ret_rdf_load_rdfa" class="refsect1">

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div id="examples_rdf_load_rdfa" class="refsect1">

## Examples

<div id="ex_rdf_load_rdfa" class="example">

**Example 24.264. Simple Use**

<div class="example-contents">

Load from local file:

``` screen
SQL>sparql clear graph <http://virtuoso.openlinksw.com/example>;
Done. -- 2 msec.
SQL>DB.DBA.RDF_LOAD_RDFA (file_to_string ('pricing.html'), 'http://virtuoso.openlinksw.com/pricing/#', 'http://virtuoso.openlinksw.com/example');
Done. -- 106 msec.
```

Load from URI:

``` screen
SQL>sparql clear graph <http://virtuoso.openlinksw.com/example>;
SQL> DB.DBA.RDF_LOAD_RDFA (http_get('http://virtuoso.openlinksw.com/pricing/'), 'http://virtuoso.openlinksw.com/pricing/#', 'http://virtuoso.openlinksw.com/example');
Done. -- 109 msec.

-- Check total triples retrieved:
SQL>SPARQL
SELECT COUNT(*)
from <http://virtuoso.openlinksw.com/example>
WHERE {?s ?p ?o};
callret-0
INTEGER
_______________________________________________________________________________

1181

1 Rows. -- 16 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_load_rdfa" class="refsect1">

## See Also

<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">DB.DBA.RDF_LOAD_RDFXML() </code></a>

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

`DB.DBA.RDF_LOAD_RDFA_MT() `

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

`DB.DBA.TTLP_MT() `

</div>

</div>
