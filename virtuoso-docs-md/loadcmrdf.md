<div>

<div>

<div>

<div>

### 1.5.36. How can I use the LOAD command to import RDF data?

</div>

</div>

</div>

SPARQL INSERT can be done using the LOAD command:

``` programlisting
SPARQL INSERT INTO <..> { .... } [[FROM ...] { ... }]

SPARQL LOAD <x> [INTO <y>]

-- <ResourceURL> will be the Graph IRI of the loaded data:
SPARQL LOAD <ResourceURL>
```

<div>

<div>

<div>

<div>

#### Examples

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Load from Resource URL

</div>

</div>

</div>

In order to load data from resource URL for ex:
http://www.w3.org/People/Berners-Lee/card#i , execute from isql the
following command:

``` programlisting
SQL> SPARQL LOAD <http://www.w3.org/People/Berners-Lee/card#i>;
callret-0
VARCHAR
_______________________________________________________________________________

Load <http://www.w3.org/People/Berners-Lee/card#i> into graph <http://www.w3.org/People/Berners-Lee/card#i> -- done

1 Rows. -- 703 msec.
SQL>
```

</div>

<div>

<div>

<div>

<div>

##### Load from file

</div>

</div>

</div>

<div>

1.  Create DAV collection which is visible to public, for ex:
    http://example.com/DAV/tmp

2.  Upload to the DAV collection a file for ex. with name listall.rq and
    with the following content:

    ``` programlisting
    SPARQL
    PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX sioc: <http://rdfs.org/sioc/ns#>
    SELECT ?x ?p ?o
    FROM <http://mygraph.com>
    WHERE
      {
        ?x rdf:type sioc:User .
        ?x ?p ?o.
        ?x sioc:id ?id .
        FILTER REGEX(str(?id), "^King")
      }
    ORDER BY ?x
    ```

3.  Execute from ISQL the following command:

    ``` programlisting
    SQL>SPARQL LOAD bif:concat ("http://", bif:registry_get("URIQADefaultHost"), "/DAV/tmp/listall.rq") into graph <http://myNewGraph.com>;
    callret-0
    VARCHAR
    _______________________________________________________________________________

    Load <http://example.com/DAV/tmp/listall.rq> into graph <http://myNewGraph.com> -- done

    1 Rows. -- 321 msec.
    ```

</div>

</div>

<div>

<div>

<div>

<div>

##### Directly LOAD triples using ISQL

</div>

</div>

</div>

``` programlisting
SQL>SPARQL INSERT INTO graph <http://mygraph.com>
{
  <http://myopenlink.net/dataspace/Kingsley#this>
  <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
  <http://rdfs.org/sioc/ns#User> .

  <http://myopenlink.net/dataspace/Kingsley#this>
  <http://rdfs.org/sioc/ns#id>
  <Kingsley> .

  <http://myopenlink.net/dataspace/Caroline#this>
  <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
  <http://rdfs.org/sioc/ns#User> .

  <http://myopenlink.net/dataspace/Caroline#this>
  <http://rdfs.org/sioc/ns#id>
  <Caroline> .
};
```

</div>

</div>

</div>
