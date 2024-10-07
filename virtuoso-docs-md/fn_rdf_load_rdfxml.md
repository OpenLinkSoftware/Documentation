<div id="fn_rdf_load_rdfxml" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_LOAD_RDFXML — Parses the content of RDF/XML text as a
sequence of separate RDF triples.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_load_rdfxml" class="funcsynopsis">

|                                     |                              |
|-------------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_LOAD_RDFXML`**` (` | in `rdfxml_text ` varchar ,  |
|                                     | in `omt_top_rdf ` varchar ,  |
|                                     | in `graph_uri ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_load_rdfxml" class="refsect1">

## Description

Parses the content of RDF/XML text as a sequence of separate RDF
triples.

</div>

<div id="params_rdf_load_rdfxml" class="refsect1">

## Parameters

<div id="id100764" class="refsect2">

### rdfxml_text

text of XML document

</div>

<div id="id100767" class="refsect2">

### omt_top_rdf

base IRI to resolve relative IRIs

</div>

<div id="id100770" class="refsect2">

### graph_uri

the IRI of destination graph

</div>

</div>

<div id="ret_rdf_load_rdfxml" class="refsect1">

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div id="examples_rdf_load_rdfxml" class="refsect1">

## Examples

<div id="ex_rdf_load_rdfxml" class="example">

**Example 24.263. Simple Use**

<div class="example-contents">

Load from local file:

``` screen
SQL>sparql drop graph <http://www.biopax.org/prototype#sample-closure>;
Done. -- 2 msec.
SQL>DB.DBA.RDF_LOAD_RDFXML (file_to_string ('MatInf-for-Alan/Reactome_109581.owl'), '', 'http://www.biopax.org/prototype#sample');
Done. -- 106 msec.
```

Load from URI:

``` screen
SQL> DB.DBA.RDF_LOAD_RDFXML (http_get('http://lod.taxonconcept.org/ontology/txn.owl'), '', 'http://lod.taxonconcept.org/ontology/txn.owl#');
Done. -- 109 msec.

-- Check total triples retrieved:
SQL>SPARQL
SELECT COUNT(*)
from <http://lod.taxonconcept.org/ontology/txn.owl#>
WHERE {?s ?p ?o};
callret-0
INTEGER
_______________________________________________________________________________

495

1 Rows. -- 16 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_load_rdfxml" class="refsect1">

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT() </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

`DB.DBA.TTLP_MT() `

</div>

</div>
