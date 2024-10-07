<div id="fn_rdf_graph_collect_fp_list" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_GRAPH_COLLECT_FP_LIST — Gets inverse / functional properties
for given graphs.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_graph_collect_fp_list" class="funcsynopsis">

|                                               |                           |
|-----------------------------------------------|---------------------------|
| ` `**`DB.DBA.RDF_GRAPH_COLLECT_FP_LIST`**` (` | in `g_iid_list ` any ,    |
|                                               | in `direct_fp ` integer , |
|                                               | inout `fp_list ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_graph_collect_fp_list" class="refsect1">

## Description

Gets inverse / functional properties for given graphs. The procedure
will fetch all triples of all specified graphs during the run, so it
will take some time if graphs are big and/or numerous.

</div>

<div id="params_rdf_graph_collect_fp_list" class="refsect1">

## Parameters

<div id="id102151" class="refsect2">

### g_iid_list

Vector of IRI_IDs of sample graphs

</div>

<div id="id102154" class="refsect2">

### direct_fp

When zero gets list of inverse functional properties; non-zero gets
functional properties.

</div>

<div id="id102157" class="refsect2">

### fp_list

Variable that will be set to the vector of properties.

</div>

</div>

<div id="ret_rdf_graph_collect_fp_list" class="refsect1">

## Return Types

any

</div>

<div id="seealso_rdf_graph_collect_fp_list" class="refsect1">

## See Also

<a href="fastapproxdiffandpatch.html" class="link"
title="16.17.16. Fast Approximate RDF Graph Diff and Patch">Fast
Approximate RDF Graph Diff and Patch</a>

<a href="fn_rdf_graph_diff.html" class="link"
title="DB.DBA.RDF_GRAPH_DIFF">DB.DBA.RDF_GRAPH_DIFF</a>

<a href="fn_rdf_suo_diff_ttl.html" class="link"
title="DB.DBA.RDF_SUO_DIFF_TTL">DB.DBA.RDF_SUO_DIFF_TTL</a>

<a href="fn_rdf_suo_apply_patch.html" class="link"
title="DB.DBA.RDF_SUO_APPLY_PATCH">DB.DBA.RDF_SUO_APPLY_PATCH</a>

</div>

</div>
