<div id="fn_sys_stat_histogram" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sys_stat_histogram — Collects a column value histogram for use in SQL
optimization

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sys_stat_histogram" class="funcsynopsis">

|                                 |                             |
|---------------------------------|-----------------------------|
| ` `**`sys_stat_histogram`**` (` | in `table_name ` varchar ,  |
|                                 | in `column_name ` varchar , |
|                                 | in `n_buckets ` integer ,   |
|                                 | in `prec ` integer `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_41" class="refsect1">

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

<div id="params_12" class="refsect1">

## Parameters

<div id="id113033" class="refsect2">

### table_name

The full name of the table exactly as in the KEY_TABLE column of
SYS_KEYS.

</div>

<div id="id113036" class="refsect2">

### column_name

The full name of the column exactly as in the COLUMN column in SYS_COLS.

</div>

<div id="id113039" class="refsect2">

### n_buckets

How much intervals to form. If more intervals are available, the
estimation of column predicates costs is more precise.

</div>

<div id="id113042" class="refsect2">

### prec

The density of the rows examined. Defaults to 1 (all the rows)

</div>

</div>

<div id="seealso_20" class="refsect1">

## See Also

<a href="fn_sys_db_stat.html" class="link" title="SYS_DB_STAT"><code
class="function">SYS_DB_STAT() </code></a>

<a href="fn_sys_stat_analyze.html" class="link"
title="sys_stat_analyze">sys_stat_analyze</a>

</div>

</div>
