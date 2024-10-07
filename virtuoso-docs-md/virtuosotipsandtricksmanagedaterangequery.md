<div id="virtuosotipsandtricksmanagedaterangequery" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.6. How to Manage Date Range SPARQL queries?

</div>

</div>

</div>

The following examples demonstrate how to manage date range in a SPARQL
query:

<span class="emphasis">*Example with date range*</span>

``` programlisting
SELECT ?s ?date
FROM <http://dbpedia.org>
WHERE
  {
    ?s ?p ?date . FILTER ( ?date >= "19450101"^^xsd:date && ?date <= "19451231"^^xsd:date )
  }
LIMIT 100
```

<span class="emphasis">*Example with bif:contains*</span>

Suppose there is the following query using bif:contains for date:

If ?date is of type xsd:date or xsd:dateTime and of valid syntax then
bif:contains(?date, '"1945\*"' ) will not found it, because it will be
parsed at load/create and stored as SQL DATE value.

So if data are all accurate and typed properly then the filter is:

``` programlisting
(?date >= xsd:date("1945-01-01") && ?date < xsd:date("1946-01-01"))
```

i.e. the query should be:

``` programlisting
SELECT DISTINCT ?s ?date
FROM <http://dbpedia.org>
WHERE
  {
    ?s ?p ?date . FILTER( ?date >= xsd:date("1945-01-01") && ?date < xsd:date("1946-01-01")  && (str(?p) != str(rdfs:label)) )
  }
LIMIT 10
```

If data falls, then the free-text will be OK for tiny examples but not
for "big" cases because <span class="emphasis">*bif:contains(?date,
'"1945\*"')*</span> would require that less than 200 words in the table
begins with 1945. Still, some data can be of accurate type and syntax so
range comparison should be used for them and results aggregated via
UNION.

If dates mention timezones then the application can chose the beginning
and the end of the year in some timezones other than the default.

</div>
