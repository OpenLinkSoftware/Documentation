<div>

<div>

<div>

<div>

### 9.34.2. Geometric Objects

</div>

</div>

</div>

Virtuoso supports a wide variety of spatial features that can be
represented in WKT or SHP: BOX, BOX2D, BOX3D, BOXM, BOXZ, BOXZM
CIRCULARSTRING COMPOUNDCURVE CURVEPOLYGON EMPTY GEOMETRYCOLLECTION,
GEOMETRYCOLLECTIONM, GEOMETRYCOLLECTIONZ, GEOMETRYCOLLECTIONZM
LINESTRING, LINESTRINGM, LINESTRINGZ, LINESTRINGZM MULTICURVE
MULTILINESTRING, MULTILINESTRINGM, MULTILINESTRINGZ, MULTILINESTRINGZM
MULTIPOINT, MULTIPOINTM, MULTIPOINTZ, MULTIPOINTZM MULTIPOLYGON,
MULTIPOLYGONM, MULTIPOLYGONZ, MULTIPOLYGONZM POINT, POINTM, POINTZ,
POINTZM POLYGON, POLYGONM, POLYGONZ, POLYGONZM POLYLINE, POLYLINEZ RING,
RINGM, RINGZ, RINGZM

Some less popular types are not yet supported: CIRCULARSTRINGM,
CIRCULARSTRINGZ, CIRCULARSTRINGZM COMPOUNDCURVEM, COMPOUNDCURVEZ,
COMPOUNDCURVEZM CURVE, CURVEM, CURVEZ, CURVEZM CURVEPOLYGONM,
CURVEPOLYGONZ, CURVEPOLYGONZM GEOMETRY, GEOMETRYZ, GEOMETRYZM
MULTICURVEM, MULTICURVEZ, MULTICURVEZM MULTIPATCH MULTISURFACE,
MULTISURFACEM, MULTISURFACEZ, MULTISURFACEZM POLYHEDRALSURFACE,
POLYHEDRALSURFACEM, POLYHEDRALSURFACEZ, POLYHEDRALSURFACEZM POLYLINEM
SURFACE, SURFACEM, SURFACEZ, SURFACEZM TIN, TINM, TINZ, TINZM

For the sake of speed and scalability, spatial support has some
intentional restrictions, that will probably persist for long time.

--- No support for circumpolar shapes. A ring with a pole inside it or
on the border of it may be treated as an error or result in wrong
calculations of spatial relations. E.g. the st_intersects of two
triangles POLYGON((0 89, 120 89, 240 89, 0 89)) and POLYGON((0 88, 120
88, 240 88, 0 88)) may return FALSE. st_intersects of two triangles
POLYGON((0 89, 60 90, 120 89, 0 89)) and POLYGON((120 88, 180 90, 240
88, 120 88)) may also return FALSE. Note that Equator is a circumpolar
shape.

--- No support for long orthodromic or near-orthodromic arcs. The
implementation assumes that shapes reside inside their bounding boxes so
st_intersects of two orthodromic arcs, LINE (0 1, 180 1) and LINE (90 1,
270 1) may return FALSE. However big shapes made of small segments (such
as a coastline of Eurasia) will be handled correctly. Shapes that are
close to 180 longitude get two sets of bounding boxes, shifted 360 one
from another, so relations between Alaska and Chukotka will be
calculated correctly no matter what offset is used.

--- In order to deal with weird data sources, the range for longitudes
is -270 to -540 and the range for latitudes is -90 to +90 for most cases
and -96 to +96 for some features such as bounding boxes. If the parsing
of a shape did not report range errors for co-ordinates then there's no
warranty that all points are in WGS ranges.

--- Peculiarities like self-touch or self-intersection of polygons can
be detected, but no warranties are given.

--- Arcstrings are poorly supported and their support will never be
optimized for speed. Each arc is supposed to be no longer than 180
degrees. As a result, ESRI circles that consist of two arcs 180+180 are
supported whereas ST_Intersects on "ill" circles like 270+90 may return
wrong answers.

</div>
