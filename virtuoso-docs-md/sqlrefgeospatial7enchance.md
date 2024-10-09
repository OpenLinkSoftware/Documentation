<div>

<div>

<div>

<div>

### 9.34.9. Virtuoso 7.1+ Geo Spatial Data type and function enhancements

</div>

</div>

</div>

As of Virtuoso 7.1+ (open source and commercial) a number of major
enhancements in Geo Spatial support have been made to improve the
Geometry data types and functions supported, as well as improve
compliance with the emerging
<a href="http://www.geosparql.org/" class="ulink"
target="_top">GeoSPARQL</a> and
<a href="http://www.opengeospatial.org/" class="ulink"
target="_top">OGC</a> standards.

<div>

<div>

<div>

<div>

#### Virtuoso Geo Spatial Geometry data types and sample queries

</div>

</div>

</div>

The table below outlines the common WKT (Well Known Text)
representations for several types of geometric objects used in RDF:

<div>

<div>

**Figure 9.1. Geo Spatial Geometry Data Types**

<div>

<div>

![Geo Spatial Geometry Data Types](images/ui/geosptypes.png)

</div>

</div>

</div>

  

</div>

The following queries "counts the number of items of each type whose
coordinates fall within a bounded box shape" for the various RDF
geometry data types now supported by Virtuoso. The links are to live
examples of the query running against the OpenLink LOD Cloud Server
instance.

<div>

<div>

<div>

<div>

##### BOX

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
   ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
   ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
   FILTER(bif:st_intersects(bif:st_geomfromtext("BOX(0.3412 43.5141, 9.3412 48.0141)"), ?p))
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1gwmvTC" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/1hKj6pE" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### POLYGON

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "POLYGON((1 2, 6 1, 9 3, 8 5, 3 6, 1 2))" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1hp78Nw" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/1cg1qKK" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### POLYGON WITH HOLE

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "POLYGON((1 2, 6 1, 9 3, 8 5, 3 6, 1 2), (3 3, 5 5, 6 2, 3 3))" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1gwmJtN" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/1bEEeLg" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### MULTIPOLYGON

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "MULTIPOLYGON(((1 2, 6 1, 9 3, 3 6, 1 2)), ((4 9, 7 6, 9 8, 4 9)))" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1jtEBIL" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/OtlPqJ" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### GEOMETRY COLLECTION

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "GEOMETRYCOLLECTION( POINT(4 5), POINT(7 4), POINT(6 2), LINESTRING(4 5, 6 7, 7 4, 6 2), POLYGON((1 2, 6 1, 9 3, 8 5, 3 6, 1 2)) )" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1h5pYuF" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/OtlYdH" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### MULTI POINT

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "MULTIPOINT(3 7, 4 2, 8 6)" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1piJibH" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/Otm1pR" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### LINE STRING

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "LINESTRING(1 2, 3 6, 9 4)" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1piJwQ6" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/1h5qfhh" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### MULTI LINE STRING

</div>

</div>

</div>

``` programlisting
SELECT ?f AS ?facet COUNT(?s) AS ?cnt
FROM <http://linkedgeodata.org>
WHERE
  {
    ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
    ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
    FILTER( bif:st_intersects( bif:st_geomfromtext( "MULTILINESTRING((1 8, 4 4), (4 9, 8 5, 6 2, 1 4))" ), ?p ) )
  }
GROUP BY ?f
ORDER BY DESC(?cnt)
LIMIT 10
```

<div>

- <a href="http://bit.ly/1leUyWc" class="ulink" target="_top">View the
  SPARQL Query Definition via SPARQL Protocol URL;</a>

- <a href="http://bit.ly/1bEHcza" class="ulink" target="_top">View the
  SPARQL Query Results via SPARQL Protocol URL</a>

</div>

</div>

<div>

<div>

<div>

<div>

##### Supported types of shapes

</div>

</div>

</div>

