<div id="constructaggfunc" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.60. How Do I use CONSTRUCT with objects which are value of aggregate function?

</div>

</div>

</div>

The following section demonstrates usage example of CONSTRUCT Query with
object which is a value of the aggregate function COUNT:

<div class="orderedlist">

1.  Assume following SPARQL SELECT Query:

    ``` programlisting
    SELECT DISTINCT ?category COUNT(?category) AS ?count
    WHERE
      {
        ?s<http://purl.org/dc/terms/subject> ?category
        FILTER(?s =<http://dbpedia.org/resource/Higgs_boson> || ?s =<http://dbpedia.org/resource/Gluon>)
      }
    ```

2.  To present it as CONSTRUCT Query, one should put "SELECT DISTINCT"
    into the CONSTRUCT's WHERE clause as a subquery. So for example it
    could be:

    ``` programlisting

    CONSTRUCT
      {
        ?category a<http://www.w3.org/2004/02/skos/core#Concept> .
        ?category<http://www.turnguard.com/virtuoso/aggregates#count>  ?count
      }
    WHERE
      {
        {
          SELECT DISTINCT ?category COUNT(?category) AS ?count
          WHERE
            {
              ?s <http://purl.org/dc/terms/subject> ?category
              FILTER(?s =<http://dbpedia.org/resource/Higgs_boson> || ?s =<http://dbpedia.org/resource/Gluon>)
            }
        }
      }
    ```

</div>

</div>
