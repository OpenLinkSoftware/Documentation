<div>

<div>

<div>

<div>

### 16.14.2. Making Rule Sets

</div>

</div>

</div>

Since RDF Schema and OWL schemas are RDF graphs, these can be loaded
into the triple store. Thus, in order to use such a schema as query
context, one first loads the corresponding document into the triple
store using ttlp() or rdf_load_rdfxml() or related functions. After the
schema document is loaded, one can add the assertions there into an
inference context with the rdfs_rule_set() function. This function
specifies a logical name for the rule set plus a graph URI. It is
possible to combine multiple schema graphs into a single rule set. A
single schema graph may also independently participate in multiple rule
sets.

The <span class="emphasis">*DB.DBA.SYS_RDF_SCHEMA*</span> table contains
information for all RDF rule sets in a Virtuoso instance. This table may
be queried to, for instance, verify rdfs_rule_set() activity:

``` programlisting
CREATE TABLE DB.DBA.SYS_RDF_SCHEMA (
  RS_NAME VARCHAR,  -- The name of the rdf rule set
  RS_URI  VARCHAR,  -- The name of the graph
  RS_G    VARCHAR,  -- Column for system usage only
  PRIMARY KEY (RS_NAME, RS_URI))
)
```

</div>
