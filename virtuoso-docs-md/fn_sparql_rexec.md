<div id="fn_sparql_rexec" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SPARQL_REXEC — Remote execution of SPARQL via SPARQL protocol,
produces a result set of SQL values.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sparql_rexec" class="funcsynopsis">

|                                  |                            |
|----------------------------------|----------------------------|
| ` `**`DB.DBA.SPARQL_REXEC`**` (` | in `service ` varchar ,    |
|                                  | in `query ` varchar ,      |
|                                  | in `dflt_graph ` varchar , |
|                                  | in `named_graphs ` any ,   |
|                                  | in `req_hdr ` any ,        |
|                                  | in `maxrows ` integer ,    |
|                                  | in `bnode_dict ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sparql_rexec" class="refsect1">

## Description

Remote execution of SPARQL via SPARQL protocol, produces a result set of
SQL values.

</div>

<div id="params_sparql_rexec" class="refsect1">

## Parameters

<div id="id103592" class="refsect2">

### service

service URI to call via HTTP.

</div>

<div id="id103595" class="refsect2">

### query

text of SPARQL query to execute.

</div>

<div id="id103598" class="refsect2">

### dflt_graph

default graph IRI, if not NULL then this overrides what is specified in
query

</div>

<div id="id103601" class="refsect2">

### named_graphs

vector of named graph IRIs, if not NULL then this overrides what is
specified in query

</div>

<div id="id103604" class="refsect2">

### req_hdr

additional HTTP header lines that should be passed to the service;
'Host: ...' is most popular.

</div>

<div id="id103607" class="refsect2">

### maxrows

limit on numbers of rows that should be returned.

</div>

<div id="id103610" class="refsect2">

### bnode_dict

dictionary of bnode ID references.

</div>

</div>

<div id="ret_sparql_rexec" class="refsect1">

## Return Types

any

</div>

<div id="examples_sparql_rexec" class="refsect1">

## Examples

<div id="ex_sparql_rexec" class="example">

**Example 24.304. Simple Use**

<div class="example-contents">

``` screen
create procedure SPARQL_TEST (in rquri varchar, in graph_uri varchar, in resuri varchar, in in_result integer := 0)
{
  declare REPORT varchar;
  declare rqtext, sqltext varchar;
  declare app_env any;
  declare rset, row any;
  declare etalon_vars, etalon_rowids, etalon_rows any;
  declare rctr, rcount integer;
  declare copyright_filter any;
  if (not in_result)
    result_names (REPORT);
  result ('');
  declare exit handler for sqlstate '*' {
   ...
    };
  ...
  rqtext := replace (cast (XML_URI_GET ('', rquri) as varchar), '# \044Id:', '# Id:');
      declare rexec_stat, rexec_msg varchar;
      declare bnode_dict, rexec_rmeta, rexec_rrows any;
      rexec_stat := '00000';
      rexec_msg := 'OK';
      bnode_dict := dict_new ();
      rexec_rrows := null;
      exec (
        'DB.DBA.SPARQL_REXEC (?, ?, ?, ?, ?, ?, ?)',
    rexec_stat, rexec_msg,
    vector (
      WB_CFG_HTTP_URI() || '/sparql/',
      rqtext,
      graph_uri,
      vector (),
      '',
      10000,
      bnode_dict ),
    10000, rexec_rmeta, rexec_rrows );
      if (not isarray (rexec_rrows))
        rexec_rrows := null;
      result (sprintf ('Remote exec of %s', rquri));
      dump_large_text_impl (
        sprintf ('  completed with state %s msg %s and %d rows',
        rexec_stat, rexec_msg, length (rexec_rrows) ) );
  result ('PASSED');
};
```

</div>

</div>

  

</div>

<div id="seealso_sparql_rexec" class="refsect1">

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT </code></a>

<a href="fn_rdf_triples_to_rdf_xml_text.html" class="link"
title="DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT"><code
class="function">DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT </code></a>

<a href="fn_sparql_rexec_with_meta.html" class="link"
title="DB.DBA.SPARQL_REXEC_WITH_META"><code
class="function">DB.DBA.SPARQL_REXEC_WITH_META </code></a>

<a href="fn_sparql_rexec_to_array.html" class="link"
title="DB.DBA.SPARQL_REXEC_TO_ARRAY"><code
class="function">DB.DBA.SPARQL_REXEC_TO_ARRAY </code></a>

</div>

</div>
