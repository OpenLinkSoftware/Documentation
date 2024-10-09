<div>

<div>

</div>

<div>

## Name

ST_NumGeometries — returns number of members of a MULTI... or
...COLLECTION shape, 1 for other sorts of shapes.

</div>

<div>

## Synopsis

<div>

|                               |                      |
|-------------------------------|----------------------|
| ` `**`ST_NumGeometries`**` (` | in `shape ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns number of members of a MULTI... or ...COLLECTION shape, 1 for
other sorts of shapes.

</div>

<div>

## Parameters

<div>

### shape

MULTI... or ...COLLECTION shape

</div>

</div>

<div>

## Return Types

Returns int.

</div>

<div>

## Examples

<div>

**Example 24.670. Simple Use**

<div>

``` screen
SQL> DB.DBA.TTLP ('
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

SQL>
SPARQL
SELECT ?s, bif:GeometryType(?o),
       bif:ST_NumGeometries(?o)
FROM <http://geo-api-demo/>
WHERE
 {
   ?s ?p ?o
 }
ORDER BY ASC(str(?s))
s                                 callret-1           callret-2
_______________________________________________________________________________

http://geo-api-demo/box1          BOX2D               1
http://geo-api-demo/collection    GEOMETRYCOLLECTION  3
http://geo-api-demo/linestring    LINESTRING          1
http://geo-api-demo/multipolygon  MULTIPOLYGON        2
http://geo-api-demo/point2d       POINT               1
http://geo-api-demo/point4d       POINTZM             1
http://geo-api-demo/polygon1      POLYGON             1
http://geo-api-demo/polygon2      POLYGON             1
http://geo-api-demo/polygon3      POLYGON             1
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_geometryn.html" class="link" title="ST_GeometryN"><code
class="function">ST_GeometryN() </code></a>

<a href="fn_geometrytype.html" class="link" title="GeometryType"><code
class="function">GeometryType() </code></a>

</div>

</div>
