<div id="me_uddi_delete_service" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_delete_service — Remove one or more *`businessService `*
structures.

</div>

<div id="syntax_uddi_delete_service_01" class="refsect1">

## Syntax

``` screen
<uddi_delete_service
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <serviceKey/>
    [ <serviceKey/> ...]
</uddi_delete_service>
```

</div>

<div id="params_uddi_delete_service_01" class="refsect1">

## Attributes & Children

<div id="id114554" class="refsect2">

### authInfo

This required argument is an element that contains an authentication
token obtained using the *`get_authToken `* call.

</div>

<div id="id114558" class="refsect2">

### serviceKey

One or more *`uuid_key `* values that represent specific instances of
known *`businessService `* data.

</div>

</div>

<div id="ret_uddi_delete_service_01" class="refsect1">

## Return Types

Upon successful completion, a *`dispositionReport`* message is returned
with a single success indicator.

</div>

<div id="errors_uddi_delete_service_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id114571" class="table">

**Table 24.88. Errors signalled by uddi_delete_service**

<div class="table-contents">

| Error Code                                          | Description                                                                                                                                                                                                                     |
|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>  | signifies that one of the *`uuid_key `* values passed did not match with any known *`serviceKey`* values. No partial results will be returned; if any *`serviceKey `* values passed are not valid, this error will be returned. |
| <span class="errorcode">E_authTokenExpired </span>  | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired.                                                                                            |
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                                                                                                           |
| <span class="errorcode">E_userMismatch </span>      | signifies that one or more of the *`serviceKey `* values passed refers to data not controlled by the entity the authentication token represents.                                                                                |
| <span class="errorcode">E_operatorMismatch </span>  | signifies that one or more of the *`serviceKey `* values passed refers to data not controlled by the server that received the request for processing.                                                                           |

</div>

</div>

  

</div>

</div>
