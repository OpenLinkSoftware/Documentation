<div>

<div>

</div>

<div>

## Name

tcpip_gethostbyname — Returns IP address by host domain name

</div>

<div>

## Synopsis

<div>

|                                         |                         |
|-----------------------------------------|-------------------------|
| `varchar `**`tcpip_gethostbyname`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This calls the system function gethostbyname() and returns h_addr from
the hostent structure or empty string if no hostent structure returned
(host not exists).

</div>

<div>

## Parameters

<div>

### name

DNS name of the host

</div>

</div>

<div>

## Return Types

A string containing IP address of the host or empty string if not exists

</div>

</div>
