<div id="fn_vd_statistics" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VD_STATISTICS — Update VDB RPC cost statistics for given DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vd_statistics" class="funcsynopsis">

|                                   |                                  |
|-----------------------------------|----------------------------------|
| `DB.DBA. `**`VD_STATISTICS`**` (` | in `_dsn ` varchar ,             |
|                                   | in `vd_table_mask ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vd_statistics" class="refsect1">

## Description

This procedure will update the RPC round-trip statistics for selected
data sources.

</div>

<div id="params_vd_statistics" class="refsect1">

## Parameters

<div id="id118164" class="refsect2">

### \_dsn

This parameter is a LIKE mask for the name of the data source, as stored
in DS_DSN column of SYS_DATA_SOURCE system table. Its default value of
'%' means update the "round-trip" times for all remote data sources.

</div>

<div id="id118167" class="refsect2">

### vd_table_mask

This parameter is a LIKE mask for the name of the table , as stored in
RT_NAME column of SYS_DATA_SOURCE system table. Its default value of '%'
means update all tables.

</div>

</div>

<div id="seealso_vd_statistics" class="refsect1">

## See Also

<a href="fn_vdd_measure_rpc_time.html" class="link"
title="vdd_measure_rpc_time"><code
class="function">vdd_measure_rpc_time() </code></a>

</div>

</div>
