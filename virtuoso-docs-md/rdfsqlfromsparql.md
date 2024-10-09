<div>

<div>

<div>

<div>

### 16.2.9. Calling SQL from SPARQL

</div>

</div>

</div>

A SPARQL expression can contain calls to Virtuoso/PL functions and
built-in SQL functions in both the WHERE clause and in the result set.
Two namespace prefixes, <span class="emphasis">*bif*</span> and
<span class="emphasis">*sql*</span> are reserved for these purposes.
When a function name starts with the
<span class="emphasis">*bif:*</span> namespace prefix, the rest of the
name is treated as the name of a SQL BIF (Built-In Function). When a
function name starts with the <span class="emphasis">*sql:*</span>
namespace prefix, the rest of the name is treated as the name of a
Virtuoso/PL function owned by DBA with database qualifier DB, e.g.
<span class="emphasis">*sql:example(...)*</span> is converted into
<span class="emphasis">*DB.DBA."example"(...)*</span> .

In both cases, the function receives arguments in SQL format ('SQL
valmode') and also returns the result in SQL format. The SPARQL compiler
will automatically add code for format conversion into the resulting SQL
code so SQL functions can be used even if <span class="emphasis">*define
output:valmode 'LONG'*</span> forces the use of RDF representation in
the result set.

<div>

<div>

<div>

<div>

#### Example with sql: namespace prefix

</div>

</div>

</div>

``` programlisting
SQL>create procedure DB.DBA.ComposeInfo (
  in pname varchar,
  in pnick varchar := '',
  in pbox  varchar := '')
{
   declare ss varchar;
   ss := concat(pname, ' ', pnick, ' ', pbox);
   ss := rtrim (ss, ' ');
   return ss;

};
Done. -- 0 msec.

SQL>SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT (sql:ComposeInfo (?name, ?nick, ?box))
FROM <http://www.w3.org/People/Berners-Lee/card>
WHERE
  {
    ?s rdf:type foaf:Person .
    optional{?s foaf:name ?name }.
    optional{?s foaf:nick ?nick }.
    optional{?s foaf:box ?box }.
    filter (?nick like '%TimBL%') .
  };
callret-0
VARCHAR
_______________________________________________________________________________

Timothy Berners-Lee TimBL

1 Rows. -- 30 msec.
```

<div>

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
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="rdfsparqlgeospatexmp.html#rdfsparqlgeospatexmp11"
class="link" title="Example 11">Example "Things around highly populated
places"</a></p></li>
<li><p><a href="virtuosospongerfacent.html" class="link"
title="16.12. Virtuoso Faceted Web Service">Virtuoso Faceted Web Service
Examples</a></p></li>
<li><p><a href="virtuosospongerfaceusagest.html#virtfacetusage6"
class="link" title="Figure 16.151. Usage Statistics">Virtuoso Faceted
Usage Statistics Examples</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div>

<div>

<div>

<div>

#### Example with sql: namespace prefix and bif:contains

</div>

</div>

</div>

``` programlisting
SQL>SPARQL
SELECT DISTINCT ?cityUri ?cityName (sql:BEST_LANGMATCH (?cityName, 'en, en-gb;q=0.8, fr;q=0.7, *;q=0.1', '')) as ?bestCityName
WHERE
  {
    ?cityUri ?predicate ?value.
    ?cityUri a <http://dbpedia.org/ontology/City>.
    ?value bif:contains "London".
    OPTIONAL
      {
        ?cityUri rdfs:label ?cityName
      }
  };

cityUri                                              cityName                      bestCityName
ANY                                                  ANY                             ANY
______________________________________________________________________________________________________________
http://dbpedia.org/resource/Anerley                  Anerley                         Anerley
http://dbpedia.org/resource/Felixstowe               Felixstowe                    Felixstowe
http://dbpedia.org/resource/Chesham                  Chesham                         Chesham
http://dbpedia.org/resource/Stratford%2C_London      Stratford, London             Stratford, London
http://dbpedia.org/resource/Ashford%2C_Surrey          Ashford (Surrey)  A           shford (Surrey)
http://dbpedia.org/resource/Newmarket%2C_Suffolk       Newmarket (Suffolk)           Newmarket (Suffolk)
http://dbpedia.org/resource/North_Rhine-Westphalia   Renania d'o Norte-Westfalia     Renania d'o Norte-Westfalia
http://dbpedia.org/resource/West_Bromwich              West Bromwich                   West Bromwich
....
```

</div>

<div>

<div>

<div>

<div>

#### Example with bif: namespace prefix

</div>

</div>

</div>

``` programlisting
SQL>SPARQL
SELECT *
FROM <http://www.w3.org/people#>
WHERE { ?s ?p ?o . ?o bif:contains '"Timo*"'};
s                                               p                                     o
VARCHAR                                         VARCHAR                               VARCHAR
_______________________________________________________________________________

 http://www.w3.org/People/Berners-Lee/card#i    http://xmlns.com/foaf/0.1/name        Timothy Berners-Lee
 http://www.w3.org/People/Berners-Lee/card#i    http://xmlns.com/foaf/0.1/givenname   Timothy

2 Rows. -- 2 msec.
```

<div>

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
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="rdfpredicatessparql.html#rdfpredicatessparqlexamples"
class="link" title="Examples">Example filtering RDF objects triples by a
given predicate</a></p></li>
<li><p><a
href="rdfsparqlprotocolendpoint.html#rdfsparqlendpointexamples6"
class="link"
title="Example with extraction part of literal as variable">Example with
extraction part of literal as variable</a></p></li>
<li><p><a href="rdfsparul.html#rdfsparulexamples25" class="link"
title="Example usage of expressions inside CONSTRUCT, INSERT and DELETE {...} Templates">Example
for Usage of Expressions inside CONSTRUCT, INSERT and DELETE {...}
Templates</a></p></li>
<li><p><a href="rdfsparul.html#rdfsparulexamples5" class="link"
title="Example for various expressions usage">Example for various
expressions usage</a></p></li>
<li><p><a href="rdfsparul.html#rdfsparulexamples8" class="link"
title="Example for generating RDF information resource URI">Example for
generating RDF information resource URI</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
