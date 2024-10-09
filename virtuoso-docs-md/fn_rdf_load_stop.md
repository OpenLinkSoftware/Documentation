<div>

<div>

</div>

<div>

## Name

rdf_load_stop — Stops RDF Loader threads.

</div>

<div>

## Synopsis

<div>

|                            |      |
|----------------------------|------|
| ` `**`rdf_load_stop`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

All RDF loader threads can be stopped using the command rdf_load_stop(),
at which point all currently running threads will be allowed to complete
and then exit.

</div>

<div>

## Parameters

</div>

<div>

## Examples

<div>

**Example 24.259. Simple example**

<div>

``` screen
SQL> rdf_load_stop();
```

</div>

</div>

  

</div>

<div>

## See Also

<a
href="http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/main/virtbulkrdfloader"
class="ulink" target="_top">Bulk Loading RDF Source Files into one or
more Graph IRIs</a>

<a href="fn_ld_dir.html" class="link" title="ld_dir">ld_dir()</a>

<a href="fn_ld_dir_all.html" class="link"
title="ld_dir_all">ld_dir_all()</a>

<a href="fn_rdf_loader_run.html" class="link"
title="rdf_loader_run">rdf_loader_run()</a>

</div>

</div>
