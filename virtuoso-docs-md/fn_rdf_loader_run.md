<div id="fn_rdf_loader_run" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

rdf_loader_run — Performs bulk load.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_loader_run" class="funcsynopsis">

|                             |                                   |
|-----------------------------|-----------------------------------|
| ` `**`rdf_loader_run`**` (` | in `max_files ` integer := NULL , |
|                             | in `log_enable ` int := 2 `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_loader_run" class="refsect1">

## Description

Virtuoso Bulk Loader function that performs bulk load. The function
recognizes several file types, including .ttl, .nt, .xml, .rdf, .owl,
.nq, .n4, and others. Internally the function uses ttlp or
db..rdf_load_rdfxml, as appropriate. Please see <a
href="http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/main/virtbulkrdfloader"
class="ulink" target="_top">more details</a> for what file formats and
file extensions are supported.

<span class="emphasis">*Note:*</span> The Virtuoso Bulk Loader functions
must be present. They are pre-loaded starting with commercial version
06.02.3129 and open source version 6.1.3, but must be manually loaded
into older versions.

</div>

<div id="params_rdf_loader_run" class="refsect1">

## Parameters

<div id="id100524" class="refsect2">

### max_files

Maximum files to be loaded.

</div>

<div id="id100527" class="refsect2">

### log_enable

For the default value 2 triggers are disabled, to speed the loading of
data. If triggers are required (e.g., for RDF Graph replication between
nodes), then the log_enable mode should be set to 3.

</div>

</div>

<div id="examples_rdf_loader_run" class="refsect1">

## Examples

<div id="ex_rdf_loader_run" class="example">

**Example 24.260. Simple example**

<div class="example-contents">

``` screen
SQL> rdf_loader_run();
```

</div>

</div>

  

</div>

<div id="seealso_rdf_loader_run_01" class="refsect1">

## See Also

<a
href="http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/main/virtbulkrdfloader#prerequisites"
class="ulink" target="_top">Bulk Loading RDF Source Files into one or
more Graph IRIs</a>

<a href="fn_ld_dir.html" class="link" title="ld_dir">ld_dir()</a>

<a href="fn_ld_dir_all.html" class="link"
title="ld_dir_all">ld_dir_all()</a>

<a href="fn_rdf_load_stop.html" class="link"
title="rdf_load_stop">rdf_load_stop()</a>

</div>

</div>
