<div>

<div>

<div>

<div>

### 9.34.5. Querying Geometric Relations

</div>

</div>

</div>

The SQL MM predicates
<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects</code></a> ,
<a href="fn_st_contains.html" class="link" title="st_contains"><code
class="function">st_contains</code></a> and
<a href="fn_st_within.html" class="link" title="st_within"><code
class="function">st_within</code></a> can be used to test whether two
geometries overlap in different ways.

<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects</code></a> means that the 1st and 2nd
arguments have at least one shared point,
<a href="fn_st_contains.html" class="link" title="st_contains"><code
class="function">st_contains</code></a> means that the 2nd argument is
fully contained in the 1st argument,
<a href="fn_st_within.html" class="link" title="st_within"><code
class="function">st_within</code></a> means that the 1st argument is
fully contained within the 2nd argument.

These functions are extended with a third argument which gives a
precision. The precision is a number that specifies a maximum distance
between two points such that the points will still be considered to
overlap. If both the 1st and 2nd arguments are points, then precision
can be interpreted as the maximum distance between them.

These do not require the presence of a geometry index but will use one
if one is present and one of the geometry arguments is a column on which
there is such an index.

</div>
