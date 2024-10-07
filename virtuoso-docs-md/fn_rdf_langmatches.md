<div id="fn_rdf_langmatches" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_LANGMATCHES — Returns 1 if language identifier r matches lang
pattern t.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_langmatches" class="funcsynopsis">

|                                     |                      |
|-------------------------------------|----------------------|
| ` `**`DB.DBA.RDF_LANGMATCHES`**` (` | in `r ` varchar ,    |
|                                     | in `t ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_langmatches" class="refsect1">

## Description

Returns 1 if language identifier r matches lang pattern t

</div>

<div id="params_rdf_langmatches" class="refsect1">

## Parameters

<div id="id103906" class="refsect2">

### r

language identifies (string or NULL).

</div>

<div id="id103909" class="refsect2">

### t

language pattern (exact name, first two letters or '\*').

</div>

</div>

<div id="ret_rdf_langmatches" class="refsect1">

## Return Types

integer

</div>

<div id="examples_rdf_langmatches" class="refsect1">

## Examples

<div id="ex_rdf_langmatches" class="example">

**Example 24.306. Simple example**

<div class="example-contents">

``` screen
SQL>SELECT DB.DBA.RDF_QNAME_OF_IID ( /*retval[*/  "s-4-1-t0"."P" /* p */ /*]retval*/ ) AS /*tmpl*/ "p",
    DB.DBA.RDF_SQLVAL_OF_OBJ ( /*retval[*/  "s-4-1-t0"."O" /* v */ /*]retval*/ ) AS /*tmpl*/ "v"
FROM DB.DBA.RDF_QUAD AS "s-4-1-t0"
WHERE /* field equal to URI ref */
    "s-4-1-t0"."S" = DB.DBA.RDF_MAKE_IID_OF_QNAME_SAFE ( 'http://example.org/#x' )
    AND /* filter */
    not ( DB.DBA.RDF_LANGMATCHES ( DB.DBA.RDF_LANGUAGE_OF_OBJ ( /*retval[*/  "s-4-1-t0"."O" /* v */ /*]retval*/ ), '*' ))
OPTION (QUIETCAST)
VARCHAR
_______________________________________________________________________________

http://example.org/data/y
http://example.org/data/x
http://example.org/a
3 Rows. -- 20 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_langmatches" class="refsect1">

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

<a href="fn_rdf_regex.html" class="link" title="DB.DBA.RDF_REGEX"><code
class="function">DB.DBA.RDF_REGEX </code></a>

</div>

</div>
