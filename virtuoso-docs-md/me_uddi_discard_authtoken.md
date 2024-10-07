<div id="me_uddi_discard_authtoken" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_discard_authToken — Inform a UDDI server that the authentication
token can be discarded.

</div>

<div id="syntax_uddi_discard_authtoken_01" class="refsect1">

## Syntax

``` screen
<uddi_discard_authToken
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
</uddi_discard_authToken>
  
```

</div>

<div id="desc_uddi_discard_authtoken_01" class="refsect1">

## Description

The *`uddi_discard_authToken`* message is used to tell a UDDI-enabled
server that the authentication token can be discarded. Subsequent calls
that use the same *`authToken`* may be rejected. This message is
optional for UDDI-enabled servers that do not manage session state or
that do not support the *`get_authToken`* message.

</div>

<div id="params_uddi_discard_authtoken_01" class="refsect1">

## Attributes & Children

<div id="id114713" class="refsect2">

### authInfo

This required argument is an element that contains an authentication
token. Authentication tokens are obtained using the *`get_authToken `*
message.

</div>

</div>

<div id="ret_uddi_discard_authtoken_01" class="refsect1">

## Return Types

Upon successful completion, the server returns a *`dispositionReport`*
is returned with a single success indicator. Discarding an expired
*`authToken`* will be reported as a success condition.

</div>

<div id="errors_uddi_discard_authtoken_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id114726" class="table">

**Table 24.90. Errors signalled by get_authToken**

<div class="table-contents">

| Error Code                                          | Description                                                                                                           |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid. |

</div>

</div>

  

</div>

</div>
