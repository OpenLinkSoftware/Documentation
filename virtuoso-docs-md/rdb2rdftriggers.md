<div id="rdb2rdftriggers" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.17. RDB2RDF Triggers

</div>

</div>

</div>

Linked Data Views have many advantages, if compared to static dumps of
the database in RDF triples. However, they does not solve few problems.
First, inference is supported only for physically stored triples, so one
had to chose between convenience of inference and convenience of Linked
Data Views. Next, algorithms that selects triples with non-constant
graphs and predicates tend to produce enormous texts of SQL queries if
Linked Data Views are complicated enough. Finally, there may be a need
in export of big and fresh static RDF dump but preparing this dump would
take too much time via both RDF Views and traditional methods.

The solution is set of triggers on source tables of an Linked Data View
that edit parts of physical dump on each change of source data. Unlike
Linked Data Views that cost nothing while not queried, these triggers
add a significant overhead on any data manipulation on sources,
continuously. To compensate this, the dump should be in an intensive use
and not replaceable by Linked Data Views. In other cases, do not add
these triggers.

It is next to impossible to write such triggers by hands so a small API
is provided to generate SQL texts from metadata of Linked Data Views.

First of all, views in an RDF storage does not work in full isolation
from each other. Some of them may partially disable others due to
OPTION(EXCLUSIVE) and some may produce one triple in different ways. As
a result, triggers are not made on per-view basis. Instead, a special
RDF storage is introduced, namely virtrdf:SyncToQuads , all required
triples are added to it and triggers are created for the whole storage.
Typically an Linked Data View is created in some other storage, e.g.,
virtrdf:DefaultQuadStorage and then added to virtrdf:SyncToQuads via:

``` programlisting
sparql alter quad storage virtrdf:SyncToQuads {
   create <my_rdf_view> using storage virtrdf:DefaultQuadStorage };
```

The following example procedure copies all user-defined Linked Data
Views from default quad storage to virtrdf:SyncToQuads:

``` programlisting
create procedure DB.DBA.RDB2RDF_COPY_ALL_RDF_VIEWS_TO_SYNC ()
{
  for (sparql define input:storage ""
    select (bif:aref(bif:sprintf_inverse (str(?idx), bif:concat (str(rdf:_), "%d"), 0), 0)) ?qm
    from virtrdf:
    where { virtrdf:DefaultQuadStorage-UserMaps ?idx ?qm . ?qm a virtrdf:QuadMap }
    order by asc (bif:sprintf_inverse (bif:concat (str(rdf:_), "%d"), str (?idx), 1)) ) do
    exec (sprintf ('sparql alter quad storage virtrdf:SyncToQuads { create <%s> using storage virtrdf:DefaultQuadStorage }', "qm"));
}
;
```

When the virtrdf:SyncToQuads storage is fully prepared, two API
functions can be used:

<div class="itemizedlist">

- <a href="fn_sparql_rdb2rdf_list_tables.html" class="link"
  title="DB.DBA.SPARQL_RDB2RDF_LIST_TABLES">DB.DBA.SPARQL_RDB2RDF_LIST_TABLES</a>
  : The function returns a vector of names of tables that are used as
  sources for Linked Data Views. Application developer should decide
  what to do with each of them - create triggers or do some
  application-specific workarounds.

  Note that if some SQL views are used as sources for Linked Data Views
  and these views does not have INSTEAD triggers then workarounds become
  mandatory for them, not just a choice, because BEFORE or AFTER
  triggers on views are not allowed if there is no appropriate INSTEAD
  trigger. The mode argument should be zero in current version.

- <a href="fn_sparql_rdb2rdf_codegen.html" class="link"
  title="DB.DBA.SPARQL_RDB2RDF_CODEGEN">DB.DBA.SPARQL_RDB2RDF_CODEGEN</a>
  : The function creates an SQL text for a given table and an operation
  specified by an opcode.

</div>

In some cases, Linked Data Views are complicated enough so that BEFORE
UPDATE and AFTER DELETE triggers are required in additional to the
minimal set. In this case, sparql_rdb2rdf_codegen calls will return a
vector of two string sessions, not single string session, and both
sessions are sql texts to inspect or execute. In this case, the BEFORE
trigger will not delete obsolete quads from RDF_QUAD table, instead it
will create records in a special table RDF_QUAD_DELETE_QUEUE as guesses
what can be deleted. The AFTER trigger will re-check these guesses,
delete related quads if needed and shorten the RDF_QUAD_DELETE_QUEUE.

