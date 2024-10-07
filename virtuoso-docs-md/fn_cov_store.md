<div id="fn_cov_store" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cov_store — Writes a test coverage to a file.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cov_store" class="funcsynopsis">

|                        |                                 |
|------------------------|---------------------------------|
| ` `**`cov_store`**` (` | in `fname ` varchar ,           |
|                        | in `add_comments ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_cov_store" class="refsect1">

## Description

This function is used to produce a coverage file called `fname` . The
expected format of the file is described in the
<a href="pldebugger.html#pldbgplcoverage" class="link"
title="11.21.1. Branch Coverage">Branch Coverage</a> section. By default
a normal concise coverage will be produced. If the `add_comment`
parameter is set to 1 then the coverage will include code excerpts
contained in line entities.

</div>

<div id="params_cov_store" class="refsect1">

## Parameters

<div id="id83170" class="refsect2">

### fname

Name of coverage file to load.

</div>

<div id="id83173" class="refsect2">

### add_comments

This flag controls whether to use coverage extensions. By default this
is 0. If 1 is supplied then extensions are used.

</div>

</div>

<div id="ret_cov_store" class="refsect1">

## Return Types

None.

</div>

<div id="seealso_cov_store" class="refsect1">

## See Also

<a href="fn_cov_load.html" class="link" title="cov_load"><code
class="function">cov_load() </code></a>

<a href="fn_cov_report.html" class="link" title="cov_report"><code
class="function">cov_report() </code></a>

<a href="fn_pldbg_stats.html" class="link" title="pldbg_stats"><code
class="function">pldbg_stats() </code></a>

<a href="fn_pldbg_stats_load.html" class="link"
title="pldbg_stats_load"><code
class="function">pldbg_stats_load() </code></a>

</div>

</div>
