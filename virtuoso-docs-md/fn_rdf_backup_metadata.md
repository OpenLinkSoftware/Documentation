<div id="fn_rdf_backup_metadata" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_BACKUP_METADATA — Makes a backup copy of RDF metadata (i.e.,
descriptions of Linked Data Views and the like).

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_backup_metadata" class="funcsynopsis">

|                                         |                                        |
|-----------------------------------------|----------------------------------------|
| ` `**`DB.DBA.RDF_BACKUP_METADATA`**` (` | in `save_to_file ` integer := 0 ,      |
|                                         | in `backup_name ` varchar := null `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_backup_metadata" class="refsect1">

## Description

This saves all RDF metadata to file or to some graph in RDF storage,
depending on first argument (nonzero for file, zero for graph). If the
function gets nonzero as first argument then it creates two files,
called, say, 'example.ttl', and 'example-DEBUG.ttl'. It's enough to save
only the former file in order to restore metadata later, but the latter
contains important additional debug information so both files should be
attached to any bug report related to RDF metadata.

There are no functions to make copies of backups. File backup consists
of plain TURTLE RDF files only. Backup graph is just a regular RDF graph
in the default storage so it can be serialized into a file or copied
into other graph. However it is important to remember that the system
graph, whose name is returned by JSO_SYS_GRAPH() stored procedure,
should not be edited directly. The content of the system graph is not
necessarily equal to the content of a backup graph and it should be
touched only by API function calls.

</div>

<div id="params_rdf_backup_metadata" class="refsect1">

## Parameters

<div id="id100397" class="refsect2">

### save_to_file

Value of 1 to backup to a files, 0 to backup into graph.

</div>

<div id="id100400" class="refsect2">

### backup_name

Name of destination graph or file. Graph should be empty before backup,
but file with the specified name may exist before backup and will be
silently overwritten. When the destination is file, the '.ttl' extension
is concatenated to the backup_name. If the argument is null then the
backup name will contain date and time of backup creation, like
'2007-12-31T23:59.59'.

</div>

</div>

<div id="ret_rdf_backup_metadata" class="refsect1">

## Return Types

The function returns the actual name of the created backup as a string.

</div>

<div id="seealso_rdf_backup_metadata" class="refsect1">

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_restore_metadata.html" class="link"
title="DB.DBA.RDF_RESTORE_METADATA"><code
class="function">DB.DBA.RDF_RESTORE_METADATA() </code></a>

</div>

</div>
