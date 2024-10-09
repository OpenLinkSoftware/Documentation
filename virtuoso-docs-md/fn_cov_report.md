<div>

<div>

</div>

<div>

## Name

cov_report — Produce a text coverage report.

</div>

<div>

## Synopsis

<div>

|                         |                           |
|-------------------------|---------------------------|
| ` `**`cov_report`**` (` | in `fname ` varchar ,     |
|                         | in `outdir ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### fname

Name of coverage report file.

</div>

<div>

### outdir

Destination directory for storing .cov coverage files.

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

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
