<div id="fn_mts_status" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

mts_status — checks status of current transaction or server.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_mts_status" class="funcsynopsis">

|                         |                            |
|-------------------------|----------------------------|
| ` `**`mts_status`**` (` | in `subject ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_mts_status" class="refsect1">

## Description

Checks status of subject. Subject can be either 'MTS' or 'TRANSACTION'.
In the first case this checks if the server is connected to MTS. In the
second case, checks if 2pc control is enabled for the current
transaction. This function returns status string. For 'MTS' it could be
either 'connected' or 'disconnected'. For 'TRANSACTION' - either '2pc
enabled' or '2pc disabled'.

</div>

</div>
