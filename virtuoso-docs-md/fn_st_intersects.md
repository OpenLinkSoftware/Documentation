<div>

<div>

</div>

<div>

## Name

st_intersects — Returns intersects between two geometries.

</div>

<div>

## Synopsis

<div>

|                            |                                  |
|----------------------------|----------------------------------|
| ` `**`st_intersects`**` (` | in `g1 ` any ,                   |
|                            | in `g2 ` any ,                   |
|                            | in `prec ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns intersects between two geometries. If prec is supplied, this is
a tolerance for the matching in units of linear distance appropriate to
the srid. Both geometries should have the same srid. st_intersects is
true if there is at least one point in common.

</div>

<div>

## Parameters

<div>

### g1

The first geometry.

</div>

<div>

### g2

The second geometry.

</div>

<div>

### prec

A tolerance for the matching in units of linear distance appropriate to
the srid. Default is 0.

</div>

</div>

<div>

## Return Types

Returns int.

</div>

<div>

## Examples

<div>

**Example 24.144. Simple Use**

<div>

``` programlisting
SQL>SELECT st_intersects (st_point (0, 51), st_point (0, 52), 100);
callret
INTEGER
_______________________________
 0
No. of rows in result: 1

SQL>SPARQL
SELECT ?c (bif:st_intersects (?geo, bif:st_point (0, 52), 100))
WHERE
   {
     ?m geo:geometry ?geo .
     ?m a ?c .

   }
GROUP BY ?c ?geo
ORDER BY desc 2
LIMIT 10;
c                                                                callret-1
ANY                                                              ANY
__________________________________________________
http://xmlns.com/foaf/0.1/Person                             1
http://rdf.alchemyapi.com/rdf/v1/s/aapi-schema#Disambiguation    1
http://rdf.alchemyapi.com/rdf/v1/s/aapi-schema#Disambiguation    1
http://www.w3.org/2003/12/exif/ns/IFD                            1
http://www.w3.org/2003/12/exif/ns/IFD                            1
http://www.w3.org/2003/12/exif/ns/IFD                            1
http://www.w3.org/2003/12/exif/ns/IFD                            1
http://www.w3.org/2003/12/exif/ns/IFD                            1
http://dbpedia.org/class/yago/HostCitiesOfTheCommonwealthGames   1
http://www.w3.org/2003/12/exif/ns/IFD                            1
No. of rows in result: 10
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="sqlrefgeospatialqgr.html" class="link"
title="9.34.5. Querying Geometric Relations">Querying Geometric
Relations</a>

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

<a href="fn_st_astext.html" class="link" title="st_astext"><code
class="function">st_astext </code></a>

<a href="fn_st_geomfromtext.html" class="link"
title="st_geomfromtext"><code
class="function">st_geomfromtext </code></a>

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
