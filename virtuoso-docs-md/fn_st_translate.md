<div>

<div>

</div>

<div>

## Name

ST_Translate — returns a copy of a shape with all coordinates shifted by
the provided dX, dY and dZ.

</div>

<div>

## Synopsis

<div>

|                           |                   |
|---------------------------|-------------------|
| ` `**`ST_Translate`**` (` | in `shape ` any , |
|                           | in `dX ` any ,    |
|                           | in `dY ` any ,    |
|                           | in `dZ ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns a copy of a shape with all coordinates shifted by the provided
dX, dY and dZ.

</div>

<div>

## Parameters

<div>

### shape

Geometry.

</div>

<div>

### dX

X coordinate.

</div>

<div>

### dY

Y coordinate.

</div>

<div>

### dZ

Z coordinate.

</div>

</div>

<div>

## Examples

<div>

**Example 24.674. Simple Use**

<div>

``` screen
SQL> DB.DBA.TTLP ('
<point2d>               <shape> "POINT(1 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<point4d>               <shape> "POINTZM(0 1 2 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<box1>                  <shape> "BOX(0 0, 2 3)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<linestring>            <shape> "LINESTRING(10 21, 12 23, 10 25)"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon1>              <shape> "POLYGON((1 3,2 4,1 5,0 4,1 3))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon2>              <shape> "POLYGON((1.5 3.5,2.5 4.5,1.5 5.5,0.5 4.5,1.5 3.5))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<polygon3>              <shape> "POLYGON((1 3,2 4,1 5,0 4,1 3),(1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<multipolygon>          <shape> "MULTIPOLYGON(((1 3,2 4,1 5,0 4,1 3)),((1 2,2 1,1 0,0 1,1 2)))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
<collection>            <shape> "GEOMETRYCOLLECTION(POINT(0 0),MULTILINESTRING((1 5,0 1,4 0,5 4),(1 5,1 0,4 0,4 5)),MULTIPOLYGON(((1 3,2 4,1 5,0 4,1 3)),((1 2,2 1,1 0,0 1,1 2))))"^^<http://www.openlinksw.com/schemas/virtrdf#Geometry> .
', 'http://geo-api-demo/', 'http://geo-api-demo/', 0)

SQL>
SPARQL SELECT ?s, bif:ST_Translate(?o, 0.1, 0.2)
FROM <http://geo-api-demo/>
WHERE
  {
    ?s ?p ?o
  }
ORDER BY ASC(str(?s))
s                                 callret-1
VARCHAR                           VARCHAR
_______________________________________________________________________________

http://geo-api-demo/box1          BOX2D(0.10 0.20,2.10 3.20)
http://geo-api-demo/collection    GEOMETRYCOLLECTION(POINT(0.10 0.20),MULTILINESTRING((1.10 5.20,0.10 1.20,4.10 0.20,5.10 4.20),(1.10 5.20,1.10 0.20,4.10 0.20,4.10 5.20)),MULTIPOLYGON(((1.10 3.20,2.10 4.20,1.10 5.20,0.10 4.20,1.10 3.20)),((1.10 2.20,2.10 1.20,1.10 0.20,0.10 1.20,1.10 2.20))))
http://geo-api-demo/linestring    LINESTRING(10.10 21.20,12.10 23.20,10.10 25.20)
http://geo-api-demo/multipolygon  MULTIPOLYGON(((1.10 3.20,2.10 4.20,1.10 5.20,0.10 4.20,1.10 3.20)),((1.10 2.20,2.10 1.20,1.10 0.20,0.10 1.20,1.10 2.20)))
http://geo-api-demo/point2d       POINT(1.1 3.2)
http://geo-api-demo/point4d       POINTZM(0.10 1.20 2.0 3.0)
http://geo-api-demo/polygon1      POLYGON((1.10 3.20,2.10 4.20,1.10 5.20,0.10 4.20,1.10 3.20))
http://geo-api-demo/polygon2      POLYGON((1.60 3.70,2.60 4.70,1.60 5.70,0.60 4.70,1.60 3.70))
http://geo-api-demo/polygon3      POLYGON((1.10 3.20,2.10 4.20,1.10 5.20,0.10 4.20,1.10 3.20),(1.10 3.70,1.60 4.20,1.10 4.70,0.60 4.20,1.10 3.70))
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_transscale.html" class="link" title="ST_TransScale"><code
class="function">ST_TransScale() </code></a>

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

<a href="fn_st_mmin.html" class="link" title="ST_MMin"><code
class="function">ST_MMin() </code></a>

<a href="fn_st_mmax.html" class="link" title="ST_MMax"><code
class="function">ST_MMax() </code></a>

</div>

</div>
