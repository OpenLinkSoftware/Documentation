<div>

<div>

</div>

<div>

## Name

DB.DBA.SPARQL_RDB2RDF_LIST_TABLES — Returns a vector of names of tables
that are used as sources for Linked Data Views.

</div>

<div>

## Synopsis

<div>

|                                                |                         |
|------------------------------------------------|-------------------------|
| ` `**`DB.DBA.SPARQL_RDB2RDF_LIST_TABLES`**` (` | in `mode ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### mode

</div>

</div>

<div>

## Return Types

vector

</div>

<div>

## See Also

<a href="rdb2rdftriggers.html" class="link"
title="16.17.17. RDB2RDF Triggers">RDB2RDF Triggers</a>

<a href="fn_sparql_rdb2rdf_codegen.html" class="link"
title="DB.DBA.SPARQL_RDB2RDF_CODEGEN"><code
class="function">DB.DBA.SPARQL_RDB2RDF_CODEGEN() </code></a>

</div>

</div>
