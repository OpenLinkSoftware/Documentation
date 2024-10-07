<div id="fn_dist_from_point_to_line_segment" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dist_from_point_to_line_segment — returns the distance between a point
and a segment on a plane.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dist_from_point_to_line_segment" class="funcsynopsis">

|                                              |                          |
|----------------------------------------------|--------------------------|
| ` `**`dist_from_point_to_line_segment`**` (` | in `Xpoint ` any ,       |
|                                              | in `Ypoint ` any ,       |
|                                              | in `Xsegment1 ` any ,    |
|                                              | in `Ysegment1 ` any ,    |
|                                              | in `Xsegment2 ` any ,    |
|                                              | in `Ysegment2 ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dist_from_point_to_line_segment" class="refsect1">

## Description

returns the distance between a point and a segment on a plane.

</div>

<div id="params_dist_from_point_to_line_segment" class="refsect1">

## Parameters

<div id="id130726" class="refsect2">

### Xpoint

A X point

</div>

<div id="id130729" class="refsect2">

### Ypoint

A Y point

</div>

<div id="id130732" class="refsect2">

### Xsegment1

X Segment

</div>

<div id="id130735" class="refsect2">

### Ysegment1

Y Segment

</div>

<div id="id130738" class="refsect2">

### Xsegment2

X Segment

</div>

<div id="id130741" class="refsect2">

### Ysegment2

Y Segment

</div>

</div>

<div id="ret_dist_from_point_to_line_segment" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_dist_from_point_to_line_segment" class="refsect1">

## Examples

<div id="ex_dist_from_point_to_line_segment" class="example">

**Example 24.657. Simple Use**

<div class="example-contents">

``` screen
SQL> select dist_from_point_to_line_segment (5, 5, 0, 3, 4, 0)

4.6

SQL> select dist_from_point_to_line_segment (5, 0, 0, 3, 4, 0)

1

SQL> select dist_from_point_to_line_segment (5, -1, 0, 3, 4, 0)

1.414213562373095

SQL> select dist_from_point_to_line_segment (5, -5, 0, 3, 4, 0)

5.099019513592784
```

</div>

</div>

  

</div>

<div id="seealso_dist_from_point_to_line_segment" class="refsect1">

## See Also

<a href="fn_haversine_deg_km.html" class="link"
title="haversine_deg_km"><code
class="function">haversine_deg_km() </code></a>

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
