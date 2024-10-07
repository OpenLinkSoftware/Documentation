<div id="fn_vdd_disconnect_data_source" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vdd_disconnect_data_source — Disconnects a data source if no active
transactions are using resources from it.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vdd_disconnect_data_source" class="funcsynopsis">

|                                         |                        |
|-----------------------------------------|------------------------|
| ` `**`vdd_disconnect_data_source`**` (` | in `dsn ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vdd_disconnect_data_source" class="refsect1">

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

<div id="params_vdd_disconnect_data_source" class="refsect1">

## Parameters

<div id="id118196" class="refsect2">

### dsn

The name of the remote datasource to disconnect.

</div>

</div>

<div id="seealso_vdd_disconnect_data_source" class="refsect1">

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
