<div>

<div>

</div>

<div>

## Name

st_transform_by_custom_projection — Performs a custom projection of
shape, using the specified algorithm and algorithm-specific arguments.

</div>

<div>

## Synopsis

<div>

|                                                |                             |
|------------------------------------------------|-----------------------------|
| ` `**`st_transform_by_custom_projection`**` (` | in `shape ` any ,           |
|                                                | in `algorithm_id ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Performs a custom projection of shape, using the specified algorithm and
algorithm-specific arguments.

</div>

<div>

## Parameters

<div>

### shape

Geometry.

</div>

<div>

### algorithm_id

Algorithm -- Current version supports only one algorithm,
st_transform_by_custom_projection (shape, 'OLAEAPS', long_of_center,
lat_of_center) for Oblique Lampert Azimuthal Equal-Area Projection
System with the specified center point.

</div>

</div>

<div>

## Return Types

Returns varchar.

</div>

<div>

## Examples

<div>

**Example 24.673. Simple Use**

<div>

``` screen
select st_transform_by_custom_projection (
  st_ewkt_read ('POLYGON((1 3,2 4,1 5,0 4,1 3),
                         (1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))'),
  'OLAEAPS', 20, 45)
unnamed
VARCHAR NOT NULL
_______________________________________________________________________________

SRID=0;POLYGON((-0.352161 -0.627582,
                -0.332392 -0.617674,
                -0.348956 -0.599730,
                -0.368752 -0.609534,
                -0.352161 -0.627582),
               (-0.351386 -0.620657,
                -0.341498 -0.615717,
                -0.349784 -0.606732,
                -0.359678 -0.611647,
                -0.351386 -0.620657))
```

</div>

</div>

  

</div>

<div>

## See Also

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
