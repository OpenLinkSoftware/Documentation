<div>

<div>

<div>

<div>

### 16.17.11. Dump Linked Data View Graph to n3

</div>

</div>

</div>

The RDF_QM_TREE_DUMP procedure and its associated procedures below are
used for dumping one or more RDFView Graphs in a Virtuoso server to a
set of turtle ttl dataset files in the specified dump directory. The
dump generation is made as fast as possible by grouping mappings by
underlying tables so many properties from neighbor database columns can
be extracted in one table scan. The size of the generated files is
limited to 5MB. The dump process creates internal stored procedures;
their texts are saved in file .dump_procedures.sql in the directory of
dump files for debugging purposes.

Note that the dump directory must be included in the `DirsAllowed`
parameter of the Virtuoso configuration file (e.g., `virtuoso.ini` ), or
the server will not be allowed to create nor access the dataset file(s).

The <a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtBulkRDFLoader"
class="ulink" target="_top">Virtuoso RDF bulk loader</a> scripts can
then be used to load the dumped datasets for the RDFView graphs directly
into a Virtuoso RDF QUAD store.

<div>

<div>

<div>

<div>

#### Parameters

</div>

</div>

</div>

<div>

- `in` <span class="emphasis">*dest_dir*</span>

  `VARCHAR` - dump directory

- `in` <span class="emphasis">*graph_iri*</span>

  `VARCHAR` - IRI of the graph to be dumped; triples from other graphs
  will be excluded. If NULL, then there's no restriction by graph.

- `in` <span class="emphasis">*storage*</span>

  `VARCHAR` - IRI of the quad map storage to use. NULL means use default
  storage.

- `in` <span class="emphasis">*root*</span>

  `VARCHAR` - IRI of the quad map to use, e.g., an IRI of an Linked Data
  View (or its part). NULL means use all Linked Data Views of the
  storage (and the default mapping as well).

</div>

</div>

<div>

<div>

<div>

<div>

#### Procedure Code

</div>

</div>

</div>

