<div>

<div>

</div>

<div>

## Name

ST_InteriorRingN — Given a 1-based index of an interior ring of a
polygon, returns the ring. Wrong index is not reported as an error and
NULL is returned.

</div>

<div>

## Synopsis

<div>

|                               |                     |
|-------------------------------|---------------------|
| ` `**`ST_InteriorRingN`**` (` | in `poligon ` any , |
|                               | in `idx ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

Given a 1-based index of an interior ring of a polygon, returns the
ring. Wrong index is not reported as an error and NULL is returned.

</div>

<div>

## Parameters

<div>

### poligon

A given poligon of a type shape.

</div>

<div>

### idx

Index.

</div>

</div>

<div>

## Return Types

Returns any.

</div>

<div>

## Examples

<div>

**Example 24.664. Simple Use**

<div>

``` screen
SQL> select ST_InteriorRingN (st_ewkt_read ('POLYGON((1 3,2 4,1 5,0 4,1 3),(1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))'), 1)
unnamed
VARCHAR NOT NULL
_______________________________________________________________________________

RING(1.0 3.500000,1.500000 4.0,1.0 4.500000,0.500000 4.0,1.0 3.500000)

SQL> DB.DBA.TTLP ('
<point2d>       <shape> "POINT(1 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<point4d>       <shape> "POINTZM(0 1 2 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<box1>          <shape> "BOX(0 0, 2 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<linestring>    <shape> "LINESTRING(10 21, 12 23, 10 25)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon1>      <shape> "POLYGON((1 3,2 4,1 5,0 4,1 3))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon2>      <shape> "POLYGON((1.5 3.5,2.5 4.5,1.5 5.5,0.5 4.5,1.5 3.5))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon3>      <shape> "POLYGON((1 3,2 4,1 5,0 4,1 3),(1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<multipolygon>  <shape> "MULTIPOLYGON(((1 3,2 4,1 5,0 4,1 3)),((1 2,2 1,1 0,0 1,1 2)))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<collection>    <shape> "GEOMETRYCOLLECTION(POINT(0 0),MULTILINESTRING((1 5,0 1,4 0,5 4),(1 5,1 0,4 0,4 5)),MULTIPOLYGON(((1 3,2 4,1 5,0 4,1 3)),((1 2,2 1,1 0,0 1,1 2))))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
', 'http://geo-api-demo/', 'http://geo-api-demo/', 0)

SQL> SPARQL
SELECT ?s, bif:ST_InteriorRingN (?o, bif:ST_NuminteriorRings (?o))
FROM <http://geo-api-demo/>
WHERE
  {
    ?s ?p ?o .
    FILTER (bif:ST_NumInteriorRings (?o) > 0)
  }
ORDER BY ASC(str(?s))
s                             callret-1
VARCHAR                       VARCHAR
_______________________________________________________________________________

http://geo-api-demo/polygon3  RING(1.0 3.500000,1.500000 4.0,1.0 4.500000,0.500000 4.0,1.0 3.500000)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_exteriorring.html" class="link"
title="ST_ExteriorRing"><code
class="function">ST_ExteriorRing() </code></a>

<a href="fn_st_numinteriorrings.html" class="link"
title="ST_NumInteriorRings"><code
class="function">ST_NumInteriorRings() </code></a>

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y </code></a>

<a href="fn_st_z.html" class="link" title="ST_Z"><code
class="function">ST_Z </code></a>

<a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance </code></a>

<a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">ST_SetSRID </code></a>

<a href="fn_st_astext.html" class="link" title="st_astext"><code
class="function">st_astext </code></a>

<a href="fn_st_geomfromtext.html" class="link"
title="st_geomfromtext"><code
class="function">st_geomfromtext </code></a>

<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects </code></a>

<a href="fn_st_contains.html" class="link" title="st_contains"><code
class="function">st_contains </code></a>

<a href="fn_st_within.html" class="link" title="st_within"><code
class="function">st_within </code></a>

<a href="fn_isgeometry.html" class="link" title="isgeometry"><code
class="function">isgeometry </code></a>

<a href="fn_geo_insert.html" class="link" title="geo_insert"><code
class="function">geo_insert </code></a>

<a href="fn_geo_delete.html" class="link" title="geo_delete"><code
class="function">geo_delete </code></a>

<a href="fn_rdf_geo_add.html" class="link"
title="DB.DBA.RDF_GEO_ADD"><code
class="function">DB.DBA.RDF_GEO_ADD </code></a>

<a href="fn_rdf_geo_fill.html" class="link"
title="DB.DBA.RDF_GEO_FILL"><code
class="function">DB.DBA.RDF_GEO_FILL </code></a>

</div>

</div>
