<div>

<div>

</div>

<div>

## Name

sys_stat_histogram — Collects a column value histogram for use in SQL
optimization

</div>

<div>

## Synopsis

<div>

|                                 |                             |
|---------------------------------|-----------------------------|
| ` `**`sys_stat_histogram`**` (` | in `table_name ` varchar ,  |
|                                 | in `column_name ` varchar , |
|                                 | in `n_buckets ` integer ,   |
|                                 | in `prec ` integer `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function collects (or updates) values distribution data for a given
column.

It splits the sorted column values in n_buckets intervals and collects
the last value of each interval. The values are then inserted into the
SYS_COL_HIST table.

If the table in question has not been analyzed, then it calls
SYS_STAT_ANALYZE for the table.

The histograms are then used by the Optimized SQL compiler. All the
cached compilations are discarded, because some of them may compile
differently in the light of the new data.

</div>

<div>

## Parameters

<div>

### table_name

The full name of the table exactly as in the KEY_TABLE column of
SYS_KEYS.

</div>

<div>

### column_name

The full name of the column exactly as in the COLUMN column in SYS_COLS.

</div>

<div>

### n_buckets

How much intervals to form. If more intervals are available, the
estimation of column predicates costs is more precise.

</div>

<div>

### prec

The density of the rows examined. Defaults to 1 (all the rows)

</div>

</div>

<div>

## See Also

<a href="fn_sys_db_stat.html" class="link" title="SYS_DB_STAT"><code
class="function">SYS_DB_STAT() </code></a>

<a href="fn_sys_stat_analyze.html" class="link"
title="sys_stat_analyze">sys_stat_analyze</a>

</div>

</div>
