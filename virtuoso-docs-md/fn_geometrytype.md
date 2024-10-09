<div>

<div>

</div>

<div>

## Name

GeometryType — returns EWKT type name of a shape.

</div>

<div>

## Synopsis

<div>

|                           |                      |
|---------------------------|----------------------|
| ` `**`GeometryType`**` (` | in `shape ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

GeometryType function returns EWKT type name of a given shape.

</div>

<div>

## Parameters

<div>

### shape

Geometry.

</div>

</div>

<div>

## Return Types

Returns varchar.

</div>

<div>

## Examples

<div>

**Example 24.653. Simple example**

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
 SPARQL
 SELECT ?s,
        bif:GeometryType(?o)
 FROM <http://geo-api-demo/>
 WHERE
   {
     ?s ?p ?o
   }
 ORDER BY ASC(str(?s))
s                                  callret-1
VARCHAR                            VARCHAR
_______________________________________________________________________________

http://geo-api-demo/box1           BOX2D
http://geo-api-demo/collection     GEOMETRYCOLLECTION
http://geo-api-demo/linestring     LINESTRING
http://geo-api-demo/multipolygon   MULTIPOLYGON
http://geo-api-demo/point2d        POINT
http://geo-api-demo/point4d        POINTZM
http://geo-api-demo/polygon1       POLYGON
http://geo-api-demo/polygon2       POLYGON
http://geo-api-demo/polygon3       POLYGON
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_geometryn.html" class="link" title="ST_GeometryN"><code
class="function">ST_GeometryN() </code></a>

<a href="fn_st_numgeometries.html" class="link"
title="ST_NumGeometries"><code
class="function">ST_NumGeometries() </code></a>

</div>

</div>
