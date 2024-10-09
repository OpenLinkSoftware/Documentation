<div>

<div>

</div>

<div>

## Name

ST_M — returns the M coordinate.

</div>

<div>

## Synopsis

<div>

|                   |                  |
|-------------------|------------------|
| ` `**`ST_M`**` (` | in `g ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

returns the M coordinate. M is for mileage or the like. M equal to 245.3
could be 245.3 km of road or 0.3 distance from buoy 245 to buoy 246 or
similar.

</div>

<div>

## Parameters

<div>

### g

Geometry point

</div>

</div>

<div>

## Return Types

Returns double precision.

</div>

<div>

## Examples

<div>

**Example 24.666. Simple Use**

<div>

``` screen
SELECT st_m( st_point (10, 20, 30, 40));
unnamed
DOUBLE PRECISION
40
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
