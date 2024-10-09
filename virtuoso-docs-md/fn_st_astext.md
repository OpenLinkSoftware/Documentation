<div>

<div>

</div>

<div>

## Name

st_astext — Returns the well known text (WKT) representation of the
geometry.

</div>

<div>

## Synopsis

<div>

|                        |                  |
|------------------------|------------------|
| ` `**`st_astext`**` (` | in `g ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the well known text (WKT) representation of the geometry.

</div>

<div>

## Parameters

<div>

### g

Geometry point

</div>

</div>

<div>

## Return Types

Returns varchar.

</div>

<div>

## Examples

<div>

**Example 24.142. Simple Use**

<div>

``` programlisting
SQL>SPARQL
SELECT DISTINCT (bif:st_astext(?geo))
WHERE
  {
    ?m geo:geometry ?geo .

  }
LIMIT 10;
callret-0
ANY
_________________________________
POINT(-139.267 -90)
POINT(-153.833 -86.9667)
POINT(-163 -85.4167)
POINT(-170.8 -85.1167)
POINT(-142.176 -85.06)
POINT(-142.258 -85.0478)
POINT(-85.0331 -85.0378)
POINT(-142.685 -85.0307)
POINT(-143.654 -84.9921)
POINT(-143.82 -84.9851)
No. of rows in result: 10
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y </code></a>

<a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance </code></a>

<a href="fn_st_srid.html" class="link" title="ST_SRID"><code
class="function">st_srid </code></a>

<a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">st_setsrid </code></a>

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
