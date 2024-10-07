<div id="fn_haversine_deg_km" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

haversine_deg_km — Given latitudes and longitudes of two points in
degrees, calculates the approximate distance between that points in
kilometers

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_haversine_deg_km" class="funcsynopsis">

|                               |                                   |
|-------------------------------|-----------------------------------|
| ` `**`haversine_deg_km`**` (` | in `lat1 ` double precision ,     |
|                               | in `long1 ` double precision ,    |
|                               | in `lat2 ` double precision ,     |
|                               | in `long2 ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_haversine_deg_km" class="refsect1">

## Description

The function calculates the approximate distance between two points,
using haversine formula with an adjustment for case when points are ends
of some diameter.

Note that the order of arguments is latitude-longitude, not
longitude-latitude.

</div>

<div id="params_haversine_deg_km" class="refsect1">

## Parameters

<div id="id131256" class="refsect2">

### lat1

latitude

</div>

<div id="id131259" class="refsect2">

### long1

longitude

</div>

<div id="id131262" class="refsect2">

### lat2

latitude

</div>

<div id="id131265" class="refsect2">

### long2

longitude

</div>

</div>

<div id="ret_haversine_deg_km" class="refsect1">

## Return Types

The function returns distance in kilometers as double precision.

</div>

<div id="examples_haversine_deg_km" class="refsect1">

## Examples

<div id="ex_haversine_deg_km" class="example">

**Example 24.663. Simple example**

<div class="example-contents">

``` screen
-- select haversine_deg_km (-90,0,90,0)
haversine_deg_km
VARCHAR
_______________________________________________________________________________

20003.88915449353

-- select haversine_deg_km (0,0,0,180) - haversine_deg_km (-90,0,90,0)
temp
VARCHAR
_______________________________________________________________________________

33.61918829571368
```

</div>

</div>

  

</div>

<div id="seealso_haversine_deg_km" class="refsect1">

## See Also

<a href="fn_earth_radius.html" class="link" title="earth_radius"><code
class="function">earth_radius() </code></a>

<a href="fn_dist_from_point_to_line_segment.html" class="link"
title="dist_from_point_to_line_segment"><code
class="function">dist_from_point_to_line_segment() </code></a>

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
