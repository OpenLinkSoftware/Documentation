<div id="fn_st_y" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_y — Retrieves the y coordinate of a geometry.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_y" class="funcsynopsis">

|                   |                  |
|-------------------|------------------|
| ` `**`st_y`**` (` | in `g ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_y" class="refsect1">

## Description

Retrieves the y coordinate of a geometry.

</div>

<div id="params_st_y" class="refsect1">

## Parameters

<div id="id90692" class="refsect2">

### g

Geometry

</div>

</div>

<div id="ret_st_y" class="refsect1">

## Return Types

Returns double precision.

</div>

<div id="examples_st_y" class="refsect1">

## Examples

<div id="ex_st_y" class="example">

**Example 24.138. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SELECT st_y( st_point (10, 20));
callret
VARCHAR
_______________________________
 20
No. of rows in result: 1

SQL>SPARQL
SELECT DISTINCT (bif:st_y(?geo ))
WHERE
   {
     ?m geo:geometry ?geo .
   }
LIMIT 10;

callret-0
ANY
_______________________________
 -90
 -86.96666717529297
 -85.41666412353516
 -85.11666870117188
 -85.05999755859375
 -85.04779815673828
 -85.03780364990234
 -85.03070068359375
 -84.99210357666016
 -84.98509979248047
No. of rows in result: 10
```

</div>

</div>

  

</div>

<div id="seealso_st_y" class="refsect1">

## See Also

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

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
