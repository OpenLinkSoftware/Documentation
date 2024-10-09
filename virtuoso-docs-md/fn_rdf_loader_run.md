<div>

<div>

</div>

<div>

## Name

rdf_loader_run — Performs bulk load.

</div>

<div>

## Synopsis

<div>

|                             |                                   |
|-----------------------------|-----------------------------------|
| ` `**`rdf_loader_run`**` (` | in `max_files ` integer := NULL , |
|                             | in `log_enable ` int := 2 `)`;    |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### max_files

Maximum files to be loaded.

</div>

<div>

### log_enable

For the default value 2 triggers are disabled, to speed the loading of
data. If triggers are required (e.g., for RDF Graph replication between
nodes), then the log_enable mode should be set to 3.

</div>

</div>

<div>

## Examples

<div>

**Example 24.260. Simple example**

<div>

``` screen
SQL> rdf_loader_run();
```

</div>

</div>

  

</div>

<div>

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
