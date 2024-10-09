<div>

<div>

</div>

<div>

## Name

ST_TransScale — returns a copy of a shape with all coordinates shifted
by the provided dX, dY and then multiplied by Xfactor and Yfactor.

</div>

<div>

## Synopsis

<div>

|                            |                        |
|----------------------------|------------------------|
| ` `**`ST_TransScale`**` (` | in `shape ` any ,      |
|                            | in `dX ` any ,         |
|                            | in `dY ` any ,         |
|                            | in `Xfactor ` any ,    |
|                            | in `Yfactor ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns a copy of a shape with all coordinates shifted by the provided
dX, dY and then multiplied by Xfactor and Yfactor. Different values for
Xfactor and Yfactor will result in distorted arcs.

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

### Xfactor

X value to multiple by.

</div>

<div>

### Yfactor

Y value to multiple by.

</div>

</div>

<div>

## Return Types

Returns any.

</div>

<div>

## Examples

<div>

**Example 24.675. Simple Use**

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

SQL> SPARQL
SELECT ?s, bif:ST_TransScale(?o, 0.1, 0.2, 0.1, 0.1)
FROM <http://geo-api-demo/>
WHERE
  {
    ?s ?p ?o
  }
ORDER BY ASC(str(?s))
s                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://geo-api-demo/box1          BOX2D(0.010 0.020,0.210 0.320)
http://geo-api-demo/collection    GEOMETRYCOLLECTION(POINT(0.010 0.020),MULTILINESTRING((0.110 0.520,0.010 0.120,0.410 0.020,0.510 0.420),(0.110 0.520,0.110 0.020,0.410 0.020,0.410 0.520)),MULTIPOLYGON(((0.110 0.320,0.010 0.420,0.110 0.520,0.210 0.420,0.110 0.320)),((0.110 0.220,0.010 0.120,0.110 0.020,0.210 0.120,0.110 0.220))))
http://geo-api-demo/linestring    LINESTRING(1.010 2.120,1.210 2.320,1.010 2.520)
http://geo-api-demo/multipolygon  MULTIPOLYGON(((0.110 0.320,0.010 0.420,0.110 0.520,0.210 0.420,0.110 0.320)),((0.110 0.220,0.010 0.120,0.110 0.020,0.210 0.120,0.110 0.220)))
http://geo-api-demo/point2d       POINT(0.11 0.32)
http://geo-api-demo/point4d       POINTZM(0.010 0.120 2.0 3.0)
http://geo-api-demo/polygon1      POLYGON((0.110 0.320,0.010 0.420,0.110 0.520,0.210 0.420,0.110 0.320))
http://geo-api-demo/polygon2      POLYGON((0.160 0.370,0.060 0.470,0.160 0.570,0.260 0.470,0.160 0.370))
http://geo-api-demo/polygon3      POLYGON((0.110 0.320,0.010 0.420,0.110 0.520,0.210 0.420,0.110 0.320),(0.110 0.370,0.060 0.420,0.110 0.470,0.160 0.420,0.110 0.370))
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

<a href="fn_st_mmin.html" class="link" title="ST_MMin"><code
class="function">ST_MMin() </code></a>

<a href="fn_st_mmax.html" class="link" title="ST_MMax"><code
class="function">ST_MMax() </code></a>

</div>

</div>
