<div id="rdfsparqlruleenableinfr" class="section">

<div class="titlepage">

<div>

<div>

### 16.14.7. Enabling Inferencing

</div>

</div>

</div>

In a SPARQL query, the define input:inference clause is used to instruct
the compiler to use the rules in the named rule set. For example:

``` programlisting
SQL> rdfs_rule_set ('sample', 'rule_graph');

SQL> SPARQL
define input:inference "sample"
SELECT *
FROM <g>
WHERE {?s ?p ?o};
```

will include all the implied triples in the result set, using the rules
in the sample rule set.

Inference can be enabled triple pattern by triple pattern. This is done
with the option (inference 'rule_set') clause after the triple pattern
concerned. Specifying option (inference none) will disable inference for
the pattern concerned while the default inference context applies to the
rest of the patterns. Note that the keyword is input:inference in the
query header and simply inference in the option clause. See the examples
section below for examples.

In SQL, if RDF_QUAD occurs in a select from clause, inference can be
added with the table option <span class="emphasis">*WITH*</span> , as
follows:

``` programlisting
SPARQL
SELECT *
FROM rdf_quad table OPTION (with 'sample')
WHERE g = iri_to_id ('xx', 0);
```

This is about the same as:

``` programlisting
SPARQL
define input:inference "sample"
SELECT *
FROM <xx>
WHERE {?s ?p ?o}
```

</div>
