<div id="fastapproxdiffandpatch" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.16. Fast Approximate RDF Graph Diff and Patch

</div>

</div>

</div>

Two algorithms described below resemble "unified diff" and "patch by
unified diff" but they work on RDF graphs, not on plain texts.

They work reasonably for graphs composed from CBDs (concise bounded
descriptions) of some subjects, if these subjects are either "named"
IRIs or can be identified by values of their inverse functional
properties.

Many sorts of commonly used graphs match these restrictions, including
all graphs without blank nodes, most of FOAF files, graphs that can be
"pretty-printed" in JSON, most of dumps of relational databases etc.

The basic idea is as simple as zipper:

<div class="itemizedlist">

- Place one graph at the left and one to the right,

- Find a retainer box at the right and a matching pin at the left,

- Join them

- Pull the slider as long as possible.

- Repeat this while there are pins and boxes that can be matched and
  sliders that can be moved.

</div>

An IRI in left graph `(say, G1)` matches to same IRI in right graph
`(G2)` as pin to box. The same is true for literals too.

Functional and inverse functional properties are teeth that form chains,
algorithm "moves sliders" along these chains, incrementally connecting
more and more nodes.

If there is a match of this sort `(O1 in G1 matches O2 in G2)` and the
matched nodes are values of same inverse functional property `P` (there
are `{ S1 P O1 }` in `G1` and `{ S2 P O2 }` in `G2` ) then we guess that
`S1` matches `S2` .

If `S1` in `G1` matches `S2` in `G2` and the matched nodes are subjects
of same functional property `P` ( there are `{ S1 P N1 }` in `G1` and
`{ S2 P N2 }` in `G2` ) then we guess that `N1` matches `N2` , now it's
possible to try same interaction on triples where `N1` and `N2` are in
subject position, that's how slides move. A typical example of a long
zipper is closed list with matched heads.

<div id="fastapproxdiffandpatchhow" class="section">

<div class="titlepage">

<div>

<div>

#### Make a Diff And Use It

</div>

</div>

</div>

<div class="itemizedlist">

- Using <a href="fn_rdf_graph_diff.html" class="link"
  title="DB.DBA.RDF_GRAPH_DIFF">DB.DBA.RDF_GRAPH_DIFF</a>

- Using <a href="fn_rdf_suo_diff_ttl.html" class="link"
  title="DB.DBA.RDF_SUO_DIFF_TTL">DB.DBA.RDF_SUO_DIFF_TTL</a>

- Using <a href="fn_rdf_suo_apply_patch.html" class="link"
  title="DB.DBA.RDF_SUO_APPLY_PATCH">DB.DBA.RDF_SUO_APPLY_PATCH</a>

</div>

</div>

<div id="fastapproxdiffandpatchclt" class="section">

<div class="titlepage">

<div>

<div>

#### Collect Functional And Inverse Functional Properties

</div>

</div>

</div>

Lists of functional properties can be retrieved from an ontology graph
by query like:

``` programlisting
SPARQL define output:valmode "LONG"
SELECT (<LONG::sql:VECTOR_AGG(?s))
FROM <my-ontology-graph>
WHERE
  {
    ?s a owl:functionalProperty
  }
```

Inverse functional properties could be retrieved by a similar query, but
unfortunately the ontology may mention so called NULL values that can be
property values for many subjects. Current implementation of diff and
patch does not recognize NULL values so they can cause patch with "false
alarm" errors. The workaround is to retrieve only properties that have
no NULL values declared:

``` programlisting
SPARQL define output:valmode "LONG"
SELECT (<LONG::sql:VECTOR_AGG(?s))
FROM <my-ontology-graph>
WHERE
  {
    ?s a owl:inverseFunctionalProperty .
    OPTIONAL { ?s owl:nullIFPValue ?v }
    FILTER (!Bound(?v))
  }
```

If no ontology is available then appropriate predicates can be obtained
from sample graphs using
<a href="fn_rdf_graph_collect_fp_list.html" class="link"
title="DB.DBA.RDF_GRAPH_COLLECT_FP_LIST">DB.DBA.RDF_GRAPH_COLLECT_FP_LIST</a>
.

</div>

<div id="fastapproxdiffandpatchimpl" class="section">

<div class="titlepage">

<div>

<div>

#### Implementation-Specific Extensions of GUO Ontology

</div>

</div>

</div>

<span class="emphasis">*Note*</span> : This section contains
implementation details that are needed only if you want to write your
own patch or diff procedure, you don't have to worry about internals if
you want to use existing procedures.

Basic GUO ontology is not expressive enough to work with blank nodes, so
some custom extensions \$ are needed.

