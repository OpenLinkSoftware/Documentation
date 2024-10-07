<div id="fn_rdf_suo_apply_patch" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_SUO_APPLY_PATCH — Modifies either the target graph specified
in the patch via `guo:target_graph ` or the graph specified by
default_target_graph argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_suo_apply_patch" class="funcsynopsis">

|                                         |                                        |
|-----------------------------------------|----------------------------------------|
| ` `**`DB.DBA.RDF_SUO_APPLY_PATCH`**` (` | in `patch_graph ` IRI_ID ,             |
|                                         | in `default_target_graph ` IRI_ID `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_suo_apply_patch" class="refsect1">

## Description

This function tries to modify either the target graph specified in the
patch via `guo:target_graph` (hence, the non-NULL target_graph argument
of the diff creator, <a href="fn_rdf_suo_diff_ttl.html" class="link"
title="DB.DBA.RDF_SUO_DIFF_TTL">DB.DBA.RDF_SUO_DIFF_TTL()</a> ) or the
graph specified by default_target_graph argument. The function returns
zero in case of success, non-zero value otherwise. In addition, the
function produces a result set that describes the process of matching
blank node in the target graph to instructions in the patch.

The TURTLE made by <a href="fn_rdf_graph_diff.html" class="link"
title="DB.DBA.RDF_GRAPH_DIFF">DB.DBA.RDF_GRAPH_DIFF</a> can be loaded
later into an empty graph and the IRI_ID of that graph can be passed as
the first argument to this patch function.

</div>

<div id="params_rdf_suo_apply_patch" class="refsect1">

## Parameters

<div id="id102302" class="refsect2">

### patch_graph

IRI ID of the patch graph

</div>

<div id="id102305" class="refsect2">

### default_target_graph

IRI ID of the default target graph

</div>

</div>

<div id="ret_rdf_suo_apply_patch" class="refsect1">

## Return Types

integer

</div>

<div id="seealso_rdf_suo_apply_patch" class="refsect1">

## See Also

<a href="fastapproxdiffandpatch.html" class="link"
title="16.17.16. Fast Approximate RDF Graph Diff and Patch">Fast
Approximate RDF Graph Diff and Patch</a>

<a href="fn_rdf_graph_diff.html" class="link"
title="DB.DBA.RDF_GRAPH_DIFF"><code
class="function">DB.DBA.RDF_GRAPH_DIFF() </code></a>

<a href="fn_rdf_suo_diff_ttl.html" class="link"
title="DB.DBA.RDF_SUO_DIFF_TTL"><code
class="function">DB.DBA.RDF_SUO_DIFF_TTL() </code></a>

<a href="fn_rdf_graph_collect_fp_list.html" class="link"
title="DB.DBA.RDF_GRAPH_COLLECT_FP_LIST"><code
class="function">DB.DBA.RDF_GRAPH_COLLECT_FP_LIST() </code></a>

</div>

</div>
