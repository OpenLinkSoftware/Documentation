<div>

<div>

<div>

<div>

### 1.5.48. How can I execute query with labels preference order?

</div>

</div>

</div>

The way to prefer one label to the other can be done as follows:

<div>

- Have a procedure which returns preference order:

  ``` programlisting
  create procedure lbl_order (in p any)
  {
    declare r int;
    r := vector (
    'http://www.w3.org/2000/01/rdf-schema#label',
    'http://xmlns.com/foaf/0.1/name',
    'http://purl.org/dc/elements/1.1/title',
    'http://purl.org/dc/terms/title',
    'http://xmlns.com/foaf/0.1/nick',
    'http://usefulinc.com/ns/doap#name',
    'http://rdf.data-vocabulary.org/name',
    'http://www.w3.org/2002/12/cal/ical#summary',
    'http://aims.fao.org/aos/geopolitical.owl#nameListEN',
    'http://s.opencalais.com/1/pred/name',
    'http://www.crunchbase.com/source_description',
    'http://dbpedia.org/property/name',
    'http://www.geonames.org/ontology#name',
    'http://purl.org/ontology/bibo/shortTitle',
    'http://www.w3.org/1999/02/22-rdf-syntax-ns#value',
    'http://xmlns.com/foaf/0.1/accountName',
    'http://www.w3.org/2004/02/skos/core#prefLabel',
    'http://rdf.freebase.com/ns/type.object.name',
    'http://s.opencalais.com/1/pred/name',
    'http://www.w3.org/2008/05/skos#prefLabel',
    'http://www.w3.org/2002/12/cal/icaltzd#summary',
    'http://rdf.data-vocabulary.org/name',
    'http://rdf.freebase.com/ns/common.topic.alias',
    'http://opengraphprotocol.org/schema/title',
    'http://rdf.alchemyapi.com/rdf/v1/s/aapi-schema.rdf#Name',
    'http://poolparty.punkt.at/demozone/ont#title'
     );
    if (isiri_id (p))
      p := id_to_iri (p);
    r := position (p, r);
    if (r = 0)
      return 100;
    return r;
  }
  ;
  ```

- Execute the following query:

  ``` programlisting
  SPARQL
  DEFINE input:inference "facets"
  SELECT ?o
  WHERE
    {
      <http://uriburner.com/about/id/entity/http/www.linkedin.com/in/kidehen#CV_mfrTl4s6Jy> virtrdf:label ?o ;
         ?p ?o .
    }
  ORDER BY (sql:lbl_order (?p));
  ```

- Or execute the following query using sql:

  ``` programlisting

  SELECT __ro2sq (O), lbl_order (P)
  FROM RDF_QUAD table option (with ''facets'')
  WHERE G = __i2id (?)
    AND S = __i2id (?)
    AND P = __i2id (''http://www.openlinksw.com/schemas/virtrdf#label'', 0)
  ORDER BY 2
  ```

</div>

</div>
