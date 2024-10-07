<div id="rdfiridereferencing" class="section">

<div class="titlepage">

<div>

<div>

## 16.13. Linked Data

</div>

</div>

</div>

There are many cases when RDF data should be retrieved from remote
sources only when really needed. E.g., a scheduling application may read
personal calendars from personal sites of its users. Calendar data
expire quickly, so there's no reason to frequently re-load them in hope
that they are queried before expired.

Virtuoso extends SPARQL so it is possible to download RDF resource from
a given IRI, parse them and store the resulting triples in a graph, all
three operations will be performed during the SPARQL query execution.
The IRI of graph to store triples is usually equal to the IRI where the
resource is download from, so the feature is named "IRI dereferencing"
There are two different use cases for this feature. In simple case, a
SPARQL query contains <span class="emphasis">*from*</span> clauses that
enumerate graphs to process, but there are no triples in
<span class="emphasis">*DB.DBA.RDF_QUAD*</span> that correspond to some
of these graphs. The query execution starts with dereferencing of these
graphs and the rest runs as usual. In more sophisticated case, the query
is executed many times in a loop. Every execution produces a partial
result. SPARQL processor checks for IRIs in the result such that
resources with that IRIs may contain relevant data but not yet loaded
into the <span class="emphasis">*DB.DBA.RDF_QUAD*</span> . After some
iteration, the partial result is identical to the result of the previous
iteration, because there's no more data to retrieve. As the last step,
SPARQL processor builds the final result set.

<div id="rdfinputgrab" class="section">

<div class="titlepage">

<div>

<div>

### 16.13.1. IRI Dereferencing For FROM Clauses, "define get:..." Pragmas

</div>

</div>

</div>

Virtuoso extends SPARQL syntax of <span class="emphasis">*from*</span>
and <span class="emphasis">*from named*</span> clauses. It allows
additional list of options at end of clause:
<span class="emphasis">*option ( param1 value1, param2 value2, ...
)*</span> where parameter names are QNames that start with
<span class="emphasis">*get:*</span> prefix and values are "precode"
expressions, i.e. expressions that does not contain variables other than
external parameters. Names of allowed parameters are listed below.

<div class="itemizedlist">

- <span class="emphasis">*get:soft*</span>

  is the retrieval mode, supported values are "soft" and "replacing". If
  the value is "soft" then the SPARQL processor will not even try to
  retrieve triples if the destination graph is non-empty. Other

  <span class="emphasis">*get:...*</span>

  parameters are useless without this one.

- <span class="emphasis">*get:uri*</span>

  is the IRI to retrieve if it is not equal to the IRI of the

  <span class="emphasis">*from*</span>

  clause. These can be used if data should be retrieved from a mirror,
  not from original resource location or in any other case when the
  destination graph IRI differs from the location of the resource.

- ``` programlisting
  SQL>SPARQL
  define get:uri "http://example.com/dataspace/person/kidehen"
  SELECT ?id
  FROM NAMED <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
  WHERE { graph ?g { ?id a ?o } }
  LIMIT 10;

  id
  VARCHAR
  _______________________________________________________________________________

  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1231
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1231
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1243
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1243
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D

  10 Rows. -- 10 msec.
  ```

- <span class="emphasis">*get:method*</span>

  is the HTTP method that should be used to retrieve the resource,
  supported methods are "GET" for plain HTTP and "MGET" for URIQA web
  service endpoint. By default, "MGET" is used for IRIs that end with
  "/" and "GET" for everything else.

- <span class="emphasis">*get:refresh*</span>

  is the maximum allowed age of the cached resource, no matter what is
  specified by the server where the resource resides. The value is an
  positive integer (number of seconds). Virtuoso reads HTTP headers and
  uses "Date", "ETag", "Expires", "Last-Modified", "Cache-Control" and
  "Pragma: no-cache" fields to calculate when the resource should be
  reloaded, this value can become smaller due to

  <span class="emphasis">*get:refresh*</span>

  but can not be incremented.

- ``` programlisting
  SQL>SPARQL
  define get:refresh "3600"
  SELECT ?id
  FROM NAMED <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
  WHERE { graph ?g { ?id a ?o } }
  LIMIT 10;

  id
  VARCHAR
  _______________________________________________________________________________

  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1231
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1231
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1243
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1243
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D

  10 Rows. -- 10 msec.
  ```

