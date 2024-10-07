<div id="fn_st_ymax" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ST_YMax — returns maximum y boundaries of a bounding box around a shape.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_ymax" class="funcsynopsis">

|                      |                      |
|----------------------|----------------------|
| ` `**`ST_YMax`**` (` | in `shape ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_ymax" class="refsect1">

## Description

returns boundaries of a bounding box around a shape. Bounding boxes
around arcs are calculated in assumption that no one arc is longer than
a half of full circle.

</div>

<div id="params_st_ymax" class="refsect1">

## Parameters

<div id="id132355" class="refsect2">

### shape

A bounding box.

</div>

</div>

<div id="ret_st_ymax" class="refsect1">

## Return Types

Returns double precision.

</div>

<div id="examples_st_ymax" class="refsect1">

## Examples

<div id="ex_st_ymax" class="example">

**Example 24.678. Simple Use**

<div class="example-contents">

``` screen
DB.DBA.TTLP ('
<point2d>           <shape> "POINT(1 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<point4d>           <shape> "POINTZM(0 1 2 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<box1>              <shape> "BOX(0 0, 2 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<linestring>        <shape> "LINESTRING(10 21, 12 23, 10 25)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon1>          <shape> "POLYGON((1 3,2 4,1 5,0 4,1 3))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon2>          <shape> "POLYGON((1.5 3.5,2.5 4.5,1.5 5.5,0.5 4.5,1.5 3.5))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon3>          <shape> "POLYGON((1 3,2 4,1 5,0 4,1 3),(1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<multipolygon>      <shape> "MULTIPOLYGON(((1 3,2 4,1 5,0 4,1 3)),((1 2,2 1,1 0,0 1,1 2)))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<collection>        <shape> "GEOMETRYCOLLECTION(POINT(0 0),MULTILINESTRING((1 5,0 1,4 0,5 4),(1 5,1 0,4 0,4 5)),MULTIPOLYGON(((1 3,2 4,1 5,0 4,1 3)),((1 2,2 1,1 0,0 1,1 2))))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
', 'http://geo-api-demo/', 'http://geo-api-demo/', 0)

--
SQL>
SPARQL
SELECT ?s,
       bif:st_ymax(?o) as ?ymax
FROM <http://geo-api-demo/>
WHERE { ?s ?p ?o };
s                                   ymax
ANY                                 DOUBLE PRECISION
_______________________________________________________________________________
 http://geo-api-demo/box1             3
 http://geo-api-demo/collection     5
 http://geo-api-demo/linestring     25
 http://geo-api-demo/multipolygon     5
 http://geo-api-demo/point2d          3
 http://geo-api-demo/point4d          1
 http://geo-api-demo/polygon1         5
 http://geo-api-demo/polygon2         5.5
```

</div>

</div>

  

</div>

<div id="seealso_st_ymax" class="refsect1">

## See Also

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">ST_X() </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">ST_Y() </code></a>

<a href="fn_st_z.html" class="link" title="ST_Z"><code
class="function">ST_Z() </code></a>

<a href="fn_st_m.html" class="link" title="ST_M"><code
class="function">ST_M() </code></a>

<a href="fn_st_xmin.html" class="link" title="ST_XMin"><code
class="function">ST_XMin() </code></a>

<a href="fn_st_xmax.html" class="link" title="ST_XMax"><code
class="function">ST_XMax() </code></a>

<a href="fn_st_ymin.html" class="link" title="ST_YMin"><code
class="function">ST_YMin() </code></a>

<a href="fn_st_zmin.html" class="link" title="ST_ZMin"><code
class="function">ST_ZMin() </code></a>

<a href="fn_st_zmax.html" class="link" title="ST_ZMax"><code
class="function">ST_ZMax() </code></a>

<a href="fn_st_mmin.html" class="link" title="ST_MMin"><code
class="function">ST_MMin() </code></a>

<a href="fn_st_mmax.html" class="link" title="ST_MMax"><code
class="function">ST_MMax() </code></a>

</div>

</div>