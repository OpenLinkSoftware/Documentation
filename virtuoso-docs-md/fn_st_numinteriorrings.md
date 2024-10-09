<div>

<div>

</div>

<div>

## Name

ST_NumInteriorRings — returns number of interior rings of the given
polygon, NULL if shape is not a polygon.

</div>

<div>

## Synopsis

<div>

|                                  |                        |
|----------------------------------|------------------------|
| ` `**`ST_NumInteriorRings`**` (` | in `poligon ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns number of interior rings of the given polygon, NULL if shape is
not a polygon.

</div>

<div>

## Parameters

<div>

### poligon

Given polygon.

</div>

</div>

<div>

## Return Types

Returns int.

</div>

<div>

## Examples

<div>

**Example 24.671. Simple Use**

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

SQL> SPARQL
SELECT ?s bif:ST_NumInteriorRings (?o)
FROM <http://geo-api-demo/>
WHERE { ?s ?p ?o }
ORDER BY ASC(str(?s))
s                                 callret-1
VARCHAR                           VARCHAR
_______________________________________________________________________________

http://geo-api-demo/box1          NULL
http://geo-api-demo/collection    NULL
http://geo-api-demo/linestring    NULL
http://geo-api-demo/multipolygon  0
http://geo-api-demo/point2d       NULL
http://geo-api-demo/point4d       NULL
http://geo-api-demo/polygon1      0
http://geo-api-demo/polygon2      0
http://geo-api-demo/polygon3      1
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_interiorringn.html" class="link"
title="ST_InteriorRingN"><code
class="function">ST_InteriorRingN() </code></a>

<a href="fn_st_exteriorring.html" class="link"
title="ST_ExteriorRing"><code
class="function">ST_ExteriorRing() </code></a>

</div>

</div>
