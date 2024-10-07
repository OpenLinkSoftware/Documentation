<div id="me_uddi_get_authtoken" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_get_authToken — Obtain authentication token.

</div>

<div id="syntax_uddi_get_authtoken_01" class="refsect1">

## Syntax

``` screen
<uddi_get_authToken
  generic="1.0"
  xmlns="urn:uddi-org:api"
  userID="someLoginName"
  cred="someCredential">
</uddi_get_authToken>
  
```

</div>

<div id="desc_uddi_get_authtoken_01" class="refsect1">

## Description

The *`uddi_get_authToken`* message is used to obtain an authentication
token. Authentication tokens are opaque values that are required for all
other publisher API calls. This message is not required for UDDI-enabled
servers that have an external mechanism defined for users to get an
authentication token. This API is provided for implementations that do
not have some other method of obtaining an authentication token or
certificate, or that choose to use password-based authentication.

</div>

<div id="params_uddi_get_authtoken_01" class="refsect1">

## Attributes & Children

<div id="id115112" class="refsect2">

### userID

This required attribute argument is the identifier that an authorized
entity was assigned by a UDDI-enabled server. Each UDDI-enabled server
provides a way for entities to obtain userids and passwords that are
valid only at that server.

</div>

<div id="id115115" class="refsect2">

### cred

This required attribute argument is the password or credential that is
associated with the entity.

</div>

</div>

<div id="ret_uddi_get_authtoken_01" class="refsect1">

## Return Types

*`uddi_get_authToken `* returns an *`authToken`* message containing a
valid *`authInfo`* element usable in subsequent calls requiring an
*`authInfo`* value.

</div>

<div id="errors_uddi_get_authtoken_01" class="refsect1">

## Errors

If an error occurs in processing this message, the server returns a
*`dispositionReport`* structure in a SOAP Fault. The following error
information will be relevant:

<div id="id115129" class="table">

**Table 24.95. Errors signalled by uddi_get_authToken**

<div class="table-contents">

| Error Code                                    | Description                                                                                                                                          |
|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_unknownUser </span> | signifies that the UDDI-enabled server that received the request does not recognize the userID and/or password argument values passed as credentials |

</div>

</div>

  

</div>

</div>
