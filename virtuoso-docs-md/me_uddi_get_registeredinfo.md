<div>

<div>

</div>

<div>

## Name

uddi_get_registeredInfo — Retrieve an abbreviated list of all
*`businessEntity `* keys.

</div>

<div>

## Syntax

``` screen
<uddi_get_registeredInfo
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
</uddi_get_registeredInfo>
  
```

</div>

<div>

## Description

The *`uddi_get_registeredInfo`* message is used to get an abbreviated
list of all *`businessEntity`* keys and *`tModel`* keys controlled by
the entity associated with the credentials passed.

</div>

<div>

## Attributes & Children

<div>

### authInfo

This required argument is an element that contains an authentication
token. Authentication tokens are obtained using the *`get_authToken `*
API call.

</div>

</div>

<div>

## Return Types

Upon successful completion, the server returns a *`registeredInfo`*
structure listing abbreviated business information in one or more
*`businessInfo`* structures, and *`tModel`* information in one or more
*`tModelInfo`* structures. This message is useful for determining the
extent of registered information controlled by a single entity.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.98. Errors signalled by uddi_get_registeredInfo**

<div>

| Error Code                                          | Description                                                                                                                          |
|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_authTokenExpired </span>  | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired. |
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                |

</div>

</div>

  

</div>

</div>
