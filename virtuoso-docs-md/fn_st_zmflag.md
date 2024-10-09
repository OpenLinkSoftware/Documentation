<div>

<div>

</div>

<div>

## Name

ST_Zmflag — returns bits indicating presence of Z and/or M coordinates.

</div>

<div>

## Synopsis

<div>

|                        |                  |
|------------------------|------------------|
| ` `**`ST_Zmflag`**` (` | in `g ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns bits indicating presence of Z and/or M coordinates. 0 means that
the shape has only X and Y, 1 means that M is also in use (but not Z), 2
means Z but ont M, 3 is for both M and Z.

</div>

<div>

## Parameters

<div>

### g

Geometry

</div>

</div>

<div>

## Return Types

Returns integer.

</div>

<div>

## Examples

<div>

**Example 24.682. Simple Use**

<div>

``` screen
SELECT ST_Zmflag( st_point (10, 20, 30, 40));
unnamed
INTEGER
 3
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
