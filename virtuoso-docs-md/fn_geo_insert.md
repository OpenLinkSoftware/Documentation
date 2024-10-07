<div id="fn_geo_insert" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

geo_insert — Inserts a geometry from an R tree index.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_geo_insert" class="funcsynopsis">

|                         |                   |
|-------------------------|-------------------|
| ` `**`geo_insert`**` (` | in `tb ` any ,    |
|                         | in `geo ` any ,   |
|                         | in `id ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_geo_insert" class="refsect1">

## Description

Inserts a geometry from an R tree index. The tb must be a fully
qualified name of an R tree table. This function is typically used from
triggers on a geometry column. The function is transactional and makes a
transaction log record of the action.

</div>

<div id="params_geo_insert" class="refsect1">

## Parameters

<div id="id91518" class="refsect2">

### tb

A fully qualified name of an R tree table.

</div>

<div id="id91521" class="refsect2">

### geo

A geometry.

</div>

<div id="id91524" class="refsect2">

### id

Geometry id.

</div>

</div>

<div id="ret_geo_insert" class="refsect1">

## Return Types

Returns int.

</div>

<div id="examples_geo_insert" class="refsect1">

## Examples

<div id="ex_geo_insert" class="example">

**Example 24.148. Simple example**

<div class="example-contents">

``` programlisting
```

</div>

</div>

  

</div>

<div id="seealso_geo_insert" class="refsect1">

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
