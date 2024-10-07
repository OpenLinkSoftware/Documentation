<div id="fn_sparql_rexec_to_array" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_REXEC_TO_ARRAY — Remote execution of SPARQL via SPARQL
protocol, produces a vector of vectors of SQL value.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_rexec_to_array" class="funcsynopsis">

|                                           |                            |
|-------------------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_REXEC_TO_ARRAY`**` (` | in `service ` varchar ,    |
|                                           | in `query ` varchar ,      |
|                                           | in `dflt_graph ` varchar , |
|                                           | in `named_graphs ` any ,   |
|                                           | in `req_hdr ` any ,        |
|                                           | in `maxrows ` integer ,    |
|                                           | in `bnode_dict ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_rexec_to_array" class="refsect1">

## Description

Remote execution of SPARQL via SPARQL protocol, produces a vector of
vectors of SQL value.

</div>

<div id="params_sparql_rexec_to_array" class="refsect1">

## Parameters

<div id="id103678" class="refsect2">

### service

service URI to call via HTTP.

</div>

<div id="id103681" class="refsect2">

### query

text of SPARQL query to execute.

</div>

<div id="id103684" class="refsect2">

### dflt_graph

default graph IRI, if not NULL then this overrides what is specified in
query

</div>

<div id="id103687" class="refsect2">

### named_graphs

vector of named graph IRIs, if not NULL then this overrides what is
specified in query

</div>

<div id="id103690" class="refsect2">

### req_hdr

additional HTTP header lines that should be passed to the service;
'Host: ...' is most popular.

</div>

<div id="id103693" class="refsect2">

### maxrows

limit on numbers of rows that should be returned.

</div>

<div id="id103696" class="refsect2">

### bnode_dict

dictionary of bnode ID references.

</div>

</div>

<div id="ret_sparql_rexec_to_array" class="refsect1">

## Return Types

any

</div>

<div id="seealso_sparql_rexec_to_array" class="refsect1">

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT </code></a>

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

</div>

</div>