In the rest of the description:

``` programlisting
@prefix guo: <http://webr3.org/owl/guo#>
```

is assumed.

The diff contains one node of `rdf:type guo:diff` .

For debugging purpose it has properties `guo:graph1` and `guo:graph2`
that corespond to `gfrom` and `gto` arguments of
<a href="fn_rdf_suo_diff_ttl.html" class="link"
title="DB.DBA.RDF_SUO_DIFF_TTL">DB.DBA.RDF_SUO_DIFF_TTL</a> .

The diff also contains zero or more nodes of
`rdf:type guo:UpdateInstruction` . These nodes are as described in basic
GUO ontology, but `guo:target_graph` is now optional,
`guo:target_subject` can be a blank node and objects of predicates
"inside" values of `guo:insert` and `guo:delete` can also be blank
nodes. These blank nodes are "placeholders" for values, calculated
according to the most important GUO extension - rule nodes.

There are eight sorts of rule nodes, four for `gfrom` side of diff and
four similar for `gto` side. Out of four sorts related to one side, two
are for functional properties and two similar are for inverse functional
properties. Thus `rdf:type-s` of these nodes are:

``` programlisting
guo:from-rule-FP0,
guo:from-rule-FP1,
guo:from-rule-IFP0,
guo:from-rule-IFP1
```

and

``` programlisting
guo:to-rule-FP0,
guo:to-rule-FP1,
guo:to-rule-IFP ,
guo:to-rule-IFP1 .
```

Each rule node has property `guo:order` that is an non-negative integer.

These integers enumerate all `guo:from-rule-` ... nodes, starting from
zero.

When patch procedure works, these rules are used in this order, the
result of each rule is a blank node that either exists in the graph or
just created.

All results are remembered for use in the rest of the patch procedure.

Similarly, other sequence of these integers enumerate all `guo:to-rule-`
... nodes, also starting from zero.

Consider a sequence of `guo:from-rule-` ... nodes, because
`guo:to-rule-` nodes have identical properties.

A rule node can have zero or more values of `guo:dep` property, each
value is a bnode that is rule node that should be calculated before the
current one.

Every rule has exactly one predicate `guo:path` that is a blank node.
Each property of this blank node describes one possible "move of
slider": predicate to follow is in predicate position and a node to
start from is in object position. An IRI or a literal in object position
is used as is, a blank node in object position should be of type
`guo:from-rule-` ... and have smaller `guo:order` so it refers to
already calculated result bnode of some preceding rule.

Rule of form:

``` programlisting
R a guo:from-rule-IFP1 ;
  guo:path [ P1 O1 ; P2 O2 ; ... ; Pn On ] .
```

searches for a unique blank node `_:Rres` that is a common subject of
triples:

``` programlisting
 _:Rres P1 O1
 _:Rres P2 O2
  . . .
 _:Rres Pn On
```

in the gfrom graph.

If subjects differ in these triples or some triples are not found or the
subject is not a blank node then an appropriate error is logged and rule
fails, otherwise `_:Rres` is remembered as the result of the rule.

Similarly, rule of form:

``` programlisting
R a guo:from-rule-FP1 ;
  guo:path [ P1 O1 ; P2 O2 ; ... ; Pn On ] .
```

searches for a unique blank node `_:Rres` that is a common object of
triples:

``` programlisting
 O1 P1 _:Rres
 O2 P2 _:Rres
  . . .
 On Pn _:Rres
```

in the gfrom graph.

Rule of form:

``` programlisting
R a guo:from-rule-IFP0 ;
  guo:path [ P1 O1 ; P2 O2 ; ... ; Pn On ] .
```

ensures that the `gfrom` graph does not contain any triple like:

``` programlisting
 _:Rres P1 O1
 _:Rres P2 O2
```

or

``` programlisting
_:Rres Pn On
```

It is an error if something exists. If nothing found then the result of
the rule is newly created unique blank node. That's how patch procedure
creates new blank nodes when it inserts "totally new" data.

Similarly, rule of form:

``` programlisting
R a guo:from-rule-IFP0 ;
  guo:path [ P1 O1 ; P2 O2 ; ... ; Pn On ] .
```

ensures that the `gfrom` graph does not contain any triple like:

``` programlisting
O1 P1 _:Rres
O2 P2 _:Rres
```

or

``` programlisting
 On Pn _:Rres
```

Current version of patch procedure does not use rules `guo:to-rule-` ...
, however they can be used by custom procedure of few sorts. First,
these rules can be used to produce a "reversed diff". Next, these rules
can be used to validate the result of the patch - if the patch can not
be reverted then the result is "suspicious".

</div>

</div>
