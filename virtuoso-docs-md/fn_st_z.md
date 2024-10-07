<div id="fn_st_z" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ST_Z — Retrieves the z coordinate of a geometry.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_z" class="funcsynopsis">

|                   |                  |
|-------------------|------------------|
| ` `**`ST_Z`**` (` | in `g ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_z" class="refsect1">

## Description

Retrieves the x coordinate of a geometry.

</div>

<div id="params_st_z" class="refsect1">

## Parameters

<div id="id132485" class="refsect2">

### g

Geometry

</div>

</div>

<div id="ret_st_z" class="refsect1">

## Return Types

Returns double precision.

</div>

<div id="examples_st_z" class="refsect1">

## Examples

<div id="ex_st_z" class="example">

**Example 24.680. Simple Use**

<div class="example-contents">

``` screen
SELECT st_z( st_point (10, 20, 30, 40));
DOUBLE PRECISION
 30
```

</div>

</div>

  

</div>

<div id="seealso_st_z" class="refsect1">

## See Also

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">ST_X() </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">ST_Y() </code></a>

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
