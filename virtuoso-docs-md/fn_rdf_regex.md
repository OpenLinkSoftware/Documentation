<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_REGEX — Returns 1 if string s matches pattern p, 0 otherwise.

</div>

<div>

## Synopsis

<div>

|                               |                                 |
|-------------------------------|---------------------------------|
| ` `**`DB.DBA.RDF_REGEX`**` (` | in `s ` varchar ,               |
|                               | in `p ` varchar ,               |
|                               | in `call ` varchar := null `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns 1 if string s matches pattern p, 0 otherwise

</div>

<div>

## Parameters

<div>

### s

source string to check.

</div>

<div>

### p

regular expression pattern string.

</div>

<div>

### coll

unused for now (modes are not yet implemented).

</div>

</div>

<div>

## Return Types

integer

</div>

<div>

## Examples

<div>

**Example 24.305. Simple example**

<div>

``` screen
SQL>SELECT DISTINCT DB.DBA.RDF_QNAME_OF_IID ( /*retval[*/  "s-1-1-t0"."S" /* R */ /*]retval*/ ) AS /*tmpl*/ "R"
FROM DB.DBA.RDF_QUAD AS "s-1-1-t0"
WHERE /* filter */
    DB.DBA.RDF_REGEX ( DB.DBA.RDF_QNAME_OF_IID ( /*retval[*/  "s-1-1-t0"."S" /* R */ /*]retval*/ ), 'http://example.org/' )
OPTION (QUIETCAST)
VARCHAR
_______________________________________________________________________________

http://example.org/ns#y3
http://example.org/things#xp2
http://example.org/ns#a
http://example.org/book/book1
http://example.org/books#book1
http://example.org/books#book2
http://example.org/books#book4
http://example.org/books#book3
http://example.org/book/book2
http://example.org/ns#x2
http://example.org/things#xp1
http://example.org/ns#x3
http://example.org/things#xt1
http://example.org/ns#y1
http://example.org/ns#y2
13 Rows. -- 30 msec.
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

</div>

</div>
