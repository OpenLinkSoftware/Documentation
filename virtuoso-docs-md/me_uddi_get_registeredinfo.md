<div id="me_uddi_get_registeredinfo" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_get_registeredInfo — Retrieve an abbreviated list of all
*`businessEntity `* keys.

</div>

<div id="syntax_uddi_get_registeredinfo_01" class="refsect1">

## Syntax

``` screen
<uddi_get_registeredInfo
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
</uddi_get_registeredInfo>
  
```

</div>

<div id="desc_uddi_get_registeredinfo_01" class="refsect1">

## Description

The *`uddi_get_registeredInfo`* message is used to get an abbreviated
list of all *`businessEntity`* keys and *`tModel`* keys controlled by
the entity associated with the credentials passed.

</div>

<div id="params_uddi_get_registeredinfo_01" class="refsect1">

## Attributes & Children

<div id="id115328" class="refsect2">

### authInfo

This required argument is an element that contains an authentication
token. Authentication tokens are obtained using the *`get_authToken `*
API call.

</div>

</div>

<div id="ret_uddi_get_registeredinfo_01" class="refsect1">

## Return Types

Upon successful completion, the server returns a *`registeredInfo`*
structure listing abbreviated business information in one or more
*`businessInfo`* structures, and *`tModel`* information in one or more
*`tModelInfo`* structures. This message is useful for determining the
extent of registered information controlled by a single entity.

</div>

<div id="errors_uddi_get_registeredinfo_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115343" class="table">

**Table 24.99. Errors signalled by uddi_get_registeredInfo**

<div class="table-contents">

| Error Code                                          | Description                                                                                                                          |
|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_authTokenExpired </span>  | signifies that the authentication token value passed in the *`authInfo `* argument is no longer valid because the token has expired. |
| <span class="errorcode">E_authTokenRequired </span> | signifies that the authentication token value passed in the *`authInfo `* argument is either missing or is not valid.                |

</div>

</div>

  

</div>

</div>
