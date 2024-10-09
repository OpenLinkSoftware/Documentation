<div>

<div>

</div>

<div>

## Name

VD_STATISTICS — Update VDB RPC cost statistics for given DSN

</div>

<div>

## Synopsis

<div>

|                                   |                                  |
|-----------------------------------|----------------------------------|
| `DB.DBA. `**`VD_STATISTICS`**` (` | in `_dsn ` varchar ,             |
|                                   | in `vd_table_mask ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This procedure will update the RPC round-trip statistics for selected
data sources.

</div>

<div>

## Parameters

<div>

### \_dsn

This parameter is a LIKE mask for the name of the data source, as stored
in DS_DSN column of SYS_DATA_SOURCE system table. Its default value of
'%' means update the "round-trip" times for all remote data sources.

</div>

<div>

### vd_table_mask

This parameter is a LIKE mask for the name of the table , as stored in
RT_NAME column of SYS_DATA_SOURCE system table. Its default value of '%'
means update all tables.

</div>

</div>

<div>

## See Also

<a href="fn_vdd_measure_rpc_time.html" class="link"
title="vdd_measure_rpc_time"><code
class="function">vdd_measure_rpc_time() </code></a>

</div>

</div>
