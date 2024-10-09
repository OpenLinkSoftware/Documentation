<div>

<div>

<div>

<div>

### 1.5.34. How can I use SPARQL to make Meshups?

</div>

</div>

</div>

The following example demonstrates how to use SPARQL in order to make
Meshups:

``` programlisting
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rtb: <http://www.openlinksw.com/schemas/oat/rdftabs#>

CONSTRUCT
  {
    ?museum geo:geometry ?museumgeo ;
             rtb:useMarker 'star' ;
             foaf:name ?musname;
             rdfs:comment ?muscomment.
    ?edu geo:geometry ?edugeo ;
          rtb:useMarker 'book' ;
          foaf:name ?eduname;
          rdfs:comment ?educomment.
    ?wh geo:geometry ?whgeo;
            rtb:useMarker '03';
            foaf:name ?whname;
            rdfs:comment ?whcomment.
  }
WHERE
  {
    {
      ?museum a dbo:Museum;
              geo:geometry ?museumgeo;
              foaf:name ?musname;
              rdfs:comment ?muscomment.
      filter (lang(?musname)='en' && lang(?muscomment)='en')
    }
    UNION
    {
      ?edu a dbo:University;
           geo:geometry ?edugeo;
           foaf:name ?eduname;
           rdfs:comment ?educomment.
      filter (lang(?eduname)='en' && lang(?educomment)='en')
    }
    UNION
    {
      ?wh a dbo:WorldHeritageSite;
            geo:geometry ?whgeo;
            rdfs:label ?whname;
            rdfs:comment ?whcomment.
      filter (lang(?whname)='en' && lang(?whcomment)='en')
    }
  }
```

</div>
