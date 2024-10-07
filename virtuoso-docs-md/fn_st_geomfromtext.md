<div id="fn_st_geomfromtext" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_geomfromtext — Parses the string and returns the corresponding
geometry.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_geomfromtext" class="funcsynopsis">

|                              |                           |
|------------------------------|---------------------------|
| ` `**`st_geomfromtext`**` (` | in `string ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_geomfromtext" class="refsect1">

## Description

Parses the string and returns the corresponding geometry. The string is
to be in well known text representation (WKT).

</div>

<div id="params_st_geomfromtext" class="refsect1">

## Parameters

<div id="id91093" class="refsect2">

### string

String for the corresponding geometry to be extracted from.

</div>

</div>

<div id="ret_st_geomfromtext" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_st_geomfromtext" class="refsect1">

## Examples

<div id="ex_st_geomfromtext" class="example">

**Example 24.143. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SELECT st_geomfromtext ('point (10.03 30.01)', 2000);
callret
VARCHAR
__________________________________
 POINT(10.03 30.01)
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_st_geomfromtext" class="refsect1">

## See Also

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

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