``` programlisting
BOX, BOX2D, BOX3D, BOXM, BOXZ, BOXZM
CIRCULARSTRING
COMPOUNDCURVE
CURVEPOLYGON
EMPTY
GEOMETRYCOLLECTION, GEOMETRYCOLLECTIONM, GEOMETRYCOLLECTIONZ,
GEOMETRYCOLLECTIONZM
LINESTRING, LINESTRINGM, LINESTRINGZ, LINESTRINGZM
MULTICURVE
MULTILINESTRING, MULTILINESTRINGM, MULTILINESTRINGZ, MULTILINESTRINGZM
MULTIPOINT, MULTIPOINTM, MULTIPOINTZ, MULTIPOINTZM
MULTIPOLYGON, MULTIPOLYGONM, MULTIPOLYGONZ, MULTIPOLYGONZM
POINT, POINTM, POINTZ, POINTZM
POLYGON, POLYGONM, POLYGONZ, POLYGONZM
POLYLINE, POLYLINEZ
RING, RINGM, RINGZ, RINGZM
```

</div>

<div>

<div>

<div>

<div>

##### Not yet supported types

</div>

</div>

</div>

``` programlisting
CIRCULARSTRINGM, CIRCULARSTRINGZ, CIRCULARSTRINGZM
COMPOUNDCURVEM, COMPOUNDCURVEZ, COMPOUNDCURVEZM
CURVE, CURVEM, CURVEZ, CURVEZM
CURVEPOLYGONM, CURVEPOLYGONZ, CURVEPOLYGONZM
GEOMETRY, GEOMETRYZ, GEOMETRYZM
MULTICURVEM, MULTICURVEZ, MULTICURVEZM
MULTIPATCH
MULTISURFACE, MULTISURFACEM, MULTISURFACEZ, MULTISURFACEZM
POLYHEDRALSURFACE, POLYHEDRALSURFACEM, POLYHEDRALSURFACEZ,
POLYHEDRALSURFACEZM
POLYLINEM
SURFACE, SURFACEM, SURFACEZ, SURFACEZM
TIN, TINM, TINZ, TINZM
```

</div>

</div>

<div>

<div>

<div>

<div>

#### Virtuoso Geo Spatial geometry functions

</div>

</div>

</div>

The following Virtuoso Geo Spatial geometry functions are available for
use in both SQL and RDF Geo Spatial queries. The listed functions are
built-in SQL functions. As all built-in functions of Virtuoso,
geo-specific functions can be called from SPARQL with prefix `bif:` .
For example:

``` programlisting
bif:earth_radius()
etc.
```

<div>

- <a href="fn_earth_radius.html" class="link" title="earth_radius"><code
  class="function">earth_radius()</code></a> : returns geom.mean of
  radius of Earth in kilometers, 6367.43568

- <a href="fn_haversine_deg_km.html" class="link"
  title="haversine_deg_km"><code
  class="function">haversine_deg_km (lat1, long1, lat2, long2)</code></a>
  : returns distance between two points on Earth sphere, adjusting
  radius of sphere to latitudes.

- <a href="fn_dist_from_point_to_line_segment.html" class="link"
  title="dist_from_point_to_line_segment"><code
  class="function">dist_from_point_to_line_segment (Xpoint, Ypoint, Xsegment1, Ysegment1,Xsegment2, Ysegment2)</code></a>
  : returns the distance between a point and a segment on a plane.

- <a href="fn_st_point.html" class="link" title="st_point"><code
  class="function">st_point</code></a> : returns a point with given
  coordinates in default SRID. z and/or m may be missing or equal to
  NULL, indicating the absence of co-ordinate.

- <a href="fn_st_linestring.html" class="link" title="st_linestring"><code
  class="function">st_linestring (item1, item2,..., itemN)</code></a> :
  returns a linestring in default SRID, the coordinates of vertices are
  specified by arguments that are points, 2-, 3- or 4-item vectors of
  coordinates, linestrings, arcstrings or vectors of the above mentioned
  values. Repeating vertices are automatically removed, except the case
  of repeating vertices in the middle of a linestring/arcstring
  argument.

- <a href="fn_st_x.html" class="link" title="st_x"><code
  class="function">st_x()</code></a> : returns X or longitude of a
  point.

- <a href="fn_st_y.html" class="link" title="st_y"><code
  class="function">st_y()</code></a> : returns X or longitude of a
  point.

