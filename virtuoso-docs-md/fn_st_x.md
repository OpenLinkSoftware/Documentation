<div id="fn_st_x" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_x — Retrieves the x coordinate of a geometry.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_x" class="funcsynopsis">

|                   |                  |
|-------------------|------------------|
| ` `**`st_x`**` (` | in `g ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_x" class="refsect1">

## Description

Retrieves the x coordinate of a geometry.

</div>

<div id="params_st_x" class="refsect1">

## Parameters

<div id="id90615" class="refsect2">

### g

Geometry point

</div>

</div>

<div id="ret_st_x" class="refsect1">

## Return Types

Returns double precision.

</div>

<div id="examples_st_x" class="refsect1">

## Examples

<div id="ex_st_x" class="example">

**Example 24.137. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SELECT st_x( st_point (10, 20));
callret
VARCHAR
_______________________________
 10
No. of rows in result: 1

SQL>SPARQL
SELECT DISTINCT (bif:st_x(?geo ))
WHERE
   {
     ?m geo:geometry ?geo .
   }
LIMIT 10;

callret-0
ANY
_______________________________
 -139.2666625976562
 -153.8333282470703
 -163
 -170.8000030517578
 -142.1759033203125
 -142.2581024169922
 -85.03309631347656
 -142.6853942871094
 -143.6544952392578
 -143.8195037841797
No. of rows in result: 10
```

</div>

</div>

  

</div>

<div id="seealso_st_x" class="refsect1">

## See Also

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y </code></a>

<a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance </code></a>

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
