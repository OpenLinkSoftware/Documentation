<div id="rdfperfgeneraldbpedia" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.14. DBpedia Benchmark

</div>

</div>

</div>

We ran the DBpedia benchmark queries again with different configurations
of Virtuoso. Comparing numbers given by different parties is a constant
problem. In the case reported here, we loaded the full DBpedia 3, all
languages, with about 198M triples, onto Virtuoso v5 and Virtuoso
Cluster v6, all on the same 4 core 2GHz Xeon with 8G RAM. All databases
were striped on 6 disks. The Cluster configuration was with 4 processes
in the same box. We ran the queries in two variants:

<div class="itemizedlist">

- With graph specified in the SPARQL FROM clause, using the default
  indices.

- With no graph specified anywhere, using an alternate indexing scheme.

</div>

The times below are for the sequence of 5 queries. As there is a query
in the set that specifies no condition on S or O and only P, thus cannot
be done with the default indices With Virtuoso v5. With Virtuoso Cluster
v6 it can, because v6 is more space efficient. So we added the index:

``` programlisting
create bitmap index rdf_quad_pogs on rdf_quad (p, o, g, s);
```

<div id="id58482" class="table">

**Table 16.20. **

<div class="table-contents">

|      | Virtuoso v5 with gspo, ogps, pogs | Virtuoso Cluster v6 with gspo, ogps | Virtuoso Cluster v6 with gspo, ogps, pogs |
|------|-----------------------------------|-------------------------------------|-------------------------------------------|
| cold | 210 s                             | 136 s                               | 33.4 s                                    |
| warm | 0.600 s                           | 4.01 s                              | 0.628 s                                   |

</div>

</div>

  

Now let us do it without a graph being specified. Note that alter index
is valid for v6 or higher. For all platforms, we drop any existing
indices, and:

``` programlisting
create table r2 (g iri_id_8, s, iri_id_8, p iri_id_8, o any, primary key (s, p, o, g))
alter index R2 on R2 partition (s int (0hexffff00));

log_enable (2);
insert into r2 (g, s, p, o) SELECT g, s, p, o from rdf_quad;

drop table rdf_quad;
alter table r2 rename RDF_QUAD;
create bitmap index rdf_quad_opgs on rdf_quad (o, p, g, s) partition (o varchar (-1, 0hexffff));
create bitmap index rdf_quad_pogs on rdf_quad (p, o, g, s) partition (o varchar (-1, 0hexffff));
create bitmap index rdf_quad_gpos on rdf_quad (g, p, o, s) partition (o varchar (-1, 0hexffff));
```

The code is identical for v5 and v6, except that with v5 we use iri_id
(32 bit) for the type, not iri_id_8 (64 bit). We note that we run out of
IDs with v5 around a few billion triples, so with v6 we have double the
ID length and still manage to be vastly more space efficient.

With the above 4 indices, we can query the data pretty much in any
combination without hitting a full scan of any index. We note that all
indices that do not begin with s end with s as a bitmap. This takes
about 60% of the space of a non-bitmap index for data such as DBpedia.

If you intend to do completely arbitrary RDF queries in Virtuoso, then
chances are you are best off with the above index scheme.

<div id="id58507" class="table">

**Table 16.21. **

<div class="table-contents">

|      | Virtuoso v5 with gspo, ogps, pogs | Virtuoso Cluster v6 with gspo, ogps, pogs |
|------|-----------------------------------|-------------------------------------------|
| warm | 0.595 s                           | 0.617 s                                   |

</div>

</div>

  

The cold times were about the same as above, so not reproduced.

It is in the SPARQL spirit to specify a graph and for pretty much any
application, there are entirely sensible ways of keeping the data in
graphs and specifying which ones are concerned by queries. This is why
Virtuoso is set up for this by default.

On the other hand, for the open web scenario, dealing with an unknown
large number of graphs, enumerating graphs is not possible and questions
like which graph of which source asserts x become relevant. We have two
distinct use cases which warrant different setups of the database,
simple as that.

The latter use case is not really within the SPARQL spec, so
implementations may or may not support this.

Once the indices are right, there is no difference between specifying a
graph and not specifying a graph with the queries considered. With more
complex queries, specifying a graph or set of graphs does allow some
optimizations that cannot be done with no graph specified. For example,
bitmap intersections are possible only when all leading key parts are
given.

The best warm cache time is with v5; the five queries run under 600 ms
after the first go. This is noted to show that all-in-memory with a
single thread of execution is hard to beat.

