<div>

<div>

</div>

<div>

## Name

ST_SRID — returns SRID of shape's spatial reference system or 0 for
shape on plane.

</div>

<div>

## Synopsis

<div>

|                      |                  |
|----------------------|------------------|
| ` `**`ST_SRID`**` (` | in `g ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the SRID of a geometry.

</div>

<div>

## Parameters

<div>

### g

Geometry.

</div>

</div>

<div>

## Return Types

Returns int.

</div>

<div>

## Examples

<div>

**Example 24.140. Simple Use**

<div>

``` programlisting
SQL>SPARQL
SELECT (bif:ST_SRID (?geo))
WHERE
  {
    ?m geo:geometry ?geo .
  }
LIMIT 10;
callret-0
INTEGER
_______________________________
 4326
 4326
 4326
 4326
 4326
 4326
 4326
 4326
 4326
 4326
No. of rows in result: 10

SQL>select ST_SRID( st_point (10, 30));
callret
INTEGER
_______________________________
 4326
No. of rows in result: 1
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
