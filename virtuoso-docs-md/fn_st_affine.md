<div id="fn_st_affine" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ST_Affine — performs standard 2d affine transformation

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_affine" class="funcsynopsis">

|                        |                     |
|------------------------|---------------------|
| ` `**`ST_Affine`**` (` | in `XXa ` any ,     |
|                        | in `XYb ` any ,     |
|                        | in `YYe ` any ,     |
|                        | in `Xoff ` any ,    |
|                        | in `Yoff ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_affine" class="refsect1">

## Description

performs standard 2d affine transformation with matrix:

``` programlisting
XXa XXb 0
YXd YYe 0
0    0    0
```

and shift (Xoff, Yoff, 0)

</div>

<div id="params_st_affine" class="refsect1">

## Parameters

<div id="id90438" class="refsect2">

### XXa

matrix a

</div>

<div id="id90441" class="refsect2">

### XYb

matrix b

</div>

<div id="id90444" class="refsect2">

### YYe

matrix e

</div>

<div id="id90447" class="refsect2">

### Xoff

x

</div>

<div id="id90450" class="refsect2">

### Yoff

y

</div>

</div>

<div id="ret_st_affine" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_st_affine" class="refsect1">

## Examples

<div id="ex_st_affine" class="example">

**Example 24.135. Simple Use**

<div class="example-contents">

``` screen
select st_affine (st_ewkt_read ('POLYGON((1 3,2 4,1 5,0 4,1 3),
                                         (1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))'),
                  30, 3, 1, 0.3, 0.001, 0.002)
VARCHAR NOT NULL
_______________________________________________________________________________

POLYGON((39.001000 1.902000,
         72.001000 3.202000,
         45.001000 2.502000,
         12.001000 1.202000,
         39.001000 1.902000),
        (40.501000 2.052000,
         57.001000 2.702000,
         43.501000 2.352000,
         27.001000 1.702000,
         40.501000 2.052000))
```

</div>

</div>

  

</div>

<div id="seealso_st_affine" class="refsect1">

## See Also

<a href="fn_st_get_bounding_box.html" class="link"
title="st_get_bounding_box"><code
class="function">st_get_bounding_box() </code></a>

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

<a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">ST_SetSRID </code></a>

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
