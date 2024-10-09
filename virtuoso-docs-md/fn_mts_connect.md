<div>

<div>

</div>

<div>

## Name

mts_connect — connects Virtuoso server to MS DTC.

</div>

<div>

## Synopsis

<div>

|                          |                              |
|--------------------------|------------------------------|
| ` `**`mts_connect`**` (` | in `reconnect ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

If reconnect flag is set to non-zero value then forces Virtuoso to
connect even it have been connected already. Returns zero if succeeds.
If MS DTC service is not available (W2K) or MTS is not running (NT4.0)
signals error with code "MX000".

</div>

</div>
