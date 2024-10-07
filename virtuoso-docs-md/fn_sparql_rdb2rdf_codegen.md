<div id="fn_sparql_rdb2rdf_codegen" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_RDB2RDF_CODEGEN — Creates an SQL text for a given table
and an operation specified by an opcode

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_rdb2rdf_codegen" class="funcsynopsis">

|                                            |                            |
|--------------------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_RDB2RDF_CODEGEN`**` (` | in `table_name ` varchar , |
|                                            | in `opcode ` integer `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_rdb2rdf_codegen" class="refsect1">

## Description

The function creates an SQL text for a given table and an operation
specified by an opcode.

</div>

<div id="params_sparql_rdb2rdf_codegen" class="refsect1">

## Parameters

<div id="id102441" class="refsect2">

### table_name

The name of the table.

</div>

<div id="id102444" class="refsect2">

### opcode

Currently supported opcodes are:

<div class="itemizedlist">

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

<div id="ret_sparql_rdb2rdf_codegen" class="refsect1">

## Return Types

string session or vector

</div>

<div id="seealso_sparql_rdb2rdf_codegen" class="refsect1">

## See Also

<a href="rdb2rdftriggers.html" class="link"
title="16.17.17. RDB2RDF Triggers">RDB2RDF Triggers</a>

<a href="fn_sparql_rdb2rdf_list_tables.html" class="link"
title="DB.DBA.SPARQL_RDB2RDF_LIST_TABLES">DB.DBA.SPARQL_RDB2RDF_LIST_TABLES</a>

</div>

</div>
