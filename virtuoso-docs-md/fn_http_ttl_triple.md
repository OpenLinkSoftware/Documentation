<div>

<div>

</div>

<div>

## Name

http_ttl_triple — outputs next triple to ses in TTL serialization.

</div>

<div>

## Synopsis

<div>

|                              |                    |
|------------------------------|--------------------|
| ` `**`http_ttl_triple`**` (` | in `env ` any ,    |
|                              | in `arg1 ` any ,   |
|                              | in `arg2 ` any ,   |
|                              | in `arg3 ` any ,   |
|                              | in `ses ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Outputs next triple to ses in TTL serialization. This function does not
terminate the printed triple in hope that the next triple will has same
"s" or pair of "s" and "p". So "intermediate" semicolon or comma can be
used instead of "trailing" dot.

</div>

<div>

## Parameters

<div>

### env

An array of special format:

``` programlisting
# vector (dict_new (some big size), 0, '', '', '', 0, 0, 0, 0), for ex.:
vector (dict_new (16000), 0, '', '', '', 0, 0, 0, 0);
```

The first item of the vector is dictionary of declared namespaces. Its
size should be big enough, but not greater than 16000 because the
function will never try to create more than 8000 of namespaces for S and
O and more than 8000 of namespaces for P and types. Thus 16000 max is
possible grand total for all four.

</div>

<div>

### arg1

Triple subject.

</div>

<div>

### arg2

Triple predicate.

</div>

<div>

### arg3

Triple object.

</div>

<div>

### ses

Session output.

</div>

</div>

<div>

## Return Types

Any

</div>

<div>

## Examples

<div>

**Example 24.291. Example 1**

<div>

``` programlisting
CREATE PROCEDURE dump_one_graph
  ( IN  srcgraph           VARCHAR  ,
    IN  out_file           VARCHAR  ,
    IN  file_length_limit  INTEGER  := 1000000000
  )
  {
    DECLARE  file_name  varchar;
    DECLARE  env, ses      any;
    DECLARE  ses_len,
             max_ses_len,
             file_len,
             file_idx      integer;
    SET ISOLATION = 'uncommitted';
    max_ses_len := 10000000;
    file_len := 0;
    file_idx := 1;
    file_name := sprintf ('%s%06d.ttl', out_file, file_idx);
    string_to_file ( file_name || '.graph',
                     srcgraph,
                     -2
                   );
    string_to_file ( file_name,
                     sprintf ( '# Dump of graph <%s>, as of %s\n',
                               srcgraph,
                               CAST (NOW() AS VARCHAR)
                             ),
                     -2
                   );
    env := vector (dict_new (16000), 0, '', '', '', 0, 0, 0, 0);
    ses := string_output ();
    FOR (SELECT * FROM ( SPARQL DEFINE input:storage ""
                         SELECT ?s ?p ?o { GRAPH `iri(?:srcgraph)` { ?s ?p ?o } }
                       ) AS sub OPTION (LOOP)) DO
      {
        http_ttl_triple (env, "s", "p", "o", ses);
        ses_len := length (ses);
        IF (ses_len > max_ses_len)
          {
            file_len := file_len + ses_len;
            IF (file_len > file_length_limit)
              {
                http (' .\n', ses);
                string_to_file (file_name, ses, -1);
                file_len := 0;
                file_idx := file_idx + 1;
                file_name := sprintf ('%s%06d.ttl', out_file, file_idx);
                string_to_file ( file_name,
                                 sprintf ( '# Dump of graph <%s>, as of %s (part %d)\n',
                                           srcgraph,
                                           CAST (NOW() AS VARCHAR),
                                           file_idx),
                                 -2
                               );
                 env := vector (dict_new (16000), 0, '', '', '', 0, 0, 0, 0);
              }
            ELSE
              string_to_file (file_name, ses, -1);
            ses := string_output ();
          }
      }
    IF (LENGTH (ses))
      {
        http (' .\n', ses);
        string_to_file (file_name, ses, -1);
      }
  }
;
```

</div>

</div>

  

<span class="emphasis">*Example 2*</span>

``` programlisting
create procedure dump_rdftriples_to_ttl(inout triples any, inout ses any)
{
  declare env any;
  declare tcount, tctr integer;
  tcount := length (triples);
  if (0 = tcount)
    {
      http ('# Empty TURTLE\n', ses);
      return;
    }
  env := vector (dict_new (__min (tcount, 16000)), 0, '', '', '', 0, 0, 0, 0);
  { whenever sqlstate '*' goto end_pred_sort;
    rowvector_subj_sort (triples, 1, 1);
end_pred_sort: ;
  }
  { whenever sqlstate '*' goto end_subj_sort;
    rowvector_subj_sort (triples, 0, 1);
end_subj_sort: ;
  }
  for (tctr := 0; tctr < tcount; tctr := tctr + 1)
    {
      http_ttl_triple (env, triples[tctr][0], triples[tctr][1], triples[tctr][2], ses);
    }
  http (' .', ses);
}
;
```

</div>

<div>

## See Also

<a href="fn_http_nt_triple.html" class="link"
title="http_nt_triple"><code
class="function">http_nt_triple() </code></a>

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">DB.DBA.RDF_LOAD_RDFXML() </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">TTLP_MT() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
