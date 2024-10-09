<div>

<div>

</div>

<div>

## Name

st_get_bounding_box — returns BOX2D that is a bounding box of a shape.

</div>

<div>

## Synopsis

<div>

|                                  |                      |
|----------------------------------|----------------------|
| ` `**`st_get_bounding_box`**` (` | in `shape ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns BOX2D that is a bounding box of a shape.

</div>

<div>

## Parameters

<div>

### shape

Shape.

</div>

</div>

<div>

## Return Types

Returns any.

</div>

<div>

## Examples

<div>

**Example 24.661. Simple Use**

<div>

``` screen
SQL> SPARQL
SELECT bif:st_get_bounding_box(?o) ?o
FROM <http://geo-api-demo/>
WHERE { ?s ?p ?o }
ORDER BY ASC(str(?s))
o                                                                                 callret-3

BOX2D(0.0 0.0,2.0 3.0)                         BOX2D(0.0 0.0,2.0 3.0)
BOX2D(0.0 0.0,5.000001 5.000001)               GEOMETRYCOLLECTION(POINT(0.0 0.0),MULTILINESTRING((1.0 5.0,0.0 1.0,4.0 0.0,5.0 4.0),(1.0 5.0,1.0 0.0,4.0 0.0,4.0 5.0)),MULTIPOLYGON(((1.0 3.0,2.0 4.0,1.0 5.0,0.0 4.0,1.0 3.0)),((1.0 2.0,2.0 1.0,1.0 0.0,0.0 1.0,1.0 2.0))))
BOX2D(9.999999 20.999997,12.000001 25.000003)  LINESTRING(10.0 21.0,12.0 23.0,10.0 25.0)
BOX2D(0.0 0.0,2.0 5.000001)                    MULTIPOLYGON(((1.0 3.0,2.0 4.0,1.0 5.0,0.0 4.0,1.0 3.0)),((1.0 2.0,2.0 1.0,1.0 0.0,0.0 1.0,1.0 2.0)))
BOX2D(1.0 3.0,1.0 3.0)                         POINT(1 3)
BOXZM(0.0 1.0 2.0 3.0,0.0 1.0 2.0 3.0)         POINTZM(0.0 1.0 2.0 3.0)
BOX2D(0.0 3.0,2.0 5.000001)                    POLYGON((1.0 3.0,2.0 4.0,1.0 5.0,0.0 4.0,1.0 3.0))
BOX2D(0.500000 3.500000,2.500000 5.500001)     POLYGON((1.500000 3.500000,2.500000 4.500000,1.500000 5.500000,0.500000 4.500000,1.500000 3.500000))
BOX2D(0.0 3.0,2.0 5.000001)                    POLYGON((1.0 3.0,2.0 4.0,1.0 5.0,0.0 4.0,1.0 3.0),(1.0 3.500000,1.500000 4.0,1.0 4.500000,0.500000 4.0,1.0 3.500000))
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_get_bounding_box_n.html" class="link"
title="st_get_bounding_box_n"><code
class="function">st_get_bounding_box_n() </code></a>

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
