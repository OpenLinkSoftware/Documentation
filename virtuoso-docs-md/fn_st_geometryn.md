<div>

<div>

</div>

<div>

## Name

ST_GeometryN — Given a 1-based index of a member of a MULTI... or
...COLLECTION shape, returns the member.

</div>

<div>

## Synopsis

<div>

|                           |                    |
|---------------------------|--------------------|
| ` `**`ST_GeometryN`**` (` | in `shape ` any ,  |
|                           | in `idx ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Given a 1-based index of a member of a MULTI... or ...COLLECTION shape,
returns the member.

</div>

<div>

## Parameters

<div>

### shape

Shape.

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

**Example 24.660. Simple Use**

<div>

``` screen
SQL> select st_geometryn (
       st_geometryn (
         st_ewkt_read ('
           GEOMETRYCOLLECTION(
              POINT(0 0),
              MULTILINESTRING(
                (1 5,0 1,4 0,5 4),
                (1 5,1 0,4 0,4 5)),
              MULTIPOLYGON(
               ((1 3,2 4,1 5,0 4,1 3)),
               ((1 2,2 1,1 0,0 1,1 2))))'),
        3),1)
_______________________________________________________________________________

POLYGON((1.0 3.0,2.0 4.0,1.0 5.0,0.0 4.0,1.0 3.0))
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_numgeometries.html" class="link"
title="ST_NumGeometries"><code
class="function">ST_NumGeometries() </code></a>

<a href="fn_geometrytype.html" class="link" title="GeometryType"><code
class="function">GeometryType() </code></a>

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
