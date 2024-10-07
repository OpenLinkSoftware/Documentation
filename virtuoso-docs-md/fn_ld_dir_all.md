<div id="fn_ld_dir_all" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ld_dir_all — Loads from the specified directory, including any and all
subdirectories.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ld_dir_all" class="funcsynopsis">

|                         |                                 |
|-------------------------|---------------------------------|
| ` `**`ld_dir_all`**` (` | in `dir_path ` varchar ,        |
|                         | in `file_mask ` varchar ,       |
|                         | in `target_graph ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ld_dir_all" class="refsect1">

## Description

Adds files from the specified directory, including any and all
subdirectories, to control list set up in the virtuoso.ini file.

</div>

<div id="params_ld_dir_all" class="refsect1">

## Parameters

<div id="id100568" class="refsect2">

### dir_path

path to the folder where the files will be loaded

</div>

<div id="id100571" class="refsect2">

### file_mask

SQL like pattern to match against the files in the directory

</div>

<div id="id100574" class="refsect2">

### target_graph

target graph IRI, parsed triples will appear in that graph.

</div>

</div>

<div id="ret_ld_dir_all" class="refsect1">

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div id="examples_ld_dir_all" class="refsect1">

## Examples

<div id="ex_ld_dir_all" class="example">

**Example 24.261. Simple Use**

<div class="example-contents">

``` programlisting
ld_dir_all ('/data8/', '%.gz', 'http://bsbm.org');
```

would load the RDF in all files ending in .gz from the directory ( and
its children ) given as first parameter. The RDF would be loaded in the
http://bsbm.org graph.

If NULL is given for the graph, each file may go to a different graph
specified in a separate file with the name of the RDF source file plus
the extension .graph.

A .graph file contains the target graph URI without any other content or
whitespace.

</div>

</div>

  

</div>

<div id="seealso_ld_dir_all" class="refsect1">

## See Also

<a href="rdfperfloading.html#rdfperfloadingutility" class="link"
title="RDF Bulk Load Utility">RDF Bulk Load Utility</a>

<a href="fn_ld_dir.html" class="link" title="ld_dir"><code
class="function">ld_dir() </code></a>

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
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">DB.DBA.TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
