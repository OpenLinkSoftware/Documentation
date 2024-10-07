<div id="fn_tcpip_gethostbyname" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

tcpip_gethostbyname — Returns IP address by host domain name

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_tcpip_gethostbyname" class="funcsynopsis">

|                                         |                         |
|-----------------------------------------|-------------------------|
| `varchar `**`tcpip_gethostbyname`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_tcpip_gethostbyname" class="refsect1">

## Description

This calls the system function gethostbyname() and returns h_addr from
the hostent structure or empty string if no hostent structure returned
(host not exists).

</div>

<div id="params_tcpip_gethostbyname" class="refsect1">

## Parameters

<div id="id113294" class="refsect2">

### name

DNS name of the host

</div>

</div>

<div id="ret_tcpip_gethostbyname" class="refsect1">

## Return Types

A string containing IP address of the host or empty string if not exists

</div>

</div>
