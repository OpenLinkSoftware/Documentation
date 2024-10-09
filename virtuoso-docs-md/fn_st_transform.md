<div>

<div>

</div>

<div>

## Name

ST_Transform — Transforms the given shape from its current spatial
reference system to one specified by dest_srid.

</div>

<div>

## Synopsis

<div>

|                           |                                      |
|---------------------------|--------------------------------------|
| ` `**`ST_Transform`**` (` | in `shape ` any ,                    |
|                           | in `dest_srid ` any ,                |
|                           | in `origin_proj4_string ` varchar ,  |
|                           | in `dest_proj4_string ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Transforms the given shape from its current spatial reference system to
one specified by dest_srid. Two optional arguments: the SRID of the
resulting shape is set to dest_srid but the conversion is done by proj4
using origin_proj4_string for projection of original shape and
dest_proj4_string for the result. If orig_proj4_string or
dest_proj4_string argument is passed but is NULL instead of string, the
projection corresponding to original or destination SRID is used.
ST_Transform is provided by a separate plugin named v7proj4, as
described below. When the plugin is loaded, functions like
ST_Intersects() support pairs of arguments with different SRIDs by
converting coords of second argument into the system of the first one,
as required by OGC and GeoSPARQL.

</div>

<div>

## Parameters

<div>

### shape

Geometry.

</div>

<div>

### dest_srid

Destination SRID.

</div>

<div>

### origin_proj4_string

String to be used for the projection.

</div>

<div>

### dest_proj4_string

String used for the destination result.

</div>

</div>

<div>

## Return Types

Returns varchar.

</div>

<div>

## Examples

<div>

**Example 24.672. Simple Use**

<div>

``` screen
SQL> SELECT * FROM DB.DBA.SYS_V7PROJ4_SRIDS;
SR_ID              SR_FAMILY          SR_TAG    SR_ORIGIN              SR_IRI    SR_PROJ4_STRING                                                                                                                                                                         SR_WKT    SR_COMMENT   SR_PROJ4_XML
INTEGER NOT NULL   VARCHAR NOT NULL   VARCHAR   VARCHAR NOT NULL       VARCHAR   VARCHAR NOT NULL                                                                                                                                                                        VARCHAR   VARCHAR      VARCHAR
________________   ________________   _______   ____________________   _______   _____________________________________________________________________________________________________________________________________________________________________________________   _______   __________   ____________

2005               EPSG               2005      /usr/share/proj/epsg   NULL      +ellps=clrk80 +k=0.9995000000000001 +lat_0=0 +lon_0=-62 +no_defs +proj=tmerc +units=m +x_0=400000 +y_0=0                                                                                          NULL         NULL
2249               EPSG               2249      /usr/share/proj/epsg   NULL      +datum=NAD83 +ellps=GRS80 +lat_0=41 +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lon_0=-71.5 +no_defs +proj=lcc +to_meter=0.3048006096012192 +x_0=200000.0001016002 +y_0=750000             NULL         NULL
4326               EPSG               4326      /usr/share/proj/epsg   NULL      +datum=WGS84 +ellps=WGS84 +no_defs +proj=longlat                                                                                                                                                  NULL         NULL

3 Rows. -- 1 msec.
SQL> SELECT
st_transform (
    st_geomfromtext ('POLYGON((-16 20.25,
                               -16.1 20.35,
                               -15.9 20.35,
                               -16 20.25))'),
                     1,
                     '+proj=latlong +ellps=clrk66',
                     '+proj=merc +ellps=clrk66 +lat_ts=33');
unnamed
VARCHAR NOT NULL
_____________________________________________________________________________________________________________________________________________

SRID=1;POLYGON((-1495284.211473 1920596.789917,
                -1504629.737795 1930501.842961,
                -1485938.685152 1930501.842961,
                -1495284.211473 1920596.789917))

1 Rows. -- 0 msec.

SQL> SELECT ST_AsText(
              ST_Transform(
                ST_GeomFromText('POLYGON((743238 2967416,
                                          743238 2967450,
                                          743265 2967450,
                                          743265.625 2967416,
                                          743238 2967416))',
                                 2249),4326)) AS wgs_geom;
wgs_geom
VARCHAR NOT NULL
___________________________________________________________________________________________________________________

POLYGON((-71.177685 42.390290,
         -71.177684 42.390383,
         -71.177584 42.390383,
         -71.177583 42.390289,
         -71.177685 42.390290))

1 Rows. -- 1 msec.
SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_st_transform_by_custom_projection.html" class="link"
title="st_transform_by_custom_projection"><code
class="function">st_transform_by_custom_projection() </code></a>

<a href="fn_st_translate.html" class="link" title="ST_Translate"><code
class="function">ST_Translate() </code></a>

<a href="fn_st_transscale.html" class="link" title="ST_TransScale"><code
class="function">ST_TransScale() </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">ST_X() </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">ST_Y() </code></a>

<a href="fn_st_z.html" class="link" title="ST_Z"><code
class="function">ST_Z() </code></a>

<a href="fn_st_m.html" class="link" title="ST_M"><code
class="function">ST_M() </code></a>

<a href="fn_st_xmin.html" class="link" title="ST_XMin"><code
class="function">ST_XMin() </code></a>

<a href="fn_st_xmax.html" class="link" title="ST_XMax"><code
class="function">ST_XMax() </code></a>

<a href="fn_st_ymin.html" class="link" title="ST_YMin"><code
class="function">ST_YMin() </code></a>

<a href="fn_st_ymax.html" class="link" title="ST_YMax"><code
class="function">ST_YMax() </code></a>

<a href="fn_st_zmin.html" class="link" title="ST_ZMin"><code
class="function">ST_ZMin() </code></a>

<a href="fn_st_zmax.html" class="link" title="ST_ZMax"><code
class="function">ST_ZMax() </code></a>

<a href="fn_st_mmin.html" class="link" title="ST_MMin"><code
class="function">ST_MMin() </code></a>

<a href="fn_st_mmax.html" class="link" title="ST_MMax"><code
class="function">ST_MMax() </code></a>

</div>

</div>
