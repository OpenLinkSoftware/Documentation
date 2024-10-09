<div>

<div>

</div>

<div>

## Name

st_point — Returns a point geometry.

</div>

<div>

## Synopsis

<div>

|                       |                               |
|-----------------------|-------------------------------|
| ` `**`st_point`**` (` | in `x ` double precision ,    |
|                       | in `y ` double precision `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns a point geometry. The x coordinate corresponds to longitude.

</div>

<div>

## Parameters

<div>

### x

X coordinate. Corresponds to longitude.

</div>

<div>

### y

Y coordinate.

</div>

</div>

<div>

## Return Types

Returns a point geometry.

</div>

<div>

## Examples

<div>

**Example 24.136. Simple Use**

<div>

``` programlisting
SQL>select st_point (0, 52);
callret
VARCHAR
_______________________________________________________________________________

POINT(0 52)

1 Rows. -- 40 msec.

SQL>
SPARQL
SELECT ?m (bif:st_distance (?geo, bif:st_point (0, 52)))
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a <http://dbpedia.org/ontology/City> .
    FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 100))
  }
ORDER BY DESC 2
LIMIT 20;
m                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/Weston-on-Trent                                       138.7082197019335
http://dbpedia.org/resource/Weston-on-Trent                                       137.7213767969613
http://dbpedia.org/resource/Weston-on-Trent                                       136.4597167847218
http://dbpedia.org/resource/Weston-on-Trent                                       134.1807668663677
http://dbpedia.org/resource/Weston-on-Trent                                       133.104337839536
http://dbpedia.org/resource/Weston-on-Trent                                       133.104337839536
http://dbpedia.org/resource/Nonington                                             132.7368236183588
http://dbpedia.org/resource/Nonington                                             132.1339163200362
http://dbpedia.org/resource/Nonington                                             132.1339163200362
http://dbpedia.org/resource/Nonington                                             130.5478483560461
http://dbpedia.org/resource/Nonington                                             130.1620410981843
http://dbpedia.org/resource/Nonington                                             129.8549842943355
http://dbpedia.org/resource/Nonington                                             129.6459280567849
http://dbpedia.org/resource/Nonington                                             129.4504858595742
http://dbpedia.org/resource/Nonington                                             129.2790713235814
http://dbpedia.org/resource/Nonington                                             128.9081040147881
http://dbpedia.org/resource/Nonington                                             128.8845164618929
http://dbpedia.org/resource/Nonington                                             128.6676189617872
http://dbpedia.org/resource/Nonington                                             128.2565253458452
http://dbpedia.org/resource/Nonington                                             128.2551696344652

20 Rows. -- 120 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x() </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y() </code></a>

<a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance() </code></a>

<a href="fn_st_srid.html" class="link" title="ST_SRID"><code
class="function">st_srid() </code></a>

<a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">st_setsrid() </code></a>

<a href="fn_st_astext.html" class="link" title="st_astext"><code
class="function">st_astext() </code></a>

<a href="fn_st_geomfromtext.html" class="link"
title="st_geomfromtext"><code
class="function">st_geomfromtext() </code></a>

<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects() </code></a>

<a href="fn_st_contains.html" class="link" title="st_contains"><code
class="function">st_contains() </code></a>

<a href="fn_st_within.html" class="link" title="st_within"><code
class="function">st_within() </code></a>

<a href="fn_isgeometry.html" class="link" title="isgeometry"><code
class="function">isgeometry() </code></a>

<a href="fn_geo_insert.html" class="link" title="geo_insert"><code
class="function">geo_insert() </code></a>

<a href="fn_geo_delete.html" class="link" title="geo_delete"><code
class="function">geo_delete() </code></a>

<a href="fn_rdf_geo_add.html" class="link"
title="DB.DBA.RDF_GEO_ADD"><code
class="function">DB.DBA.RDF_GEO_ADD() </code></a>

<a href="fn_rdf_geo_fill.html" class="link"
title="DB.DBA.RDF_GEO_FILL"><code
class="function">DB.DBA.RDF_GEO_FILL() </code></a>

</div>

</div>
