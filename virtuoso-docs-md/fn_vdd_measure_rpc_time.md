<div id="fn_vdd_measure_rpc_time" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vdd_measure_rpc_time — Estimate VDB RPC round-trip for a given DSN in
milliseconds

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vdd_measure_rpc_time" class="funcsynopsis">

|                                        |                         |
|----------------------------------------|-------------------------|
| `float `**`vdd_measure_rpc_time`**` (` | in `_dsn ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vdd_measure_rpc_time" class="refsect1">

## Description

This function will return the estimated number of milliseconds to
perform an RPC round trip on the DSN supplied.

</div>

<div id="params_vdd_measure_rpc_time" class="refsect1">

## Parameters

<div id="id118226" class="refsect2">

### \_dsn

The name of the data source to estimate round-trip time for.

</div>

</div>

<div id="ret_vdd_measure_rpc_time" class="refsect1">

## Return Types

The length of time taken in milliseconds as a float type.

</div>

<div id="seealso_vdd_measure_rpc_time" class="refsect1">

## See Also

<a href="fn_vd_statistics.html" class="link" title="vd_statistics"><code
class="function">vd_statistics() </code></a>

</div>

</div>
