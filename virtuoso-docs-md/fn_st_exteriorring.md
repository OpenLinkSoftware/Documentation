<div>

<div>

</div>

<div>

## Name

ST_ExteriorRing — Returns an external (the very first) ring of a
polygon.

</div>

<div>

## Synopsis

<div>

|                              |                        |
|------------------------------|------------------------|
| ` `**`ST_ExteriorRing`**` (` | in `poligon ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns an external (the very first) ring of a polygon.

</div>

<div>

## Parameters

<div>

### poligon

A given poligon from a type shape.

</div>

</div>

<div>

## Return Types

Returns any.

</div>

<div>

## Examples

<div>

**Example 24.659. Simple Use**

<div>

``` screen
SQL> select ST_ExteriorRing (st_ewkt_read ('POLYGON((1 3,2 4,1 5,0 4,1 3),(1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))'))
_______________________________________________________________________________

RING(1.0 3.0,2.0 4.0,1.0 5.0,0.0 4.0,1.0 3.0)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_interiorringn.html" class="link"
title="ST_InteriorRingN"><code
class="function">ST_InteriorRingN() </code></a>

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
