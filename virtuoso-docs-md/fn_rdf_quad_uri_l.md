<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_QUAD_URI_L — Performs simple insertion of a quad where object
is a literal value in 'SQL valmode'.

</div>

<div>

## Synopsis

<div>

|                                    |                       |
|------------------------------------|-----------------------|
| ` `**`DB.DBA.RDF_QUAD_URI_L`**` (` | in `g_uri ` varchar , |
|                                    | in `s_uri ` varchar , |
|                                    | in `p_uri ` varchar , |
|                                    | in `o_lit ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

Performs simple insertion of a quad where object is a literal value in
'SQL valmode'. The arguments g_uri, s_uri and p_uri should be IRI
strings or IRI_IDs. All string arguments should be in UTF-8 encoding,
otherwise they will be stored but are not queryable via SPARQL.

</div>

<div>

## Parameters

<div>

### g_uri

graph uri IRI string or IRI_ID

</div>

<div>

### s_uri

subject IRI string or IRI_ID

</div>

<div>

### p_uri

predicate IRI string or IRI_ID

</div>

<div>

### o_uri

string, number or datetime, NULL is not allowed

</div>

</div>

<div>

## Return Types

any

</div>

<div>

## Examples

<div>

**Example 24.308. Simple example**

<div>

``` screen
SQL>DB.DBA.RDF_QUAD_URI_L ('g_many', 's1', 'p_some', 'z016,g_many,s1,p_some');

Done. -- 0 msec.
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

<a href="fn_rdf_quad_uri_l_typed.html" class="link"
title="DB.DBA.RDF_QUAD_URI_L_TYPED"><code
class="function">DB.DBA.RDF_QUAD_URI_L_TYPED </code></a>

<a href="fn_rdf_ttl2hash.html" class="link"
title="DB.DBA.RDF_TTL2HASH"><code
class="function">DB.DBA.RDF_TTL2HASH </code></a>

</div>

</div>
