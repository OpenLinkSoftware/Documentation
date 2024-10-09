<div>

<div>

<div>

<div>

### 16.13.2. IRI Dereferencing For Variables, "define input:grab-..." Pragmas

</div>

</div>

</div>

Consider a set of personal data such that one resource can list many
persons and point to resources where that persons are described in more
details. E.g. resource about <span class="emphasis">*user1*</span>
describes the user and also contain statements that
<span class="emphasis">*user2*</span> and
<span class="emphasis">*user3*</span> are persons and more data can be
found in <span class="emphasis">*user2.ttl*</span> and
<span class="emphasis">*user3.ttl*</span> ,
<span class="emphasis">*user3.ttl*</span> can contain statements that
<span class="emphasis">*user4*</span> is also person and more data can
be found in <span class="emphasis">*user4.ttl*</span> and so on. The
query should find as many users as it is possible and return their names
and e-mails.

If all data about all users were loaded into the database, the query
could be quite simple:

``` programlisting
SQL>SPARQL
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT ?id ?firstname ?nick
where
  {
    graph ?g
      {
        ?id rdf:type foaf:Person.
        ?id foaf:firstName ?firstname.
        ?id foaf:knows ?fn .
        ?fn foaf:nick ?nick.
      }
   }
limit 10;

id                                                      firstname  nick
VARCHAR                                                 VARCHAR    VARCHAR
_______________________________________________________________________________

http://example.com/dataspace/person/pmitchell#this   LaRenda    sdmonroe
http://example.com/dataspace/person/pmitchell#this   LaRenda    kidehen{at}openlinksw.com
http://example.com/dataspace/person/pmitchell#this   LaRenda    alexmidd
http://example.com/dataspace/person/abm#this         Alan       kidehen{at}openlinksw.com
http://example.com/dataspace/person/igods#this       Cameron    kidehen{at}openlinksw.com
http://example.com/dataspace/person/goern#this       Christoph  captsolo
http://example.com/dataspace/person/dangrig#this     Dan        rickbruner
http://example.com/dataspace/person/dangrig#this     Dan        sdmonroe
http://example.com/dataspace/person/dangrig#this     Dan        lszczepa
http://example.com/dataspace/person/dangrig#this     Dan        kidehen

10 Rows. -- 80 msec.
```

It is possible to enable IRI dereferencing in such a way that all
appropriate resources are loaded during the query execution even if
names of some of them are not known a priori.

``` programlisting
SQL>SPARQL
  define input:grab-var "?more"
  define input:grab-depth 10
  define input:grab-limit 100
  define input:grab-base "http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300"
  prefix foaf: <http://xmlns.com/foaf/0.1/>
  prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
  prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?id ?firstname ?nick
WHERE {
    graph ?g {
               ?id rdf:type foaf:Person.
               ?id foaf:firstName ?firstname.
               ?id foaf:knows ?fn .
               ?fn foaf:nick ?nick.
               OPTIONAL { ?id rdfs:SeeAlso ?more }
            }
}
LIMIT 10;

id                                                         firstname  nick
VARCHAR                                                    VARCHAR    VARCHAR
_______________________________________________________________________________

http://example.com/dataspace/person/ghard#this          Yrj+?n+?   kidehen
http://inamidst.com/sbp/foaf#Sean                          Sean       d8uv
http://example.com/dataspace/person/dangrig#this        Dan        rickbruner
http://example.com/dataspace/person/dangrig#this        Dan        sdmonroe
http://example.com/dataspace/person/dangrig#this        Dan        lszczepa
http://example.com/dataspace/person/dangrig#this        Dan        kidehen
http://captsolo.net/semweb/foaf-captsolo.rdf#Uldis_Bojars  Uldis      mortenf
http://captsolo.net/semweb/foaf-captsolo.rdf#Uldis_Bojars  Uldis      danja
http://captsolo.net/semweb/foaf-captsolo.rdf#Uldis_Bojars  Uldis      zool
http://example.com/dataspace/person/rickbruner#this     Rick       dangrig

10 Rows. -- 530 msec.
```

The IRI dereferencing is controlled by the following pragmas:

<div>

- <span class="emphasis">*input:grab-var*</span>

  specifies a name of variable whose values should be used as IRIs of
  resources that should be downloaded. It is not an error if the
  variable is sometimes unbound or gets values that can not be converted
  to IRIs (e.g., integers) -- bad values are silently ignored. It is
  also not an error if the IRI can not be retrieved, this makes IRI
  retrieval somewhat similar to "best effort union" in SQL. This pragma
  can be used more than once to specify many variable names. It is not
  an error if values of different variables result in same IRI or a
  variable gets same value many times -- no one IRI is retrieved more
  than once.

- <span class="emphasis">*input:grab-iri*</span>

  specifies an IRI that should be retrieved before executing the rest of
  the query, if it is not in the

  <span class="emphasis">*DB.DBA.RDF_QUAD*</span>

  already. This pragma can be used more than once to specify many IRIs.
  The typical use of this pragma is querying a set of related resources
  when only one "root" resource IRI is known but even that resource is
  not loaded.

