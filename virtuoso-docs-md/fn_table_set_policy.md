<div>

<div>

</div>

<div>

## Name

table_set_policy — Sets policy function to table.

</div>

<div>

## Synopsis

<div>

|                               |                                 |
|-------------------------------|---------------------------------|
| ` `**`table_set_policy`**` (` | in `tablename ` varchar ,       |
|                               | in `policypl ` varchar ,        |
|                               | in `policy_scope ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Sets policy function to table.

</div>

<div>

## Parameters

<div>

### tablename

is the table to which the policy applies

</div>

<div>

### policypl

is the actual Virtuoso Stored Procedure based policy

</div>

<div>

### policy_scope

defines the scope of the policy in relation to SQL statement processing
using one of more of the following values; I (for Inserts), D (for
Deletions), U (for Updates), S (for Selects).

</div>

</div>

<div>

## Return Types

varchar

<div>

<table data-border="0" data-summary="Note: Note:
">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>Note that the
policy_pl procedure should have the following signature (this is how
it's called by the Virtuoso SQL compiler to get the policy) :</p>
<pre class="programlisting"><code>&lt;procedure_name&gt; (in table varchar, in op varchar) returns varchar</code></pre></td>
</tr>
</tbody>
</table>

</div>

</div>

<div>

## See Also

<a href="fn_table_drop_policy.html" class="link"
title="table_drop_policy"><code
class="function">table_drop_policy() </code></a>

</div>

</div>
