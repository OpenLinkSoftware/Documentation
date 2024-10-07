<div id="fn_rdf_quad_uri_l_typed" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_QUAD_URI_L_TYPED — Performs simple insertion of a quad where
object is a literal value in 'SQL valmode' and can be specified datatype
and language.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_quad_uri_l_typed" class="funcsynopsis">

|                                          |                         |
|------------------------------------------|-------------------------|
| ` `**`DB.DBA.RDF_QUAD_URI_L_TYPED`**` (` | in `g_uri ` varchar ,   |
|                                          | in `s_uri ` varchar ,   |
|                                          | in `p_uri ` varchar ,   |
|                                          | in `o_lit ` any ,       |
|                                          | in `dt ` any ,          |
|                                          | in `lang ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_quad_uri_l_typed" class="refsect1">

## Description

Performs simple insertion of a quad where object is a literal value in
'SQL valmode' and can be specified datatype and language. The arguments
g_uri, s_uri and p_uri should be IRI strings or IRI_IDs. All string
arguments should be in UTF-8 encoding, otherwise they will be stored but
are not queryable via SPARQL.

</div>

<div id="params_rdf_quad_uri_l_typed" class="refsect1">

## Parameters

<div id="id104211" class="refsect2">

### g_uri

graph uri IRI string or IRI_ID

</div>

<div id="id104214" class="refsect2">

### s_uri

subject IRI string or IRI_ID

</div>

<div id="id104217" class="refsect2">

### p_uri

predicate IRI string or IRI_ID

</div>

<div id="id104220" class="refsect2">

### o_uri

string value of the literal

</div>

<div id="id104223" class="refsect2">

### dt

datatype as IRI string or IRI_ID, can be NULL

</div>

<div id="id104226" class="refsect2">

### lang

language as string or NULL

</div>

</div>

<div id="ret_rdf_quad_uri_l_typed" class="refsect1">

## Return Types

any

</div>

<div id="examples_rdf_quad_uri_l_typed" class="refsect1">

## Examples

<div id="ex_rdf_quad_uri_l_typed" class="example">

**Example 24.309. Simple example**

<div class="example-contents">

``` screen
SQL>DB.DBA.RDF_QUAD_URI_L_TYPED ('g_many', 's1', 'p_some', 'z016,g_many,s1,p_some', null, 'en');

Done. -- 0 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_quad_uri_l_typed" class="refsect1">

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

<a href="fn_rdf_quad_uri.html" class="link"
title="DB.DBA.RDF_QUAD_URI"><code
class="function">DB.DBA.RDF_QUAD_URI </code></a>

<a href="fn_rdf_quad_uri_l.html" class="link"
title="DB.DBA.RDF_QUAD_URI_L"><code
class="function">DB.DBA.RDF_QUAD_URI_L </code></a>

<a href="fn_rdf_ttl2hash.html" class="link"
title="DB.DBA.RDF_TTL2HASH"><code
class="function">DB.DBA.RDF_TTL2HASH </code></a>

</div>

</div>
