<div>

<div>

</div>

<div>

## Name

DB.DBA.VACUUM — Compact index structures in the database (deprecated
since v6)

</div>

<div>

## Synopsis

<div>

|                            |                                           |
|----------------------------|-------------------------------------------|
| ` `**`DB.DBA.VACUUM`**` (` | in `table_name ` varchar (default %) ,    |
|                            | in `index_name ` varchar (default %) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

<div>

|                              |                                                                              |
|:----------------------------:|:-----------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Deprecated!                                                                  |
|                              | This functionality happens automatically in Virtuoso versions 6 and greater. |

</div>

<div>

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

<div>

## Parameters

<div>

### table_name

This is a LIKE pattern for tables to vacuum. The default is all tables.
The name is case sensitive and must have all the three parts given, e.g.
APP.USER.DATA

</div>

<div>

### index_name

This allows specifying an individual index to compact. The specified
table(s) must have this index. The index name is a LIKE pattern and if
given should match the case and spelling of index names as returned by
the ODBC call SQLStatistics or equivalent, which is also the KEY_NAME
column of SYS_KEYS.

</div>

</div>

<div>

## Examples

<div>

**Example 24.68. Simple example**

<div>

Vacuum the entire database:

``` screen
        SQL> DB.DBA.vacuum ();
      
```

</div>

</div>

  

</div>

</div>