Cluster v6 performs the same queries in 623 ms. What is gained in
parallelism is lost in latency if all operations complete in
microseconds. On the other hand, Cluster v6 leaves v5 in the dust in any
situation that has less than 100% hit rate. This is due to actual
benefit from parallelism if operations take longer than a few
microseconds, such as in the case of disk reads. Cluster v6 has
substantially better data layout on disk, as well as fewer pages to load
for the same content.

This makes it possible to run the queries without the pogs index on
Cluster v6 even when v5 takes prohibitively long.

The purpose is to have a lot of RAM and space-efficient data
representation.

For reference, the query texts specifying the graph are below. To run
without specifying the graph, just drop the FROM \<http://dbpedia.org\>
from each query. The returned row counts are indicated below each
query's text.

``` programlisting
SQL>SPARQL
SELECT ?p ?o
FROM <http://dbpedia.org>
WHERE
  {
    <http://dbpedia.org/resource/Metropolitan_Museum_of_Art> ?p ?o .
  };

p                                                                                 o
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://www.w3.org/1999/02/22-rdf-syntax-ns#type                                   http://umbel.org/umbel/ac/Artifact
http://www.w3.org/1999/02/22-rdf-syntax-ns#type                                   http://dbpedia.org/class/yago/MuseumsInNewYorkCity
http://www.w3.org/1999/02/22-rdf-syntax-ns#type                                   http://dbpedia.org/class/yago/ArtMuseumsAndGalleriesInTheUnitedStates
http://www.w3.org/1999/02/22-rdf-syntax-ns#type                                   http://dbpedia.org/class/yago/Museum103800563
..
-- 335 rows

SQL>SPARQL
PREFIX p: <http://dbpedia.org/property/>
SELECT ?film1 ?actor1 ?film2 ?actor2
FROM <http://dbpedia.org>
WHERE
  {
    ?film1 p:starring <http://dbpedia.org/resource/Kevin_Bacon> .
    ?film1 p:starring ?actor1 .
    ?film2 p:starring ?actor1 .
    ?film2 p:starring ?actor2 .
};

film1                                       actor1                                    film2                                        ctor2
VARCHAR                                     VARCHAR                                   VARCHAR                                      ARCHAR
http://dbpedia.org/resource/The_River_Wild  http://dbpedia.org/resource/Kevin_Bacon   http://dbpedia.org/resource/The_River_Wild   http://dbpedia.org/resource/Kevin_Bacon
http://dbpedia.org/resource/The_River_Wild  http://dbpedia.org/resource/Kevin_Bacon   http://dbpedia.org/resource/The_River_Wild   http://dbpedia.org/resource/Meryl_Streep
http://dbpedia.org/resource/The_River_Wild  http://dbpedia.org/resource/Kevin_Bacon   http://dbpedia.org/resource/The_River_Wild   http://dbpedia.org/resource/Joseph_Mazzello
http://dbpedia.org/resource/The_River_Wild  http://dbpedia.org/resource/Kevin_Bacon   http://dbpedia.org/resource/The_River_Wild   http://dbpedia.org/resource/David_Strathairn
http://dbpedia.org/resource/The_River_Wild  http://dbpedia.org/resource/Kevin_Bacon   http://dbpedia.org/resource/The_River_Wild   http://dbpedia.org/resource/John_C._Reilly
...
--  23910 rows

SQL>SPARQL
PREFIX p: <http://dbpedia.org/property/>
SELECT ?artist ?artwork ?museum ?director
FROM <http://dbpedia.org>
WHERE
  {
    ?artwork p:artist ?artist .
    ?artwork p:museum ?museum .
    ?museum p:director ?director
  };

artist                                          artwork                                              museum                                                                            director
VARCHAR                                         VARCHAR                                              VARCHAR                                                                           VARCHAR
_______________________________________________

http://dbpedia.org/resource/Paul_C%C3%A9zanne   http://dbpedia.org/resource/The_Basket_of_Apples     http://dbpedia.org/resource/Art_Institute_of_Chicago                              James Cuno
http://dbpedia.org/resource/Paul_Signac         http://dbpedia.org/resource/Neo-impressionism        http://dbpedia.org/resource/Art_Institute_of_Chicago                              James Cuno
http://dbpedia.org/resource/Georges_Seurat      http://dbpedia.org/resource/Neo-impressionism        http://dbpedia.org/resource/Art_Institute_of_Chicago                              James Cuno
http://dbpedia.org/resource/Edward_Hopper       http://dbpedia.org/resource/Nighthawks               http://dbpedia.org/resource/Art_Institute_of_Chicago                              James Cuno
http://dbpedia.org/resource/Mary_Cassatt        http://dbpedia.org/resource/The_Child%27s_Bath       http://dbpedia.org/resource/Art_Institute_of_Chicago                              James Cuno
..
-- 303 rows

SQL>SPARQL
PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
SELECT ?s ?homepage
FROM <http://dbpedia.org>
WHERE
  {
    <http://dbpedia.org/resource/Berlin> geo:lat ?berlinLat .
    <http://dbpedia.org/resource/Berlin> geo:long ?berlinLong .
    ?s geo:lat ?lat .
    ?s geo:long ?long .
    ?s foaf:homepage ?homepage .
    FILTER (
      ?lat        <=     ?berlinLat + 0.03190235436 &&
      ?long       >=     ?berlinLong - 0.08679199218 &&
      ?lat        >=     ?berlinLat - 0.03190235436 &&
      ?long       <=     ?berlinLong + 0.08679199218) };

s                                                                                 homepage
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/Berlin_University_of_the_Arts                         http://www.udk-berlin.de/
http://dbpedia.org/resource/Berlin_University_of_the_Arts                         http://www.udk-berlin.de/
http://dbpedia.org/resource/Berlin_Zoological_Garden                              http://www.zoo-berlin.de/en.html
http://dbpedia.org/resource/Federal_Ministry_of_the_Interior_%28Germany%29        http://www.bmi.bund.de
http://dbpedia.org/resource/Neues_Schauspielhaus                                  http://www.goya-berlin.com/
http://dbpedia.org/resource/Bauhaus_Archive                                       http://www.bauhaus.de/english/index.htm
http://dbpedia.org/resource/Canisius-Kolleg_Berlin                                http://www.canisius-kolleg.de
http://dbpedia.org/resource/Franz%C3%B6sisches_Gymnasium_Berlin                   http://www.fg-berlin.cidsnet.de
..
-- 48 rows

SQL>SPARQL
PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX p: <http://dbpedia.org/property/>
SELECT ?s ?a ?homepage
FROM <http://dbpedia.org>
WHERE
  {
    <http://dbpedia.org/resource/New_York_City> geo:lat ?nyLat .
    <http://dbpedia.org/resource/New_York_City> geo:long ?nyLong .
    ?s geo:lat ?lat .
    ?s geo:long ?long .
    ?s p:architect ?a .
    ?a foaf:homepage ?homepage .
    FILTER (
      ?lat        <=     ?nyLat + 0.3190235436 &&
      ?long       >=     ?nyLong - 0.8679199218 &&
      ?lat        >=     ?nyLat - 0.3190235436 &&
      ?long       <=     ?nyLong + 0.8679199218) };
s                                                                                 a               homepage
VARCHAR                                                                           VARCHAR              VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/GE_Building                                           http://dbpedia.org/resource/Associated_Architects              http://www.associated-architects.co.uk
http://dbpedia.org/resource/Giants_Stadium                                        http://dbpedia.org/resource/HNTB              http://www.hntb.com/
http://dbpedia.org/resource/Fort_Tryon_Park_and_the_Cloisters                     http://dbpedia.org/resource/Frederick_Law_Olmsted              http://www.asla.org/land/061305/olmsted.html
http://dbpedia.org/resource/Central_Park                                          http://dbpedia.org/resource/Frederick_Law_Olmsted              http://www.asla.org/land/061305/olmsted.html
http://dbpedia.org/resource/Prospect_Park_%28Brooklyn%29                          http://dbpedia.org/resource/Frederick_Law_Olmsted              http://www.asla.org/land/061305/olmsted.html
http://dbpedia.org/resource/Meadowlands_Stadium                                   http://dbpedia.org/resource/360_Architecture              http://oakland.athletics.mlb.com/oak/ballpark/new/faq.jsp
http://dbpedia.org/resource/Citi_Field                                            http://dbpedia.org/resource/HOK_Sport_Venue_Event              http://www.hoksve.com/
http://dbpedia.org/resource/Citigroup_Center                                      http://dbpedia.org/resource/Hugh_Stubbins_Jr.              http://www.klingstubbins.com
http://dbpedia.org/resource/150_Greenwich_Street                                  http://dbpedia.org/resource/Fumihiko_Maki              http://www.pritzkerprize.com/maki2.htm
http://dbpedia.org/resource/Freedom_Tower                                         http://dbpedia.org/resource/David_Childs              http://www.som.com/content.cfm/www_david_m_childs
http://dbpedia.org/resource/7_World_Trade_Center                                  http://dbpedia.org/resource/David_Childs              http://www.som.com/content.cfm/www_david_m_childs
http://dbpedia.org/resource/The_New_York_Times_Building                           http://dbpedia.org/resource/Renzo_Piano              http://www.rpbw.com/
http://dbpedia.org/resource/Trump_World_Tower                                     http://dbpedia.org/resource/Costas_Kondylis              http://www.kondylis.com

13 Rows. -- 2183 msec.
```

</div>
