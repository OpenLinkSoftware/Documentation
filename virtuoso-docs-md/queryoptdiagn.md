<div id="queryoptdiagn" class="section">

<div class="titlepage">

<div>

<div>

### 9.28.3. Query Optimization Diagnostics

</div>

</div>

</div>

Queries involving a large number of possible plans may run out of memory
during optimization. There are a number of settings that influence query
optimization memory utilization.

These are set in the virtuoso.ini file or can be altered on a running
system with
<a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
class="function">__dbf_set</code></a> function:

<div id="id34458" class="table">

**Table 9.4. **

<div class="table-contents">

| INI section | INI parameter name           | \_\_dbf_set function name                                        | \_\_dbf_set function description                                                                                                                                                                                                 |
|-------------|------------------------------|------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Parameters  | MaxMemPoolSize               | <span class="emphasis">*sqlo_max_mp_size*</span>                 | Controlls the size limit in bytes for transient memory consumption. Increasing this may help. The given value should be over 10M, increasing this over 100M is seldom useful but can be tried.                                   |
| Parameters  | MaxOptimizeLayouts           | <span class="emphasis">*sqlo_max_layouts*</span>                 | Decreasing will reduce the number of plans tried, hence save memory. Reasonable values are 0 for no limit or somewhere in excess of 500 for a limit.                                                                             |
| Parameters  | StopCompilerWhenXOverRunTime | <span class="emphasis">*sqlo_compiler_exceeds_run_factor*</span> | Setting to 1 will stop optimization once the best plan is expected to take less time and the amount of time spent optimizing so far.                                                                                             |
| Flag        | enable_joins_only            | <span class="emphasis">*enable_joins_only*</span>                | When set, will cause the optimizer to only consider next plan candidates that are connected by a join to the existing partial plan. In other words, no cartesian products will be considered. This may save some space and time. |

</div>

</div>

  

When reporting issues with query optimization it will be useful to
include statistics from the database in order to facilitate reproducing
the effect. The function
<a href="fn_stat_export.html" class="link" title="stat_export"><code
class="function">stat_export()</code></a> produces a statistics summary
that can be read back into another database with the
<a href="fn_stat_import.html" class="link" title="stat_import"><code
class="function">stat_import()</code></a> function.

To export statistics:

``` programlisting
string_to_file('stat.dv', serialize(stat_export()), -2);
```

To load exported statistics into a database:

``` programlisting
stat_import (deserialize (file_to_string ('stat.dv')));
```

When exporting statistics as part of bug reporting, make sure to first
run the queries exhibiting the problem then only export the stats. The
queries drive statistics gathering.

</div>
