<div>

<div>

<div>

<div>

### 16.9.4. SPARQL Insert using LOAD

</div>

</div>

</div>

SPARQL INSERT operation can be done using the LOAD features:

``` programlisting

SPARQL INSERT INTO <..> { .... } [[FROM ...] { ... }]

SPARQL LOAD <x> [INTO <y>]

-- <ResourceURL> will be the Graph IRI of the loaded data:
SPARQL LOAD <ResourceURL>
```

Examples:

<div>

1.  Load from ISQL:

    ``` programlisting
    SPARQL insert in graph <http://mygraph.com>
    {
      <http://example.com/dataspace/Kingsley#this>
      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
      <http://rdfs.org/sioc/ns#User> .

      <http://example.com/dataspace/Kingsley#this>
      <http://rdfs.org/sioc/ns#id>
      <Kingsley> .

      <http://example.com/dataspace/Caroline#this>
      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
      <http://rdfs.org/sioc/ns#User> .

     <http://example.com/dataspace/Caroline#this>
      <http://rdfs.org/sioc/ns#id>
      <Caroline> .

       <http://example.com/dataspace/Matt#this>
      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
      <http://rdfs.org/sioc/ns#User> .

      <http://example.com/dataspace/Matt#this>
      <http://rdfs.org/sioc/ns#id>
      <Matt> .

       <http://example.com/dataspace/demo#this>
      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
      <http://rdfs.org/sioc/ns#User> .

      <http://example.com/dataspace/demo#this>
      <http://rdfs.org/sioc/ns#id>
      <demo> .};
    ```

2.  Load from .rq file:

    <div>

    1.  Create DAV collection which is visible to public, for ex:
        http://example.com/DAV/tmp

    2.  Upload to the DAV collection the following file for ex. with
        name listall.rq and with the following content:

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
        SQL>SPARQL
        load bif:concat ("http://", bif:registry_get("URIQADefaultHost"), "/DAV/tmp/listall.rq") into graph <http://myNewGraph.com>;
        ```

        As result should be shown:

        ``` programlisting
        callret-0
        VARCHAR
        _______________________________________________________________________________

        Load <http://example.com/DAV/tmp/listall.rq> into graph <http://myNewGraph.com> -- done

        1 Rows. -- 321 msec.
        ```

    </div>

3.  Load from Resource URL:

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

</div>
