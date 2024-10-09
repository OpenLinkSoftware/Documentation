<div>

<div>

<div>

<div>

## 16.14. Inference Rules & Reasoning

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 16.14.1. Introduction

</div>

</div>

</div>

Virtuoso SPARQL can use an inference context for inferring triples that
are not physically stored. This functionality applies to physically
stored quads and not to virtual triples generated from relational data
with Linked Data Views. Such an inference context can be built from one
or more graphs containing RDF Schema triples. The supported RDF Schema
or OWL constraints are imported from these graphs and are grouped
together into rule bases. A rule base is a persistent entity that can be
referenced by a SPARQL query or end point. Queries running with a given
rule base work as if the triples asserted by this rule base were
included in the graph or graphs accessed by the query.

As of version 5.0, Virtuoso recognizes
<span class="emphasis">*rdfs:subClassOf*</span> and
<span class="emphasis">*rdfs:subPropertyOf*</span> . owl:sameAs is
considered for arbitrary subjects and objects if specially enabled by a
pragma in the query. As of 5.00.3031, owl:sameAs, owl:equivalentClass
and owl:equivalentProperty are also considered when determining subclass
or subproperty relations. If two classes are equivalent, they share all
instances, subclasses and superclasses directly or indirectly stated in
the data for either class. Other RDF Schema or OWL information is not
taken into account.

</div>

</div>
