<div id="sqlrefgeospatial" class="section">

<div class="titlepage">

<div>

<div>

## 9.34. Geometry Data Types and Spatial Index Support

</div>

</div>

</div>

Virtuoso includes a spatial database capability from version 6.01.3126
onwards. This capability is specially geared towards geographical data
in RDF but can be used with SQL also. The functions implemented follow
the SQL MM spatial specification where applicable but the entire SQL MM
function set is not supported.

Spatial indexing is supported by a two dimensional R tree
implementation. The geometries supported may have from two to four
dimensions, with a choice of WGS 84 (or similar) latitude and longitude
coordinates with haversine distances or a flat 2 dimensional plane for
spatial reference system.

<div id="sqlrefgeospatialspatref" class="section">

<div class="titlepage">

<div>

<div>

### 9.34.1. Spatial References

</div>

</div>

</div>

The default reference system is WGS-84 with coordinates in degrees of
longitude and latitude on Earth. The SRID number for this is 4326 and is
assigned by default to all new geometries.
<a href="fn_st_transform.html" class="link" title="ST_Transform"><code
class="function">ST_Transform</code></a> can be used to re-calculate
coordinates of a shape from one spatial reference system to another.
<a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">ST_SetSRID</code></a> can be used for altering SRID
without altering coordinates.

Distances and precisions for "latitude-longitude" spatial reference
systems are in kilometers, as approximately calculated with the
haversine formula. For other systems they are in the same unit as the
coordinates.

</div>

</div>
