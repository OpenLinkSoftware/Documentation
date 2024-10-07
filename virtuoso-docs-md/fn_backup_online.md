<div id="fn_backup_online" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

backup_online — perform online backup of database

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_backup_online" class="funcsynopsis">

|                               |                             |
|-------------------------------|-----------------------------|
| `int `**`backup_online`**` (` | in `file_prefix ` varchar , |
|                               | in `pages ` integer ,       |
|                               | in `timeout ` integer ,     |
|                               | in `dirs ` any `)`;         |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_backup_online" class="refsect1">

## Description

This procedure will backup all information from the checkpoint space to
a series of files named "`<file_prefix><n>.bp` ", where \<n\> is the
sequence number of the file in the backup series. The first backup will
be a full gzip compressed dump of database pages in the checkpoint
space. Any subsequent call will only backup pages which have changed
since the last backup was made. To start with a fresh full backup, use
backup_clear_context to clear the change tracking data. At each
checkpoint the checkpoint space will be updated, and the next
"backup_online;" procedure will create new files. Once backup_online()
has been called for the first time, the arguments supplied will be used
for subsequent calls to it. Hence, arguments supplied to this procedure
(except the "dirs" argument) will be ignored in subsequent calls.

Before a new backup series can be started, the
<a href="fn_backup_context_clear.html" class="link"
title="backup_context_clear"><code
class="function">backup_context_clear();</code></a> procedure must be
called first. This procedure will clear the current backup context and
mark all pages in the checkpoint space as ready for backup.

A database checkpoint cannot be performed while an online backup is in
progress. Attempt to do a checkpoint will wait until the backup is
complete.

This is the preferred means of backing up databases and replaces any
other prior means. As an alternative, copying database files while the
database is running will still work, as long as no checkpoint is made
during the copy process.

</div>

<div id="params_backup_online" class="refsect1">

## Parameters

<div id="id80818" class="refsect2">

### file_prefix

A string to prefix to the filename of the backup files.

</div>

<div id="id80821" class="refsect2">

### pages

The pages argument indicates the maximum number of 8K pages that will be
backed up into each file. This argument must be larger than 100. If
pages \< 100 an error will be returned.

</div>

<div id="id80824" class="refsect2">

### timeout

This parameter has no effect.

</div>

<div id="id80827" class="refsect2">

### dirs

This optional parameter must be an array of directory names (array of
strings). The backup files are first stored in the first directory. When
running out of disk any consecutive backup files are stored in the next
directory in the list. If there are no more directories then an error is
signalled and all the files written by this call to backup_online are
deleted so as not to leave half made backups.

</div>

</div>

<div id="ret_backup_online" class="refsect1">

## Return Types

This function will return the number of 8k pages that were backed-up.

</div>

<div id="errors_backup_online" class="refsect1">

## Errors

This function can generate the following errors:
<span class="errorcode">IB001 </span><span class="errorcode">IB002
</span><span class="errorcode">IB003
</span><span class="errorcode">IB004
</span><span class="errorcode">IB005
</span><span class="errorcode">IB006
</span><span class="errorcode">IB007
</span><span class="errorcode">IB008
</span><span class="errorcode">IB009
</span><span class="errorcode">IB010 </span>

</div>

<div id="examples_backup_online" class="refsect1">

## Examples

<div id="ex_fnbackup_online" class="example">

**Example 24.20. Performing an online backup**

<div class="example-contents">

If there are 2010 new pages in the checkpoint space and user invokes:

``` screen
"backup_online ('dump-20021010_#', 500);"
```

from ISQL, then the following series of backup files will be created in
the Virtuoso database directory:

``` screen
dump-20011010_#1.bp
dump-20011010_#2.bp
dump-20011010_#3.bp
dump-20011010_#4.bp
dump-20011010_#5.bp
```

The first 4 files will each contain 500 8K pages. The actual length of
the files will vary due to varying compression ratio.

</div>

</div>

  

<div id="ex_fnanonlinebackuprestore" class="example">

**Example 24.21. Restoring an Online Backup**

<div class="example-contents">

The following command could be used to restore the database from the
backup files created:

``` programlisting
virtuoso-iodbc-t +restore-backup dump-20011010_#
```

or:

``` programlisting
virtuoso-odbc-t.exe +restore-backup dump-20011010_#
```

</div>

</div>

  

</div>

<div id="seealso_backup_online" class="refsect1">

## See Also

<a href="fn_backup_context_clear.html" class="link"
title="backup_context_clear"><code
class="function">backup_context_clear(); </code></a>

</div>

</div>