- ``` programlisting
  SQL>SPARQL
    define input:storage ""
    define input:grab-iri <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
    define input:grab-var "id"
    define input:grab-depth 10
    define input:grab-limit 100
    define input:grab-base "http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300"
  SELECT ?id
  WHERE { graph ?g { ?id a ?o } }
  LIMIT 10;

  id
  VARCHAR
  _______________________________________________________________________________

  http://example.com/virtrdf-data-formats#default-iid
  http://example.com/virtrdf-data-formats#default-iid-nullable
  http://example.com/virtrdf-data-formats#default-iid-nonblank
  http://example.com/virtrdf-data-formats#default-iid-nonblank-nullable
  http://example.com/virtrdf-data-formats#default
  http://example.com/virtrdf-data-formats#default-nullable
  http://example.com/virtrdf-data-formats#sql-varchar
  http://example.com/virtrdf-data-formats#sql-varchar-nullable
  http://example.com/virtrdf-data-formats#sql-longvarchar
  http://example.com/virtrdf-data-formats#sql-longvarchar-nullable

  10 Rows. -- 530 msec.
  ```

- <span class="emphasis">*input:grab-all*</span>

  is the simplest possible way to enable the feature but the resulting
  performance can be very bad. It turns all variables and IRI constants
  in all graph, subject and object fields of all triple patterns of the
  query into values for

  <span class="emphasis">*input:grab-var*</span>

  and

  <span class="emphasis">*input:grab-iri*</span>

  , so the SPARQL processor will dereference everything what might be
  related to the text of the query.

- ``` programlisting
  SQL>SPARQL
    define input:grab-all "yes"
    define input:grab-depth 10
    define input:grab-limit 100
    define input:grab-base "http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300"
    prefix foaf: <http://xmlns.com/foaf/0.1/>
    prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
  SELECT ?id ?firstname ?nick
  where
    {
      graph ?g
       {
         ?id rdf:type foaf:Person.
         ?id foaf:firstName ?firstname.
         ?id foaf:knows ?fn .
         ?fn foaf:nick ?nick.
       }
    }
  limit 10;

  id                                                      firstname   nick
  VARCHAR                                                 VARCHAR     VARCHAR
  ____________________________________________________________________

  http://example.com/dataspace/person/pmitchell#this   LaRenda     sdmonroe
  http://example.com/dataspace/person/pmitchell#this   LaRenda     kidehen{at}openlinksw.com
  http://example.com/dataspace/person/pmitchell#this   LaRenda     alexmidd
  http://example.com/dataspace/person/abm#this         Alan        kidehen{at}openlinksw.com
  http://example.com/dataspace/person/igods#this       Cameron     kidehen{at}openlinksw.com
  http://example.com/dataspace/person/goern#this       Christoph   captsolo
  http://example.com/dataspace/person/dangrig#this     Dan         rickbruner
  http://example.com/dataspace/person/dangrig#this     Dan         sdmonroe
  http://example.com/dataspace/person/dangrig#this     Dan         lszczepa
  http://example.com/dataspace/person/dangrig#this     Dan         kidehen

  10 Rows. -- 660 msec.
  ```

- <span class="emphasis">*input:grab-seealso*</span>

  (and synonym

  <span class="emphasis">*input:grab-follow-predicate*</span>

  ) specifies an IRI of an predicate similar to foaf:seeAlso. Predicates
  of that sort suggest location of resources that contain more data
  about predicate subject. The IRI dereferencing routine may use these
  predicates to find additional IRIs for loading resources. This is
  especially useful when the text of the query comes from remote client
  and may lack triple patterns like

  <span class="emphasis">*optional { ?id \<SeeAlso\> ?more }*</span>

  from the previous example. The use of

  <span class="emphasis">*input:grab-seealso*</span>

  makes the SPARQL query nondeterministic, because the order and the
  number of retrieved documents will depend on execution plan and they
  may change from run to run. This pragma can be used more than once to
  specify many IRIs, but this feature is costly. Every additional
  predicate may result in significant number of lookups in the RDF
  storage, affecting total execution time.

- ``` programlisting
  SQL>SPARQL
    define input:grab-iri <http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl>
    define input:grab-var "id"
    define input:grab-depth 10
    define input:grab-limit 100
    define input:grab-base "http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300"
    define input:grab-seealso <foaf:maker>
      prefix foaf: <http://xmlns.com/foaf/0.1/>
  SELECT ?id
  where
    {
      graph ?g
        {
          ?id a foaf:Person .
        }
    }
  limit 10;

  id
  VARCHAR
  _______________________________________________________________________________

  mailto:somebody@example.domain
  http://example.com/dataspace/person/dav#this
  http://example.com/dataspace/person/dba#this
  mailto:2@F.D
  http://example.com/dataspace/person/test1#this
  http://www.openlinksw.com/blog/~kidehen/gems/rss.xml#Kingsley%20Uyi%20Idehen
  http://digitalmusic.weblogsinc.com/rss.xml#
  http://partners.userland.com/nytrss/books.xml#
  http://partners.userland.com/nytrss/arts.xml#

  9 Rows. -- 105 msec.
  ```