- <a href="fn_st_xmin.html" class="link" title="ST_XMin"><code
  class="function">ST_XMin (shape)</code></a> ,

  <a href="fn_st_ymin.html" class="link" title="ST_YMin"><code
  class="function">ST_YMin (shape)</code></a> ,

  <a href="fn_st_xmax.html" class="link" title="ST_XMax"><code
  class="function">ST_XMax (shape)</code></a> ,

  <a href="fn_st_ymax.html" class="link" title="ST_YMax"><code
  class="function">ST_YMax (shape)</code></a> : return boundaries of a
  bounding box around a shape. Bounding boxes around arcs are calculated
  in assumption that no one arc is longer than a half of full circle.

- <a href="fn_st_intersects.html" class="link" title="st_intersects"><code
  class="function">st_intersects (shape1, shape2 [, proximity]) </code></a>
  : checks whether two shapes intersect or some of its points are within
  the specified proximity. Current version is not complete and does not
  support arcs of all sorts and rings of polygons, this is fixed in the
  next release.

- `st_may_intersect (shape1, shape2 [, proximity])` : checks whether
  bounding boxes of two shapes intersect or some of its points are
  within the specified proximity. This is much faster than full

  <a href="fn_st_intersects.html" class="link" title="st_intersects"><code
  class="function">st_intersects()</code></a> check (actually that is
  the initial part of

  <a href="fn_st_intersects.html" class="link" title="st_intersects"><code
  class="function">st_intersects()</code></a> execution)

- <a href="fn_st_contains.html" class="link" title="st_contains"><code
  class="function">(haystack_shape, needle_shape [, proximity])</code></a>
  :

- <a href="fn_st_within.html" class="link" title="st_within"><code
  class="function">st_within (needle_shape, haystack_shape [, proximity]) </code></a>
  : checks whether `haystack_shape` contains the `needle_shape` . If
  proximity is specified, it is treated as an extra wide border around
  `haystack_shape` . In current version, only a combination of bounding
  box and a point is supported, the functionality will be extended in
  the next release.

- <a href="fn_st_distance.html" class="link" title="st_distance"><code
  class="function">st_distance (shape1, shape2)</code></a> : returns the
  distance in units of plane or in kilometers on sphere.

- <a href="fn_isgeometry.html" class="link" title="isgeometry"><code
  class="function">isgeometry (v) </code></a> : returns whether the
  given v is a spatial object.

- <a href="fn_st_astext.html" class="link" title="st_astext"><code
  class="function">st_astext (shape)</code></a> : returns EWKT
  representation of a shape.

- <a href="fn_st_srid.html" class="link" title="ST_SRID"><code
  class="function">ST_SRID (shape)</code></a> : returns SRID of shape's
  spatial reference system or 0 for shape on plane.

- <a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
  class="function">ST_SetSRID (shape, new_srid)</code></a> : replaces
  the SRID of a shape but does not transform the shape or its
  coordinates from old SRID to a new one.

- <a href="fn_st_geomfromtext.html" class="link"
  title="st_geomfromtext"><code
  class="function">st_geomfromtext (ewkt_text)</code></a> : Parses the
  string and returns the corresponding geometry.

- <a href="fn_st_ewkt_read.html" class="link" title="st_ewkt_read"><code
  class="function">st_ewkt_read (ewkt_text)</code></a> : Parses the
  giwen text as a EWKT and returns the parsed shape.

- <a href="fn_http_st_ewkt.html" class="link" title="http_st_ewkt"><code
  class="function">http_st_ewkt (shape, ses)</code></a> : Writes a EWKT
  representation of a shape to the given session, a fast replacement for

  <a href="fn_st_astext.html" class="link" title="st_astext"><code
  class="function">st_astext (shape)</code></a> .

- <a href="fn_http_st_dxf_entity.html" class="link"
  title="http_st_dxf_entity"><code
  class="function">http_st_dxf_entity (shape, attrs, ses)</code></a> :
  writes a DXF (Data Exchange Format) representation of shape into the
  given output session.Attrs is a vector of arbitrary DXF properties in
  form (tag1, value1, tag2, value2...) where tags are integer codes
  according to DXF specification, related values are not validated and
  printed to the session as is. Current version does not support
  ARCSTRINGs, CURVEs and CURVEPOLYGONs. If shape is null, the function
  returns without writing anything to the shape.

- <a href="fn_st_get_bounding_box.html" class="link"
  title="st_get_bounding_box"><code
  class="function">st_get_bounding_box (shape)</code></a> : returns
  BOX2D that is a bounding box of a shape.