``` programlisting
CREATE PROCEDURE DB.DBA.RDF_QM_TREE_DUMP
  ( in  dest_dir  VARCHAR,
    in  graph_iri VARCHAR := NULL,
    in  storage   VARCHAR := NULL,
    in  root      VARCHAR := NULL
  )
{
 DECLARE all_qms,
         grouped_qmvs,
         launcher_text  ANY;
 DECLARE grp_ctr,
         qm_ctr,
         qm_count       INTEGER;
 DECLARE sql_file,
         launcher_name  VARCHAR;
 IF (NOT (dest_dir LIKE '%/'))
   dest_dir := dest_dir || '/';
 sql_file := dest_dir || '.dump_procedures.sql';
 IF (storage IS NULL)
   storage := 'http://www.openlinksw.com/schemas/virtrdf#DefaultQuadStorage';
 string_to_file (
   sql_file,
   '-- This file contains procedure created by DB.DBA.RDF_QM_TREE_DUMP() for storage '
      || COALESCE (storage, 'NULL')
      || ' and root quad map '
      || COALESCE (root, 'NULL')
      || '\n\n',
   -2);
 all_qms := dict_list_keys (DB.DBA.RDF_QM_CONTENT_OF_QM_TREE (graph_iri, storage, root), 2);
 grouped_qmvs := DB.DBA.RDF_QM_GROUP_BY_SOURCE_TABLES (all_qms);
 launcher_name := 'RDF_QM_TREE_DUMP_BATCH_' || md5 (serialize (graph_iri) || storage || serialize (root));
 launcher_text := string_output ();
 http ('CREATE PROCEDURE DB.DBA."' || launcher_name || '" (in dest_dir VARCHAR)\n{\n', launcher_text);
 FOR (grp_ctr := length (grouped_qmvs); grp_ctr > 0; grp_ctr := grp_ctr-2)
   {
     DECLARE tables, qms, proc_text ANY;
     DECLARE group_key, proc_name, dump_prefix, cmt VARCHAR;
     tables := grouped_qmvs [grp_ctr-2];
     qms := grouped_qmvs [grp_ctr-1];
     qm_count := length (qms);
     group_key := md5 (serialize (graph_iri) || storage || serialize (root) || serialize (tables));
     proc_name := 'RDF_QM_TREE_DUMP_GRP_' || group_key;
     proc_text := string_output ();
     cmt := sprintf ('%d quad maps on join of', qm_count);
     FOREACH (VARCHAR t IN tables) DO cmt := cmt || ' ' || t;
     http ('  --  ' || cmt || '\n', launcher_text);
     http ('  DB.DBA."' || proc_name || '" (dest_dir);\n', launcher_text);
     http ('CREATE PROCEDURE DB.DBA."' || proc_name || '" (in dest_dir VARCHAR)\n', proc_text);
     http ('{\n', proc_text);
     http ('  -- ' || cmt || '\n', proc_text);
     http ('  DECLARE ses, env ANY;\n', proc_text);
     http ('  DECLARE file_ctr, cmt_len INTEGER;\n', proc_text);
     http ('  file_ctr := 0;\n', proc_text);
     http ('  dbg_obj_princ (' || WS.WS.STR_SQL_APOS (cmt) || ', '', file '', file_ctr);\n', proc_text);
     http ('  ses := string_output ();\n', proc_text);
     http ('  http (' || WS.WS.STR_SQL_APOS ('#' || cmt || '\n') || ', ses);\n', proc_text);
     http ('  env := VECTOR (dict_new (16000), 0, '''', '''', '''', 0, 0, 0, 0, 0);\n', proc_text);
     http ('  cmt_len := LENGTH (ses);\n', proc_text);
     http ('  FOR (SPARQL DEFINE input:storage <' || storage || '>\n', proc_text);
     http ('    SELECT ?s1, ?p1, ?o1\n', proc_text);
     IF (graph_iri IS NOT NULL)
       {
         http ('    WHERE { GRAPH <', proc_text); http_escape (graph_iri, 12, proc_text, 1, 1); http ('> {\n', proc_text);
       }
     ELSE
       http ('    WHERE { GRAPH ?g1 {\n', proc_text);
     FOR (qm_ctr := 0; qm_ctr < qm_count; qm_ctr := qm_ctr + 1)
       {
         IF (qm_ctr > 0) http ('            UNION\n', proc_text);
         http ('            { quad map <' || qms[qm_ctr] || '> { ?s1 ?p1 ?o1 } }\n', proc_text);
       }
     http ('          } } ) DO {\n', proc_text);
     http ('      http_ttl_triple (env, "s1", "p1", "o1", ses);\n', proc_text);
     http ('      IF (LENGTH (ses) > 5000000)\n', proc_text);
     http ('        {\n', proc_text);
     http ('          http ('' .\\n'', ses);\n', proc_text);
     http ('          string_to_file (sprintf (''%s' || group_key || '_%05d.ttl'', dest_dir, file_ctr), ses, -2);\n', proc_text);
     http ('          file_ctr := file_ctr + 1;\n', proc_text);
     http ('          dbg_obj_princ (' || WS.WS.STR_SQL_APOS (cmt) || ', '', file '', file_ctr);\n', proc_text);
     http ('          ses := string_output ();\n', proc_text);
     http ('          http (' || WS.WS.STR_SQL_APOS ('#' || cmt || '\n') || ', ses);\n', proc_text);
     http ('          env := VECTOR (dict_new (16000), 0, '''', '''', '''', 0, 0, 0, 0, 0);\n', proc_text);
     http ('        }\n', proc_text);
     http ('    }\n', proc_text);
     http ('  IF (LENGTH (ses) > cmt_len)\n', proc_text);
     http ('    {\n', proc_text);
     http ('      http ('' .\\n'', ses);\n', proc_text);
     http ('      string_to_file (sprintf (''%s' || group_key || '_%05d.ttl'', dest_dir, file_ctr), ses, -2);\n', proc_text);
     http ('    }\n', proc_text);
     http ('}\n', proc_text);
     proc_text := string_output_string (proc_text);
     string_to_file (sql_file, proc_text || ';\n\n' , -1);
     EXEC (proc_text);
   }
 http ('}\n', launcher_text);
 launcher_text := string_output_string (launcher_text);
 string_to_file (sql_file, launcher_text || ';\n\n' , -1);
 EXEC (launcher_text);
 CALL ('DB.DBA.' || launcher_name)(dest_dir);
}
;

CREATE FUNCTION DB.DBA.RDF_QM_CONTENT_OF_QM_TREE
  ( in  graph_iri  VARCHAR := NULL,
    in  storage    VARCHAR := NULL,
    in  root       VARCHAR := NULL,
    in  dict       ANY := NULL
  ) returns ANY
{
 DECLARE res, subqms any;
 DECLARE graphiri varchar;
 graphiri := DB.DBA.JSO_SYS_GRAPH();
 IF (storage IS NULL)
   storage := 'http://www.openlinksw.com/schemas/virtrdf#DefaultQuadStorage';
 DB.DBA.RDF_QM_ASSERT_STORAGE_FLAG (storage, 0);
 IF (dict IS NULL)
   dict := dict_new ();
 IF (root IS NULL)
   {
     subqms := ((SELECT DB.DBA.VECTOR_AGG (sub."qmiri")
         FROM (
           SPARQL DEFINE input:storage ""
           SELECT DISTINCT (str(?qm)) AS ?qmiri
           WHERE { GRAPH `iri(?:graphiri)` {
                     { `iri(?:storage)` virtrdf:qsUserMaps ?lst .
                       ?lst ?p ?qm .
                       FILTER (0 = bif:strstr (str(?p), str(rdf:_)))
                     } UNION {
                       `iri(?:storage)` virtrdf:qsDefaultMap ?qm .
                     } } } ) AS sub ) );
     FOREACH (varchar qmid IN subqms) DO
       DB.DBA.RDF_QM_CONTENT_OF_QM_TREE (graph_iri, storage, qmid, dict);
     RETURN dict;
   }
 DB.DBA.RDF_QM_ASSERT_JSO_TYPE (root, 'http://www.openlinksw.com/schemas/virtrdf#QuadMap');
 IF (graph_iri IS NOT NULL AND
   EXISTS ((SPARQL DEFINE input:storage ""
       SELECT (1) WHERE {
           GRAPH `iri(?:graphiri)` {
               `iri(?:root)` virtrdf:qmGraphRange-rvrFixedValue ?g .
               FILTER (str (?g) != str(?:graph_iri))
             } } ) ) )
   RETURN dict;
 IF (NOT EXISTS ((SPARQL DEFINE input:storage ""
       SELECT (1) WHERE {
           GRAPH `iri(?:graphiri)` {
               `iri(?:root)` virtrdf:qmMatchingFlags virtrdf:SPART_QM_EMPTY .
             } } ) ) )
   dict_put (dict, root, 1);
 subqms := ((SELECT DB.DBA.VECTOR_AGG (sub."qmiri")
     FROM (
       SPARQL DEFINE input:storage ""
       SELECT DISTINCT (str(?qm)) as ?qmiri
       WHERE { GRAPH `iri(?:graphiri)` {
        `iri(?:root)` virtrdf:qmUserSubMaps ?lst .
               ?lst ?p ?qm .
               FILTER (0 = bif:strstr (str(?p), str(rdf:_)))
             } } ) AS sub ) );
 FOREACH (VARCHAR qmid IN subqms) DO
   DB.DBA.RDF_QM_CONTENT_OF_QM_TREE (graph_iri, storage, qmid, dict);
 RETURN dict;
}
;

CREATE FUNCTION DB.DBA.RDF_QM_GROUP_BY_SOURCE_TABLES (in qms ANY) returns ANY
{
 DECLARE res ANY;
 DECLARE ctr INTEGER;
 DECLARE graphiri VARCHAR;
 graphiri := DB.DBA.JSO_SYS_GRAPH();
 res := dict_new (LENGTH (qms) / 20);
 FOREACH (VARCHAR qmiri IN qms) DO
   {
     DECLARE tbls, acc ANY;
     tbls := ((SELECT DB.DBA.VECTOR_AGG (sub."tbl")
         FROM (SELECT subsub."tbl"
           FROM (
             SPARQL DEFINE input:storage ""
             SELECT DISTINCT ?tbl
             WHERE { GRAPH `iri(?:graphiri)` {
                       { `iri(?:qmiri)` virtrdf:qmTableName ?tbl .
                       } UNION {
                         `iri(?:qmiri)` virtrdf:qmATables ?atbls .
                         ?atbls ?p ?atbl .
                         ?atbl virtrdf:qmvaTableName ?tbl
                       } UNION {
                         `iri(?:qmiri)` ?fldmap ?qmv .
                         ?qmv virtrdf:qmvATables ?atbls .
                         ?atbls ?p ?atbl .
                         ?atbl virtrdf:qmvaTableName ?tbl .
                       } } } ) subsub
           ORDER BY 1 ) AS sub ) );
     acc := dict_get (res, tbls);
     IF (acc IS NULL)
       vectorbld_init (acc);
     vectorbld_acc (acc, qmiri);
     dict_put (res, tbls, acc);
   }
 res := dict_to_vector (res, 2);
 FOR (ctr := LENGTH (res); ctr > 0; ctr := ctr-2)
   {
     DECLARE acc ANY;
     acc := aref_set_0 (res, ctr-1);
     vectorbld_final (acc);
     aset_zap_arg (res, ctr-1, acc);
   }
 RETURN res;
}
;

--test dbg_obj_princ (DB.DBA.RDF_QM_GROUP_BY_SOURCE_TABLES (dict_list_keys (DB.DBA.RDF_QM_CONTENT_OF_QM_TREE (null), 2)));
--test dbg_obj_princ (dict_list_keys (DB.DBA.RDF_QM_CONTENT_OF_QM_TREE (null), 2));
--test DB.DBA.RDF_QM_TREE_DUMP ('dump/demo', null, null, null);
--test DB.DBA.RDF_QM_TREE_DUMP ('dump/tpch', 'http://localhost:8600/tpch', null, null);
```

</div>

</div>
