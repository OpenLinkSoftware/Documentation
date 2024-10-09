<div>

<div>

</div>

<div>

## Name

uddi_delete_binding — Causes one or more *`bindingTemplate `* structures
to be deleted.

</div>

<div>

## Syntax

``` screen
<uddi_delete_binding
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <bindingKey/>
    [ <bindingKey/> ...]
</uddi_delete_binding>
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

### bindingKey

One or more *`uuid_key `* values that represent specific instances of
known *`bindingTemplate `* data.

</div>

</div>

<div>

## Return Types

Upon successful completion, a *`dispositionReport`* is returned with a
single success indicator.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.85. Errors signalled by uddi_delete_binding**

<div>

| Error Code                                          | Description                                                                                                                                                                                                                     |
|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>  | signifies that one of the *`uuid_key `* values passed did not match with any known *`bindingKey`* values. No partial results will be returned; if any *`bindingKey `* values passed are not valid, this error will be returned. |
| <span class="errorcode">E_authTokenExpired </span>  | signifies that the authentication token value passed in the authInfo argument is no longer valid because the token has expired.                                                                                                 |
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the authInfo argument is either missing or is not valid.                                                                                                                |
| <span class="errorcode">E_userMismatch </span>      | signifies that one or more of the *`bindingKey `* values passed refers to data not controlled by the entity the authentication token represents.                                                                                |
| <span class="errorcode">E_operatorMismatch </span>  | signifies that one or more of the *`bindingKey `* values passed refers to data not controlled by the server that received the request for processing.                                                                           |

</div>

</div>

  

</div>

</div>
