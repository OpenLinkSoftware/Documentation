<div id="discoversparqlfedcapabtip" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.75. How to discover the capabilities of a SPARQL endpoint to enhancing SPARQL-FED usage from Virtuoso instances?

</div>

</div>

</div>

<div id="discoversparqlfedcapabtipwhat" class="section">

<div class="titlepage">

<div>

<div>

#### What?

</div>

</div>

</div>

How to discover the capabilities of a SPARQL endpoint en route to
enhancing SPARQL-FED usage from Virtuoso instances.

</div>

<div id="discoversparqlfedcapabtipwhy" class="section">

<div class="titlepage">

<div>

<div>

#### Why?

</div>

</div>

</div>

There are features supported in Virtuoso SPARQL that aren't supported by
other SPARQL engines. There are also a lot of Virtuoso instances behind
bubbles in the LOD cloud. Net effect, a Virtuoso instance operator is
faced with varied behavior when attempting to use SPARQL-FED
functionality.

</div>

<div id="discoversparqlfedcapabtiphow" class="section">

<div class="titlepage">

<div>

<div>

#### How?

</div>

</div>

</div>

Run this command to load metadata (or lack thereof) from an external
SPARQL endpoint:

``` programlisting
SPARQL LOAD SERVICE <{sparql-endpoint-iri> DATA
```

<div id="discoversparqlfedcapabtiphowex" class="section">

<div class="titlepage">

<div>

<div>

##### Example

</div>

</div>

</div>

<div class="orderedlist">

1.  Run:

    ``` programlisting
    Query result:
    ANY
     Load service <http://lod.openlinksw.com/sparql> data -- done.
     Trying to query <http://lod.openlinksw.com/sparql> as SPARQL web service endpoint, POST mode...
    ```

2.  Check the retrieved data:

    ``` programlisting
    SPARQL
    SELECT *
      FROM virtrdf:
     WHERE
         {
           <http://lod.openlinksw.com/sparql> ?p ?o
         }
     LIMIT 10

    Query result:
    p                                                                o
    ANY                                                              ANY
    http://www.openlinksw.com/schemas/virtrdf#isEndpointOfService      http://lod.openlinksw.com/sparql-sd
    http://www.openlinksw.com/schemas/virtrdf#dialect                000037ff
    ```

</div>

</div>

</div>

</div>
