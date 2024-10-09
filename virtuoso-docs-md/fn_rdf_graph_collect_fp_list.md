<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_GRAPH_COLLECT_FP_LIST — Gets inverse / functional properties
for given graphs.

</div>

<div>

## Synopsis

<div>

|                                               |                           |
|-----------------------------------------------|---------------------------|
| ` `**`DB.DBA.RDF_GRAPH_COLLECT_FP_LIST`**` (` | in `g_iid_list ` any ,    |
|                                               | in `direct_fp ` integer , |
|                                               | inout `fp_list ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Gets inverse / functional properties for given graphs. The procedure
will fetch all triples of all specified graphs during the run, so it
will take some time if graphs are big and/or numerous.

</div>

<div>

## Parameters

<div>

### g_iid_list

Vector of IRI_IDs of sample graphs

</div>

<div>

### direct_fp

When zero gets list of inverse functional properties; non-zero gets
functional properties.

</div>

<div>

### fp_list

Variable that will be set to the vector of properties.

</div>

</div>

<div>

## Return Types

any

</div>

<div>

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