The extra activity of triggers on RDF_QUAD, RDF_OBJ,
RDF_QUAD_DELETE_QUEUE and other tables and indexes of the storage of
"physical" triples may cause deadlocks so the application should be
carefully checked for proper support of deadlocks if they were very
seldom before turning RDB2RDF triggers on. In some cases, the whole
processing of RDB2RDF can be moved to a separate server and connected to
the main workhorse server via replication.

The following example functions create texts of all triggers, save them
to files in for further studying and try to load them. That's probably
quite bad scenario for a production database, because it's better to
read procedures before loading them, especially if they're triggers,
especially if some of them may contain errors.

``` programlisting
-- This creates one or two files with one or two triggers or other texts and try to load the
generated sql texts.
create procedure DB.DBA.RDB2RDF_EXEC_CODEGEN1_FOR_TABLE
(  in dump_prefix varchar,
   in tbl varchar,
   in dump_id any,
   in txt any )
{
  declare fname varchar;
  declare stat, msg varchar;
  if (isinteger (dump_id))
    dump_id := cast (dump_id as varchar);
  if (__tag of vector = __tag (txt))
    {
      DB.DBA.RDB2RDF_EXEC_CODEGEN1_FOR_TABLE (dump_prefix, tbl, dump_id, txt[0]);
      DB.DBA.RDB2RDF_EXEC_CODEGEN1_FOR_TABLE (dump_prefix, tbl, dump_id || 'p' , txt[1]);
      return;
    }
  if (__tag of varchar <> __tag (txt))
    txt := string_output_string (txt);
  fname := sprintf ('%s_Rdb2Rdf.%s.%s.sql', dump_prefix, tbl, dump_id);
  string_to_file (fname, txt || '\n;\n', -2);
  if ('0' = dump_id)
    return;
  stat := '00000';
  msg := '';
  exec (txt, stat, msg);
  if ('00000' <> stat)
    {
      string_to_file (fname, '\n\n- - - - - 8< - - - - -\n\nError ' || stat || ' ' || msg, -1);
      if (not (subseq (msg, 0, 5) in ('SQ091')))
        signal (stat, msg);
    }
}
;

-- This creates and loads all triggers, init procedure and debug dump related to one table.
create procedure DB.DBA.RDB2RDF_PREPARE_TABLE (in dump_prefix varchar, in tbl varchar)
{
  declare ctr integer;
  for (ctr := 0; ctr <= 4; ctr := ctr+1 )
    DB.DBA.RDB2RDF_EXEC_CODEGEN1_FOR_TABLE (dump_prefix, tbl, ctr, sparql_rdb2rdf_codegen (tbl, ctr));
}
;

-- This creates and loads all triggers, init procedure and debug dump related to all tables used by and Linked Data View.
create procedure DB.DBA.RDB2RDF_PREPARE_ALL_TABLES (in dump_prefix varchar)
{
  declare tbl_list any;
  tbl_list := sparql_rdb2rdf_list_tables (0);
  foreach (varchar tbl in tbl_list) do
    {
      DB.DBA.RDB2RDF_PREPARE_TABLE (dump_prefix, tbl);
    }
}
;
```

The following combination of calls prepares all triggers for all Linked
Data Views of the default storage:

``` programlisting
DB.DBA.RDB2RDF_COPY_ALL_RDF_VIEWS_TO_SYNC ();
DB.DBA.RDB2RDF_PREPARE_ALL_TABLES (cast (now() as varchar));
```

This does not copy the initial state of RDB2RDF graphs to the physical
storage, because this can be dangerous for existing RDF data and even if
all procedures will work as expected then they may produce huge amounts
of RDF data, run out of transaction log limits and thus require
application-specific precautions. It is also possible to make initial
loading by a SPARUL statements like:

``` programlisting
SPARQL
INSERT IN <snapshot-graph> { ?s ?p ?o }
FROM <snapshot-htaph>
WHERE
 { quad map <id-of-rdf-view>
      { ?s ?p ?o }
 };
```

</div>
