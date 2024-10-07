<div id="virtuosotipsandtricks" class="section">

<div class="titlepage">

<div>

<div>

## 1.5. Tips and Tricks

</div>

</div>

</div>

<div id="virtuosotipsandtricksgeotr" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.1. How Can I convert triples with geo properties to geometries to use spartial query?

</div>

</div>

</div>

Assuming a Named Graph with the following triples:

``` programlisting
...
<http://linkedgeodata.org/triplify/node454640663> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://linkedgeodata.org/ontology/hostel> .
<http://linkedgeodata.org/triplify/node454640663> <http://www.georss.org/georss/point> "53.2752338 -9.0443748" .
<http://linkedgeodata.org/triplify/node454640663> <http://www.w3.org/2003/01/geo/wgs84_pos#long> "-9.0443748"^^<http://www.w3.org/2001/XMLSchema#decimal> .
<http://linkedgeodata.org/triplify/node454640663> <http://www.w3.org/2003/01/geo/wgs84_pos#lat> "53.2752338"^^<http://www.w3.org/2001/XMLSchema#decimal> .

<http://linkedgeodata.org/triplify/node280886720> <http://www.w3.org/2000/01/rdf-schema#label> "Abbey House" .
<http://linkedgeodata.org/triplify/node280886720> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://linkedgeodata.org/ontology/bed_and_breakfast> .
<http://linkedgeodata.org/triplify/node280886720> <http://www.georss.org/georss/point> "53.2874983 -9.0702631" .
<http://linkedgeodata.org/triplify/node280886720> <http://www.w3.org/2003/01/geo/wgs84_pos#long> "-9.0702631"^^<http://www.w3.org/2001/XMLSchema#decimal> .
<http://linkedgeodata.org/triplify/node280886720> <http://www.w3.org/2003/01/geo/wgs84_pos#lat> "53.2874983"^^<http://www.w3.org/2001/XMLSchema#decimal> .
...
```

In order to convert these triples ( with geo properties ) to geometries
to use spartial query, you need to run the `DB.DBA.RDF_GEO_FILL ()`
function to populate the special RDF_GEO table with the point
information as detailed at
<a href="rdfsparqlgeospatcrg.html" class="link"
title="16.15.2. Creating Geometries From RDF Data">Creating Geometries
From RDF Data</a> documentation section.

Then the geo-spatail information will be available and can be queried.

Note: RDF_GEO and associated indexes are created when the database is
first created and thus just needs to be populated with the geometry data
in the RDF triples, which is what the `DB.DBA.RDF_GEO_FILL ()` function
does.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:
">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="rdfsparqlgeospat.html#rdfsparqlgeospatprog" class="link"
title="16.15.1. Programmatic Manipulation of Geometries in RDF">Programmatic
Manipulation of Geometries in RDF</a></p></li>
<li><p><a href="rdfsparqlgeospatexmp.html" class="link"
title="16.15.4. GEO Spatial Examples">GEO Spatial Examples</a></p></li>
<li><p>GEO Spatial Tutorials:</p>
<div class="itemizedlist">
<ul>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(26)"
class="ulink" target="_top">ROUND</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(27)"
class="ulink" target="_top">DESCRIBE</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(28)"
class="ulink" target="_top">CONSTRUCT</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(29)"
class="ulink" target="_top">ASK</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(30)"
class="ulink" target="_top">UNION</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(31)"
class="ulink" target="_top">COUNT</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(32)"
class="ulink" target="_top">FILTER</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(33)"
class="ulink" target="_top">Find Distance Variant I</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(34)"
class="ulink" target="_top">Find Distance Variant II</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(35)"
class="ulink" target="_top">Querying Time and Space Variant
I</a></p></li>
<li><p><a
href="http://virtuoso.openlinksw.com/presentations/SPARQL_Tutorials/SPARQL_Tutorials_Part_2/SPARQL_Tutorials_Part_2.html#(36)"
class="ulink" target="_top">Querying Time and Space Variant
II</a></p></li>
</ul>
</div></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
