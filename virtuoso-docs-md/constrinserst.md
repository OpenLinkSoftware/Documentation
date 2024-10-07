<div id="constrinserst" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.45. How can I use INSERT via CONSTRUCT Statements?

</div>

</div>

</div>

You can write an ordinary CONSTRUCT statement, ensure that it generates
the triples intended to be added, and then replace the leading CONSTRUCT
keyword with the INSERT INTO phrase.

<span class="emphasis">*Example:*</span>

<div class="orderedlist">

1.  Assume new triples need to be added for the equivalentClass:

    ``` programlisting
    CONSTRUCT
      {
        ?s <http://www.w3.org/2002/07/owl#equivalentClass> `iri (bif:replace(?o,'http://schema.rdfs.org/', 'http://schema.org/'))`
       }
    FROM <http://www.openlinksw.com/schemas/rdfs>
    WHERE
      {
        ?s <http://www.w3.org/2002/07/owl#equivalentClass> ?o
      };
    ```

2.  Execute the CONSTRUCT query from the htp://cname/sparql SPARQL
    endpoint.

3.  View the generated triples to ensure they are correct.

4.  Replace CONSTRUCT with INSERT INTO:

    ``` programlisting
    SPARQL INSERT INTO <http://www.openlinksw.com/schemas/rdfs>
      {
        ?s <http://www.w3.org/2002/07/owl#equivalentClass> `iri (bif:replace(?o,'http://schema.rdfs.org/', 'http://schema.org/'))`
       }
    FROM <http://www.openlinksw.com/schemas/rdfs>
    WHERE
      {
        ?s <http://www.w3.org/2002/07/owl#equivalentClass> ?o
      } ;
    ```

</div>

</div>
