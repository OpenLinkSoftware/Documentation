<div id="fn_cov_load" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cov_load — Load test coverage data from file.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cov_load" class="funcsynopsis">

|                       |                          |
|-----------------------|--------------------------|
| ` `**`cov_load`**` (` | in `fname ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_cov_load" class="refsect1">

## Description

This function accepts one argument with name of file containing test
coverage data. The expected format of the file is described in the
<a href="pldebugger.html#pldbgplcoverage" class="link"
title="11.21.1. Branch Coverage">Branch Coverage</a> section. The loaded
file is merged with the data already collected by Virtuoso. More than
one file can be loaded. The ultimate report will be the union of all
files.

</div>

<div id="params_cov_load" class="refsect1">

## Parameters

<div id="id83081" class="refsect2">

### fname

Name of coverage file to load.

</div>

</div>

<div id="ret_cov_load" class="refsect1">

## Return Types

None.

</div>

<div id="seealso_cov_load" class="refsect1">

## See Also

<a href="fn_cov_store.html" class="link" title="cov_store"><code
class="function">cov_store() </code></a>

<a href="fn_cov_report.html" class="link" title="cov_report"><code
class="function">cov_report() </code></a>

<a href="fn_pldbg_stats.html" class="link" title="pldbg_stats"><code
class="function">pldbg_stats() </code></a>

<a href="fn_pldbg_stats_load.html" class="link"
title="pldbg_stats_load"><code
class="function">pldbg_stats_load() </code></a>

</div>

</div>
