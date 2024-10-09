<div>

<div>

</div>

<div>

## Name

uddi_save_binding — save or update a complete *`bindingTemplate `*
structure

</div>

<div>

## Syntax

``` screen
<uddi_save_binding
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <bindingTemplate/>
    [<bindingTemplate/>...]
</uddi_save_binding>
  
```

</div>

<div>

## Description

The *`uddi_save_binding`* message is used to save or update a complete
*`bindingTemplate`* structure. This message can be used to add or update
one or more *`bindingTemplate`* structures to one or more existing
*`businessService`* structures.

</div>

<div>

## Attributes & Children

<div>

### authInfo

This required argument is an element that contains an authentication
token, obtained using the *`get_authToken `* call.

</div>

<div>

### bindingTemplate

One or more complete *`bindingTemplate `* structures. The order in which
these are processed is not defined. To save a new *`bindingTemplate`* ,
pass a *`bindingTemplate `* structure with an empty *`bindingKey `*
attribute value.

</div>

<div>

### Behavior

Each *`bindingTemplate `* structure passed must contain a
*`serviceKey `* value that corresponds to a registered
*`businessService`* controlled by the same identity saving the
*`bindingTemplate`* data. The effect of this call is to establish the
parent *`businessService`* relationship for each *`bindingTemplate`*
affected by this call. If the same *`bindingTemplate`* (determined by
matching *`bindingKey`* value) is listed more than once, any
relationship to the containing *`businessService`* will be determined by
processing order, which is determined by the position of the
*`bindingTemplate `* data in first-to-last order.

</div>

</div>

<div>

## Return Types

This message returns a *`bindingDetail`* message that reflects the newly
registered information for the affected *`bindingTemplate`* structures.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.101. Errors signalled by uddi_save_binding**

<div>

| Error Code                                             | Description                                                                                                                                                                                                                                             |
|--------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>     | signifies that the request cannot be satisfied because one or more *`uuid_key`* values specified is not a valid key value, or that a *`hostingRedirector`* value references a *`bindingTemplate `* that itself contains a *`hostingRedirector `* value. |
| <span class="errorcode">E_authTokenExpired </span>     | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired.                                                                                                                    |
| <span class="errorcode">E_authTokenRequired </span>    | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                                                                                                                                   |
| <span class="errorcode">E_userMismatch </span>         | signifies that one or more of the *`uuid_key `* values passed refers to data that is not controlled by the entity represented by the authentication token.                                                                                              |
| <span class="errorcode">E_operatorMismatch </span>     | signifies that one or more of the *`uuid_key `* values passed refers to data that is not controlled by the server that received the request for processing.                                                                                             |
| <span class="errorcode">E_keyRetired </span>           | signifies that the request cannot be satisfied because one or more *`uuid_key`* values specified has previously been hidden or removed by the requester. This specifically applies to the *`tModelKey `* values passed.                                 |
| <span class="errorcode">E_invalidURLPassed </span>     | an error occurred with one of the *`uploadRegister `* URL values.                                                                                                                                                                                       |
| <span class="errorcode">E_accountLimitExceeded </span> | signifies that user account limits have been exceeded.                                                                                                                                                                                                  |

</div>

</div>

  

</div>

</div>