- <a href="fn_geometrytype.html" class="link" title="GeometryType"><code
  class="function">GeometryType (shape)</code></a> : returns EWKT type
  name of a shape.

- <a href="fn_st_numgeometries.html" class="link"
  title="ST_NumGeometries"><code
  class="function">ST_NumGeometries (shape)</code></a> : returns number
  of members of a MULTI... or ...COLLECTION shape, 1 for other sorts of
  shapes.

- <a href="fn_st_geometryn.html" class="link" title="ST_GeometryN"><code
  class="function">ST_GeometryN (shape, idx)</code></a> : Given a
  1-based index of a member of a MULTI... or ...COLLECTION shape,
  returns the member.

- <a href="fn_st_exteriorring.html" class="link"
  title="ST_ExteriorRing"><code
  class="function">ST_ExteriorRing (polygon_shape)</code></a> : Returns
  an external (the very first) ring of a polygon.

- <a href="fn_st_numinteriorrings.html" class="link"
  title="ST_NumInteriorRings"><code
  class="function">ST_NumInteriorRings (polygon_shape)</code></a> :
  returns number of interior rings of the given polygon, NULL if shape
  is not a polygon.

- <a href="fn_st_interiorringn.html" class="link"
  title="ST_InteriorRingN"><code
  class="function">ST_InteriorRingN (polygon_shape, idx)</code></a> :
  Given a 1-based index of an interior ring of a polygon, returns the
  ring. Wrong index is not reported as an error and NULL is returned.

- <a href="fn_st_get_bounding_box_n.html" class="link"
  title="st_get_bounding_box_n"><code
  class="function">st_get_bounding_box_n (shape, idx)</code></a> : Given
  a 1-based index of a member of a MULTI... or ...COLLECTION shape,
  returns the bounding box of a member. This is a fast equivalent of

  <a href="fn_st_get_bounding_box.html" class="link"
  title="st_get_bounding_box"><code
  class="function">st_get_bounding_box (ST_GeometryN (shape,idx))</code></a>
  .

- <a href="fn_st_translate.html" class="link" title="ST_Translate"><code
  class="function">ST_Translate (shape, dX, dY [, dZ])</code></a> :
  returns a copy of a shape with all coordinates shifted by the provided
  dX, dY and dZ.

- <a href="fn_st_transscale.html" class="link" title="ST_TransScale"><code
  class="function">ST_TransScale (shape, dX, dY, Xfactor, Yfactor)</code></a>
  : returns a copy of a shape with all coordinates shifted by the
  provided dX, dY and then multiplied by Xfactor and Yfactor. In current
  version, differente values for Xfactor and Yfactor will result in
  distorted arcs.

- <a href="fn_st_transform_by_custom_projection.html" class="link"
  title="st_transform_by_custom_projection"><code
  class="function">st_transform_by_custom_projection (shape, algorithm_id, ...)</code></a>
  : Performs a custom projection of shape, using the specified algorithm
  and algorithm-specific arguments. Current version supports only one
  algorithm,
  <a href="fn_st_transform_by_custom_projection.html" class="link"
  title="st_transform_by_custom_projection"><code
  class="function">st_transform_by_custom_projection (shape, 'OLAEAPS', long_of_center, lat_of_center)</code></a>
  for Oblique Lampert Azimuthal Equal-Area Projection System with the
  specified center point.

- <a href="fn_st_transform.html" class="link" title="ST_Transform"><code
  class="function">ST_Transform (shape, deST_SRID, [orig_proj4_string, dest_proj4_string])</code></a>
  : Transforms the given shape from its current spatial reference system
  to one specified by `deST_SRID` . Two optional arguments are for
  "cheating": the SRID of the resulting shape is set to `deST_SRID` but
  the conversion is done by proj4 using `origin_proj4_string` for
  projection of original shape and `dest_proj4_string` for the result.
  If `orig_proj4_string` or `dest_proj4_string` argument is passed but
  is NULL instead of string, the projection corresponding to original or
  destination SRID is used.
  <a href="fn_st_transform.html" class="link" title="ST_Transform"><code
  class="function">ST_Transform</code></a> is provided by a separate
  plugin named v7proj4, as described below. When the plugin is loaded,
  functions like
  <a href="fn_st_intersects.html" class="link" title="st_intersects"><code
  class="function">st_intersects()</code></a> support pairs of arguments
  with different SRIDs by converting coords of second argument into the
  system of the first one, as required by OGC and GeoSPARQL.

