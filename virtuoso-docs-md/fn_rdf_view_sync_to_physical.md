<div id="fn_rdf_view_sync_to_physical" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

RDF_VIEW_SYNC_TO_PHYSICAL — This function generates data synchronization
triggers and/or actual RDF quad store data from transient Linked Data
views. Basically, it enables you share physical and transient Linked
Data views typically generated from 3rd party ODBC/JDBC accessible data
sources.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_view_sync_to_physical" class="funcsynopsis">

|                                        |                                   |
|----------------------------------------|-----------------------------------|
| ` `**`RDF_VIEW_SYNC_TO_PHYSICAL`**` (` | in `vgraph ` varchar ,            |
|                                        | in `load_data ` int := 0 ,        |
|                                        | in `pgraph ` varchar := null ,    |
|                                        | in `transaction_mode ` int := 1 , |
|                                        | in `atomicity ` int := 1 `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_view_sync_to_physical" class="refsect1">

## Description

This function create new Transient and Materialized View pairs with
option (where load = 1/0) to load data or wait for updates -- from
triggers at execute time. 0 for non-transaction mode, and atomicity 0/1
determines server accessiblity where 1 indicates inaccessiblity during
run. Note: applicable for Virtuoso 6.0 and higher.

</div>

<div id="params_rdf_view_sync_to_physical" class="refsect1">

## Parameters

<div id="id101384" class="refsect2">

### vgraph

The transient (or virutal) named graph to which synchronization triggers
are to be associated, or the actual source of data used to populate a
named graph in the quad store.

</div>

<div id="id101387" class="refsect2">

### load_data

Flag that determines which operations are performed:

<div class="itemizedlist">

- 0 -- only create synchronization triggers;

- 1 -- create synchronization triggers and then immediately load data
  into a designated quad store named graph.

</div>

</div>

<div id="id101395" class="refsect2">

### pgraph

Designated quad store named graph IRI.

</div>

<div id="id101398" class="refsect2">

### transaction_mode

Integer values (0, 1, 2, or 3) which determine the transaction mode in
place during synchronization. This is basically a call to log_enable ()
with the same values.

</div>

<div id="id101401" class="refsect2">

### atomicity

Enforces atomic mode during data synchronization. This mode of operation
performs a checkpoint when completed, and is the recommended behavior
for handling transient Linked Data views derived from large SQL large
tables.

</div>

</div>

<div id="ret_rdf_view_sync_to_physical" class="refsect1">

## Return Types

any

</div>

<div id="examples_rdf_view_sync_to_physical" class="refsect1">

## Examples

<div id="ex_rdf_view_sync_to_physical" class="example">

**Example 24.272. **

<div class="example-contents">

Example 1

Using the command-line iSQL utility or its variant hosted in the HTML
based Conductor, and assuming named graphs denoted by the following
IRIs:

<div class="orderedlist">

1.  \<http://www.openlinksw.com/schemas/odbcCustomers#\> -- a named
    graph associated with virtual (and transient) RDF statements
    (triples) mapped to an ODBC accessible data source e.g., a
    "Customers" database.

2.  \<urn:rdf:materialized:view:odbc:Customers\> -- a named graph to be
    associated with RDF statements (triples) materialized from virtual
    triples in the designated source named graph.

</div>

``` screen
SQL> RDF_VIEW_SYNC_TO_PHYSICAL ('http://www.openlinksw.com/schemas/odbcCustomers#', 1, 'urn:rdf:materialized:view:odbc:Customers');

# which is equivalent to:

SQL> RDF_VIEW_SYNC_TO_PHYSICAL ('http://www.openlinksw.com/schemas/odbcCustomers#', 1, 'urn:rdf:materialized:view:odbc:Customers', 1, 1);
```

Example 2

A variant of the prior example where with ACID transaction modality
enabled:

``` screen
SQL> RDF_VIEW_SYNC_TO_PHYSICAL ('http://www.openlinksw.com/schemas/odbcCustomers#', 0, 'urn:rdf:materialized:view:odbc:Customers', 1, 1);
```

</div>

</div>

  

</div>

<div id="seealso_rdf_view_sync_to_physical" class="refsect1">

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

<a href="fn_rdf_quad_uri.html" class="link"
title="DB.DBA.RDF_QUAD_URI"><code
class="function">DB.DBA.RDF_QUAD_URI() </code></a>

<a href="fn_rdf_quad_uri_l_typed.html" class="link"
title="DB.DBA.RDF_QUAD_URI_L_TYPED"><code
class="function">DB.DBA.RDF_QUAD_URI_L_TYPED() </code></a>

<a href="fn_rdf_ttl2hash.html" class="link"
title="DB.DBA.RDF_TTL2HASH"><code
class="function">DB.DBA.RDF_TTL2HASH() </code></a>

</div>

</div>
