<div>

<div>

</div>

<div>

## Name

DB.DBA.TTLP_MT_LOCAL_FILE — parses TTL (TURTLE or N3 resource) and
places its triples into DB.DBA.RDF_QUAD on multiple threads.

</div>

<div>

## Synopsis

<div>

|                                        |                            |
|----------------------------------------|----------------------------|
| ` `**`DB.DBA.TTLP_MT_LOCAL_FILE`**` (` | in `path ` varchar ,       |
|                                        | in `base ` varchar ,       |
|                                        | in `graph ` varchar ,      |
|                                        | in `flags ` integer ,      |
|                                        | in `log_mode ` integer ,   |
|                                        | in `threads ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Loads the TTL (TURTLE or N3 resource) file on multiple threads, using
parallel I/O and multiprocessing if available. The function commit
partial transactions while it runs so the transaction log may contain
part of loading. Moreover, the function may or may not leave a
transaction log, depending on *`log_mode `* . Hence, after successful
load, one may need to execute the checkpoint statement to make sure that
a server restart does not wipe out the results.

</div>

<div>

## Parameters

<div>

### path

path to the file in the local filesystem

</div>

<div>

### base

base IRI to resolve relative IRIs to absolute

</div>

<div>

### graph

target graph IRI, parsed triples will appear in that graph.

</div>

<div>

### flags

bitmask of parsing flags. Permits some sorts of syntax errors in
resource. Default is 0, meaning no permitted deviations from the spec.
Other supported bits are:

``` programlisting
  1 - Single quoted and double quoted strings may with newlines.
  2 - Allows bnode predicates (but SPARQL processor may ignore them!).
  4 - Allows variables, but triples with variables are ignored.
  8 - Allows literal subjects, but triples with them are ignored.
 16 - Allows '/', '#', '%' and '+' in local part of QName ("Qname with path")
 32 - Allows invalid symbols between '&lt;' and '&gt;', i.e. in relative IRIs.
 64 - Relax TURTLE syntax to include popular violations.
128 - Try to recover from lexical errors as much as it is possible.
256 - Allows Trig syntax, thus loading data in more than one graph.
512 - Allows loading N-quad dataset files with and optional context value to indicate provenance as detailed
<ulink url="http://sw.deri.org/2008/07/n-quads/">here</ulink>.
```

</div>

<div>

### log_mode

detail level of writing the effect of loading to the transaction log. 0
means log nothing, 1 means log only allocations of internal IDs for new
IRIs and literals, 2 means log everything. If database crashes when the
loading is in progress or after the loading but before checkpoint is
made, 0 will means that the database become inconsistent, 1 means that
the database is consistent but loaded quads may disappear so the loading
should be repeated and log replay may produce wrong results if actions
in it depend on the content of quad store, 2 means no danger (so the
default is 2). Hence loading with mode 1 and especially mode 0 are
faster than usual mode 2 but they require checkpoints after data
loadings and mode 0 additionally requires a checkpoint and database
backup right before the loading.

</div>

<div>

### threads

number of threads that insert quads into the database. It should not be
less than 1, obviously; it is better to not set it greater than
<span class="emphasis">*((N-2)/k)-1* </span> where
<span class="emphasis">*N* </span> is the number of available CPU cores
and <span class="emphasis">*k* </span> is the number of loadings that
happen at the same time.

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## Examples

<div>

**Example 24.268. **

<div>

<span class="emphasis">*Sample Example 1* </span>

``` screen
SQL>DB.DBA.TTLP_MT_LOCAL_FILE ('tmp/users.ttl', '', 'http://example.com');

Done. -- 381 msec.
SQL>sparql
select *
from <http://example.com>
where {?s ?p ?o}
limit 10;
s             p                   o
VARCHAR       VARCHAR             VARCHAR
_______________________________________________________________________________

http://www.openlinksw.com/virtrdf-data-formats#SysUsers-GranteeId-format          http://www.w3.org/1999/02/22-rdf-syntax-ns#type            http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-GranteeId-format          http://www.openlinksw.com/schemas/virtrdf#qmfSuperFormats  nodeID://1000272018
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-GranteeId-format          http://www.openlinksw.com/schemas/virtrdf#inheritFrom      http://www.openlinksw.com/virtrdf-data-formats#sql-integer-uri-fn
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-GranteeId-format          http://www.openlinksw.com/schemas/virtrdf#noInherit        http://www.openlinksw.com/schemas/virtrdf#qmfCustomString1
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-GranteeId-format          http://www.openlinksw.com/schemas/virtrdf#qmfCustomString1 DB.DBA.RDF_DF_GRANTEE_ID_URI
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-UserId-format             http://www.w3.org/1999/02/22-rdf-syntax-ns#type            http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-UserId-format             http://www.openlinksw.com/schemas/virtrdf#qmfSuperFormats  nodeID://1000272019
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-UserId-format             http://www.openlinksw.com/schemas/virtrdf#inheritFrom      http://www.openlinksw.com/virtrdf-data-formats#sql-integer-uri
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-UserId-format             http://www.openlinksw.com/schemas/virtrdf#noInherit        http://www.openlinksw.com/schemas/virtrdf#qmfCustomString1
http://www.openlinksw.com/virtrdf-data-formats#SysUsers-UserId-format             http://www.openlinksw.com/schemas/virtrdf#qmfCustomString1 http://example.com/sys/user?id=%d

10 Rows. -- 30 msec.
```

<span class="emphasis">*Sample Example 2*</span>

``` screen
SQL>create procedure SPARQL_DAWG_LOAD_REMOTE_DATFILE (in full_uri varchar, in in_resultset integer := 0)
{
  declare REPORT varchar;
  declare graph_uri, dattext varchar;
  declare app_env any;
  app_env := null;
  whenever sqlstate '*' goto err_rep;
  if (not in_resultset)
    result_names (REPORT);
  dattext := cast (XML_URI_GET_AND_CACHE (full_uri) as varchar);
  SPARQL_REPORT (sprintf ('Downloading %s: %d bytes',
      full_uri, length (dattext) ) );
  graph_uri := full_uri;
  delete from RDF_QUAD where G = DB.DBA.RDF_MAKE_IID_OF_QNAME (graph_uri);
  if ((full_uri like '%.ttl') or (full_uri like '%.nt') or (full_uri like '%.n3'))
    DB.DBA.TTLP_MT_LOCAL_FILE (dattext, full_uri, graph_uri);
  else -- if (rel_path like '%.rdf')
    DB.DBA.RDF_LOAD_RDFXML_MT (dattext, full_uri, graph_uri);
  return graph_uri;
err_rep:
  result (sprintf ('%s: %s', __SQL_STATE, __SQL_MESSAGE));
  return graph_uri;
}
;
Done. -- 891 msec
SQL> select SPARQL_DAWG_LOAD_REMOTE_DATFILE('http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl');
REPORT
VARCHAR
_______________________________________________________________________________

Downloading http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl: 12768 bytes
http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/sioc.ttl

2 Rows. -- 1382 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

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

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

</div>

</div>
