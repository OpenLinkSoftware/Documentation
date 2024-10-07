<div id="fn_st_may_intersect" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_may_intersect — checks whether bounding boxes of two shapes intersect
or some of its points are within the specified proximity.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_may_intersect" class="funcsynopsis">

|                               |                          |
|-------------------------------|--------------------------|
| ` `**`st_may_intersect`**` (` | in `shape1 ` any ,       |
|                               | in `shape2 ` any ,       |
|                               | in `proximity ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_may_intersect" class="refsect1">

## Description

checks whether bounding boxes of two shapes intersect or some of its
points are within the specified proximity. This is much faster than full
<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects() </code></a> check.

</div>

<div id="params_st_may_intersect" class="refsect1">

## Parameters

<div id="id131591" class="refsect2">

### shape1

Given shape

</div>

<div id="id131594" class="refsect2">

### shape2

Given shape

</div>

<div id="id131597" class="refsect2">

### proximity

A proximity.

</div>

</div>

<div id="ret_st_may_intersect" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_st_may_intersect" class="refsect1">

## Examples

<div id="ex_st_may_intersect" class="example">

**Example 24.667. Simple Use**

<div class="example-contents">

``` screen
SQL> SPARQL
SELECT ?s1 ?s2
FROM <http://geo-api-demo/>
WHERE
  {
    ?s1 ?p1 ?o1 .
    ?s2 ?p2 ?o2 .
    FILTER (bif:st_may_intersect (?o1, ?o2))
  }
ORDER BY ASC(str(?s1)) ASC(str(?s2));

s1                               s2
ANY                              ANY
_______________________________________________________________________________
http://geo-api-demo/box1           http://geo-api-demo/box1
http://geo-api-demo/box1           http://geo-api-demo/collection
http://geo-api-demo/box1           http://geo-api-demo/multipolygon
http://geo-api-demo/box1           http://geo-api-demo/point2d
http://geo-api-demo/box1           http://geo-api-demo/point4d
http://geo-api-demo/box1           http://geo-api-demo/polygon1
http://geo-api-demo/collection   http://geo-api-demo/box1
http://geo-api-demo/collection   http://geo-api-demo/collection
http://geo-api-demo/collection   http://geo-api-demo/multipolygon
```

</div>

</div>

  

</div>

<div id="seealso_st_may_intersect" class="refsect1">

## See Also

<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects() </code></a>

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
