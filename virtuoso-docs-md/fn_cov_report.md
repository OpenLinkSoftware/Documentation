<div id="fn_cov_report" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cov_report — Produce a text coverage report.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cov_report" class="funcsynopsis">

|                         |                           |
|-------------------------|---------------------------|
| ` `**`cov_report`**` (` | in `fname ` varchar ,     |
|                         | in `outdir ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_cov_report" class="refsect1">

## Description

This function is used to produce a coverage report in text format. The
format of the file is described in the
<a href="pldebugger.html#pldbgplcoverage" class="link"
title="11.21.1. Branch Coverage">Branch Coverage</a> section. This
function takes a filename 'fname' as a path to the extended coverage
report file and 'outdir' as a path to a directory where .cov files will
be stored. The profile.prof file in the output directory is a summary of
function call counts and execution times, once ranked by self time, once
by time spent inside the function and functions called from there. Note
that directory must exists before calling this function.

</div>

<div id="params_cov_report" class="refsect1">

## Parameters

<div id="id83123" class="refsect2">

### fname

Name of coverage report file.

</div>

<div id="id83126" class="refsect2">

### outdir

Destination directory for storing .cov coverage files.

</div>

</div>

<div id="ret_cov_report" class="refsect1">

## Return Types

None.

</div>

<div id="seealso_cov_report" class="refsect1">

## See Also

<a href="fn_cov_load.html" class="link" title="cov_load"><code
class="function">cov_load() </code></a>

<a href="fn_cov_store.html" class="link" title="cov_store"><code
class="function">cov_store() </code></a>

<a href="fn_pldbg_stats.html" class="link" title="pldbg_stats"><code
class="function">pldbg_stats() </code></a>

<a href="fn_pldbg_stats_load.html" class="link"
title="pldbg_stats_load"><code
class="function">pldbg_stats_load() </code></a>

</div>

</div>
