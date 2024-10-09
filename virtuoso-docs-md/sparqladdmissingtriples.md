<div>

<div>

<div>

<div>

### 1.5.62. How to Use SPARQL to add missing isDefinedBy relations to an Ontology?

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### What?

</div>

</div>

</div>

Using SPARQL to add missing isDefinedBy relations to an Ontology.

</div>

<div>

<div>

<div>

<div>

#### Why?

</div>

</div>

</div>

isDefinedBy relations make Ontologies (TBox) more navigable using
follow-your-nose pattern. This also makes ABox instance data more
discoverable.

</div>

<div>

<div>

<div>

<div>

#### How?

</div>

</div>

</div>

Use SPARQL to generate relations that associate Classes and Properties
the Ontology that describes them.

<div>

<div>

<div>

<div>

##### Example Using the Ontology for vCards

</div>

</div>

</div>

In this example we will use:

<div>

- Ontology Document URL: http://www.w3.org/2006/vcard/ns ;

- Ontology URI: http://www.w3.org/2006/vcard/ns# ;

- A local Named Graph IRI to host SPARQL Update (SPARUL) the new
  relations.

</div>

``` programlisting
## Uncomment line below if using Virtuoso and executing SPARQL via iSQL
## or via an ODBC, JDBC, ADO.NET connection

## SPARQL

## Uncomment line (a SPARQL pragma) below if using Virtuoso and there
## isn't a local Named Graph holding triples retrieved from the Ontology URL

## DEFINE get:soft "add"

INSERT INTO <urn:data:qos:vcard>
  { ?s rdfs:isDefinedBy <http://www.w3.org/2006/vcard/ns#> }
FROM <http://www.w3.org/2006/vcard/ns>
WHERE
  {
    ?s a ?o
  }
```

</div>

<div>

<div>

<div>

<div>

##### Example Using the Recorded Media Ontology

</div>

</div>

</div>

In this example we will use:

<div>

- Ontology Document URL: http://www.w3.org/ns/ma-ont ;

- Ontology URI: http://www.w3.org/ns/ma-ont# ;

- A local Named Graph IRI to host SPARQL Update (SPARUL) the new
  relations.

</div>

``` programlisting
SPARQL
INSERT INTO <urn:data:qos:ma-ont>
  { ?s rdfs:isDefinedBy <http://www.w3.org/ns/ma-ont#> }
FROM <http://www.w3.org/ns/ma-ont>
WHERE
  {
    ?s a ?o
  }
```

</div>

</div>

</div>