- <span class="emphasis">*input:grab-limit*</span>

  should be an integer that is a maximum allowed number of resource
  retrievals. The default value is pretty big (few millions of
  documents) so it is strongly recommended to set smaller value. Set it
  even if you're absolutely sure that the set of resources is small,
  because program errors are always possible. All resource downloads are
  counted, both successful and failed, both forced by

  <span class="emphasis">*input:grab-iri*</span>

  and forced by

  <span class="emphasis">*input:grab-var*</span>

  . Nevertheless, all constant IRIs specified by

  <span class="emphasis">*input:grab-iri*</span>

  (or

  <span class="emphasis">*input:grab-all*</span>

  ) are downloaded before the first check of the

  <span class="emphasis">*input:grab-limit*</span>

  counter, so this limit will never prevent from downloading "root"
  resources.

- <span class="emphasis">*input:grab-depth*</span>

  should be an integer that is a maximum allowed number of query
  iterations. Every iteration may find new IRIs to retrieve, because
  resources loaded on previous iteration may add these IRIs to

  <span class="emphasis">*DB.DBA.RDF_QUAD*</span>

  and make result set longer. The default value is 1, so the SPARQL
  processor will retrieve only resources explicitly named in "root"
  resources or in quad that are in the database before the query
  execution.

- <span class="emphasis">*input:grab-base*</span>

  specifies a base IRI used to convert relative IRIs into absolute. The
  default is an empty string.

- ``` programlisting
  SQL>SPARQL
    define input:grab-depth 10
    define input:grab-limit 100
    define input:grab-var "more"
    define input:grab-base "http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300"
    prefix foaf: <http://xmlns.com/foaf/0.1/>
  SELECT ?id
  where
    {
      graph ?g
       {
         ?id a foaf:Person .
         optional { ?id foaf:maker ?more }
       }
    }
  limit 10;

  id
  VARCHAR
  _______________________________________________________________________________

  mailto:somebody@example.domain
  http://example.com/dataspace/person/dav#this
  http://example.com/dataspace/person/dba#this
  mailto:2@F.D
  http://example.com/dataspace/person/test1#this
  http://www.openlinksw.com/blog/~kidehen/gems/rss.xml#Kingsley%20Uyi%20Idehen
  http://digitalmusic.weblogsinc.com/rss.xml#
  http://partners.userland.com/nytrss/books.xml#
  http://partners.userland.com/nytrss/arts.xml#

  9 Rows. -- 115 msec.
  ```

- <span class="emphasis">*input:grab-resolver*</span>

  is a name of procedure that resolve IRIs and determines the HTTP
  method of retrieval. The default is name of

  <span class="emphasis">*DB.DBA.RDF_GRAB_RESOLVER_DEFAULT()*</span>

  procedure that is described below. If other procedure is specified,
  the signature should match to the default one.

- <span class="emphasis">*input:grab-destination*</span>

  is to override the default behaviour of the IRI dereferencing and
  store all retrieved triples in a single graph. This is convenient when
  there's no logical difference where any given triple comes from, and
  changes in remote resources will only add triples but not make cached
  triples obsolete. A SPARQL query is usually faster when all graph IRIs
  are fixed and there are no graph group patterns with an unbound graph
  variable, so storing everything in one single graph is worth
  considering.

- <span class="emphasis">*input:grab-loader*</span>

  is a name of procedure that retrieve the resource via HTTP, parse it
  and store it. The default is name of

  <span class="emphasis">*DB.DBA.RDF_SPONGE_UP()*</span>

  procedure; this procedure also used by IRI dereferencing for FROM
  clauses. You will probably never need to write your own procedure of
  this sort but some Virtuoso plugins will provide ready-to-use
  functions that will retrieve non-RDF resources and extract their
  metadata as triples or will implement protocols other than HTTP.

</div>

Default resolver procedure is
<span class="emphasis">*DB.DBA.RDF_GRAB_RESOLVER_DEFAULT()*</span> .
Note that the function produce two absolute URIs,
<span class="emphasis">*abs_uri*</span> and
<span class="emphasis">*dest_uri*</span> . Default procedure returns two
equal strings, but other may return different values, e.g., return
primary and permanent location of the resource as
<span class="emphasis">*dest_uri*</span> and the fastest known mirror
location as <span class="emphasis">*abs_uri*</span> thus saving HTTP
retrieval time. It can even signal an error to block the downloading of
some unwanted resource.

``` programlisting
DB.DBA.RDF_GRAB_RESOLVER_DEFAULT (
  in base varchar,         -- base IRI as specified by input:grab-base pragma
  in rel_uri varchar,      -- IRI of the resource as it is specified by input:grab-iri or a value of a variable
  out abs_uri varchar,     -- the absolute IRI that should be downloaded
  out dest_uri varchar,    -- the graph IRI where triples should be stored after download
  out get_method varchar ) -- the HTTP method to use, should be "GET" or "MGET".
```

</div>
