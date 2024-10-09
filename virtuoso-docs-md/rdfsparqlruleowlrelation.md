<div>

<div>

<div>

<div>

### 16.14.11. Inference Rules, OWL Support and Relationship Ontology

</div>

</div>

</div>

This section provides queries usage for inference rules, owl support and
Relationship Vocabulary.

<div>

<div>

<div>

<div>

#### Example 1

</div>

</div>

</div>

Example based on Relationship Vocab:

``` programlisting
## Verify Ontology Data is in Quad Store
## Ontology: <http://vocab.org/relationship/> (Relationship Ontology)
## Use pragma to put latest in Quad store.

DEFINE get:soft "replace"
SELECT *
FROM <http://vocab.org/relationship/>
WHERE {?s ?p ?o}

## Clean up

CLEAR GRAPH <urn:owl.tests>

## Create Instance Data for Relationship Ontology
PREFIX rel: <http://purl.org/vocab/relationship/>

INSERT into GRAPH <urn:owl.tests>
  {
    <http://dbpedia.org/resource/Prince_William_of_Wales> rel:siblingOf <http://dbpedia.org/resource/Prince_Harry_of_Wales>.
    <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon> rel:ancestorOf <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom>.
    <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom> rel:ancestorOf
    <http://dbpedia.org/resource/Charles%2C_Prince_of_Wales>.
    <http://dbpedia.org/resource/Charles%2C_Prince_of_Wales> rel:ancestorOf <http://dbpedia.org/resource/Prince_William_of_Wales>.
  };

## Verify

SELECT *
FROM  <urn:owl.tests>
WHERE
  {
    ?s ?p ?o
  }

## Create an  Inference Rule that references the Relationship Ontology Named Graph

rdfs_rule_set ('urn:owl.tests', 'http://vocab.org/relationship') ;

## Verify Rule's existence

SELECT * FROM SYS_RDF_SCHEMA ;
```

</div>

<div>

<div>

<div>

<div>

#### Example 2

</div>

</div>

</div>

``` programlisting
## Test owl:TransitiveProperty Reasoning
## Start with a specific URI
## Goal: See inferred Triples
## In this case, relationship between: <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon>
## and her descendants: Queen Elizabeth, Prince Charles, Prince William, and Prince Harry)

DEFINE input:inference 'urn:owl.tests'
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:owl.tests>
WHERE
  {
    <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon> rel:ancestorOf ?o
  }
```

</div>

<div>

<div>

<div>

<div>

#### Example 3

</div>

</div>

</div>

``` programlisting
## Test owl:SymmetricalProperty Reasoning
## Should show same result irrespective of rel:siblingOf URI in Subject or Object slots of Triple

DEFINE input:inference 'urn:owl.tests'
PREFIX rel: <http://purl.org/vocab/relationship/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT *
FROM <urn:owl.tests>
WHERE
  {
    <http://dbpedia.org/resource/Prince_William_of_Wales> rel:siblingOf ?o
  }

## OR

DEFINE input:inference 'urn:owl.tests'
PREFIX rel: <http://purl.org/vocab/relationship/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT *
FROM <urn:owl.tests>
WHERE
  {
    ?s rel:siblingOf <http://dbpedia.org/resource/Prince_William_of_Wales>
  }
```

</div>

<div>

<div>

<div>

<div>

#### Example 4

</div>

</div>

</div>

``` programlisting
## Test owl:inverseOf Reasoning
## Should show triples exposing the inverseOf relation.
## In this case rel:ancestorOf instance data triples exist,so the system must infer rel:descendant Of triples

DEFINE input:inference 'urn:owl.tests'
PREFIX rel: <http://purl.org/vocab/relationship/>

SELECT *
FROM <urn:owl.tests>
WHERE
  {
    <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom> rel:descendantOf ?o
  }

## OR with Transitivity Option applied

DEFINE input:inference 'urn:owl.tests'
PREFIX rel: <http://purl.org/vocab/relationship/>

SELECT *
FROM <urn:owl.tests>
WHERE
  {
    <http://dbpedia.org/resource/Prince_William_of_Wales> rel:descendantOf ?o
    OPTION (T_DISTINCT)
  }
```

