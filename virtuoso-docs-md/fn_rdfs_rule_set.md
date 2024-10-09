<div>

<div>

</div>

<div>

## Name

rdfs_rule_set — Adds the applicable facts of the graph into a rule set.

</div>

<div>

## Synopsis

<div>

|                            |                           |
|----------------------------|---------------------------|
| ` `**`rdfs_rule_set`**` (` | in `rule_name ` varchar , |
|                            | in `graph_iri ` varchar , |
|                            | in `remove ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function associates a rule-name with a source named graphs
identified by a named graph IRI. This named graph is contains RDF
statements that constitute the desired inference rule to be created. You
can use this procedure to add RDF statements from other named graphs as
part as part of a rule-enhancement effort.

</div>

<div>

## Parameters

<div>

### rule_name

Rule name (literal that identifies the rule).

</div>

<div>

### graph_iri

A named graph IRI that identifies the source of RDF statements to be
used as inference rules,

</div>

<div>

### remove

(0\|1 default 0) - where 1 indicates that the specified graph is to be
removed from the rule set.

</div>

</div>

<div>

## Examples

<div>

**Example 24.280. Simple Usage Example**

<div>

Google and Bloomberg Stock Quote Services return HTML5+Microdata based
Linked Open Data using terms from Schema.org. As will be quite common,
there is a case sensitive issue in regards to the HTTP URIs that
identify the "Financial Quote" class. For Bloomberg we have:
\<http://schema.org/intangible/financialquote\> and for Google:
\<http://schema.org/Intangible/FinancialQuote\> . What follows in an
<span class="emphasis">*owl:equivalentProperty*</span> relation that
enables a processor of this data (e.g., SPARQL Query Processor) apply
reasoning and inference based on the semantics of the
<span class="emphasis">*owl:equivalentProperty*</span> relation. Using
Virtuoso's SPARQL processor, you can create an inference rule
declaratively via
<a href="fn_rdfs_rule_set.html" class="link" title="rdfs_rule_set"><code
class="function">rdfs_rule_set() </code></a> :

``` programlisting
-- Suppose a ttl file inference-rule-for-stock-quotes.ttl has the following content:
<http://schema.org/intangible/financialquote>
  owl:equivalentProperty <http://schema.org/Intangible/FinancialQuote> .

-- Load the data to a Named Graph that's implicitly (in the case of Virtuoso)
-- identified by the RDF Document URL that contains the RDF statements that
-- constitute the rule being created
SQL> LOAD <http://example.com/inference-rule-for-stock-quotes.ttl> ;
Done. -- 15 msec.

-- Via SQL run the procedure:
SQL> RDFS_RULE_SET ('schema_stock_quotes', 'http://example.com/inference-rule-for-stock-quotes.ttl');
```

</div>

</div>

  

<div>

**Example 24.281. Create Rule example**

<div>

Create rule set and verify rule's existence:

``` programlisting
SQL> rdfs_rule_set('myset', 'http://mygraph.com');
Done. -- 15 msec.
SQL> SELECT * FROM DB.DBA.SYS_RDF_SCHEMA ;
RS_NAME                              RS_URI                                                         RS_G
VARCHAR NOT NULL                     VARCHAR NOT NULL                          VARCHAR
_______________________________________________________________________________

http://example.com/dataspace         http://example.com/dataspace/inf          NULL
http://www.w3.org/2002/07/owl#       http://www.w3.org/2002/07/owl#            NULL
myset                                http://mygraph.com                        NULL
virtrdf-ifp                          virtrdf-ifp                                                    NULL
virtrdf-label                        virtrdf-label                                                  NULL
virtrdf-meta-entity-class            http://www.openlinksw.com/schemas/virtrdf-meta-entity-class    NULL

7 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT() </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_rdf_triples_to_rdf_xml_text.html" class="link"
title="DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT"><code
class="function">DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT() </code></a>

<a href="fn_sparql_rexec.html" class="link"
title="DB.DBA.SPARQL_REXEC"><code
class="function">DB.DBA.SPARQL_REXEC() </code></a>

<a href="fn_sparql_rexec_to_array.html" class="link"
title="DB.DBA.SPARQL_REXEC_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_REXEC_TO_ARRAY() </code></a>

<a href="fn_sparql_rexec_with_meta.html" class="link"
title="DB.DBA.SPARQL_REXEC_WITH_META"><code
class="function">DB.DBA.SPARQL_REXEC_WITH_META() </code></a>

<a href="fn_rdf_quad_uri_l.html" class="link"
title="DB.DBA.RDF_QUAD_URI_L"><code
class="function">DB.DBA.RDF_QUAD_URI_L() </code></a>

<a href="fn_rdf_quad_uri_l_typed.html" class="link"
title="DB.DBA.RDF_QUAD_URI_L_TYPED"><code
class="function">DB.DBA.RDF_QUAD_URI_L_TYPED() </code></a>

<a href="fn_rdf_ttl2hash.html" class="link"
title="DB.DBA.RDF_TTL2HASH"><code
class="function">DB.DBA.RDF_TTL2HASH() </code></a>

</div>

</div>
