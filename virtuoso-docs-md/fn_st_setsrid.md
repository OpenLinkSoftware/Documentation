<div id="fn_st_setsrid" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ST_SetSRID — replaces the SRID of a shape but does not transform the
shape or its coordinates from old SRID to a new one.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_setsrid" class="funcsynopsis">

|                         |                     |
|-------------------------|---------------------|
| ` `**`ST_SetSRID`**` (` | in `g ` any ,       |
|                         | in `SRID ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_setsrid" class="refsect1">

## Description

The geometry given as argument is modified to have the specified SRID
and the modified geometry is returned.

</div>

<div id="params_st_setsrid" class="refsect1">

## Parameters

<div id="id90933" class="refsect2">

### g

The geometry to be modified.

</div>

<div id="id90936" class="refsect2">

### SRID

The specified SRID.

</div>

</div>

<div id="ret_st_setsrid" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_st_setsrid" class="refsect1">

## Examples

<div id="ex_st_setsrid" class="example">

**Example 24.141. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SELECT ST_SetSRID( st_point (10,2), 4335);
callret
ANY
_______________________________
POINT(0.0197 51.1005)
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_st_setsrid" class="refsect1">

## See Also

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y </code></a>

<a href="fn_st_z.html" class="link" title="ST_Z"><code
class="function">ST_Z </code></a>

<a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance </code></a>

<a href="fn_st_srid.html" class="link" title="ST_SRID"><code
class="function">ST_SRID </code></a>

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
