<div id="rdfinsertmethodsparqlqueryandsponger" class="section">

<div class="titlepage">

<div>

<div>

### 16.9.9. Using SPARQL Query and Sponger (i.e. we Fetch the Network Resources in the FROM Clause or values for the graph-uri parameter in SPARQL protocol URLs)

</div>

</div>

</div>

<span class="emphasis">*Example:*</span>

Execute the following query:

``` programlisting
SQL>SPARQL
SELECT ?id
FROM NAMED <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
 OPTION (get:soft "soft", get:method "GET")
WHERE { GRAPH ?g { ?id a ?o } }
limit 10;
```

As result will be shown the retrieved triples:

``` programlisting
id
VARCHAR
_______________________________________________________________________________

http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D
http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/612
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/612
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/610
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/610
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/856
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/856

10 Rows. -- 20 msec.
```

</div>
