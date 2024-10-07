<div id="fn_rdf_geo_fill" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_GEO_FILL — Converts geo:lat and geo:long properties
properties into geometries.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_geo_fill" class="funcsynopsis">

|                                  |                                                 |
|----------------------------------|-------------------------------------------------|
| ` `**`DB.DBA.RDF_GEO_FILL`**` (` | `n_threads ` integer (optional, default 4) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_geo_fill" class="refsect1">

## Description

Converts geo:lat and geo:long properties into geometries. This operation
reads through all graphs and for each subject with at least one geo:lat
and geo:long, a point geometry is made for each distinct lat/long pair
where lat and long are in the same graph.

It should not happen in practice that a single subject has multiple lats
or long within one graph. If this still happens, a geometry is made for
each combination. The geometry is added to the subject with the lat and
long as the value of the geo:geometry property.

This is performed in parallel on multiple threads and is optimized for
cluster execution and done without transaction logging and is not
transactional. To make the result persistent, the operator should do an
explicit checkpoint by executing:

``` programlisting
SQL>cl_exec ('checkpoint');
```

on any process of a cluster or single server. Otherwise the result may
be lost if the server terminates abnormally before an automatic
checkpoint is made.

</div>

<div id="params_rdf_geo_fill" class="refsect1">

## Parameters

<div id="id101985" class="refsect2">

### n_threads

Number of threads to run. Default is to run 4 threads that will make
geomerty objects (not counting the thread that searches for separate
geo:lat and geo:long properties).

</div>

</div>

<div id="examples_rdf_geo_fill" class="refsect1">

## Examples

<div id="ex_rdf_geo_fill" class="example">

**Example 24.282. Simple example**

<div class="example-contents">

``` programlisting
SQL> rdf_geo_fill ();

Done. -- 282 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_geo_fill" class="refsect1">

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

<a href="fn_rdf_geo_add.html" class="link"
title="DB.DBA.RDF_GEO_ADD"><code
class="function">DB.DBA.RDF_GEO_ADD </code></a>

</div>

</div>
