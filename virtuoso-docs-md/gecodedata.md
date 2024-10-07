<div id="gecodedata" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.54. How Do I Gecode Data?

</div>

</div>

</div>

<span class="emphasis">*What?*</span>

Automatic geocoding of data in quad store.

<span class="emphasis">*Why?*</span>

Enable exploitation of SPARQL-GEO for geospatial oriented queries.

<span class="emphasis">*How?*</span>

To gecode data one should call the
<a href="fn_rdf_geo_fill.html" class="link"
title="DB.DBA.RDF_GEO_FILL"><code
class="function">rdf_geo_fill</code></a> API from Conductor or iSQL:

``` programlisting
SQL> rdf_geo_fill ();

Done. -- 282 msec.
```

<div id="gecodedata_01" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL-GEO sample queries

</div>

</div>

</div>

<div class="itemizedlist">

- <a
  href="http://lod.openlinksw.com/b3s/search.vsp?q=20&amp;sc=http%3A%2F%2Fdbpedia.org%2Fresource%2FOxford&amp;sc2=5&amp;sc3=http%3A%2F%2Fdbpedia.org%2Fproperty%2Festablished&amp;sc4=en&amp;fa=Execute"
  class="ulink" target="_top">All Educational Institutions within 10km of
  Oxford, UK</a> :

  ``` programlisting
  SELECT DISTINCT ?thing AS ?uri ?thingLabel AS ?name ?date AS ?established ?lat ?long WHERE
    {
      <http://dbpedia.org/resource/Oxford> geo:geometry ?sourcegeo .
      ?resource geo:geometry ?matchgeo .
      ?resource geo:lat ?lat .
      ?resource geo:long ?long .
      FILTER ( bif:st_intersects ( ?matchgeo, ?sourcegeo, 5 ) ) .
      ?thing ?somelink ?resource .
      ?thing <http://dbpedia.org/property/established> ?date .
      ?thing rdfs:label ?thingLabel .
      FILTER ( lang ( ?thingLabel ) = "en" )
    }
  ```

- <a
  href="http://lod.openlinksw.com/b3s/search.vsp?q=18&amp;sc=http%3A%2F%2Fdbpedia.org%2Fresource%2FLondon&amp;sc2=20&amp;sc3=en&amp;fa=Execute"
  class="ulink" target="_top">Things within close proximity of London</a>:

  ``` programlisting
  SELECT DISTINCT ?resource ?label ?location WHERE
    {
      <http://dbpedia.org/resource/London> geo:geometry ?sourcegeo .
      ?resource geo:geometry ?location ; rdfs:label ?label .
      FILTER ( bif:st_intersects ( ?location, ?sourcegeo, 20 ) ) .
      FILTER ( lang ( ?label ) = "en" )
    }
  ```

</div>

</div>

<div id="id1319" class="section">

<div class="titlepage">

<div>

<div>

#### See Also:

</div>

</div>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">Tip</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="fn_rdf_geo_fill.html" class="link"
title="DB.DBA.RDF_GEO_FILL"><code
class="function">rdf_geo_fill</code></a></p></li>
<li><p><a href="rdfsparqlgeospatcrg.html" class="link"
title="16.15.2. Creating Geometries From RDF Data">Creating Geometries
From RDF Data</a></p></li>
<li><p><a href="rdfsparqlgeospat.html#rdfsparqlgeospatprog" class="link"
title="16.15.1. Programmatic Manipulation of Geometries in RDF">Programmatic
Manipulation of Geometries in RDF</a></p></li>
<li><p><a href="rdfsparqlgeospatusg.html" class="link"
title="16.15.3. Using Geometries With Existing Databases">Using
Geometries With Existing Databases</a></p></li>
<li><p><a href="http://lod.openlinksw.com/b3s/" class="ulink"
target="_top">OpenLink Billion Triple Demo queries</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
