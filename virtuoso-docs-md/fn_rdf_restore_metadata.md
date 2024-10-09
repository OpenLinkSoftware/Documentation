<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_RESTORE_METADATA — Restores RDF metadata (descriptions of
Linked Data Views and the like) from previously saved backup.

</div>

<div>

## Synopsis

<div>

|                                          |                                |
|------------------------------------------|--------------------------------|
| ` `**`DB.DBA.RDF_RESTORE_METADATA`**` (` | in `read_from_file ` integer , |
|                                          | in `backup_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This restores RDF metadata from specified file or graph in RDF storage.
The file or graph should be previously created by
<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA</code> ()</a> . It is
usually safe to restore metadata from backup made by some previous
version of Virtuoso server but it is good idea to call
<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA</code> ()</a> after such
restore.

When the procedure is executed on the server that continues to serve
user requests during the maintenance then SPARQL query compiler may
interrupt query compilations or create queries that will return
incomplete result sets. These queries may be cached till the end of
metadata update procedure but the cache is flushed when the update is
complete, so possible errors will be transient. If even transient errors
are not appropriate then do RDF metadata update with all precautions
usual for changing database schema of an application.

</div>

<div>

## Parameters

<div>

### read_from_file

This flag specifies the type of the origin: it should be nonzero for
file, zero for graph.

</div>

<div>

### backup_name

Name of backup file or graph as it is returned by the call of
<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA </code> ()</a> that created
the backup.

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

</div>

</div>
