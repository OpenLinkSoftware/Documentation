<div id="fn_mts_get_timeout" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

mts_get_timeout — returns timeout of distributed transaction in
milliseconds.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_mts_get_timeout" class="funcsynopsis">

|                              |      |
|------------------------------|------|
| ` `**`mts_get_timeout`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_mts_get_timeout" class="refsect1">

## Description

If reconnect flag is set to non-zero value then forces Virtuoso to
connect even it have been connected already. Returns zero if succeeds.
If MS DTC service is not available (W2K) or MTS is not running (NT4.0)
signals error with code "MX000".

</div>

</div>