</div>

<div>

<div>

<div>

<div>

#### Example 5

</div>

</div>

</div>

``` programlisting
## Test owl:inverseOf Reasoning
## Should show triples exposing the inverseOf relation.
## In this case rel:employedBy instance data triples exist,
## the system must infer rel:employerOf triples.

DEFINE input:inference 'urn:owl.tests'
PREFIX rel: <http://purl.org/vocab/relationship/>

SELECT *
FROM <urn:owl.tests>
WHERE
  {
    ?s rel:employerOf ?o
  }
```

</div>

<div>

<div>

<div>

<div>

#### Example 6

</div>

</div>

</div>

Example based on Relationship Vocab and SKOS

Assume the following test10.rdf file:

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:daml="http://www.daml.org/2001/03/daml+oil#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:turnguard="http://www.turnguard.com#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sea="http://www.2sea.org/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dct="http://purl.org/dc/terms/">

<rdf:Description rdf:about="http://www.turnguard.com/Music">
    <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
    <skos:prefLabel xml:lang="en">Music</skos:prefLabel>
    <skos:narrower rdf:resource="http://www.turnguard.com/Pop" />
</rdf:Description>
<rdf:Description rdf:about="http://www.turnguard.com/Pop">
      <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
        <skos:prefLabel xml:lang="en">POP</skos:prefLabel>
      <skos:narrower rdf:resource="http://www.turnguard.com/TechnoPop" />
</rdf:Description>
<rdf:Description rdf:about="http://www.turnguard.com/TechnoPop">
        <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
        <skos:prefLabel xml:lang="en">TECHNOPOP</skos:prefLabel>
        <skos:narrower rdf:resource="http://www.turnguard.com/ElectroPop" />
</rdf:Description>

<rdf:Description rdf:about="http://www.turnguard.com/ElectroPop">
        <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
        <skos:prefLabel xml:lang="en">ELECTROPOP</skos:prefLabel>
</rdf:Description>
<rdf:Description rdf:about="http://www.turnguard.com/KrautRock">
        <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
        <skos:prefLabel xml:lang="en">KrautRock</skos:prefLabel>
    <skos:related rdf:resource="http://www.turnguard.com/ElectroPop" />
</rdf:Description>
</rdf:RDF>
```

Execute the following steps:

``` programlisting
## Graph Cleanup
CLEAR GRAPH <urn:owl.test2.tbox>
CLEAR GRAPH <http://turnguard.com/virtuoso/test10.rdf>

## Load Instance Data into Quad Store
## PL Procedure

## SQL realm
DB.DBA.RDF_LOAD_RDFXML
  (
    http_get('http://www.w3.org/2009/08/skos-reference/skos-owl1-dl.rdf'),
    'no',
    'urn:owl.test2.tbox'
  );
DB.DBA.RDF_LOAD_RDFXML
  (
    http_get ('http://www.w3.org/2002/07/owl.rdf'),
    'no',
    'urn:owl.test2.tbox'
  );
DB.DBA.RDF_LOAD_RDFXML
  (
    file_to_string ('test10.rdf'),
    'no',
    'http://turnguard.com/virtuoso/test10.rdf'
  );

SELECT *
FROM <http://www.w3.org/2004/02/skos/core>
WHERE
  {
    {
      <http://www.w3.org/2004/02/skos/core#related> ?p ?o
    }
    UNION
    {
      ?s ?p <http://www.w3.org/2004/02/skos/core#related>
    }
  }

## Create Rules
## SQL Realm

rdfs_rule_set ('urn:owl.test2.rules', 'urn:owl.test2.tbox');

## Transitivity Query re. SKOS concept hierarchy

DEFINE input:inference "urn:owl.test2.rules"
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

SELECT *
FROM <http://turnguard.com/virtuoso/test10.rdf>
WHERE
  {
    <http://www.turnguard.com/ElectroPop> skos:broaderTransitive ?o
    OPTION  (T_DISTINCT).
  }
```

</div>

</div>
