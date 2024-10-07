<div id="me_uddi_get_tmodeldetail" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_get_tModelDetail — Request full information about a known
*`tModel `* structure.

</div>

<div id="syntax_uddi_get_tmodeldetail_01" class="refsect1">

## Syntax

``` screen
<uddi_get_tModelDetail
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <tModelKey/>
    [ <tModelKey/> ...]
</uddi_get_tModelDetail>
```

</div>

<div id="params_uddi_get_tmodeldetail_01" class="refsect1">

## Attributes & Children

<div id="id115419" class="refsect2">

### tModelKey

one or more URN qualified *`uuid_key `* values that represent specific
instances of known *`tModel`* data. All *`tModelKey`* values begin with
a uuid URN qualifier such as "uuid:" followed by a known *`tModel `*
uuid value.

</div>

</div>

<div id="ret_uddi_get_tmodeldetail_01" class="refsect1">

## Return Types

This message returns a *`tModelDetail`* message on successful match of
one or more *`tModelKey`* values. If multiple *`tModelKey`* values were
passed, the results will be returned in the same order as the keys
passed.

In the event of a large number of matches, a server may truncate the
result set. If this occurs, the response will contain a *`truncated`*
attribute with the value of this attribute set to true.

</div>

<div id="errors_uddi_get_tmodeldetail_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115438" class="table">

**Table 24.101. Errors signalled by uddi_get_tModelDetail**

<div class="table-contents">

| Error Code                                         | Description                                                                                                                                                                                                                                                                                                                         |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the URN-qualified *`uuid_key `* values passed did not match with any known *`tModelKey`* values. No partial results will be returned; if any *`tModelKey`* values passed are not valid, this error will be returned. Any *`tModelKey`* values passed without a uuid URN qualifier will be considered invalid. |
| <span class="errorcode">E_keyRetired </span>       | signifies that the request cannot be satisfied because the owner has retired the *`tModel`* information. The *`tModel`* reference may still be valid and used as intended, but the information defining the *`tModel `* behind the key is unavailable.                                                                              |

</div>

</div>

  

</div>

</div>
