<div>

<div>

</div>

<div>

## Name

sys_stat_analyze — Collects statistics on a table and its columns for
use in SQL optimization

</div>

<div>

## Synopsis

<div>

|                               |                               |
|-------------------------------|-------------------------------|
| ` `**`sys_stat_analyze`**` (` | in `table_name ` varchar ,    |
|                               | in `pcnt ` integer ,          |
|                               | in `ignore_vdb ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Collects (or updates) column statistics for the table columns. It
collects minimum, maximum average and distinct values for a column and a
row count for the table and inserts the data into the
DB.DBA.SYS_COL_STAT table. It does not make histograms for the columns.

The statistics are then used by the Optimized SQL compiler. All the
cached compilations are discarded, because some of them may compile
differently in the light of the new data.

This function will normally consider the entire database with the
exception of remote tables. Since you may be concerned about time or
remote tables this operation is configurable using the optional
parameters, *`pcnt `* and *`ignore_vdb `* .

</div>

<div>

## Parameters

<div>

### table_name

The full name of the table exactly as in the KEY_TABLE column of
SYS_KEYS.

</div>

<div>

### pcnt

Determines the sample size for statistics gathering. A value of 0 will
read the whole table. The default is 5, for an approximately five
percentsample of the table.

</div>

<div>

### ignore_vdb

Determines whether remote tables are considered. By default remote
tables (ignore_vdb = 1) are ignored. Setting this value to 0 will cause
this function to gather statistical information for remote tables also.
A percentage of 0 will read the remote table from beginning to end. A
non-zero percentage will access the statistics tables of the remote DBMS
if it is of a supported type, see the sys_stat_vdb_mappers table.

</div>

</div>

<div>

## See Also

<a href="fn_sys_stat_histogram.html" class="link"
title="sys_stat_histogram">sys_stat_histogram</a>

<a href="fn_sys_db_stat.html" class="link"
title="SYS_DB_STAT">SYS_DB_STAT()</a>

</div>

</div>
