<div>

<div>

</div>

<div>

## Name

isgeometry — Returns 1 if the argument is a geometry.

</div>

<div>

## Synopsis

<div>

|                         |                  |
|-------------------------|------------------|
| ` `**`isgeometry`**` (` | in `x ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns 1 if the argument is a geometry.

</div>

<div>

## Parameters

<div>

### x

The geometry value.

</div>

</div>

<div>

## Return Types

Returns int.

</div>

<div>

## Examples

<div>

**Example 24.147. Simple example**

<div>

``` programlisting
SQL>SELECT isgeometry(st_point(0, 52));
callret
VARCHAR
___________________________
 1
No. of rows in result: 1

SQL>SPARQL
SELECT ?m
WHERE
  {
    ?m a <http://dbpedia.org/ontology/City> .
    FILTER (bif:isgeometry(?m) = 0)
  }
LIMIT 10

m
VARCHAR
__________________________________________________
http://dbpedia.org/resource/Berg%2C_Upper_Bavaria
http://dbpedia.org/resource/Grasbrunn
http://dbpedia.org/resource/Putzbrunn
http://dbpedia.org/resource/Ottobrunn
http://dbpedia.org/resource/Dietramszell
http://dbpedia.org/resource/Prutting
http://dbpedia.org/resource/Gauting
http://dbpedia.org/resource/Lucerne
http://dbpedia.org/resource/Hamburg
http://dbpedia.org/resource/Bavaria
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
