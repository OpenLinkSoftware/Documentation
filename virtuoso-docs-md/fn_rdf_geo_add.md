<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_GEO_ADD — Translates a geometry into a RDF box

</div>

<div>

## Synopsis

<div>

|                                 |                  |
|---------------------------------|------------------|
| ` `**`DB.DBA.RDF_GEO_ADD`**` (` | in `g ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function translates a geometry into a RDF box. It looks if an
identical geometry already exists and if so assigns the existing id to
it. If the geometry is new, it gets a new ID and is stored in the RDF
literals table RDF_OBJ. At this time it is also automatically inserted
into the RDF geometry index.

<span class="emphasis">*Note:*</span> In a cluster situation one should
use the dpipe mechanism for inserting into RDF quad so as to get large
numbers of inserts into a single message. This is essential for
performance.

</div>

<div>

## Parameters

<div>

### g

Geometry to be translated into RDF box.

</div>

</div>

<div>

## Examples

<div>

**Example 24.283. Simple example**

<div>

``` programlisting
INSERT INTO RDF_QUAD (g, s, p, o)
VALUES (
         "g",
         "s",
         iri_to_id ('http://www.w3.org/2003/01/geo/wgs84_pos#geometry'),
         DB.DBA.rdf_geo_add (rdf_box (st_point (lng, lat), 256, 257, 0, 1)));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="rdfsparqlgeospatcrg.html" class="link"
title="16.15.2. Creating Geometries From RDF Data">Creating Geometries
From RDF Data</a>

<a href="rdfsparqlgeospat.html#rdfsparqlgeospatprog" class="link"
title="16.15.1. Programmatic Manipulation of Geometries in RDF">Programmatic
Manipulation of Geometries in RDF</a>

<a href="rdfsparqlgeospatusg.html" class="link"
title="16.15.3. Using Geometries With Existing Databases">Using
Geometries With Existing Databases</a>

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

<a href="fn_st_within.html" class="link" title="st_within"><code
class="function">st_within </code></a>

<a href="fn_isgeometry.html" class="link" title="isgeometry"><code
class="function">isgeometry </code></a>

<a href="fn_geo_insert.html" class="link" title="geo_insert"><code
class="function">geo_insert </code></a>

<a href="fn_geo_delete.html" class="link" title="geo_delete"><code
class="function">geo_delete </code></a>

<a href="fn_rdf_geo_fill.html" class="link"
title="DB.DBA.RDF_GEO_FILL"><code
class="function">DB.DBA.RDF_GEO_FILL </code></a>

</div>

</div>
