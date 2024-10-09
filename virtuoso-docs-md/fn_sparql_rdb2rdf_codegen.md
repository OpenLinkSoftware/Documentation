<div>

<div>

</div>

<div>

## Name

DB.DBA.SPARQL_RDB2RDF_CODEGEN — Creates an SQL text for a given table
and an operation specified by an opcode

</div>

<div>

## Synopsis

<div>

|                                            |                            |
|--------------------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_RDB2RDF_CODEGEN`**` (` | in `table_name ` varchar , |
|                                            | in `opcode ` integer `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function creates an SQL text for a given table and an operation
specified by an opcode.

</div>

<div>

## Parameters

<div>

### table_name

The name of the table.

</div>

<div>

### opcode

Currently supported opcodes are:

<div>

- 0: debugging dump of internal state of code generator, it can be
  requested by the help-desk.

- 1: text of procedure that makes an initial RDF dump of triples,
  created from the specified table. It is used if the table is not empty
  when triggers are added, so existing data should be dumped as a batch
  before being continuously edited by triggers.

- 2: text of AFTER INSERT trigger.

- 3: text of AFTER UPDATE trigger.

- 4: text of BEFORE DELETE trigger.

</div>

</div>

</div>

<div>

## Return Types

string session or vector

</div>

<div>

## See Also

<a href="rdb2rdftriggers.html" class="link"
title="16.17.17. RDB2RDF Triggers">RDB2RDF Triggers</a>

<a href="fn_sparql_rdb2rdf_list_tables.html" class="link"
title="DB.DBA.SPARQL_RDB2RDF_LIST_TABLES">DB.DBA.SPARQL_RDB2RDF_LIST_TABLES</a>

</div>

</div>
