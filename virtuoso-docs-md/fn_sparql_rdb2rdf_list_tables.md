<div id="fn_sparql_rdb2rdf_list_tables" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_RDB2RDF_LIST_TABLES — Returns a vector of names of tables
that are used as sources for Linked Data Views.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_rdb2rdf_list_tables" class="funcsynopsis">

|                                                |                         |
|------------------------------------------------|-------------------------|
| ` `**`DB.DBA.SPARQL_RDB2RDF_LIST_TABLES`**` (` | in `mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_rdb2rdf_list_tables" class="refsect1">

## Description

Returns a vector of names of tables that are used as sources for Linked
Data Views. Application developer should decide what to do with each of
them - create triggers or do some application-specific workarounds.

Note that if some SQL views are used as sources for Linked Data Views
and these views does not have INSTEAD triggers then workarounds become
mandatory for them, not just a choice, because BEFORE or AFTER triggers
on views are not allowed if there is no appropriate INSTEAD trigger. The
mode argument should be zero in current version.

</div>

<div id="params_sparql_rdb2rdf_list_tables" class="refsect1">

## Parameters

<div id="id102487" class="refsect2">

### mode

</div>

</div>

<div id="ret_sparql_rdb2rdf_list_tables" class="refsect1">

## Return Types

vector

</div>

<div id="seealso_sparql_rdb2rdf_list_tables" class="refsect1">

## See Also

<a href="rdb2rdftriggers.html" class="link"
title="16.17.17. RDB2RDF Triggers">RDB2RDF Triggers</a>

<a href="fn_sparql_rdb2rdf_codegen.html" class="link"
title="DB.DBA.SPARQL_RDB2RDF_CODEGEN"><code
class="function">DB.DBA.SPARQL_RDB2RDF_CODEGEN() </code></a>

</div>

</div>
