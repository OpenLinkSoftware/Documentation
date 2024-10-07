<div id="rdfmetadatarecovery" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.11. RDF Metadata Maintenance and Recovery

</div>

</div>

</div>

This section refers to checking and backing up Linked Data View and
storage declarations only. The checks and backup/restore do not affect
physical quads, relational schema or tables or data therein. For general
backup and restore, see server administration. To detect and fix
automatically most popular sorts of RDF metadata corruption use
<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA</code></a> . It is also
possible to backup RDF data by
<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA</code></a> and restore the
saved state later by using
<a href="fn_rdf_restore_metadata.html" class="link"
title="DB.DBA.RDF_RESTORE_METADATA"><code
class="function">DB.DBA.RDF_RESTORE_METADATA</code></a> . It is
convenient to make a backup before any modification of quad storages,
quad map patterns or IRI classes, especially during debugging new Linked
Data Views.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|                              | In SQL, adding a new view can not break anything. This is because SQL lacks the ability of querying "everything" so data sources are always specified. This is not true for SPARQL, so please treat <span class="emphasis">*any*</span> metadata manipulation as potentially destructive operation. If an RDF storage is supposed to be used by more than one application then these applications should be tested together, not one after other, and they should be installed/upgraded on live database in the very same order as they were installed/upgraded on instrumental machine during testing. Always remember that these applications share RDF tables so they may interfere. |

</div>

</div>
