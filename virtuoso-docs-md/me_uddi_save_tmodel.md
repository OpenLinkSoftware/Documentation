<div>

<div>

</div>

<div>

## Name

uddi_save_tModel — Adds or updates one or more *`tModel `* structures.

</div>

<div>

## Syntax

``` screen
<uddi_save_tModel
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <tModel/> [<tModel/>...] | <uploadRegister/> [<uploadRegister/>...]
</uddi_save_tModel>
```

</div>

<div>

## Attributes & Children

<div>

### authInfo

This required argument is an element that contains an authentication
token obtained using the *`get_authToken `* call.

</div>

<div>

### tModel

One or more complete *`tModel `* structures can be passed. If adding a
new *`tModel `* , the *`tModelKey `* value should be passed as an empty
element.

</div>

<div>

### uploadRegister

One or more resolvable HTTP URL addresses that each point to a single
and valid *`tModel`* structure. This variant argument allows a registry
to be updated to reflect the contents of an XML document that is
URL-addressable. The URL must return a pure XML document that only
contains a *`tModel`* structure as its top-level element, and must be
accessible using the standard HTTP-GET protocol.

</div>

</div>

<div>

## Return Types

This message returns a *`tModelDetail`* message containing the new
registered information for the effected *`tModel`* structures.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.104. Errors signalled by uddi_save_tModel**

<div>

| Error Code                                             | Description                                                                                                                                                                                                                                        |
|--------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>     | signifies that the request cannot be satisfied because one or more *`uuid_key `* values specified is not a valid key value. This will occur if a *`uuid_key`* value is passed in a *`tModel `* that does not match with any known *`tModel `* key. |
| <span class="errorcode">E_authTokenExpired </span>     | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired.                                                                                                               |
| <span class="errorcode">E_authTokenRequired </span>    | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                                                                                                                              |
| <span class="errorcode">E_userMismatch </span>         | signifies that one or more of the *`uuid_key `* values passed refers to data not controlled by the entity represented by the authentication token.                                                                                                 |
| <span class="errorcode">E_operatorMismatch </span>     | signifies that one or more of the *`uuid_key `* values passed refers to data not controlled by the server that received the request for processing.                                                                                                |
| <span class="errorcode">E_keyRetired </span>           | signifies that the request cannot be satisfied because one or more *`uuid_key`* values specified has previously been hidden or removed by the requester. This specifically applies to the *`tModelKey `* values passed.                            |
| <span class="errorcode">E_invalidURLPassed </span>     | an error occurred with one of the *`uploadRegister `* URL values.                                                                                                                                                                                  |
| <span class="errorcode">E_accountLimitExceeded </span> | signifies that user account limits have been exceeded.                                                                                                                                                                                             |

</div>

</div>

  

</div>

</div>
