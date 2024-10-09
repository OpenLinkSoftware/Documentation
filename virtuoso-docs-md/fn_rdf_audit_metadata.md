<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_AUDIT_METADATA — Fix RDF metadata corruption.

</div>

<div>

## Synopsis

<div>

|                                        |                              |
|----------------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_AUDIT_METADATA`**` (` | in `audit_mode ` integer ,   |
|                                        | in `str_value ` varchar ,    |
|                                        | in `graph_iri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function can detect and automatically fix most popular sorts of
metadata corruption.

</div>

<div>

## Parameters

<div>

### audit_mode

(0\|1\|2\|3 default 0) - 0 = read-only audit operation; 1 = audit and
fix; 2 = audit, fix and garbage collection for all incomplete
declarations; 3 = the routine erases data it can't fix and it makes up
to 10 iterations trying to erase all invalid/incomplete metadata. The
bigger the number, the more errors can be fixed, at the price of more
metadata changed if needed for the fix.

</div>

<div>

### str_value

Default '' is to stop if the metadata graph contains marks that some
storages are being edited.

'\*' is to remove such marks.

Other values will be suggested by the error dump when appropriate.

</div>

<div>

### graph_iri

Default is system metadata graph.

If specified then it should be a name of graph created by
<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA</code></a> . It is possible
to make the backup to a graph, test and maybe fix that backup and
finally restore metadata from the fixed backup. The disadvantage is that
DB.DBA.RDF_AUDIT_METADATA() may detect and fix more errors on "active"
metadata than on their backup. The possible approach is to make backup,
test and maybe fix it (after fix it can be tested one more time). If the
backup was successfully fixed then the DB.DBA.RDF_AUDIT_METADATA() is
used to fix the "active" metadata, not the copy. In any case, if one
makes a backup to fix it then it's worth to make and keep another
'untouched' backup, just to stay on safe side.

</div>

</div>

<div>

## Examples

<div>

**Example 24.254. Simple example**

<div>

Automatically fix the corrupted metadata:

``` screen
        SQL> DB.DBA.RDF_AUDIT_METADATA(1, '*');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA </code></a>

<a href="fn_rdf_restore_metadata.html" class="link"
title="DB.DBA.RDF_RESTORE_METADATA"><code
class="function">DB.DBA.RDF_RESTORE_METADATA </code></a>

</div>

</div>
