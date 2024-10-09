<div>

<div>

</div>

<div>

## Name

uddi_save_service — Adds or updates one or more *`businessService `*
structures.

</div>

<div>

## Syntax

``` screen
<uddi_save_service
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <businessService/> [<businessService/>...]
</uddi_save_service>
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

### businessService

One or more complete *`businessService `* structures can be passed.
These structures can be obtained in advance by using the
*`get_serviceDetail`* call or by any other means.

</div>

</div>

<div>

## Return Types

This message returns a *`serviceDetail`* message that reflects the newly
registered information for the affected *`businessService`* structures.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.103. Errors signalled by uddi_save_service**

<div>

| Error Code                                          | Description                                                                                                                                                                                                             |
|-----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>  | signifies that the request cannot be satisfied because one or more *`uuid_key`* values specified is not a valid key value. This includes any *`tModelKey`* references that are unknown.                                 |
| <span class="errorcode">E_authTokenExpired </span>  | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired.                                                                                    |
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                                                                                                   |
| <span class="errorcode">E_userMismatch </span>      | signifies that one or more of the *`uuid_key`* values passed refers to data not controlled by the entity that the authentication token represents.                                                                      |
| <span class="errorcode">E_operatorMismatch </span>  | signifies that one or more of the *`uuid_key `* values passed refers to data not controlled by the server that received the request for processing.                                                                     |
| <span class="errorcode">E_keyRetired </span>        | signifies that the request cannot be satisfied because one or more *`uuid_key`* values specified has previously been hidden or removed by the requester. This specifically applies to the *`tModelKey `* values passed. |

</div>

</div>

  

</div>

</div>
