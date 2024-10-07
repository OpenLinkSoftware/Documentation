<div id="me_uddi_save_service" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_save_service — Adds or updates one or more *`businessService `*
structures.

</div>

<div id="syntax_uddi_save_service_01" class="refsect1">

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

<div id="params_uddi_save_service_01" class="refsect1">

## Attributes & Children

<div id="id115715" class="refsect2">

### authInfo

This required argument is an element that contains an authentication
token obtained using the *`get_authToken `* call.

</div>

<div id="id115719" class="refsect2">

### businessService

One or more complete *`businessService `* structures can be passed.
These structures can be obtained in advance by using the
*`get_serviceDetail`* call or by any other means.

</div>

</div>

<div id="ret_uddi_save_service_01" class="refsect1">

## Return Types

This message returns a *`serviceDetail`* message that reflects the newly
registered information for the affected *`businessService`* structures.

</div>

<div id="errors_uddi_save_service_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115733" class="table">

**Table 24.104. Errors signalled by uddi_save_service**

<div class="table-contents">

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
