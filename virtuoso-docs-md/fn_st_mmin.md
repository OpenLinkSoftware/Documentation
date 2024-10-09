<div>

<div>

</div>

<div>

## Name

ST_MMin — returns boundaries of a bounding box around a shape in
cordinates.

</div>

<div>

## Synopsis

<div>

|                      |                      |
|----------------------|----------------------|
| ` `**`ST_MMin`**` (` | in `shape ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns boundaries of a bounding box around a shape. Bounding boxes
around arcs are calculated in assumption that no one arc is longer than
a half of full circle.

</div>

<div>

## Parameters

<div>

### shape

A bounding box.

</div>

</div>

<div>

## Return Types

Returns double precision.

</div>

<div>

## Examples

<div>

**Example 24.669. Simple Use**

<div>

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
SELECT ?s, bif:st_mmin(?o) as ?mmin
FROM <http://geo-api-demo/>
WHERE { ?s ?p ?o };
s                                   mmin
ANY
_______________________________________________________________________________
 http://geo-api-demo/box1            BOX2D(0.000000 0.000000,2.000000 3.000000)  1e+38
 http://geo-api-demo/linestring    LINESTRING(10.000000 21.000000,12.000000 23.000000,10.000000 25.000000)   1e+38
 http://geo-api-demo/point4d         POINTZM(0.000000 1.000000 2.000000 3.000000)    3
```

</div>

</div>

  

</div>

<div>

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

<a href="fn_st_ymax.html" class="link" title="ST_YMax"><code
class="function">ST_YMax() </code></a>

<a href="fn_st_zmin.html" class="link" title="ST_ZMin"><code
class="function">ST_ZMin() </code></a>

<a href="fn_st_zmax.html" class="link" title="ST_ZMax"><code
class="function">ST_ZMax() </code></a>

<a href="fn_st_mmax.html" class="link" title="ST_MMax"><code
class="function">ST_MMax() </code></a>

</div>

</div>
