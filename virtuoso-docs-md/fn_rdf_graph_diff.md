<div id="fn_rdf_graph_diff" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_GRAPH_DIFF — performs the core operation of preparing graph
diff.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_graph_diff" class="funcsynopsis">

|                                    |                                  |
|------------------------------------|----------------------------------|
| ` `**`DB.DBA.RDF_GRAPH_DIFF`**` (` | in `gfrom ` IRI_ID ,             |
|                                    | in `gto ` IRI_ID ,               |
|                                    | in `only_gfrom ` any ,           |
|                                    | in `only_gto ` any ,             |
|                                    | in `accuracy ` integer ,         |
|                                    | inout `fp_list ` any ,           |
|                                    | inout `invfp_list ` any ,        |
|                                    | inout `gfrom_rules ` any ,       |
|                                    | inout `gto_rules ` any ,         |
|                                    | in `equiv_map ` any := null ,    |
|                                    | in `equiv_rev ` any := null `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_graph_diff" class="refsect1">

## Description

Performs the core operation of preparing graph diff - matching between
nodes of two graphs.

Typically is called from wrapper that returns the diff in an extended
GUO ontology (http://webr3.org/owl/guo#) as a string output in TURTLE
syntax.

</div>

<div id="params_rdf_graph_diff" class="refsect1">

## Parameters

<div id="id102213" class="refsect2">

### gfrom

IRI ID of the from graph

</div>

<div id="id102216" class="refsect2">

### gto

IRI ID of the destination graph

</div>

<div id="id102219" class="refsect2">

### only_gfrom

Dictionaries of triples that present only in gfrom (but have no matches
in gto)

</div>

<div id="id102222" class="refsect2">

### only_gto

Dictionaries of triples that present only in gto (but have no matches in
gfrom)

</div>

<div id="id102225" class="refsect2">

### accuracy

Tells the procedure what should be done if one or both graphs contain
blank nodes. If zero then different bnodes are treated as distinct.
Bnodes are allocated individually for each data load, so even if one and
the same resource is loaded in two different graphs then these graphs
will contain no blank nodes in common, accuracy=0 would result in the
diff containing all triples from both graphs that have bnode subject o
object. If nonzero then the procedure will try to match blank nodes,
zipper style. In this case rest of arguments comes to play.

</div>

<div id="id102228" class="refsect2">

### fp_list

Vector of IRI_IDs of predicates that are supposed to be functional
properties, i.e., any given subject has no more than one value of a
given predicate.

</div>

<div id="id102231" class="refsect2">

### invfp_list

Vector of IRI_IDs of (supposedly) inverse functional properties, i.e.,
any given object could be the value of a given predicate for no more
than one subject. The best source of such vectors is a good ontology
suitable for both graphs. Types owl:functionalProperty and
owl:inverseFunctionalProperty will provide truly "meaningful" lists of
predicates that will provide really "meaningful" patch. Meaningful
patches have three important advantages:

<div class="itemizedlist">

- they're as compact as possible;

- human readers undestand them better;

- when a diff is applied to a graph that differs from gfrom then either
  the result is accurate and satisfies the ontology or the patch
  procedure reports meaningful conflicts. If the ontology is not
  specified then
  <a href="fn_rdf_graph_collect_fp_list.html" class="link"
  title="DB.DBA.RDF_GRAPH_COLLECT_FP_LIST">DB.DBA.RDF_GRAPH_COLLECT_FP_LIST</a>
  can be used to build these list on some representative collection of
  similar graphs. That's "better than nothing", but the quality of the
  resulting diffs may be worse if some predicates only occasionally have
  one object per subject or one subject per object in sample graps or if
  some functional/inverse functional predicates are not used in sample
  graphs but appear in graphs to diff. Remember, diff on graphs with
  blank nodes is based on heuristics, it's better to run it on sound
  data, not on results of other heuristics.

</div>

</div>

<div id="id102242" class="refsect2">

### fp_list

If NULL but accuracy is not zero then the function will call
<a href="fn_rdf_graph_collect_fp_list.html" class="link"
title="DB.DBA.RDF_GRAPH_COLLECT_FP_LIST">DB.DBA.RDF_GRAPH_COLLECT_FP_LIST</a>
internally, using graphs gfrom and gto as specimens.

</div>

<div id="id102246" class="refsect2">

### invfp_list

If NULL but accuracy is not zero then the function will call
<a href="fn_rdf_graph_collect_fp_list.html" class="link"
title="DB.DBA.RDF_GRAPH_COLLECT_FP_LIST">DB.DBA.RDF_GRAPH_COLLECT_FP_LIST</a>
internally, using graphs gfrom and gto as specimens.

</div>

<div id="id102250" class="refsect2">

### gfrom_rules

Describes how bnodes of graphs were matched, i.e., how sliders were
moved along chains of predicates.

</div>

<div id="id102253" class="refsect2">

### gto_rules

Describes how bnodes of graphs were matched, i.e., how sliders were
moved along chains of predicates.

Every event during matching of bnodes produces a rule that should be
followed when the patch will scan its input graph for bnodes to edit.

</div>

<div id="id102257" class="refsect2">

### equiv_map

Dictionary that describe the match between bnodes in gfrom and gto. In
equiv_map, bnodes from gfrom are keys and matching bnodes from gto are
values.

</div>

<div id="id102260" class="refsect2">

### equiv_rev

Dictionary that describes the match between bnodes in gfrom and gto. In
equiv_rev, same pairs are in different roles, bnodes from gfrom are
values for matching bnodes from gto that are now keys. These data can be
incomplete or NULL at all, but if provided then the function will trust
them blindly.

</div>

</div>

<div id="ret_rdf_graph_diff" class="refsect1">

## Return Types

any

</div>

<div id="seealso_rdf_graph_diff" class="refsect1">

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
