<div>

<div>

</div>

<div>

## Name

set_identity_column — sets the sequence starting value for an identity
column

</div>

<div>

## Synopsis

<div>

|                                         |                              |
|-----------------------------------------|------------------------------|
| `integer `**`set_identity_column`**` (` | in `table_name ` varchar ,   |
|                                         | in `column_name ` varchar ,  |
|                                         | in `new_value ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes the table name, the column name and the new sequence
value as parameters. It checks for the existence of the identity column,
and then sets the sequence value (using the sequence_set) and returns
the old sequence value. The table and column names must be properly
qualified to ensure the correct resource is located. The effect of
calling this function is immediate.

</div>

<div>

## Parameters

<div>

### table_name

the fully qualified table name in the correct case exactly as it appears
in the DB.DBA.SYS_KEYS table.

</div>

<div>

### column_name

the exact column name as it appears in the DB.DBA.SYS_COLS table.

</div>

<div>

### new_value

the new sequence value.

</div>

</div>

<div>

## Return Types

the previous sequence value

</div>

</div>
