<div id="fn_st_contains" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

st_contains — Returns true if all points of a given geometry g2 are in
another geometry g1.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_st_contains" class="funcsynopsis">

|                          |                                  |
|--------------------------|----------------------------------|
| ` `**`st_contains`**` (` | in `g1 ` any ,                   |
|                          | in `g2 ` any ,                   |
|                          | in `prec ` double precision `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_st_contains" class="refsect1">

## Description

Returns true if all points of a given geometry g2 are in another
geometry g1. If prec is supplied, this is a tolerance for the matching
in units of linear distance appropriate to the srid. Both geometries
should have the same srid.

</div>

<div id="params_st_contains" class="refsect1">

## Parameters

<div id="id91263" class="refsect2">

### g1

The first geometry.

</div>

<div id="id91266" class="refsect2">

### g2

The second geometry.

</div>

<div id="id91269" class="refsect2">

### prec

A tolerance for the matching in units of linear distance appropriate to
the srid. Default is 0.

</div>

</div>

<div id="ret_st_contains" class="refsect1">

## Return Types

Returns int.

</div>

<div id="examples_st_contains" class="refsect1">

## Examples

<div id="ex_st_contains" class="example">

**Example 24.145. Simple Use**

<div class="example-contents">

``` programlisting
SQL>SPARQL
SELECT ?c COUNT (*)
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a ?c .
    FILTER (bif:st_contains (?geo, bif:st_point (0, 52)))
  }
GROUP BY ?c ?geo
ORDER BY DESC 2;

c                                                                     callret-1
ANY                                                                   ANY
________________________________________________________________________________
 http://dbpedia.org/class/yago/Landmark108624891                  12
 http://www.w3.org/2002/07/owl#Thing                                  3
 http://dbpedia.org/ontology/Place                                3
 http://dbpedia.org/ontology/PopulatedPlace                       2
 http://dbpedia.org/class/yago/TowersInTheNetherlands                 2
 http://dbpedia.org/class/yago/TowersInGermany                        1
 http://dbpedia.org/class/yago/HillsOfWarwickshire                1
 http://dbpedia.org/class/yago/PrehistoricSitesInPembrokeshire        1
 http://dbpedia.org/class/yago/HillsOfSomerset                        1
 http://dbpedia.org/class/yago/PeninsulasOfTheFalklandIslands         1
 http://dbpedia.org/class/yago/HillsOfWiltshire                       1
 http://dbpedia.org/class/yago/HillsOfOxfordshire                 1
 http://dbpedia.org/class/yago/HillsOfGloucestershire                 1
 http://dbpedia.org/ontology/City                                 1
 http://dbpedia.org/class/yago/HillsOfWorcestershire                  1
 http://dbpedia.org/class/yago/GuyedMasts                         1
 http://dbpedia.org/ontology/Building                                 1
 http://dbpedia.org/class/yago/Cities,TownsAndVillagesInGelderland    1
 http://dbpedia.org/ontology/Area                                 1
 http://dbpedia.org/class/yago/FormerMunicipalitiesOfGelderland       1
No. of rows in result: 20
```

</div>

</div>

  

</div>

<div id="seealso_st_contains" class="refsect1">

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

<a href="fn_rdf_geo_fill.html" class="link"
title="DB.DBA.RDF_GEO_FILL"><code
class="function">DB.DBA.RDF_GEO_FILL </code></a>

</div>

</div>
