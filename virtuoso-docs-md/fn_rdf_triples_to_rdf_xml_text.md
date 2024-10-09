<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT — Serializes vector of triples into a
session, in RDF/XML syntax.

</div>

<div>

## Synopsis

<div>

|                                                 |                             |
|-------------------------------------------------|-----------------------------|
| ` `**`DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT`**` (` | inout `triples ` any ,      |
|                                                 | in `print_top_level ` any , |
|                                                 | inout `ses ` any `)`;       |

<div>

 

</div>

</div>

</div>

<div>

## Description

Serializes vector of triples into a session, in TURTLE syntax. In
current version, every triple is printed in separate top-level record
(say, in rdf:Description tag), without any pretty-print or nesting
optimization.

</div>

<div>

## Parameters

<div>

### triples

vector of triples in 'long valmode'.

</div>

<div>

### print_top_level

zero if only rdf:Description tags should be written, non-zero if the
rdf:RDF top-level element should also be written

</div>

<div>

### ses

an output stream in server default encoding

</div>

</div>

<div>

## Examples

<div>

**Example 24.270. Simple example**

<div>

``` screen
create procedure simple_test(in query varchar, in dflt_graph varchar)
{
  declare ses, rset, triples any;
  declare txt varchar;
  ses := string_output ();
  rset := DB.DBA.SPARQL_EVAL_TO_ARRAY (query, dflt_graph, 1);
  triples := dict_list_keys (rset[0][0], 1);
  DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT (triples, 1, ses);
  txt := string_output_string (ses);
  dump_large_text (txt);
}
;
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

<a href="fn_rdf_triples_to_ttl.html" class="link"
title="DB.DBA.RDF_TRIPLES_TO_TTL"><code
class="function">DB.DBA.RDF_TRIPLES_TO_TTL </code></a>

</div>

</div>
