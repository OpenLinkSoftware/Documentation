<div id="fn_wst_cli" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

wst_cli — Request a security token from WST endpoint

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_wst_cli" class="funcsynopsis">

|                           |                             |
|---------------------------|-----------------------------|
| `token `**`wst_cli`**` (` | in `req ` soap_client_req , |
|                           | in `policy ` any `)`;       |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_wst_cli" class="refsect1">

## Description

This function is for use with a SOAP client contacting a WS-Trust
endpoint for a security token.

</div>

<div id="params_wst_cli" class="refsect1">

## Parameters

<div id="id119333" class="refsect2">

### req

A UDT containing soap_client parameters as described in WS-RM.

</div>

<div id="id119336" class="refsect2">

### policy

contains policy to be applied, an example:

``` programlisting
create type policy_struct as 
(
  usage - integrity/confidentiality
  token_type - wsse token type: x509; context token etc.
  token_issuer - URL of the issuer
  user_name - represent to issuer,
  user_pass,
  debug - dump req/res. 1 - for RequestSecurityToken, 2 - end point
  token - base64 encoded Binary Security Token 
)
```

</div>

</div>

<div id="ret_wst_cli" class="refsect1">

## Return Types

A security token.

</div>

<div id="seealso_wst_cli" class="refsect1">

## See Also

<a href="warm.html" class="link"
title="17.7. Web Services Reliable Messaging Protocol (WS-ReliableMessaging)">WS
Reliable Messaging</a>

</div>

</div>
