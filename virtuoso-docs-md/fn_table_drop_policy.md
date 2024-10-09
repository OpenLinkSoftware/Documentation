<div>

<div>

</div>

<div>

## Name

table_drop_policy — Drops policy function from table.

</div>

<div>

## Synopsis

<div>

|                                |                          |
|--------------------------------|--------------------------|
| ` `**`table_drop_policy`**` (` | in `_tb ` varchar ,      |
|                                | in `_type ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Drops policy function from table.

</div>

<div>

## Parameters

<div>

### \_tb

is the table to which the policy applies

</div>

<div>

### \_type

defines the scope of the policy in relation to SQL statement processing
using one of more of the following values; I (for Inserts), D (for
Deletions), U (for Updates), S (for Selects).

</div>

</div>

<div>

## Return Types

None.

<div>

|                              |                                                                                             |
|:----------------------------:|:--------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                       |
|                              | Note that if either the table or the procedure gets dropped the policy is also autodropped. |

</div>

</div>

<div>

## See Also

<a href="fn_table_set_policy.html" class="link"
title="table_set_policy"><code
class="function">table_set_policy() </code></a>

</div>

</div>
