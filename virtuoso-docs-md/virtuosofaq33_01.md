<div>

<div>

<div>

<div>

### 1.4.34. What sort of security features are built into Virtuoso?

</div>

</div>

</div>

For SQL, we have the standard role-based security and an Oracle-style
row-level security (policy) feature.

For SPARQL, users may have read or update roles at the level of the quad
store.

With RDF, a graph may be owned by a user. The user may specify read and
write privileges on the graph. These are then enforced for SPARUL (the
SPARQL update language) and SPARQL.

When an RDF graph is based on relationally stored data in Virtuoso or
another RDBMS through Virtuoso's SQL federation feature (i.e., if the
graph is an Linked Data View of underlying SQL data), then all
relational security controls apply.

Further, due to the dual-nature of Virtuoso, sophisticated
ontology-based security models are feasible. Such models are not
currently used by default, but they are achievable with our consultancy.

</div>
