<div id="fn_rdf_load_stop" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

rdf_load_stop — Stops RDF Loader threads.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_load_stop" class="funcsynopsis">

|                            |      |
|----------------------------|------|
| ` `**`rdf_load_stop`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_load_stop" class="refsect1">

## Description

All RDF loader threads can be stopped using the command rdf_load_stop(),
at which point all currently running threads will be allowed to complete
and then exit.

</div>

<div id="params_rdf_load_stop" class="refsect1">

## Parameters

</div>

<div id="examples_rdf_load_stop" class="refsect1">

## Examples

<div id="ex_rdf_load_stop" class="example">

**Example 24.259. Simple example**

<div class="example-contents">

``` screen
SQL> rdf_load_stop();
```

</div>

</div>

  

</div>

<div id="seealso_rdf_load_stop" class="refsect1">

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
