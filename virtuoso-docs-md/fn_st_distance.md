<div id="fn_st_distance" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_distance — Returns the shortest distance between two points.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_distance" class="funcsynopsis">

|                          |                   |
|--------------------------|-------------------|
| ` `**`st_distance`**` (` | in `g1 ` any ,    |
|                          | in `g2 ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_distance" class="refsect1">

## Description

Returns the shortest distance between two points such that the first
point is part of g1 and the second of g2. The srid of g1 and g2 must be
the same. If the srid is 4326, the haversine function is used to compute
a great circle distance in kilometers on Earth. Otherwise the distance
is calculated as on a flat Euclidean plane.

</div>

<div id="params_st_distance" class="refsect1">

## Parameters

<div id="id90771" class="refsect2">

### g1

Geometry.

</div>

<div id="id90774" class="refsect2">

### g2

Geometry.

</div>

</div>

<div id="ret_st_distance" class="refsect1">

## Return Types

Returns double precision.

</div>

<div id="examples_st_distance" class="refsect1">

## Examples

<div id="ex_st_distance" class="example">

**Example 24.139. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SELECT st_distance (st_point(0, 52),st_point(0, 70));
callret
VARCHAR
_____________________________
 2000.388915449352
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_st_distance" class="refsect1">

## See Also

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y </code></a>

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