- <a href="fn_postgis_proj_version.html" class="link"
  title="postgis_proj_version"><code
  class="function">postgis_proj_version()</code></a> : Returns the
  version of proj4 in use, as a string, for compatibility with PostGIS.

</div>

</div>

<div>

<div>

<div>

<div>

#### v7proj4 plugin

</div>

</div>

</div>

The Virtuoso v7proj4 hosted plugin module is required for performing
transformation between different co-ordinates systems using the
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform()</code></a> function. The plugin is based
on
<a href="http://trac.osgeo.org/proj/" class="ulink" target="_top">Frank
Warmerdam's proj4</a> library and it's practical to have the proj4
package installed on every box of Virtuoso cluster, even if the build is
performed on single machine or on different location at all. The reason
is that the plugin should load data about coordinate systems to work and
the simplest way to get the right data from a high-quality source is to
use the package.

<div>

<div>

<div>

<div>

##### Compiling open source v7proj4 plugin

</div>

</div>

</div>

The v7proj4 is currently available in the default develop/7 branch of
the "<a href="https://github.com/v7fasttrack/virtuoso-opensource"
class="ulink" target="_top">v7fasttrack</a> " git repository and can be
build as follows:

``` programlisting
git clone https://github.com/v7fasttrack/virtuoso-opensource.git
cd virtuoso-opensource
./autogen.sh
export CFLAGS="-msse4.2 -DSSE42"
./configure
make -j 24
make install
```

Note first the "proj.4" library must be installed on the system and can
be proj.4 download area, which the configure script will detect the
installation of enabling the v7proj4 plugin library to be built in
~/libsrc/plugin/.libs:

``` programlisting
ls libsrc/plugin/.libs/v7proj4*
libsrc/plugin/.libs/v7proj4.a
libsrc/plugin/.libs/v7proj4.la
libsrc/plugin/.libs/v7proj4.lai
libsrc/plugin/.libs/v7proj4_la-import_gate_virtuoso.o
libsrc/plugin/.libs/v7proj4_la-sql_v7proj4.o
libsrc/plugin/.libs/v7proj4_la-v7proj4_plugin.o
libsrc/plugin/.libs/v7proj4.so
libsrc/plugin/.libs/v7proj4.ver
```

</div>

<div>

<div>

<div>

<div>

##### Installation and Configuration of v7proj4 plugin

</div>

</div>

</div>

When the plugin (v7proj4.so) is built, it needs to be added to the
\[Plugins\] section of Virtuoso configuration file (virtuoso.ini or the
like), also on every node of a cluster:

``` programlisting
[Plugins]
LoadPath = ./plugins
Load2    = plain, v7proj4
```

If everything is fine then the virtuoso.log file will contain something
like the following lines after the next startup:

``` programlisting
21:30:10 { Loading plugin 1: Type `plain', file `shapefileio' in `.'
21:30:10   ShapefileIO version 0.1virt71 from OpenLink Software
21:30:10   Shapefile support based on Frank Warmerdam's Shapelib
21:30:10   SUCCESS plugin 1: loaded from ./plugins/shapefileio.so }
21:30:10 { Loading plugin 2: Type `plain', file `v7proj4' in `.'
21:30:11   plain version 3208 from OpenLink Software
21:30:11   Cartographic Projections support based on Frank Warmerdam's
proj4 library
21:30:11   SUCCESS plugin 2: loaded from ./plugins/v7proj4.so }
21:30:11 OpenLink Virtuoso Universal Server
21:30:11 Version 07.10.3208-pthreads for Linux as of Mar 31 2014
...
21:30:28 PL LOG: Initial setup of DB.DBA.SYS_V7PROJ4_SRIDS data from
files in "/usr/share/proj"
21:30:30 PL LOG: DB.DBA.SYS_V7PROJ4_SRIDS now contains 6930 spatial
reference systems
...
21:30:32 Server online at 1720 (pid 9654)
```

