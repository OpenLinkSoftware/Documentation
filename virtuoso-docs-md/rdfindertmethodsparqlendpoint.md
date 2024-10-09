<div>

<div>

<div>

<div>

### 16.9.5. SPARQL Insert via /sparql endpoint

</div>

</div>

</div>

SPARQL INSERT operation can be sent to a web service endpoint as a
single statement and executed in sequence.

<span class="emphasis">*Example:*</span>

Using the Virtuoso ISQL tool or using the /sparql UI at
http://host:port/sparql, execute the following:

<div>

1.  Insert into graph http://BookStore.com 3 triples:

    ``` programlisting
    SQL>SPARQL insert in graph <http://BookStore.com>
    { <http://www.dajobe.org/foaf.rdf#i> <http://purl.org/dc/elements/1.1/date> <1999-04-01T00:00:00> .
      <http://www.w3.org/People/Berners-Lee/card#i> <http://purl.org/dc/elements/1.1/date> <1998-05-03T00:00:00> .
      <http://www.w3.org/People/Connolly/#me> <http://purl.org/dc/elements/1.1/date> <2001-02-08T00:00:00> };
    ```

2.  As result will be shown the message:

    ``` programlisting
    SQL>Insert into <http://BookStore.com>
    3 triples -- done
    ```

3.  Next we will select all triples from the graph http://BookStore.com:

    ``` programlisting
    SQL>SPARQL SELECT * FROM <http://BookStore.com> WHERE {?s ?p ?o};
    ```

4.  As result will be shown:

    ``` programlisting
    s                                              p                                       o
    VARCHAR                                        VARCHAR                                 VARCHAR
    _______________________________________________________________________________

    http://www.w3.org/People/Berners-Lee/card#i    http://purl.org/dc/elements/1.1/date    1998-05-03T00:00:00
    http://www.w3.org/People/Connolly/#me          http://purl.org/dc/elements/1.1/date    2001-02-08T00:00:00
    http://www.dajobe.org/foaf.rdf#i               http://purl.org/dc/elements/1.1/date    1999-04-01T00:00:00

    3 Rows. -- 0 msec.
    ```

5.  Now let's insert into graph another http://NewBookStore.com graph's
    values:

    ``` programlisting
    SQL>SPARQL
    PREFIX dc:  <http://purl.org/dc/elements/1.1/>
    PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
    INSERT INTO GRAPH <http://NewBookStore.com> { ?book ?p ?v }
    WHERE
      { GRAPH  <http://BookStore.com>
       { ?book dc:date ?date
         FILTER ( xsd:dateTime(?date) < xsd:dateTime("2000-01-01T00:00:00")).
         ?book ?p ?v.
       }
      };
    ```

6.  As result will be shown:

    ``` programlisting
    callret-0
    VARCHAR
    _______________________________________________________________________________

    Insert into <http://NewBookStore.com>, 2 triples -- done
    ```

7.  Finally we will check the triples from the graph NewBookStore.com:

    ``` programlisting
    SQL> SPARQL
    SELECT *
    FROM <http://NewBookStore.com>
    WHERE {?s ?p ?o};
    ```

8.  As result will be shown:

    ``` programlisting
    s                                             p                                      o
    VARCHAR                                       VARCHAR                                VARCHAR
    _______________________________________________________________________________

    http://www.w3.org/People/Berners-Lee/card#i   http://purl.org/dc/elements/1.1/date   1998-05-03T00:00:00
    http://www.dajobe.org/foaf.rdf#i              http://purl.org/dc/elements/1.1/date   1999-04-01T00:00:00

    2 Rows. -- 10 msec.
    ```

</div>

</div>
