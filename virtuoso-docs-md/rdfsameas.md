<div id="rdfsameas" class="section">

<div class="titlepage">

<div>

<div>

### 16.14.5. OWL sameAs Support

</div>

</div>

</div>

Virtuoso has limited support for the OWL sameAs predicate.

If sameAs traversal is enabled and a triple pattern with a given subject
or object is being matched, all the synonyms of the S and O will be
tried and results generated for all the tried bindings of S and O. The
set of synonyms is generated at run time by following all owl:sameAs
triples where the IRI in question is either the subject or the object.
These are followed recursively from object to subject and subject to
object until the complete transitive closure is generated. All sameAs
triples from all the graphs applicable to instantiating the triple
pattern at hand are considered.

Thus for example:

The inital SPARQL query:

``` programlisting
SQL>SPARQL
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix owl: <http://www.w3.org/2002/07/owl#>
prefix sioc: <http://rdfs.org/sioc/ns#>
SELECT *
from <http://example.com/dataspace>
where
 {
    ?person a foaf:Person FILTER REGEX(?person ,"http://example.com/dataspace/person/kidehen#this").
    ?person foaf:name ?name .
    ?person owl:sameAs ?sameas .
  }
limit 8;
person                                               name             sameas
VARCHAR                                              VARCHAR          VARCHAR
_______________________________________________________________________________

http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://my.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://kidehen.idehen.net/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://qdos.com/user/e922b748a2eb667bf37b188018002dec
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://knowee.net/kidehen/ids/id3684976382
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://dbpedia.org/resource/Kingsley_Idehen
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://identi.ca/user/14092
http://example.com/dataspace/person/kidehen#this  Kingsley Idehen  http://myopenlink.net/proxy?url=http%3A%2F%2Fwww.facebook.com%2Fpeople%2FKingsley_Idehen%2F605980750&force=rdf&login=kidehen

8 Rows. -- 181 msec.
```

So if we have:

``` programlisting
<http://example.com/dataspace/person/kidehen#this>    <http://www.w3.org/2002/07/owl#sameAs> <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this> .
<http://example.com/dataspace/person/kidehen#this>    <http://xmlns.com/foaf/0.1/name>         Kingsley Idehen
```

and we instantiate <span class="emphasis">*?s
\<http://xmlns.com/foaf/0.1/name\> "Kingsley Idehen"*</span> we get
<span class="emphasis">*?s*</span> bound to
<span class="emphasis">*\<http://example.com/dataspace/person/kidehen#this\>*</span>
.

If we instantiate
<span class="emphasis">*\<http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this\>
\<http://xmlns.com/foaf/0.1/name\> ?l*</span> we get
<span class="emphasis">*?l*</span> bound to
<span class="emphasis">*"Kingsley Idehen"*</span> because the subject
was given and it was expanded to its synonyms.

If binding a variable in a pattern where the variable was free, we do
not expand the value to the complete set of its synonyms.

Same-as expansion is enabled in a query by
<span class="emphasis">*define input:same-as "yes"*</span> in the
beginning of the SPARQL query. This has a significant run time cost but
is in some cases useful when joining data between sets which are mapped
to each other with same-as.

We note that the number of same-as expansions will depend on the join
order used for the SPARQL query. The compiler does not know the number
of synonyms and cannot set the join order accordingly. Regardless of the
join order we will however get at least one IRI of the each synonym set
as answer. Also when interactively navigating a graph with a browser,
the same-as expansion will take all synonyms into account.

For getting the complete entailment of same-as, a forward chaining
approach should be used, effectively asserting all the implied triples.

<div id="rdfsameasexmp" class="section">

<div class="titlepage">

<div>

<div>

#### OWL sameAs Example

</div>

</div>

</div>

``` programlisting
SQL>SPARQL
DEFINE input:same-as "yes"
SELECT *
WHERE
 {
   ?s <http://xmlns.com/foaf/0.1/name> "Kingsley Idehen" .
 }
LIMIT 10;

s
VARCHAR
___________________________________________________
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
http://demo.openlinksw.com/dataspace/kingsley#person
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
http://example.com/dataspace/person/kidehen#this
No. of rows in result: 10
```

</div>

</div>
