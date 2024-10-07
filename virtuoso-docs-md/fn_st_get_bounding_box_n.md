<div id="fn_st_get_bounding_box_n" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_get_bounding_box_n — Given a 1-based index of a member of a MULTI...
or ...COLLECTION shape, returns the bounding box of a member.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_get_bounding_box_n" class="funcsynopsis">

|                                    |                    |
|------------------------------------|--------------------|
| ` `**`st_get_bounding_box_n`**` (` | in `shape ` any ,  |
|                                    | in `idx ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_get_bounding_box_n" class="refsect1">

## Description

Given a 1-based index of a member of a MULTI... or ...COLLECTION shape,
returns the bounding box of a member. This is a fast equivalent of
<a href="fn_st_get_bounding_box_n.html" class="link"
title="st_get_bounding_box_n"><code
class="function">st_get_bounding_box_n(ST_GeometryN (shape,idx)) </code></a>
.

</div>

<div id="params_st_get_bounding_box_n" class="refsect1">

## Parameters

<div id="id131163" class="refsect2">

### shape

Shape

</div>

<div id="id131166" class="refsect2">

### idx

Index

</div>

</div>

<div id="ret_st_get_bounding_box_n" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_st_get_bounding_box_n" class="refsect1">

## Examples

<div id="ex_st_get_bounding_box_n" class="example">

**Example 24.662. Simple Use**

<div class="example-contents">

``` screen
SQL> select st_get_bounding_box_n (
              st_ewkt_read ('
                GEOMETRYCOLLECTION(
                  POINT(0 0),
                  MULTILINESTRING(
                    (1 5,0 1,4 0,5 4),
                    (1 5,1 0,4 0,4 5)),
                  MULTIPOLYGON(
                    ((1 3,2 4,1 5,0 4,1 3)),
                    ((1 2,2 1,1 0,0 1,1 2))))'), 1)
unnamed
VARCHAR NOT NULL
_______________________________________________________________________________

BOX2D(0.0 0.0,0.0 0.0)

SQL> select st_get_bounding_box_n (
              st_ewkt_read ('
                GEOMETRYCOLLECTION(
                  POINT(0 0),
                  MULTILINESTRING(
                    (1 5,0 1,4 0,5 4),
                    (1 5,1 0,4 0,4 5)),
                  MULTIPOLYGON(
                    ((1 3,2 4,1 5,0 4,1 3)),
                    ((1 2,2 1,1 0,0 1,1 2))))'), 2)
unnamed
VARCHAR NOT NULL
_______________________________________________________________________________

BOX2D(0.0 0.0,5.000001 5.000001)
```

</div>

</div>

  

</div>

<div id="seealso_st_get_bounding_box_n" class="refsect1">

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
