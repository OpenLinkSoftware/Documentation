<div>

<div>

</div>

<div>

## Name

soap_current_url — Returns URL used to access particular HTTP resource.

</div>

<div>

## Synopsis

<div>

|                                      |      |
|--------------------------------------|------|
| `varchar `**`soap_current_url`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to get in VSP/VSPX context the URL used to access
current resource (page). It check whether 'Host' header field is
specified, if not will return as a host information the IP address
resolved via connected socket information.

</div>

<div>

## Return Types

The return type of `soap_current_url() ` is an string containing the URL
of the HTTP request.

</div>

</div>
