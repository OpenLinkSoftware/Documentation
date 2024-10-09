<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_SUO_APPLY_PATCH — Modifies either the target graph specified
in the patch via `guo:target_graph ` or the graph specified by
default_target_graph argument.

</div>

<div>

## Synopsis

<div>

|                                         |                                        |
|-----------------------------------------|----------------------------------------|
| ` `**`DB.DBA.RDF_SUO_APPLY_PATCH`**` (` | in `patch_graph ` IRI_ID ,             |
|                                         | in `default_target_graph ` IRI_ID `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### patch_graph

IRI ID of the patch graph

</div>

<div>

### default_target_graph

IRI ID of the default target graph

</div>

</div>

<div>

## Return Types

integer

</div>

<div>

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
