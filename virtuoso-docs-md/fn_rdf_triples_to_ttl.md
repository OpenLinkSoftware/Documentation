<div id="fn_rdf_triples_to_ttl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_TRIPLES_TO_TTL — Serializes vector of triples into a session,
in TURTLE syntax.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_triples_to_ttl" class="funcsynopsis">

|                                        |                        |
|----------------------------------------|------------------------|
| ` `**`DB.DBA.RDF_TRIPLES_TO_TTL`**` (` | inout `triples ` any , |
|                                        | inout `ses ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_triples_to_ttl" class="refsect1">

## Description

Serializes vector of triples into a session, in TURTLE syntax. In
current version, every triple is printed in separate top-level record
(say, in rdf:Description tag), without any pretty-print or nesting
optimization.

</div>

<div id="params_rdf_triples_to_ttl" class="refsect1">

## Parameters

<div id="id101305" class="refsect2">

### triples

vector of triples in 'long valmode'.

</div>

<div id="id101308" class="refsect2">

### ses

an output stream in server default encoding

</div>

</div>

<div id="examples_rdf_triples_to_ttl" class="refsect1">

## Examples

<div id="ex_rdf_triples_to_ttl" class="example">

**Example 24.271. Simple example**

<div class="example-contents">

``` screen
SQL>create procedure RDFXML2N3 (in _rdfxml varchar)
{
  declare triples, ses any;
  declare STRG varchar;
  result_names (STRG);
  delete from RDF_QUAD where G=DB.DBA.RDF_MAKE_IID_OF_QNAME ('http://fake.example.org/graph/');
  DB.DBA.RDF_LOAD_RDFXML_MT (_rdfxml, 'http://fake.example.org/base/', 'http://fake.example.org/graph/' );
  for (sparql define output:valmode "LONG" select ?s ?p ?o where { graph <http://fake.example.org/graph/> { ?s ?p ?o } } order by ?s ?p ?o) do
    {
      ses := string_output ();
      DB.DBA.RDF_TRIPLES_TO_TTL (vector (vector ("s", "p", "o")), ses);
      result (sprintf ('%s\t%d %d', replace (string_output_string (ses), '\n', ' '), rdf_box_type ("o"), rdf_box_data_tag ("o")));
    }
}

Done. -- 0 msec.

SQL>RDFXML2N3('
<?xml version="1.0"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:dc="http://purl.org/dc/elements/1.1/"
         xmlns:ex="http://example.org/stuff/1.0/">

<rdf:Description rdf:about="http://www.w3.org/TR/rdf-syntax-grammar">
  <ex:editor>
    <rdf:Description>
      <ex:fullName>Dave Beckett</ex:fullName>
    </rdf:Description>
  </ex:editor>
</rdf:Description>

<rdf:Description rdf:about="http://www.w3.org/TR/rdf-syntax-grammar">
  <ex:editor>
    <rdf:Description>
      <ex:homePage>
        <rdf:Description rdf:about="http://purl.org/net/dajobe/">
        </rdf:Description>
      </ex:homePage>
    </rdf:Description>
  </ex:editor>
</rdf:Description>

<rdf:Description rdf:about="http://www.w3.org/TR/rdf-syntax-grammar">
  <dc:title>RDF/XML Syntax Specification (Revised)</dc:title>
</rdf:Description>

</rdf:RDF>')
STRG
VARCHAR
_______________________________________________________________________________

<http://www.w3.org/TR/rdf-syntax-grammar> <http://example.org/stuff/1.0/editor> _:b1000010000 .     257 243
<http://www.w3.org/TR/rdf-syntax-grammar> <http://example.org/stuff/1.0/editor> _:b1000010001 .     257 243
<http://www.w3.org/TR/rdf-syntax-grammar> <http://purl.org/dc/elements/1.1/title> "RDF/XML Syntax Specification (Revised)".     257 182
_:b1000010000 <http://example.org/stuff/1.0/fullName> "Dave Beckett" .    257 182
_:b1000010001 <http://example.org/stuff/1.0/homePage> <http://purl.org/net/dajobe/> .   257 243

5 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_triples_to_ttl" class="refsect1">

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

</div>

</div>
