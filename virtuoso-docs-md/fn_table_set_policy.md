<div id="fn_table_set_policy" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

table_set_policy — Sets policy function to table.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_table_set_policy" class="funcsynopsis">

|                               |                                 |
|-------------------------------|---------------------------------|
| ` `**`table_set_policy`**` (` | in `tablename ` varchar ,       |
|                               | in `policypl ` varchar ,        |
|                               | in `policy_scope ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_table_set_policy" class="refsect1">

## Description

Sets policy function to table.

</div>

<div id="params_table_set_policy" class="refsect1">

## Parameters

<div id="id113075" class="refsect2">

### tablename

is the table to which the policy applies

</div>

<div id="id113078" class="refsect2">

### policypl

is the actual Virtuoso Stored Procedure based policy

</div>

<div id="id113081" class="refsect2">

### policy_scope

defines the scope of the policy in relation to SQL statement processing
using one of more of the following values; I (for Inserts), D (for
Deletions), U (for Updates), S (for Selects).

</div>

</div>

<div id="ret_table_set_policy" class="refsect1">

## Return Types

varchar

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

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

<div id="seealso_table_set_policy" class="refsect1">

## See Also

<a href="fn_table_drop_policy.html" class="link"
title="table_drop_policy"><code
class="function">table_drop_policy() </code></a>

</div>

</div>
