<div>

<div>

</div>

<div>

## Name

st_linestring — returns a linestring in default SRID

</div>

<div>

## Synopsis

<div>

|                            |                      |
|----------------------------|----------------------|
| ` `**`st_linestring`**` (` | in `item1 ` any ,    |
|                            | in `item2 ` any ,    |
|                            | in `itemN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns a linestring in default SRID, the coordinates of vertices are
specified by arguments that are points, 2-, 3- or 4-item vectors of
coordinates, linestrings, arcstrings or vectors of the above mentioned
values. Repeating vertices are automatically removed, except the case of
repeating vertices in the middle of a linestring/arcstring argument.

</div>

<div>

## Parameters

<div>

### item1

Geometry.

</div>

<div>

### item2

Geometry.

</div>

<div>

### itemN

Geometry.

</div>

</div>

<div>

## Return Types

Returns varchar.

</div>

<div>

## Examples

<div>

**Example 24.665. Simple Use**

<div>

``` screen
SQL> select st_linestring (st_point (11,22),
                           st_point (13, 24),
                           st_point (13,24),
                           st_point (15,26),
                           st_point (17,28))
unnamed
VARCHAR NOT NULL
_______________________________________________________________________________

LINESTRING(11.0 22.0,13.0 24.0,15.0 26.0,17.0 28.0)

SQL> select st_linestring (st_linestring (vector(vector (11,22),
                                                 vector (13, 24))),
                           st_linestring (vector (13,24), vector(vector (15,26),
                                                          vector (17,28))))
st_linestring
VARCHAR
_______________________________________________________________________________

LINESTRING(11.0 22.0,13.0 24.0,15.0 26.0,17.0 28.0)
```

</div>

</div>

  

</div>

<div>

## See Also

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
