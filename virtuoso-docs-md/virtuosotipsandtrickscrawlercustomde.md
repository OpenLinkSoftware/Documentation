<div>

<div>

<div>

<div>

### 1.5.19. How Can I Get an exact mapping for a date?

</div>

</div>

</div>

Assume a given attempts to get an exact mapping for the literal "1950"
using <span class="emphasis">*bif:contains*</span> :

``` programlisting
SPARQL
SELECT DISTINCT ?s ?o
FROM <http://dbpedia.org>
WHERE
  {
    ?s ?p ?o .
   FILTER( bif:contains (?o, '"1950"')
           && isLiteral(?o)
           && ( str(?p) ! = rdfs:label  || str(?p) !=  foaf:name
           && ( ?o='1950')
         )
  }
```

As an integer 1950 or date 1950-01-01 are not texts, they are not in
free-text index and thus invisible for CONTAINS free-text predicate.

A possible way to make them visible that way is to introduce an
additional RDF predicate that will contain objects of the triples in
question, converted to strings via str() function.

Thus better results will be approached: if searches about dates are
frequent then a new predicate can have date/datetime values extracted
from texts, eliminating the need for bif:contains.

Therefor, the query from above should be changed to:

``` programlisting
SPARQL
SELECT DISTINCT ?s ?o
FROM <http://dbpedia.org>
WHERE
  {
    ?s ?p ?o .
    FILTER (  isLiteral(?o)
              && (  str(?p) != str(rdfs:label) || str(?p) !=  foaf:name )
              && str(?o) in ("1950", "1950-01-01"))
  }
```

</div>
