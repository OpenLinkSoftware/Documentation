<div id="rndsalltr" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.32. What is best method to get a random sample of all triples for a subset of all the resources of a SPARQL endpoint?

</div>

</div>

</div>

The best method to get a random sample of all triples for a subset of
all the resources of a SPARQL endpoint, is decimation in its original
style:

``` programlisting
SELECT ?s ?p ?o
FROM <some-graph>
WHERE
  {
    ?s ?p ?o .
    FILTER ( 1 > bif:rnd (10, ?s, ?p, ?o) )
  }
```

By tweaking first argument of <span class="emphasis">*bif:rnd()*</span>
and the left side of the inequality you can tweak decimation ratio from
1/10 to the desired value. What's important is to know that the SQL
optimizer has a right to execute <span class="emphasis">*bif:rnd
(10)*</span> only once at the beginning of the query, so we had to pass
additional three arguments that can be known only when a table row is
fetched so <span class="emphasis">*bif:rnd (10, ?s, ?p, ?o)*</span> is
calculated for every row and thus any given row is either returned or
ignored independently from others.

However, <span class="emphasis">*bif:rnd (10, ?s, ?p, ?o)*</span>
contains a subtle inefficiency. In RDF store, graph nodes are stored as
numeric IRI IDs and literal objects can be stored in a separate table.
The call of an SQL function needs arguments of traditional SQL
datatypes, so the query processor will extract the text of IRI for each
node and the full value for each literal object. That is significant
waste of time. The workaround is:

``` programlisting
SPARQL
SELECT ?s ?p ?o
FROM <some-graph>
WHERE
  {
    ?s ?p ?o .
    FILTER ( 1>  <SHORT_OR_LONG::bif:rnd>  (10, ?s, ?p, ?o))
  }
```

This tells the SPARQL front-end to omit redundant conversions of values.

</div>
