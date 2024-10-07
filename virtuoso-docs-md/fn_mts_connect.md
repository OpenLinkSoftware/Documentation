<div id="fn_mts_connect" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

mts_connect — connects Virtuoso server to MS DTC.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_mts_connect" class="funcsynopsis">

|                          |                              |
|--------------------------|------------------------------|
| ` `**`mts_connect`**` (` | in `reconnect ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_mts_connect" class="refsect1">

## Description

If reconnect flag is set to non-zero value then forces Virtuoso to
connect even it have been connected already. Returns zero if succeeds.
If MS DTC service is not available (W2K) or MTS is not running (NT4.0)
signals error with code "MX000".

</div>

</div>
