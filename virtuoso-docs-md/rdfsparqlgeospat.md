<div id="rdfsparqlgeospat" class="section">

<div class="titlepage">

<div>

<div>

## 16.15. RDF and Geometry

</div>

</div>

</div>

A geometry may occur as an object of an RDF quad. The SQL MM functions
can then be used for geospatial queries.

For geometry functions, see the
<a href="sqlrefgeospatial.html" class="link"
title="9.34. Geometry Data Types and Spatial Index Support">SQL Geometry
support section</a> .

A geometry may occur as an object value in an RDF quad. In such a case,
the bare geometry object is not used but instead a special RDF typed
literal is made with the type virtrdf:Geometry. Such a literal is
automatically indexed in an R tree index containing all distinct
geometries occurring in any quad of any graph under any predicate.
Normally, WGS84, SRID 4326 is the SRID of any such geometry.

In this section, the geo namespace prefix is used to mean
\<http://www.w3.org/2003/01/geo/wgs84_pos#\>.

The preferred way of adding geometries to RDF graphs is with the ttlp
and related functions which parse a text string in the Turtle syntax and
insert the result in a graph.

For example:

``` programlisting
ttlp ('@prefix virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
<point> geo:geometry "point(1.2 22.4"^^virtrdf:Geometry .',
'xxx', 'graph');
```

A typed literal whose text is a WKT representation of a geometry and
whose type is virtrdf:geometry creates a geometry object and adds it to
the R tree index of all RDF geometries.

Geometries can be queried with geometry predicates, st_intersects,
st_contains and st_within, as follows. As usual, the bif: namespace is
used since these are SQL built-in functions.

``` programlisting
SQL>
SPARQL
SELECT ?c COUNT (*)
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a ?c .
    FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 100))
  }
GROUP BY ?c
ORDER BY DESC 2;

c                                               callret-1
VARCHAR                                             VARCHAR
____________________________________________________________
http://linkedgeodata.org/vocabulary#node        2317684
http://linkedgeodata.org/vocabulary#way         85315
http://linkedgeodata.org/vocabulary#building        14257
http://dbpedia.org/class/yago/Landmark108624891     9093
http://linkedgeodata.org/vocabulary#wood        7155
http://linkedgeodata.org/vocabulary#gate        7079
http://www.w3.org/2002/07/owl#Thing                 6788
http://linkedgeodata.org/vocabulary#post_box        6144
http://linkedgeodata.org/vocabulary#pub         5697
http://dbpedia.org/ontology/Place               5670
http://linkedgeodata.org/vocabulary#hedge       5391
...
```

This would return the classes of things within 100 km of 0, 52, which is
near London.

``` programlisting
SQL>
SPARQL
SELECT ?m (bif:st_distance (?geo, bif:st_point (0, 52)))
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a <http://dbpedia.org/ontology/City> .
    FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 30))
  }
ORDER BY DESC 2
LIMIT 20;

m                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            39.13180985471543
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            39.13180985471543
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            39.13180985471543
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            39.13180985471543
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            37.36907252285992
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            34.49432513061792
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            33.7676326404143
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            33.24238654570499
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            32.60139660515003
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            32.60139660515003
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            32.17414911350438
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            31.45681319171456
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            31.17750625349044
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            31.115377038
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            31.115377038
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            30.56388658524301
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            29.89662974046085
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            29.85090625132639
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            29.82605254366244
http://dbpedia.org/resource/Kingston%2C_Cambridgeshire                            29.60102064794003

20 Rows. -- 13600 msec.
```

This would be the cities within 20 km of 0, 52, ordered by increasing
distance from this point.

When SPARQL is called from SQL, the geometries can be bound to SQL
variables as anything else returned from SPARQL. The
<span class="emphasis">*st\_*</span> functions can then be used for
retrieving properties of these objects.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point</code></a></p>
<p><a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x</code></a></p>
<p><a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y</code></a></p>
<p><a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance</code></a></p>
<p><a href="fn_st_srid.html" class="link" title="ST_SRID"><code
class="function">ST_SRID</code></a></p>
<p><a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">ST_SetSRID</code></a></p>
<p><a href="fn_st_astext.html" class="link" title="st_astext"><code
class="function">st_astext</code></a></p>
<p><a href="fn_st_geomfromtext.html" class="link"
title="st_geomfromtext"><code
class="function">st_geomfromtext</code></a></p>
<p><a href="fn_st_contains.html" class="link" title="st_contains"><code
class="function">st_contains</code></a></p>
<p><a href="fn_st_intersects.html" class="link"
title="st_intersects"><code
class="function">st_intersects</code></a></p>
<p><a href="fn_st_within.html" class="link" title="st_within"><code
class="function">st_within</code></a></p>
<p><a href="fn_isgeometry.html" class="link" title="isgeometry"><code
class="function">isgeometry</code></a></p>
<p><a href="fn_geo_insert.html" class="link" title="geo_insert"><code
class="function">geo_insert</code></a></p>
<p><a href="fn_geo_delete.html" class="link" title="geo_delete"><code
class="function">geo_delete</code></a></p></td>
</tr>
</tbody>
</table>

</div>

<div id="rdfsparqlgeospatprog" class="section">

<div class="titlepage">

<div>

<div>

### 16.15.1. Programmatic Manipulation of Geometries in RDF

</div>

</div>

</div>

The <a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">ttlp</code></a> function is the preferred way of
inserting geometries. The more are inserted at one time, the more
efficient the operation is. This loader function will also deal with
cluster message optimization.

For deleting quads with geometries, normal
<a href="rdfsparql.html#rdfsparqlimplementationextent" class="link"
title="16.2.1. SPARQL Implementation Details">SPARUL operations</a>
apply.

A geometry occurring in an RDF quad object is a member of the RDF box
data type. This data type stands for a typed RDF literal. The type of
all geometries is 256. This is mapped to a URI in the RDF_DATATYPE
system table.

A geometry does not occur directly in the object position of a quad. It
is referenced by an id that is stored in the RDF typed literal box and
references RO_ID of the RDF_OBJ system table. To translate a geometry
into a RDF box that can be stored, do as in the example below:

``` programlisting
INSERT INTO RDF_QUAD (g, s, p, o)
VALUES (
         "g",
         "s",
         iri_to_id ('http://www.w3.org/2003/01/geo/wgs84_pos#geometry'),
         DB.DBA.rdf_geo_add (rdf_box (st_point (lng, lat), 256, 257, 0, 1)));
```

The DB.DBA.RDF_GEO_ADD function looks if an identical geometry already
exists and if so assigns the existing id to it. If the geometry is new,
it gets a new ID and is stored in the RDF literals table RDF_OBJ. At
this time it is also automatically inserted into the RDF geometry index.

In a cluster situation one should use the dpipe mechanism for inserting
into RDF quad so as to get large numbers of inserts into a single
message. This is essential for performance.

</div>

</div>
