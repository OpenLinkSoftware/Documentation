<div>

<div>

</div>

<div>

## Name

backup , backup_close , backup_flush , backup_prepare , backup_row —
Write data into transaction log format for backup purposes. Deprecated.

</div>

<div>

## Synopsis

<div>

|                     |                         |
|---------------------|-------------------------|
| ` `**`backup`**` (` | in `file ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                           |      |
|---------------------------|------|
| ` `**`backup_close`**` (` | `)`; |

<div>

 

</div>

</div>

<div>

|                           |      |
|---------------------------|------|
| ` `**`backup_flush`**` (` | `)`; |

<div>

 

</div>

</div>

<div>

|                             |                         |
|-----------------------------|-------------------------|
| ` `**`backup_prepare`**` (` | in `file ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                         |                    |
|-------------------------|--------------------|
| ` `**`backup_row`**` (` | in `row ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

<div>

<table data-border="0" data-summary="Important">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/important.png" alt="[Important]" /></td>
<td style="text-align: left;">Important</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>These functions are
deprecated. The use of backup_online () is preferred for database
backups. Performing a backup with the destination file /dev/null is a
good way of verifying a database's physical integrity.</p>
<p>All backup files, whether complete (created with <code
class="function">backup</code> ) or partial (created with <code
class="function">backup_prepare</code> and <code
class="function">backup_row</code> of selected rows), begin with the
complete schema that was effective at the time of the backup.</p>
<p>Backup and log files contain assumptions about the schema and row
layout of the database. Hence it is not possible to use these for
transferring data between databases. Attempt to do so will result in
unpredictable results. Thus a log or backup may only be replayed on the
same database, an empty database or a copy of the database which has had
no schema changed since it was made. Also, when replaying a backup file
onto an empty database, the +replay-crash-dump switch should be given on
the executable command line.</p></td>
</tr>
</tbody>
</table>

</div>

This function requires dba privileges.

<div>

### Full backup

The `backup ` function takes a file name as argument. The file produced
will be in the log format and will recreate the database as it was at
the time of the last checkpoint when replayed on an empty database. Such
a file cannot be replayed on anything except an empty database. Logs
made after the backup can be replayed over the database resulting from
the backup file's replay. No schema operations are allowed between
replays.

</div>

<div>

### Partial backups

The `backup_prepare ` , `backup_row` and `backup_close` operations allow
making specific partial backups.

**`backup_prepare ` . ** `backup_prepare ` initiates the backup. This
must be the first statement to execute in its transaction. The rest of
the transaction will be a read only snapshot view of the state as of the
last checkpoint. Checkpointing is disabled until `backup_close` is
called.

Checkpoints are disabled for the time between `backup_prepare` and
`backup_close` . The backup transaction being lock-free, it cannot die
of deadlock and hence will stay open for the duration of the backup.

**`backup_row ` . ** `backup_row ` writes the row given as parameter
into the backup file that was associated to the current transaction by a
prior `backup_prepare` . The row must be obtained obtained by selecting
the pseudo column `_ROW ` from any table.

**`backup_flush ` . ** The `backup_flush ` function will insert a
transaction boundary into the backup log. All rows backed up between two
`backup_flush` calls will be replayed as a single transaction by replay.
Having long intervals between `backup_flush` calls will cause
significant memory consumption at replay time for undo logs.

**`backup_close ` . ** The `backup_close ` function terminates the
backup and closes the file. The transaction remains a read only snapshot
of the last checkpoint but checkpoints are now re-enabled. The
transaction should be committed or rolled back after `backup_close ` .

</div>

</div>

<div>

## Parameters

<div>

### *`file `*

<span class="type">varchar </span>*`file `* filename for the generated
log.

</div>

<div>

### `backup_row `

<span class="type">any </span>*`row `* a value of the pseudo column
`_ROW ` .

</div>

</div>

<div>

## See Also

<a href="fn_replay.html" class="link" title="replay">replay</a>

<a href="fn_backup_online.html" class="link" title="backup_online"><code
class="function">backup_online() </code></a> ,
<a href="fn_backup_context_clear.html" class="link"
title="backup_context_clear"><code
class="function">backup_context_clear() </code></a>

</div>

</div>