To store descriptions of coordinate systems, the plugin creates a table:

``` programlisting
create table DB.DBA.SYS_V7PROJ4_SRIDS (
 SR_ID integer,
 SR_FAMILY varchar not null,
 SR_TAG varchar,
 SR_ORIGIN varchar not null,
 SR_IRI IRI_ID_8,
 SR_PROJ4_STRING varchar not null,
 SR_WKT varchar,
 SR_COMMENT varchar,
 SR_PROJ4_XML any,
 primary key (SR_ID, SR_FAMILY) )
;
```

and fills it with data from files epsg, esri, esri.extra, nad83 and
nad27 of directory /usr/share/proj. Note these files must exist in the
/usr/share/proj directory otherwise a message will be reported in the
log file indicated the file could not be found. Every row of the table
is identified with name of "family" of coordinate systems and an integer
SRID. Different sources may assign same SRID to different reference
systems, however descriptions of well-known systems match exactly or the
difference is not noticeable for any practical application.

The loading process uses family names 'EPSG', 'ESRI', 'NAD83' and
'NAD27'. When the
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform()</code></a> searches for a coordinate
system that corresponds to a given SRID then it returns first record
found while checking the following families in the following order:
'PG', 'EPSG', 'ESRI','NAD83', 'NAD27'. Thus it is practical to put all
custom definitions in 'PG' family, thus they will get the highest
priority.

A sample
<a href="http://www.epsg.org/" class="ulink" target="_top">EPSG</a> file
containing the mapping for the proj.4
<a href="http://spatialreference.org/ref/epsg/4326/" class="ulink"
target="_top">EPSG:4326</a> coordinate system is:

``` programlisting
$ cat /usr/share/proj/epsg
<4326>+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs<>
```

``` programlisting
SQL> SELECT * FROM DB.DBA.SYS_V7PROJ4_SRIDS;
SR_ID             SR_FAMILY          SR_TAG    SR_ORIGIN              SR_IRI    SR_PROJ4_STRING                                    SR_WKT    SR_COMMENT   SR_PROJ4_XML
INTEGER NOT NULL  VARCHAR NOT NULL   VARCHAR   VARCHAR NOT NULL       VARCHAR   VARCHAR NOT NULL                                   VARCHAR   VARCHAR      VARCHAR
_______________________________________________________________________________

4326              EPSG               4326      /usr/share/proj/epsg   NULL      +datum=WGS84 +ellps=WGS84 +no_defs +proj=longlat             NULL         NULL

1 Rows. -- 0 msec.
SQL>
```

There are two procedures are available for loading more co-ordinate
systems:

<div>

1.  `DB.DBA.V7PROJ4_LOAD_SYS_SRIDS` : it is called at server startup if
    the v7proj4 plugin is loaded:

    ``` programlisting
    DB.DBA.V7PROJ4_LOAD_SYS_SRIDS (
      in projdir varchar := '/usr/share/proj',
      in only_if_empty_table integer := 0
    )
    ```

2.  `DB.DBA.V7PROJ4_LOAD_INIT_FILE` : it is lower-level procedure:

    ``` programlisting
    DB.DBA.V7PROJ4_LOAD_INIT_FILE (
      in path varchar,
      in _sr_family varchar
    )
    ```

</div>

The main part of `DB.DBA.V7PROJ4_LOAD_SYS_SRIDS()` is a sequence of:

``` programlisting
DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/epsg', 'EPSG');
DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/esri', 'ESRI');
DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/esri.extra', 'ESRI');
DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/nad83', 'NAD83');
DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/nad27', 'NAD27');
```

Rows with same SRID but different `SR_FAMILY` may exist in the table,
however only one projection per SRID is used and `SR_FAMILY` defines the
priority. The internal search query for projection by SRID is:

``` programlisting
SELECT COALESCE
   (
     ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='PG'),
     ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='EPSG'),
     ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='ESRI'),
     ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='NAD83'),
     ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='NAD27')
   )
```

so for
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform()</code></a> function 'PG' overrides
everything else, EPSG is the next highest priority, then ESRI, NAD83 and
NAD27. However custom queries and procedure may select whatever they
please, including sr families not listed here or strings from other
tables etc., and feed projection strings directly to
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform()</code></a> .

