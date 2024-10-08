<div id="fn_vacuum" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.VACUUM — Compact index structures in the database (deprecated
since v6)

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vacuum" class="funcsynopsis">

|                            |                                           |
|----------------------------|-------------------------------------------|
| ` `**`DB.DBA.VACUUM`**` (` | in `table_name ` varchar (default %) ,    |
|                            | in `index_name ` varchar (default %) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vacuum" class="refsect1">

## Description

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                              |
|:----------------------------:|:-----------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Deprecated!                                                                  |
|                              | This functionality happens automatically in Virtuoso versions 6 and greater. |

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                           |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                     |
|                              | This is not the same as compacting the database and may actually make the db file larger when run. The preferred way to shrink the database file itself is to perform a <a href="ch-server.html#vdbrecovery" class="link" 
                                title="Database Recovery">backup-dump/restore-crash-dump</a> cycle.                                                                                                                                                        |

</div>

This function reads through the specified tables and indices and finds
groups of adjacent index pages holding data that will fit on fewer pages
than it currently occupies. If such an operation can be made, the pages
are thus compacted.

The compacted pages become part of the committed state and will be
written to the checkpoint space on the next checkpoint.

The vacuum operation is non-locking and can be run on a busy database.
It will simply skip pages with ongoing activity such as pending cursors
or locks. The vacuum procedure returns only after it has read through
the indices it affects but it will not prevent other activity on the
indices.

The vacuum operation may run out of disk space even if it makes net
gains because the modified pages will not be final until the next
checkpoint and the originals will not be free until this same
checkpoint. Thus manually running a checkpoint after vacuum runs out of
space will free the space and vacuum may be rerun.

</div>

<div id="params_vacuum" class="refsect1">

## Parameters

<div id="id84056" class="refsect2">

### table_name

This is a LIKE pattern for tables to vacuum. The default is all tables.
The name is case sensitive and must have all the three parts given, e.g.
APP.USER.DATA

</div>

<div id="id84071" class="refsect2">

### index_name

This allows specifying an individual index to compact. The specified
table(s) must have this index. The index name is a LIKE pattern and if
given should match the case and spelling of index names as returned by
the ODBC call SQLStatistics or equivalent, which is also the KEY_NAME
column of SYS_KEYS.

</div>

</div>

<div id="examples_vacuum" class="refsect1">

## Examples

<div id="ex_vacuum" class="example">

**Example 24.68. Simple example**

<div class="example-contents">

Vacuum the entire database:

``` screen
        SQL> DB.DBA.vacuum ();
      
```

</div>

</div>

  

</div>

</div>
