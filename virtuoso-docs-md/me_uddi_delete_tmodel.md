<div>

<div>

</div>

<div>

## Name

uddi_delete_tModel — Remove or retire one or more *`tModel `*
structures.

</div>

<div>

## Syntax

``` screen
<uddi_delete_tModel
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <tModelKey/>
    [ <tModelKey/> ...]
</uddi_delete_tModel>
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

### tModelKey

One or more URN-qualified *`uuid_key`* values that represent specific
instances of known *`tModel`* data. All *`tModelKey`* values begin with
a uuid URN qualifier (e.g. "uuid:" followed by a known tModel UUID
value.)

</div>

</div>

<div>

## Return Types

Upon successful completion, a *`dispositionReport `* structure is
returned with a single success indicator.

<div>

### Behavior

If a *`tModel`* is deleted and any other managed data references that
*`tModel`* by *`uuid_key`* (e.g. within a *`categoryBag`* ,
*`identifierBag`* or within a *`tModelInstanceInfo`* structure) then the
*`tModel`* will not be physically deleted as a result of this call.
Instead it will be marked as hidden. *`tModels`* hidden in this way are
still accessible to their owner, via the *`get_registeredInfo`* call;
however, they will be omitted from any results returned by calls to
*`find_tModel`* .

The details associated with a hidden *`tModel`* are still available to
anyone who uses the *`get_tModelDetail`* message. Publishers who want to
remove all details about a *`tModel`* from the system should call
*`save_tModel`* , passing empty values in the data fields, before using
*`uddi_delete_tModel`* . A hidden *`tModel`* can be restored and made
universally visible by invoking *`save`* \_tModel at a later time,
passing the key of the hidden *`tModel `* .

</div>

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.88. Errors signalled by uddi_delete_tModel**

<div>

| Error Code                                          | Description                                                                                                                                                                                                                                                                                                                         |
|-----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>  | signifies that one of the URN-qualified *`uuid_key`* values passed did not match with any known *`tModelKey`* values. No partial results will be returned; if any *`tModelKey`* values passed are not valid, this error will be returned. Any *`tModelKey `* values passed without a uuid URN qualifier will be considered invalid. |
| <span class="errorcode">E_authTokenExpired </span>  | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired.                                                                                                                                                                                                |
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                                                                                                                                                                                                               |
| <span class="errorcode">E_userMismatch </span>      | signifies that one or more of the *`tModelKey `* values passed refers to data not controlled by the entity the authentication token represents.                                                                                                                                                                                     |
| <span class="errorcode">E_operatorMismatch </span>  | signifies that one or more of the *`tModelKey `* values passed refers to data that is not controlled by the server that received the request for processing.                                                                                                                                                                        |

</div>

</div>

  

</div>

</div>
