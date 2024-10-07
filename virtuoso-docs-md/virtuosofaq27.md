<div id="virtuosofaq27" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.27. Does Virtuoso Support Property Tables?

</div>

</div>

</div>

For large applications, we would recommend RDF whenever there is
significant variability of schema, but would still use an
application-specific, relational style representation for those parts of
the data that are regular in format. This is possible without loss of
flexibility for the variable-schema part. However, this will introduce
relational-style restrictions on the regular data; for example, a person
could only have a single date-of-birth by design. In many cases, such
restrictions are quite acceptable. Querying will still take place in
SPARQL, and the representation will be transparent.

A relational table where the primary key is the RDF subject and where
columns represent single-valued properties is usually called a property
table. These can be defined in a manner similar to defining RDF mappings
of relational tables.

</div>
