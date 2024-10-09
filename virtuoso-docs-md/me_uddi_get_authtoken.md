<div>

<div>

</div>

<div>

## Name

uddi_get_authToken — Obtain authentication token.

</div>

<div>

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

<div>

## Description

The *`uddi_get_authToken`* message is used to obtain an authentication
token. Authentication tokens are opaque values that are required for all
other publisher API calls. This message is not required for UDDI-enabled
servers that have an external mechanism defined for users to get an
authentication token. This API is provided for implementations that do
not have some other method of obtaining an authentication token or
certificate, or that choose to use password-based authentication.

</div>

<div>

## Attributes & Children

<div>

### userID

This required attribute argument is the identifier that an authorized
entity was assigned by a UDDI-enabled server. Each UDDI-enabled server
provides a way for entities to obtain userids and passwords that are
valid only at that server.

</div>

<div>

### cred

This required attribute argument is the password or credential that is
associated with the entity.

</div>

</div>

<div>

## Return Types

*`uddi_get_authToken `* returns an *`authToken`* message containing a
valid *`authInfo`* element usable in subsequent calls requiring an
*`authInfo`* value.

</div>

<div>

## Errors

If an error occurs in processing this message, the server returns a
*`dispositionReport`* structure in a SOAP Fault. The following error
information will be relevant:

<div>

**Table 24.94. Errors signalled by uddi_get_authToken**

<div>

| Error Code                                    | Description                                                                                                                                          |
|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_unknownUser </span> | signifies that the UDDI-enabled server that received the request does not recognize the userID and/or password argument values passed as credentials |

</div>

</div>

  

</div>

</div>
