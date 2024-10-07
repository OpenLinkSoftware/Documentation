<div id="cleargraphrelemtgr" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.46. How to clear graphs which are related to empty graphs?

</div>

</div>

</div>

The following example demonstrates how to remove graphs which are
related to empty graphs:

``` programlisting
PREFIX nrl:<http://www.semanticdesktop.org/ontologies/2007/08/15/nrl#>
SELECT ( bif:exec(bif:sprintf("SPARQL CLEAR GRAPH<%s>", str(?mg))))
WHERE
  {
    ?mg nrl:coreGraphMetadataFor ?g .
    FILTER(?g in ( <urn:nepomuk:local:8a9e692a> )) .
    FILTER ( !bif:exists((SELECT (1) WHERE { GRAPH ?g { ?s ?p ?o . } . })) ) .
  }
```

</div>
