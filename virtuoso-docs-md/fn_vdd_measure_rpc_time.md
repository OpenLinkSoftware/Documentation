<div>

<div>

</div>

<div>

## Name

vdd_measure_rpc_time — Estimate VDB RPC round-trip for a given DSN in
milliseconds

</div>

<div>

## Synopsis

<div>

|                                        |                         |
|----------------------------------------|-------------------------|
| `float `**`vdd_measure_rpc_time`**` (` | in `_dsn ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function will return the estimated number of milliseconds to
perform an RPC round trip on the DSN supplied.

</div>

<div>

## Parameters

<div>

### \_dsn

The name of the data source to estimate round-trip time for.

</div>

</div>

<div>

## Return Types

The length of time taken in milliseconds as a float type.

</div>

<div>

## See Also

<a href="fn_vd_statistics.html" class="link" title="vd_statistics"><code
class="function">vd_statistics() </code></a>

</div>

</div>
