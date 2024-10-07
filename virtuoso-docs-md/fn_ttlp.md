<div id="fn_ttlp" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.TTLP — parses TTL (TURTLE or N3 resource) and places its triples
into DB.DBA.RDF_QUAD.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ttlp" class="funcsynopsis">

|                          |                          |
|--------------------------|--------------------------|
| ` `**`DB.DBA.TTLP`**` (` | in `strg ` any ,         |
|                          | in `base ` varchar ,     |
|                          | in `graph ` varchar ,    |
|                          | in `flags ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ttlp" class="refsect1">

## Description

Parses TTL (TURTLE or N3 resource) and places its triples into
DB.DBA.RDF_QUAD.

</div>

<div id="params_ttlp" class="refsect1">

## Parameters

<div id="id100954" class="refsect2">

### strg

text of the resource

</div>

<div id="id100957" class="refsect2">

### base

base IRI to resolve relative IRIs to absolute

</div>

<div id="id100960" class="refsect2">

### graph

target graph IRI, parsed triples will appear in that graph.

</div>

<div id="id100963" class="refsect2">

### flags

bitmask of parsing flags. Permits some sorts of syntax errors in
resource. Default is 0, meaning no permitted deviations from the spec.
Other supported bits are:

``` programlisting
   1 - Single quoted and double quoted strings may with newlines.
   2 - Allows bnode predicates (but SPARQL processor may ignore them!).
   4 - Allows variables, but triples with variables are ignored.
   8 - Allows literal subjects, but triples with them are ignored.
  16 - Allows '/', '#', '%' and '+' in local part of QName ("Qname with path")
  32 - Allows invalid symbols between '<' and '>', i.e. in relative IRIs.
  64 - Relax TURTLE syntax to include popular violations.
 128 - Try to recover from lexical errors as much as it is possible.
 256 - Allows TriG syntax, thus loading data in more than one graph.
 512 - Allows loading N-quad dataset files with and optional context value to indicate provenance as detailed.
8192 - Enables searching for Turtle within the string.
<ulink url="http://sw.deri.org/2008/07/n-quads/">here</ulink>.
```

</div>

</div>

<div id="ret_ttlp" class="refsect1">

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div id="examples_ttlp" class="refsect1">

## Examples

<div id="ex_ttlp" class="example">

**Example 24.266. **

<div class="example-contents">

For loading a file of any greater length, it is most practical to use
the file_to_string_output function.

It is important the file to be accessible for the Virtuoso server. You
need to have set properly the DirsAllowed parameter value in section
\[Parameters\] of the Virtuoso database INI file. For example on Windows
it could be:

``` screen
virtuoso.ini file:
[Parameters]
...
DirsAllowed =  .\tmp
...
```

So in the example the file you want to import from, should be in the tmp
folder or in its subfolder. Note that this example folder is a subfolder
of the Virtuoso Server working directory.

<span class="emphasis">*Sample Example 1* </span>

``` screen
SQL> ttlp (file_to_string_output ('.\tmp\data.ttl'), '', 'http://my_graph', 0);
```

Forth item in record of NQuad format is optional. If present then it is
used as a graph. If missed then the default graph is used. The purpose
is to make SPARQL dataset serialization possible in a "natural" way: the
content of default graph is written without any graph name specified
whereas the content of named graphs is written with fouth field in
place. Similarly, TriG uses default graph for triples outside graph
blocks. In all these cases, base IRI is used to resolve all relative
IRIs of the document, no matter what is the destination graph. Here is a
simple example:

<span class="emphasis">*Sample Example 2* </span> Suppose we have the
simple nquad.nq file:

``` programlisting
<http://www.w3.org/2002/01/tr-automation/tr.rdf> <http://purl.org/dc/elements/1.1/title> "W3C Standards and Technical Reports" <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/PersonalProfileDocument> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card> <http://creativecommons.org/ns#license> <http://creativecommons.org/licenses/by-nc/3.0/> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card> <http://purl.org/dc/elements/1.1/title> "Tim Berners-Lee's FOAF file" <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card> <http://xmlns.com/foaf/0.1/maker> <http://www.w3.org/People/Berners-Lee/card#i> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card> <http://xmlns.com/foaf/0.1/primaryTopic> <http://www.w3.org/People/Berners-Lee/card#i> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card#cm> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card#cm> <http://www.w3.org/2000/01/rdf-schema#seeAlso> <http://www.koalie.net/foaf.rdf> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card#cm> <http://xmlns.com/foaf/0.1/mbox> <mailto:coralie@w3.org> <http://www.w3.org/People/Berners-Lee/card> .
<http://www.w3.org/People/Berners-Lee/card#cm> <http://xmlns.com/foaf/0.1/name> "Coralie Mercier" <http://www.w3.org/People/Berners-Lee/card> .
```

Load the file:

``` programlisting
SQL>DB.DBA.TTLP (file_to_string_output ('./nquad.nq'), '', 'http://example.com/DAV/test', 512);
Done. -- 48 msec.
```

Select all triples from the graph with URI the fourth provenance URI
from the NQuad file i.e.: \<http://www.w3.org/People/Berners-Lee/card\>:

``` programlisting
 SQL> sparql select * from <http://www.w3.org/People/Berners-Lee/card> where {?s ?p ?o};
 s                                               p                                                  o
 VARCHAR                                         VARCHAR                                            VARCHAR
 ________________________________________________

 http://www.w3.org/2002/01/tr-automation/tr.rdf  http://purl.org/dc/elements/1.1/title              W3C Standards and Technical Reports
 http://www.w3.org/People/Berners-Lee/card       http://www.w3.org/1999/02/22-rdf-syntax-ns#type    http://xmlns.com/foaf/0.1/PersonalProfileDocument
 http://www.w3.org/People/Berners-Lee/card       http://xmlns.com/foaf/0.1/primaryTopic             http://www.w3.org/People/Berners-Lee/card#i
 http://www.w3.org/People/Berners-Lee/card       http://purl.org/dc/elements/1.1/title              Tim Berners-Lee's FOAF file
 http://www.w3.org/People/Berners-Lee/card       http://xmlns.com/foaf/0.1/maker                    http://www.w3.org/People/Berners-Lee/card#i
 http://www.w3.org/People/Berners-Lee/card       http://creativecommons.org/ns#license              http://creativecommons.org/licenses/by-nc/3.0/
 http://www.w3.org/People/Berners-Lee/card#cm    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    http://xmlns.com/foaf/0.1/Person
 http://www.w3.org/People/Berners-Lee/card#cm    http://xmlns.com/foaf/0.1/mbox                     mailto:coralie@w3.org
 http://www.w3.org/People/Berners-Lee/card#cm    http://xmlns.com/foaf/0.1/name                     Coralie Mercier
 http://www.w3.org/People/Berners-Lee/card#cm    http://www.w3.org/2000/01/rdf-schema#seeAlso       http://www.koalie.net/foaf.rdf

 10 Rows. -- 7 msec.
```

</div>

</div>

  

</div>

<div id="seealso_ttlp" class="refsect1">

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">DB.DBA.RDF_LOAD_RDFXML() </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">DB.DBA.TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
