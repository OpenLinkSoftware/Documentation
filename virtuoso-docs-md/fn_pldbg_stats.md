<div>

<div>

</div>

<div>

## Name

pldbg_stats — Makes an array of line/count information based on current
coverage.

</div>

<div>

## Synopsis

<div>

|                             |                                  |
|-----------------------------|----------------------------------|
| `any `**`pldbg_stats`**` (` | in `name ` varchar ,             |
|                             | in `add_line_info ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to make an array of line/count information based
on the current coverage statistics. If the procedure `name` is given
(first param), then the result will contain only coverage statistic for
that procedure. if the procedure name is not supplied or supplied as
NULL then the result will contain coverage data for all procedures
having statistic. The `add_line_info` flag is used to add code excerpt
on line info.

</div>

<div>

## Parameters

<div>

### name

Optional name of procedure for producing selective information.

</div>

<div>

### outdir

Optional flag to control output existence. If this flag is set to 1 then
code excerpts will be contained in the output.

</div>

</div>

<div>

## Return Types

An array (or vector) is returned containing the line/count information
of the selected coverage data. The format is as follows:

``` programlisting
(
  ("PRODECURE_NAME" "file_name" <times executed> <total lines> ) -- procedure info
  ((<line no> <no executed> "<line excerpt>" ) .... )            -- line statistics
  (("CALLER PROCEDURE" <counts> ) .... )           -- caller statistics
  ...
)
```

</div>

<div>

## See Also

<a href="fn_cov_load.html" class="link" title="cov_load"><code
class="function">cov_load() </code></a>

<a href="fn_cov_store.html" class="link" title="cov_store"><code
class="function">cov_store() </code></a>

<a href="fn_cov_report.html" class="link" title="cov_report"><code
class="function">cov_report() </code></a>

<a href="fn_pldbg_stats_load.html" class="link"
title="pldbg_stats_load"><code
class="function">pldbg_stats_load() </code></a>

</div>

</div>
