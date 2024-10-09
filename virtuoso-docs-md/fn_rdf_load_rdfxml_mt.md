<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_LOAD_RDFXML_MT — Parses the content of large RDF/XML text as
a sequence of separate RDF triples.

</div>

<div>

## Synopsis

<div>

|                                        |                                  |
|----------------------------------------|----------------------------------|
| ` `**`DB.DBA.RDF_LOAD_RDFXML_MT`**` (` | in `strg ` varchar ,             |
|                                        | in `base ` varchar ,             |
|                                        | in `graph ` varchar ,            |
|                                        | in `log_mode ` integer ,         |
|                                        | in `threads ` integer ,          |
|                                        | in `transactional ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

For loading large resources when transactional integrity is not
important (loading of a single resource may take more than one
transaction). The function may or may not leave a transaction log,
depending on *`log_mode `* . Hence, after successful load, one may need
to execute the checkpoint statement to make sure that a server restart
does not wipe out the results.

</div>

<div>

## Parameters

<div>

### strg

text of the resource.

</div>

<div>

### base

base IRI to resolve relative IRIs to absolute.

</div>

<div>

### graph

target graph IRI, parsed triples will appear in that graph.

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

<div>

### transactional

controls the transaction mode which is "0" by default i.e. off and can
be turned on by setting it to "1".

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## Examples

<div>

**Example 24.262. Usage Example**

<div>

The following example demonstrates importing data from the rdf file
resource Kingsley_Idehen.rdf which can be downloaded from <a
href="http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com/about.rdf"
class="ulink" target="_top">here</a>

``` screen
SQL> DB.DBA.RDF_LOAD_RDFXML_MT (file_to_string_output ('tmp/Kingsley_Idehen.rdf'), '', 'http://example.com');
Done. -- 61 msec.
SQL>sparql
select *
from <http://example.com>
where {?s ?p ?o};

s             p                    o
VARCHAR       VARCHAR              VARCHAR
_______________________________________________________________________________

http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#based_near      http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://www.w3.org/2003/01/geo/wgs84_pos#Point
http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#based_near      http://www.w3.org/2003/01/geo/wgs84_pos#lat       42.485836
http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#based_near      http://www.w3.org/2003/01/geo/wgs84_pos#long      -71.214287
http://www.openlinksw.com/dataspace/organization/vdb#this                         http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Organization
http://www.openlinksw.com/dataspace/organization/vdb#this                         http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Person
http://www.openlinksw.com/dataspace/organization/vdb#this                         http://xmlns.com/foaf/0.1/nick                    vdb
http://www.openlinksw.com/dataspace/organization/vdb#this                         http://xmlns.com/foaf/0.1/name                    Virtuoso Data Space Bot
http://www.openlinksw.com/dataspace/organization/dav#this                         http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Organization
http://www.openlinksw.com/dataspace/organization/dav#this                         http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Person
http://www.openlinksw.com/dataspace/organization/dav#this                         http://xmlns.com/foaf/0.1/nick                    dav

10 Rows. -- 30 msec.
```

The following example demonstrates importing data from the rdf resource
with URI: http://www.w3.org/People/Berners-Lee/card

``` screen
SQL>create procedure MY_LOAD_FILE (in full_uri varchar, in in_resultset integer := 0)
{
  declare REPORT varchar;
  declare graph_uri, dattext varchar;
  declare app_env any;
  app_env := null;
  whenever sqlstate '*' goto err_rep;
  if (not in_resultset)
    result_names (REPORT);
  dattext := cast (XML_URI_GET_AND_CACHE (full_uri) as varchar);
  MY_SPARQL_REPORT (sprintf ('Downloading %s: %d bytes',
      full_uri, length (dattext) ) );
  graph_uri := full_uri;
  delete from RDF_QUAD where G = DB.DBA.RDF_MAKE_IID_OF_QNAME (graph_uri);
  DB.DBA.RDF_LOAD_RDFXML_MT (dattext, full_uri, graph_uri);
  return graph_uri;
err_rep:
  result (sprintf ('%s: %s', __SQL_STATE, __SQL_MESSAGE));
  return graph_uri;
}
;

Done. -- 0 msec.

SQL>create procedure MY_SPARQL_REPORT(in strg varchar)
{
  if (__tag(strg) <> 182)
    strg := cast (strg as varchar) || sprintf (' -- not a string, tag=%d', __tag(strg));
  strg := replace (strg, SPARQL_DAV_DATA_URI(), '\044{SPARQL_DAV_DATA_URI()}');
  strg := replace (strg, SPARQL_DAV_DATA_PATH(), '\044{SPARQL_DAV_DATA_PATH()}');
  strg := replace (strg, SPARQL_FILE_DATA_ROOT(), '\044{SPARQL_FILE_DATA_ROOT()}');
  result (strg);
}
;

Done. -- 0 msec.

SQL> MY_LOAD_FILE('http://www.w3.org/People/Berners-Lee/card');
REPORT
VARCHAR
_______________________________________________________________________________

Downloading http://www.w3.org/People/Berners-Lee/card: 17773 bytes

1 Rows. -- 4046 msec.

SQL>sparql
select *
from <http://www.w3.org/People/Berners-Lee/card>
where {?s ?p ?o} ;

s                                             p                                               o
VARCHAR                                       VARCHAR                                         VARCHAR
__________________________________________________________________________________________________________

http://bblfish.net/people/henry/card#me       http://xmlns.com/foaf/0.1/name                  Henry Story
http://www.w3.org/People/Berners-Lee/card#i   http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://xmlns.com/foaf/0.1/Person
http://www.w3.org/People/Berners-Lee/card#i   http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://www.w3.org/2000/10/swap/pim/contact#Male
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/nick                  TimBL
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/nick                  timbl
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/mbox                  mailto:timbl@w3.org
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/mbox_sha1sum          965c47c5a70db7407210cef6e4e6f5374a525c5c
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://bblfish.net/people/henry/card#me
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://hometown.aol.com/chbussler/foaf/chbussler.foaf#me
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://danbri.org/foaf#danbri
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://norman.walsh.name/knows/who#norman-walsh
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://www.aaronsw.com/about.xrdf#aaronsw
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://www.ivan-herman.net/foaf.rdf#me
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://www.w3.org/People/Berners-Lee/card#amy
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://dig.csail.mit.edu/People/RRS
..........
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

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

</div>

</div>
