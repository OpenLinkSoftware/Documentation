<div>

<div>

</div>

<div>

## Name

uddi_discard_authToken — Inform a UDDI server that the authentication
token can be discarded.

</div>

<div>

## Syntax

``` screen
<uddi_discard_authToken
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
</uddi_discard_authToken>
  
```

</div>

<div>

## Description

The *`uddi_discard_authToken`* message is used to tell a UDDI-enabled
server that the authentication token can be discarded. Subsequent calls
that use the same *`authToken`* may be rejected. This message is
optional for UDDI-enabled servers that do not manage session state or
that do not support the *`get_authToken`* message.

</div>

<div>

## Attributes & Children

<div>

### authInfo

This required argument is an element that contains an authentication
token. Authentication tokens are obtained using the *`get_authToken `*
message.

</div>

</div>

<div>

## Return Types

Upon successful completion, the server returns a *`dispositionReport`*
is returned with a single success indicator. Discarding an expired
*`authToken`* will be reported as a success condition.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.89. Errors signalled by get_authToken**

<div>

| Error Code                                          | Description                                                                                                           |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid. |

</div>

</div>

  

</div>

</div>
