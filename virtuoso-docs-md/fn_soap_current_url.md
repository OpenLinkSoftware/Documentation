<div id="fn_soap_current_url" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_current_url — Returns URL used to access particular HTTP resource.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_current_url" class="funcsynopsis">

|                                      |      |
|--------------------------------------|------|
| `varchar `**`soap_current_url`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_current_url" class="refsect1">

## Description

This function is used to get in VSP/VSPX context the URL used to access
current resource (page). It check whether 'Host' header field is
specified, if not will return as a host information the IP address
resolved via connected socket information.

</div>

<div id="ret_soap_current_url" class="refsect1">

## Return Types

The return type of `soap_current_url() ` is an string containing the URL
of the HTTP request.

</div>

</div>
