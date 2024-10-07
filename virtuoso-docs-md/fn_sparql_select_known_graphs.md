<div id="fn_sparql_select_known_graphs" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_SELECT_KNOWN_GRAPHS — returns all explicitly created
graphs.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_select_known_graphs" class="funcsynopsis">

|                                                |      |
|------------------------------------------------|------|
| ` `**`DB.DBA.SPARQL_SELECT_KNOWN_GRAPHS`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_select_known_graphs" class="refsect1">

## Description

This function returns URIs for all explicitly created graphs.

</div>

<div id="params_sparql_select_known_graphs" class="refsect1">

## Parameters

</div>

<div id="ret_sparql_select_known_graphs" class="refsect1">

## Return Types

varchar

</div>

<div id="examples_sparql_select_known_graphs" class="refsect1">

## Examples

<div id="ex_sparql_select_known_graphs" class="example">

**Example 24.284. Simple Use**

<div class="example-contents">

``` programlisting
# Create explicitly a graph:
CREATE GRAPH <http://example.com/mygraph>;
callret-0
Create graph <http://example.com/mygraph> -- done
...
SQL> DB.DBA.SPARQL_SELECT_KNOWN_GRAPHS();
GRAPH_IRI
VARCHAR
_______________________________________________________________________________

http://www.openlinksw.com/schemas/virtrdf#
http://example.com/mygraph
http://example.com/DAV
http://example.com/dataspace
http://example.com/dataspace/inf
http://www.w3.org/2002/07/owl#
http://www.w3.org/2002/07/owl
http://www.openlinksw.com/schemas/RDF_Mapper_Ontology/1.0/
http://bblfish.net/work/atom-owl/2006-06-06/
http://purl.org/dc/elements/1.1/
http://www.openlinksw.com/schema/attribution#
http://purl.org/ontology/bibo/
http://purl.org/dc/terms/
http://xmlns.com/foaf/0.1/
http://purl.org/goodrelations/v1
http://open.vocab.org/terms
http://www.w3.org/1999/02/22-rdf-syntax-ns#
http://www.w3.org/2000/01/rdf-schema#
http://scot-project.org/scot/ns#
http://rdfs.org/sioc/ns#

20 Rows. -- 188 msec.
```

</div>

</div>

  

</div>

<div id="seealso_sparql_select_known_graphs" class="refsect1">

## See Also

<a href="fastapproxdiffandpatch.html" class="link"
title="16.17.16. Fast Approximate RDF Graph Diff and Patch">Fast
Approximate RDF Graph Diff and Patch</a>

<a href="fn_rdf_suo_diff_ttl.html" class="link"
title="DB.DBA.RDF_SUO_DIFF_TTL">DB.DBA.RDF_SUO_DIFF_TTL</a>

<a href="fn_rdf_suo_apply_patch.html" class="link"
title="DB.DBA.RDF_SUO_APPLY_PATCH">DB.DBA.RDF_SUO_APPLY_PATCH</a>

<a href="fn_rdf_graph_collect_fp_list.html" class="link"
title="DB.DBA.RDF_GRAPH_COLLECT_FP_LIST">DB.DBA.RDF_GRAPH_COLLECT_FP_LIST</a>

</div>

</div>
