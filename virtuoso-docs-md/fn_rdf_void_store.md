<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_VOID_STORE — Collects statistics for a given graph and saves
it.

</div>

<div>

## Synopsis

<div>

|                                    |                                  |
|------------------------------------|----------------------------------|
| ` `**`DB.DBA.RDF_VOID_STORE`**` (` | in `graph ` varchar ,            |
|                                    | in `to_graph_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Collects statistics for the first given graph and saves the result into
the second graph. For correct results, the first graph should be loaded
in the database before executing the function.

</div>

<div>

## Parameters

<div>

### graph

the graph iri string to take statistics from

</div>

<div>

### to_graph_name

the graph iri string to write the void data.

</div>

</div>

<div>

## Examples

<div>

**Example 24.258. Simple example**

<div>

``` screen
SQL>DB.DBA.RDF_VOID_STORE('http://www.openlinksw.com/blog/~kidehen','http://example.com');
Done. -- 201 msec.

SQL>sparql
select *
from <http://example.com>
where {?s ?p ?o}
limit 30;

s                                                                                 p              o
VARCHAR                                                                           VARCHAR        VARCHAR
_______________________________________________________________________________

http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://www.w3.org/1999/02/22-rdf-syntax-ns#type      http://rdfs.org/ns/void#Dataset
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://www.w3.org/2000/01/rdf-schema#seeAlso         http://www.openlinksw.com/blog/~kidehen
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#Stat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#channelStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#EntryStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#BlogPostStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#OrganizationStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#ServiceStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#CommentStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#PersonStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#PersonalProfileDocumentStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#FeedStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#BriefcaseStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#SpaceStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#WeblogStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#OnlineAccountStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#UserStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#PointStat
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#sparqlEndpoint               http://leon:8894/sparql
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#containsLinks                http://www.openlinksw.com/blog/~kidehen#sameAsLinks
http://www.openlinksw.com/blog/~kidehen#Dataset                                   http://rdfs.org/ns/void#containsLinks                http://www.openlinksw.com/blog/~kidehen#seeAlsoLinks
http://www.openlinksw.com/blog/~kidehen#Stat                                      http://www.w3.org/1999/02/22-rdf-syntax-ns#type      http://purl.org/NET/scovo#Item
http://www.openlinksw.com/blog/~kidehen#Stat                                      http://www.w3.org/1999/02/22-rdf-syntax-ns#value     377
http://www.openlinksw.com/blog/~kidehen#Stat                                      http://purl.org/NET/scovo#dimension                  http://rdfs.org/ns/void#numOfTriples
http://www.openlinksw.com/blog/~kidehen#sameAsLinks                               http://www.w3.org/1999/02/22-rdf-syntax-ns#type                  http://rdfs.org/ns/void#Linkset
http://www.openlinksw.com/blog/~kidehen#sameAsLinks                               http://rdfs.org/ns/void#statItem                     http://www.openlinksw.com/blog/~kidehen#sameAsStat
http://www.openlinksw.com/blog/~kidehen#sameAsStat                                http://www.w3.org/1999/02/22-rdf-syntax-ns#type      http://purl.org/NET/scovo#Item
http://www.openlinksw.com/blog/~kidehen#sameAsStat                                http://www.w3.org/1999/02/22-rdf-syntax-ns#value     2
http://www.openlinksw.com/blog/~kidehen#sameAsStat                                http://purl.org/NET/scovo#dimension                  http://www.openlinksw.com/blog/~kidehen#sameAsType
http://www.openlinksw.com/blog/~kidehen#sameAsType                                http://www.w3.org/1999/02/22-rdf-syntax-ns#type      http://www.openlinksw.com/blog/~kidehen#TypeOfLink

30 Rows. -- 340 msec.
SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT </code></a>

<a href="fn_rdf_triples_to_rdf_xml_text.html" class="link"
title="DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT"><code
class="function">DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT </code></a>

</div>

</div>
