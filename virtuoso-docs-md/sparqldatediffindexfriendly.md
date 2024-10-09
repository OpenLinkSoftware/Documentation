<div>

<div>

<div>

<div>

### 1.5.73. How to optimize bif:dateadd in SPARQL query using selective index-friendly filter?

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### What?

</div>

</div>

</div>

Index-friendly filter for Date range ( bif:dateadd ) optimization within
SPARQL query.

</div>

<div>

<div>

<div>

<div>

#### Why?

</div>

</div>

</div>

Achieve fast results and better performance.

</div>

<div>

<div>

<div>

<div>

#### How?

</div>

</div>

</div>

Assume the following SPARQL query:

``` programlisting
SELECT ?wiki,
       ?dbp,
       bif:datediff('second',  xsd:DateTime(?extracted), now()) AS ?secondsAgo
 FROM <http://nl.dbpedia.org>
WHERE
  {
    ?wiki foaf:primaryTopic ?dbp .
    ?dbp dcterms:modified ?extracted .
    FILTER ( bif:datediff('minute', now(), xsd:DateTime(?extracted)) <= 10 )
  }
ORDER BY DESC(?extracted)
LIMIT 30
```

Let's take a look at the calculation of:

``` programlisting
FILTER ( bif:datediff('minute', now(),  xsd:DateTime(?extracted)) <= 10 ) .
```

For each "is modified" triple we:

<div>

1.  Convert ?extracted to xsd:dateTime;

2.  Calculate datediff;

3.  Make a comparison and know whether we hit or miss 10 minutes
    interval

</div>

Written so, this will lead to a potentially long loop, because even if
the optimizer will realize that the filter is selective, it can't
discover why is it so selective.

Now let's change the filter to:

``` programlisting
FILTER ( ?extracted > bif:dateadd('minute', -10, now())) .
```

`now()` can be calculated once at the very beginning of the query
execution because it does not depend on any rows in a given table. Then
`bif:dateadd` has all arguments known and thus the whole
`bif:dateadd('minute', -10, now())` can be calculated only once and
produce some value. Therefor `FILTER ( ?extracted > some_known_value )`
can be represented as a single search step: look at index and get
triples with known P, known G, O greater than the given one and any S.
That's pretty fast and predictable step, good for both optimizer and the
runtime.

We can rephrase the query to filter index-friendly:

``` programlisting
SELECT ?wiki,
       ?dbp,
        bif:datediff('second',  xsd:DateTime(?extracted) ,
        now()) AS ?secondsAgo
 FROM <http://nl.dbpedia.org>
WHERE
  {
    ?wiki foaf:primaryTopic ?dbp .
    ?dbp dcterms:modified ?extracted .
     FILTER ( ?extracted > bif:dateadd('minute', -10, now()))
  }
ORDER BY DESC (?extracted)
LIMIT 30
```

In this case the presence or the absence of the order by does not matter
too much, because the query is way more straightforward: selective
index-friendly filter first, and the selection could be ordered
naturally via hot index used by the filter.

Note also that if you know the datatype of an object literal, there's no
need to write a cast like xsd:dateTime --- it can make an expression
index-unfriendly even if it will always return the argument unchanged on
your specific data.

<div>

1.  <a href="http://bit.ly/13xefMl" class="ulink" target="_top">View the
    SPARQL Query Definition via SPARQL Protocol URL</a>

2.  <a href="http://bit.ly/18rI9VA" class="ulink" target="_top">View the
    SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

</div>
