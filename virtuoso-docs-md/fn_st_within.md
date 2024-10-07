<div id="fn_st_within" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_within — Returns true if all points of a given geometry g1 are in
another geometry g2.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_within" class="funcsynopsis">

|                        |                                  |
|------------------------|----------------------------------|
| ` `**`st_within`**` (` | in `g1 ` any ,                   |
|                        | in `g2 ` any ,                   |
|                        | in `prec ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_within" class="refsect1">

## Description

Returns true if all points of g1 are in g2. If prec is supplied, this is
a tolerance for the matching in units of linear distance appropriate to
the srid. Both geometries should have the same srid.

</div>

<div id="params_st_within" class="refsect1">

## Parameters

<div id="id91352" class="refsect2">

### g1

The first geometry.

</div>

<div id="id91355" class="refsect2">

### g2

The second geometry.

</div>

<div id="id91358" class="refsect2">

### prec

A tolerance for the matching in units of linear distance appropriate to
the srid. Default is 0.

</div>

</div>

<div id="ret_st_within" class="refsect1">

## Return Types

Returns int.

</div>

<div id="examples_st_within" class="refsect1">

## Examples

<div id="ex_st_within" class="example">

**Example 24.146. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SPARQL
SELECT ?c ?geo
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a ?c .
    FILTER (bif:st_within(?geo, bif:st_point (0, 52), 100))
  }
LIMIT 10;
c                                                geo
ANY                                              ANY
_______________________________
http://linkedgeodata.org/vocabulary#node     POINT(0.0197 51.1005)
http://linkedgeodata.org/vocabulary#node     POINT(0.0207 51.1006)
http://linkedgeodata.org/vocabulary#node     POINT(0.0148 51.1006)
http://linkedgeodata.org/vocabulary#node     POINT(0.0217 51.1006)
http://linkedgeodata.org/vocabulary#node     POINT(0.0021 51.1008)
http://linkedgeodata.org/vocabulary#node     POINT(0.0029 51.1008)
http://linkedgeodata.org/vocabulary#node     POINT(0.0467 51.1007)
http://linkedgeodata.org/vocabulary#node     POINT(0.0217 51.1007)
http://linkedgeodata.org/vocabulary#node     POINT(0.0148 51.1007)
http://linkedgeodata.org/vocabulary#node     POINT(0.0217 51.1008)
No. of rows in result: 10
```

</div>

</div>

  

</div>

<div id="seealso_st_within" class="refsect1">

## See Also

<a href="sqlrefgeospatialqgr.html" class="link"
title="9.34.5. Querying Geometric Relations">Querying Geometric
Relations</a>

<a href="fn_st_point.html" class="link" title="st_point"><code
class="function">st_point </code></a>

<a href="fn_st_x.html" class="link" title="st_x"><code
class="function">st_x </code></a>

<a href="fn_st_y.html" class="link" title="st_y"><code
class="function">st_y </code></a>

<a href="fn_st_distance.html" class="link" title="st_distance"><code
class="function">st_distance </code></a>

<a href="fn_st_srid.html" class="link" title="ST_SRID"><code
class="function">st_srid </code></a>

<a href="fn_st_setsrid.html" class="link" title="ST_SetSRID"><code
class="function">st_setsrid </code></a>

<a href="fn_st_astext.html" class="link" title="st_astext"><code
class="function">st_astext </code></a>

<a href="fn_st_geomfromtext.html" class="link"
title="st_geomfromtext"><code
class="function">st_geomfromtext </code></a>

<a href="fn_st_intersects.html" class="link" title="st_intersects"><code
class="function">st_intersects </code></a>

<a href="fn_st_contains.html" class="link" title="st_contains"><code
class="function">st_contains </code></a>

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
