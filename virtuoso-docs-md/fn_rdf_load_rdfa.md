<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_LOAD_RDFA — Parses the content of RDF embedded as RDFa text
as a sequence of separate RDF triples.

</div>

<div>

## Synopsis

<div>

|                                   |                              |
|-----------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_LOAD_RDFA`**` (` | in `rdfa_text ` varchar ,    |
|                                   | in `omt_top_rdf ` varchar ,  |
|                                   | in `graph_uri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Parses the content of RDF embedded as RDFa text as a sequence of
separate RDF triples.

</div>

<div>

## Parameters

<div>

### rdfa_text

text of document containing RDFa data

</div>

<div>

### omt_top_rdf

base IRI to resolve relative IRIs

</div>

<div>

### graph_uri

the IRI of destination graph

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## Examples

<div>

**Example 24.264. Simple Use**

<div>

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

<div>

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
