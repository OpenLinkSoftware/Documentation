<div id="fn_set_identity_column" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

set_identity_column — sets the sequence starting value for an identity
column

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_set_identity_column" class="funcsynopsis">

|                                         |                              |
|-----------------------------------------|------------------------------|
| `integer `**`set_identity_column`**` (` | in `table_name ` varchar ,   |
|                                         | in `column_name ` varchar ,  |
|                                         | in `new_value ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_set_identity_column" class="refsect1">

## Description

This function takes the table name, the column name and the new sequence
value as parameters. It checks for the existence of the identity column,
and then sets the sequence value (using the sequence_set) and returns
the old sequence value. The table and column names must be properly
qualified to ensure the correct resource is located. The effect of
calling this function is immediate.

</div>

<div id="params_set_identity_column" class="refsect1">

## Parameters

<div id="id109830" class="refsect2">

### table_name

the fully qualified table name in the correct case exactly as it appears
in the DB.DBA.SYS_KEYS table.

</div>

<div id="id109833" class="refsect2">

### column_name

the exact column name as it appears in the DB.DBA.SYS_COLS table.

</div>

<div id="id109836" class="refsect2">

### new_value

the new sequence value.

</div>

</div>

<div id="ret_set_identity_column" class="refsect1">

## Return Types

the previous sequence value

</div>

</div>
