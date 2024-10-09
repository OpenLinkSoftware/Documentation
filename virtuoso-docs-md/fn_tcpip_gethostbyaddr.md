<div>

<div>

</div>

<div>

## Name

tcpip_gethostbyaddr — Returns fully qualified DNS name of the host
associated with given IP address

</div>

<div>

## Synopsis

<div>

|                                         |                            |
|-----------------------------------------|----------------------------|
| `varchar `**`tcpip_gethostbyaddr`**` (` | in `address ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This calls the system function gethostbyaddr() and returns h_name from
the hostent structure returned by it. If no hostent structure returned,
then it returns it's argument.

</div>

<div>

## Parameters

<div>

### address

A string containing an IP address

</div>

</div>

<div>

## Return Types

Returns fully qualified DNS name of the host associated with 'address'.
If no such address the return will contain same value as 'address'
parameter.

</div>

</div>
