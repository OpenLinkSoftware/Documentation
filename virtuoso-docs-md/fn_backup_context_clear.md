<div id="fn_backup_context_clear" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

backup_context_clear — Clears the backup context and marks all pages in
checkpoint space as ready for online backup

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_backup_context_clear" class="funcsynopsis">

|                                   |      |
|-----------------------------------|------|
| ` `**`backup_context_clear`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_backup_context_clear" class="refsect1">

## Description

This procedure must be called before a new backup series can be started,
This procedure will clear the current backup context and mark all pages
in the checkpoint space as ready for backup.

</div>

<div id="seealso_backup_context_clear" class="refsect1">

## See Also

<a href="fn_backup_online.html" class="link" title="backup_online"><code
class="function">backup_online(); </code></a>

</div>

</div>
