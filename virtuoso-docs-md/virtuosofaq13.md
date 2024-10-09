<div>

<div>

<div>

<div>

### 1.4.13. Do you support additional metadata for triples, such as time-stamps, security tags etc?

</div>

</div>

</div>

Since quads (triple plus graph) are stored in a regular SQL table with
special data types, changing the table layout to add a column is
possible. This column would not however be visible to SPARQL without
some extra tuning. For coarse grain provenance and security information,
we recommend doing this at the graph level, where triples that belong
together are tagged with the same provenance or security are in the same
graph. The graph can then have the relevant metadata as its properties.

If tagging at the single triple level is needed, this will most often
not be needed for all triples. Hence altering the table for all triples
may not be the best choice. Making a special table that has the graph,
subject, predicate and object of the tagged triple as a key and the tag
data as a dependent part may be more efficient. Also, this table could
be more easily accessed from SPARQL.

Using the RDF reification vocabulary is not recommended as a first
choice but is possible without any alterations.

Alterations of this nature are possible but we recommend contacting us
for specifics. We can provide consultancy on the best way to do this for
each application. Altering the storage layout without some extra support
from us is not recommended.

</div>
