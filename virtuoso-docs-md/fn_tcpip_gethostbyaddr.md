<div id="fn_tcpip_gethostbyaddr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

tcpip_gethostbyaddr — Returns fully qualified DNS name of the host
associated with given IP address

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_tcpip_gethostbyaddr" class="funcsynopsis">

|                                         |                            |
|-----------------------------------------|----------------------------|
| `varchar `**`tcpip_gethostbyaddr`**` (` | in `address ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_tcpip_gethostbyaddr" class="refsect1">

## Description

This calls the system function gethostbyaddr() and returns h_name from
the hostent structure returned by it. If no hostent structure returned,
then it returns it's argument.

</div>

<div id="params_tcpip_gethostbyaddr" class="refsect1">

## Parameters

<div id="id113319" class="refsect2">

### address

A string containing an IP address

</div>

</div>

<div id="ret_tcpip_gethostbyaddr" class="refsect1">

## Return Types

Returns fully qualified DNS name of the host associated with 'address'.
If no such address the return will contain same value as 'address'
parameter.

</div>

</div>
