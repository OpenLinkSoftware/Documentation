<div id="fn_rdf_ttl2hash" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_TTL2HASH — Returns a dict of triples in 'long valmode'.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_ttl2hash" class="funcsynopsis">

|                                  |                          |
|----------------------------------|--------------------------|
| ` `**`DB.DBA.RDF_TTL2HASH`**` (` | in `strg ` any ,         |
|                                  | in `base ` varchar ,     |
|                                  | in `graph ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_ttl2hash" class="refsect1">

## Description

Returns a dict of triples in 'long valmode'.

</div>

<div id="params_rdf_ttl2hash" class="refsect1">

## Parameters

<div id="id103975" class="refsect2">

### strg

text of the resource

</div>

<div id="id103978" class="refsect2">

### base

base IRI to resolve relative IRIs to absolute

</div>

<div id="id103981" class="refsect2">

### graph

target graph IRI, parsed triples will appear in that graph.

</div>

</div>

<div id="ret_rdf_ttl2hash" class="refsect1">

## Return Types

any

</div>

<div id="examples_rdf_ttl2hash" class="refsect1">

## Examples

<div id="ex_rdf_ttl2hash" class="example">

**Example 24.307. Simple example**

<div class="example-contents">

``` screen
```

</div>

</div>

  

</div>

<div id="seealso_rdf_ttl2hash" class="refsect1">

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

<a href="fn_sparql_rexec.html" class="link"
title="DB.DBA.SPARQL_REXEC"><code
class="function">DB.DBA.SPARQL_REXEC </code></a>

<a href="fn_sparql_rexec_to_array.html" class="link"
title="DB.DBA.SPARQL_REXEC_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_REXEC_TO_ARRAY </code></a>

<a href="fn_sparql_rexec_with_meta.html" class="link"
title="DB.DBA.SPARQL_REXEC_WITH_META"><code
class="function">DB.DBA.SPARQL_REXEC_WITH_META </code></a>

</div>

</div>