The co-ordinate systems can also be updated by direct manipulations on
`DB.DBA.SYS_V7PROJ4_SRIDS table` (the table it is readable for public
and writable for DBA only). When the table is edited, call function
"`Proj4 cache_reset()` " to prevent SQL runtime from using previously
prepared projections that might become obsolete after changes in the
table. Note that proj4 projections are for normalized data in radians
whereas Virtuoso stores shapes using numbers that come from WKT, i.e.
they're latitudes and longitudes in degrees for almost all cases.

The v7proj4 plugin automatically applies `RAD_TO_DEG` multiplier before
conversion and/or `RAD_TO_DEG` multiplier after conversion when source
and/or destination coordinate systems are latitude-longitude or
geocentric. Even if this conversion is done automatically, you should
remember that it happens, for the following reason. Many "how-to"
instructions for spatial data sets contain paragraphs like "how to
convert these data to WGS-84" and sample C/C++ code contains
transformations like `{ x *= RAD_TO_DEG; y *= RAD_TO_DEG; }` . These
transformations will probably be redundant in the corresponding
Virtuoso/PL code whereas proj4 strings can be used unchanged and passed
as 3rd and 4th arguments of
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform()</code></a> function. If
degrees-to-radians conversion is made twice then the data can be
calculated as if the shape is located in a totally different place of
ellipsoid. If the post-transformation radians-to-degrees conversion is
also made twice, the resulting shape may look like the real one but
coordinates may be tens kilometers away from correct values.

</div>

<div>

<div>

<div>

<div>

##### ST_Transform() Example

</div>

</div>

</div>

Below are some example uses of the
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform()</code></a> function to transform some of
the sample coordinate systems load into Virtuoso:

``` programlisting
SQL> SELECT * FROM DB.DBA.SYS_V7PROJ4_SRIDS;
SR_ID              SR_FAMILY          SR_TAG    SR_ORIGIN              SR_IRI    SR_PROJ4_STRING                                                                                                                                                                         SR_WKT    SR_COMMENT   SR_PROJ4_XML
INTEGER NOT NULL   VARCHAR NOT NULL   VARCHAR   VARCHAR NOT NULL       VARCHAR   VARCHAR NOT NULL                                                                                                                                                                        VARCHAR   VARCHAR      VARCHAR
_______________________________________________________________________________

2005               EPSG               2005      /usr/share/proj/epsg   NULL      +ellps=clrk80 +k=0.9995000000000001 +lat_0=0 +lon_0=-62 +no_defs +proj=tmerc +units=m +x_0=400000 +y_0=0                                                                                          NULL         NULL
2249               EPSG               2249      /usr/share/proj/epsg   NULL      +datum=NAD83 +ellps=GRS80 +lat_0=41 +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lon_0=-71.5 +no_defs +proj=lcc +to_meter=0.3048006096012192 +x_0=200000.0001016002 +y_0=750000             NULL         NULL
4326               EPSG               4326      /usr/share/proj/epsg   NULL      +datum=WGS84 +ellps=WGS84 +no_defs +proj=longlat                                                                                                                                                  NULL         NULL

3 Rows. -- 1 msec.
SQL> SELECT ST_Transform (st_geomfromtext ('POLYGON((-16 20.25,-16.1 20.35,-15.9 20.35,-16 20.25))'), 1, '+proj=latlong +ellps=clrk66', '+proj=merc +ellps=clrk66 +lat_ts=33');
unnamed
VARCHAR NOT NULL
_______________________________________________________________________________

SRID=1;POLYGON((-1495284.211473 1920596.789917,-1504629.737795 1930501.842961,-1485938.685152 1930501.842961,-1495284.211473 1920596.789917))

1 Rows. -- 0 msec.
SQL> SELECT ST_AsText(ST_Transform(ST_GeomFromText('POLYGON((743238 2967416,743238 2967450, 743265 2967450,743265.625 2967416,743238 2967416))',2249),4326)) AS wgs_geom;
wgs_geom
VARCHAR NOT NULL
_______________________________________________________________________________

POLYGON((-71.177685 42.390290,-71.177684 42.390383,-71.177584 42.390383,-71.177583 42.390289,-71.177685 42.390290))

1 Rows. -- 1 msec.
SQL>
```

</div>

</div>

</div>