- <span class="emphasis">*get:proxy*</span>

  address of the proxy server, as "host:port" string, if direct download
  is impossible; the default is to not use proxy.

- ``` programlisting
  SQL>SPARQL
  define get:proxy "www.openlinksw.com:80"
  define get:method "GET"
  define get:soft "soft"
  SELECT ?id
  FROM NAMED <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
  WHERE { graph ?g { ?id a ?o } }
  LIMIT 10;

  id
  VARCHAR
  _______________________________________________________________________________

  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1231
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1231
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1243
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1243
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1261
  http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D
  http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D

  10 Rows. -- 10 msec.
  SQL> limit 10;
  ```

- If a value of some <span class="emphasis">*get:...*</span> parameter
  repeats for every <span class="emphasis">*from*</span> clause then it
  can be written as a global pragma like <span class="emphasis">*define
  get:soft "soft"*</span> . The following two queries will work
  identically:

  ``` programlisting
  SQL>SPARQL
  SELECT ?id
  FROM NAMED <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
    OPTION (get:soft "soft", get:method "GET")
  FROM NAMED <http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/sioc.ttl>
    OPTION (get:soft "soft", get:method "GET")
  WHERE { graph ?g { ?id a ?o } }
  LIMIT 10;

  id
  VARCHAR
  _______________________________________________________________________________

  http://www.openlinksw.com/dataspace/person/oerling#this
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/958
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/958
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/949
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/949

  10 Rows. -- 862 msec.
  ```

- ``` programlisting
  SQL>SPARQL
  define get:method "GET"
  define get:soft "soft"
  SELECT ?id
  FROM NAMED <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
  FROM NAMED <http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/sioc.ttl>
  WHERE { graph ?g { ?id a ?o } }
  LIMIT 10;

  id
  VARCHAR
  _______________________________________________________________________________

  http://www.openlinksw.com/dataspace/person/oerling#this
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/958
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/958
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/949
  http://www.openlinksw.com/dataspace/oerling/weblog/Orri%20Erling%27s%20Blog/949

  10 Rows. -- 10 msec.
  ```

- It can make text shorter and it is especially useful when the query
  text comes from client but the parameter should have a fixed value due
  to security reasons: the values set by <span class="emphasis">*define
  get:...*</span> can not be redefined inside the query and the
  application may prevent the text with desired pragmas before the
  execution.

  Note that the user should have
  <span class="emphasis">*SPARQL_UPDATE*</span> role in order to execute
  such a query. By default SPARQL web service endpoint is owned by
  <span class="emphasis">*SPARQL*</span> user that have
  <span class="emphasis">*SPARQL_SELECT*</span> but not
  <span class="emphasis">*SPARQL_UPDATE*</span> . It is possible in
  principle to grant <span class="emphasis">*SPARQL_UPDATE*</span> to
  <span class="emphasis">*SPARQL*</span> but this breaches the whole
  security of the RDF storage.

- <span class="emphasis">*FROM CLAUSE with options*</span>

  : options in OPTION() list should be delimited with commas. grab
  options are not allowed as they are global for the query. Only
  specific 'get:xxx' options are useful here.

- ``` programlisting
  SQL>SPARQL
  PREFIX foaf: <http://xmlns.com/foaf/0.1/>
  SELECT DISTINCT ?friend
  FROM NAMED  <http://example.com/dataspace/person/kidehen>
  OPTION (get:soft "soft", get:method "GET")
  WHERE
    {
        <http://example.com/dataspace/person/kidehen#this> foaf:knows
  ?friend .
    };
  friend
  VARCHAR
  _______________________________________________________________________________

  http://www.dajobe.org/foaf.rdf#i
  http://www.w3.org/People/Berners-Lee/card#i
  http://www.w3.org/People/Connolly/#me
  http://my.opera.com/chaals/xml/foaf#me
  http://www.w3.org/People/Berners-Lee/card#amy
  http://www.w3.org/People/EM/contact#me
  http://example.com/dataspace/person/ghard#this
  http://example.com/dataspace/person/omfaluyi#this
  http://example.com/dataspace/person/alanr#this
  http://example.com/dataspace/person/bblfish#this
  http://example.com/dataspace/person/danja#this
  http://example.com/dataspace/person/tthibodeau#this
  ...
  36 Rows. -- 1693 msec.
  ```

</div>

</div>

</div>
