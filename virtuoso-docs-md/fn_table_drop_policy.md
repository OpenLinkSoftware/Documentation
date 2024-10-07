<div id="fn_table_drop_policy" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

table_drop_policy — Drops policy function from table.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_table_drop_policy" class="funcsynopsis">

|                                |                          |
|--------------------------------|--------------------------|
| ` `**`table_drop_policy`**` (` | in `_tb ` varchar ,      |
|                                | in `_type ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_table_drop_policy" class="refsect1">

## Description

Drops policy function from table.

</div>

<div id="params_table_drop_policy" class="refsect1">

## Parameters

<div id="id113117" class="refsect2">

### \_tb

is the table to which the policy applies

</div>

<div id="id113120" class="refsect2">

### \_type

defines the scope of the policy in relation to SQL statement processing
using one of more of the following values; I (for Inserts), D (for
Deletions), U (for Updates), S (for Selects).

</div>

</div>

<div id="ret_table_drop_policy" class="refsect1">

## Return Types

None.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                             |
|:----------------------------:|:--------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                       |
|                              | Note that if either the table or the procedure gets dropped the policy is also autodropped. |

</div>

</div>

<div id="seealso_table_drop_policy" class="refsect1">

## See Also

<a href="fn_table_set_policy.html" class="link"
title="table_set_policy"><code
class="function">table_set_policy() </code></a>

</div>

</div>
