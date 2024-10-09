<div>

<div>

</div>

<div>

## Name

cov_load — Load test coverage data from file.

</div>

<div>

## Synopsis

<div>

|                       |                          |
|-----------------------|--------------------------|
| ` `**`cov_load`**` (` | in `fname ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function accepts one argument with name of file containing test
coverage data. The expected format of the file is described in the
<a href="pldebugger.html#pldbgplcoverage" class="link"
title="11.21.1. Branch Coverage">Branch Coverage</a> section. The loaded
file is merged with the data already collected by Virtuoso. More than
one file can be loaded. The ultimate report will be the union of all
files.

</div>

<div>

## Parameters

<div>

### fname

Name of coverage file to load.

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

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
