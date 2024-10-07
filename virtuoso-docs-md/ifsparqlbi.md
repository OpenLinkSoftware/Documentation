<div id="ifsparqlbi" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.39. How can I use the SPARQL IF operator for SPARQL-BI endpoint?

</div>

</div>

</div>

Assume a SPARQL query is to be executed against the Virtuoso DBpedia
SPARQL endpoint (<a href="http://dbpedia.org/sparql" class="ulink"
target="_top">http://dbpedia.org/sparql</a> ) to retrieve the decimal
longitude of the "NJ Devils' hometown" with cardinal direction, which
determines whether the decimal is positive (in the case of East) or
negative (in the case of West).

Virtuoso supports SPARQL-BI, an extended SPARQL 1.0 implementation from
before SPARQL 1.1 was ratified, thus the "IF" operator is not currently
supported, but an equivalent
<a href="fn_either.html" class="link" title="either"><code
class="function">bif:either</code></a> built-in SQL function does exist
enabling an equivalent query to be executed:

``` programlisting
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX dbp: <http://dbpedia.org/property/>
SELECT ?team ( (bif:either( ?ew = 'W', -1, 1)) * (?d + (((?m * 60) + ?s) / 3600.0)) as ?v)
  {
    ?team a dbo:HockeyTeam . ?team rdfs:label 'New Jersey Devils'@en .
    ?team dbp:city ?cityname . ?city rdfs:label ?cityname .
    ?city dbp:longd ?d; dbp:longm ?m; dbp:longs ?s; dbp:longew ?ew .
  }
```

<div class="figure-float">

<div id="spbi1" class="figure">

**Figure 1.6. SPARQL IF operator for SPARQL-BI endpoint**

<div class="figure-contents">

<div class="mediaobject">

![SPARQL IF operator for SPARQL-BI endpoint](images/ui/spbi1.png)

</div>

</div>

</div>

  

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
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
<td style="text-align: left;" data-valign="top"><p><a
href="rdfsparqlimplementatioptragmas.html" class="link"
title="16.2.12. Supported SPARQL-BI &quot;define&quot; pragmas">Supported
SPARQL-BI "define" pragmas</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSArticleBISPARQL2"
class="ulink" target="_top">SPARQL-BI</a> <a href="rdfsparul.html"
class="link"
title="16.3.2. SPARUL -- an Update Language For RDF Graphs">???</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
