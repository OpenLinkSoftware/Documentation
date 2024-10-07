<div id="fn_sys_db_stat" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

SYS_DB_STAT — gathers common statistical information about the database.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sys_db_stat" class="funcsynopsis">

|                          |                               |
|--------------------------|-------------------------------|
| ` `**`SYS_DB_STAT`**` (` | in `pcnt ` integer ,          |
|                          | in `ignore_vdb ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sys_db_stat" class="refsect1">

## Description

The `SYS_DB_STAT ` procedure gathers common information about the whole
Virtuoso database, including attached remote tables. It traverses each
table and populates the SYS_COL_STAT table with data collected.
SYS_DB_STAT can be used in random mode when not all rows of the tables
are used to gather statistics of the database.

`SYS_DB_STAT` gathers the following information for each column, COL,
traversed in the database:

|                                      |
|--------------------------------------|
| SYS_COL_STAT - SQL command           |
| CS_N_DISTINCT - count (distinct XXX) |
| CS_MIN - min (XXX)                   |
| CS_MAX - max (XXX)                   |
| CS_AVG_LEN - avg (raw_length (XXX))  |
| CS_N_VALUES - count (XXX)            |
| CS_N_ROWS - count (XXX)              |

</div>

<div id="params_sys_db_stat" class="refsect1">

## Parameters

<div id="id112818" class="refsect2">

### pcnt

Rate that affects percentage of database coverage. Zero means that the
whole database is read. The default is 5, for a random sample of
approximately 5 percent of each table.

</div>

<div id="id112821" class="refsect2">

### ignore_vdb

By default SYS_DB_STAT does not analyze the remote tables. To allow
statistics gathering over linked tables, set this parameter to zero.
Remote tables can be very large or access to them can be very slow or
both. If this parameter is set to zero and pcnt is zero, SYS_DB_STAT
will read the remote tables from start to end which may take very long.
If pcnt is non-zero, this function will use its knowledge of the remote
DBMS to get statistics in a DBMS specific manner if the DBMS is
supported. See sys_stat_vdb_mappers table.

</div>

</div>

<div id="ret_sys_db_stat" class="refsect1">

## Return Types

None.

</div>

<div id="seealso_sys_db_stat" class="refsect1">

## See Also

<a href="fn_sys_stat_histogram.html" class="link"
title="sys_stat_histogram">sys_stat_histogram</a>

<a href="fn_sys_stat_analyze.html" class="link"
title="sys_stat_analyze">sys_stat_analyze</a>

</div>

</div>
