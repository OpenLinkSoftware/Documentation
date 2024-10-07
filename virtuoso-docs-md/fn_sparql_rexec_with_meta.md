<div id="fn_sparql_rexec_with_meta" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_REXEC_WITH_META — Remote execution of SPARQL via SPARQL
protocol. Fills in output parameters with metadata (like exec metadata)
and a vector of vector s of 'long valmode' values.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_rexec_with_meta" class="funcsynopsis">

|                                            |                            |
|--------------------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_REXEC_WITH_META`**` (` | in `service ` varchar ,    |
|                                            | in `query ` varchar ,      |
|                                            | in `dflt_graph ` varchar , |
|                                            | in `named_graphs ` any ,   |
|                                            | in `req_hdr ` any ,        |
|                                            | in `maxrows ` integer ,    |
|                                            | in `bnode_dict ` any ,     |
|                                            | out `metadata ` any ,      |
|                                            | out `resultset ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_rexec_with_meta" class="refsect1">

## Description

Remote execution of SPARQL via SPARQL protocol. Fills in output
parameters with metadata (like exec metadata) and a vector of vector s
of 'long valmode' values.

</div>

<div id="params_sparql_rexec_with_meta" class="refsect1">

## Parameters

<div id="id103760" class="refsect2">

### service

service URI to call via HTTP.

</div>

<div id="id103763" class="refsect2">

### query

text of SPARQL query to execute.

</div>

<div id="id103766" class="refsect2">

### dflt_graph

default graph IRI, if not NULL then this overrides what is specified in
query

</div>

<div id="id103769" class="refsect2">

### named_graphs

vector of named graph IRIs, if not NULL then this overrides what is
specified in query

</div>

<div id="id103772" class="refsect2">

### req_hdr

additional HTTP header lines that should be passed to the service;
'Host: ...' is most popular.

</div>

<div id="id103775" class="refsect2">

### maxrows

limit on numbers of rows that should be returned.

</div>

<div id="id103778" class="refsect2">

### bnode_dict

dictionary of bnode ID references.

</div>

<div id="id103781" class="refsect2">

### metadata

metadata like exec () returns.

</div>

<div id="id103784" class="refsect2">

### resultset

results as 'long valmode' value.

</div>

</div>

<div id="ret_sparql_rexec_with_meta" class="refsect1">

## Return Types

any

</div>

<div id="seealso_sparql_rexec_with_meta" class="refsect1">

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

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_rdf_triples_to_rdf_xml_text.html" class="link"
title="DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT"><code
class="function">DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT() </code></a>

<a href="fn_sparql_rexec.html" class="link"
title="DB.DBA.SPARQL_REXEC"><code
class="function">DB.DBA.SPARQL_REXEC() </code></a>

<a href="fn_sparql_rexec_to_array.html" class="link"
title="DB.DBA.SPARQL_REXEC_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_REXEC_TO_ARRAY() </code></a>

</div>

</div>
