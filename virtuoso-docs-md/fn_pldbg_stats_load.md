<div>

<div>

</div>

<div>

## Name

pldbg_stats_load — Used to load a coverage of a single procedure record
as an array.

</div>

<div>

## Synopsis

<div>

|                               |                     |
|-------------------------------|---------------------|
| ` `**`pldbg_stats_load`**` (` | in `info ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to load coverage information for a single
procedure record. The expected format is an array. The data expected is
exactly that which can be produced by `pldbg_stats()` . Only one record
will can be accepted, an array of several procedure records will not be
acceptable.

</div>

<div>

## Parameters

<div>

### info

An array with the following format:

``` programlisting
(
  ("PRODECURE_NAME" "file_name" <times executed> <total lines> ) -- procedure info
  ((<line no> <no executed> "<line excerpt>" ) .... )            -- line statistics
  (("CALLER PROCEDURE" <counts> ) .... )           -- caller statistics
)
```

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

<a href="fn_cov_report.html" class="link" title="cov_report"><code
class="function">cov_report() </code></a>

<a href="fn_pldbg_stats.html" class="link" title="pldbg_stats"><code
class="function">pldbg_stats() </code></a>

</div>

</div>
