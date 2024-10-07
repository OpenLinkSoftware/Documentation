<div id="fn_rdf_regex" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_REGEX — Returns 1 if string s matches pattern p, 0 otherwise.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_regex" class="funcsynopsis">

|                               |                                 |
|-------------------------------|---------------------------------|
| ` `**`DB.DBA.RDF_REGEX`**` (` | in `s ` varchar ,               |
|                               | in `p ` varchar ,               |
|                               | in `call ` varchar := null `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_regex" class="refsect1">

## Description

Returns 1 if string s matches pattern p, 0 otherwise

</div>

<div id="params_rdf_regex" class="refsect1">

## Parameters

<div id="id103839" class="refsect2">

### s

source string to check.

</div>

<div id="id103842" class="refsect2">

### p

regular expression pattern string.

</div>

<div id="id103845" class="refsect2">

### coll

unused for now (modes are not yet implemented).

</div>

</div>

<div id="ret_rdf_regex" class="refsect1">

## Return Types

integer

</div>

<div id="examples_rdf_regex" class="refsect1">

## Examples

<div id="ex_rdf_regex" class="example">

**Example 24.305. Simple example**

<div class="example-contents">

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

<div id="seealso_rdf_regex" class="refsect1">

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
