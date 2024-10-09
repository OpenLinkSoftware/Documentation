<div>

<div>

</div>

<div>

## Name

vdd_disconnect_data_source — Disconnects a data source if no active
transactions are using resources from it.

</div>

<div>

## Synopsis

<div>

|                                         |                        |
|-----------------------------------------|------------------------|
| ` `**`vdd_disconnect_data_source`**` (` | in `dsn ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

You must have DBA privileges to run that function.

This function disconnects all the idle opened connections to a VDB
datasource. If there are active transactions server-side, using
connections to that datasource, they are not closed. After they finish,
this function can be called again to disconnect the new idle
connections.

The datasource continues to be valid and any subsequent transactions
using this datasource will open a new connection to it.

</div>

<div>

## Parameters

<div>

### dsn

The name of the remote datasource to disconnect.

</div>

</div>

<div>

## See Also

<a href="fn_vd_remote_table.html" class="link"
title="vd_remote_table">vd_remote_table</a>

<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source">vd_remote_data_source</a>

<a href="ch-server.html#mansetrds" class="link"
title="Manually Setting Up A Remote Data Source">Manually Setting Up A
Remote Data Source</a>

</div>

</div>
