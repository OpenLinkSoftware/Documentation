<div id="me_uddi_get_servicedetail" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_get_serviceDetail — request full information about a known
*`businessService `* structure

</div>

<div id="syntax_uddi_get_servicedetail_01" class="refsect1">

## Syntax

``` screen
<uddi_get_serviceDetail
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <serviceKey/>
    [ <serviceKey/> ...]
</uddi_get_serviceDetail>
```

</div>

<div id="params_uddi_get_servicedetail_01" class="refsect1">

## Attributes & Children

<div id="id115374" class="refsect2">

### serviceKey

one or more *`uuid_key `* values that represent specific instances of
known *`businessService `* data.

</div>

</div>

<div id="ret_uddi_get_servicedetail_01" class="refsect1">

## Return Types

This message returns a *`serviceDetail`* message on successful match of
one or more *`serviceKey`* values. If multiple *`serviceKey`* values
were passed, the results will be returned in the same order as the keys
passed.

In the event of a large number of matches, a server may truncate the
result set. If this occurs, the response will contain a *`truncated`*
attribute with the value of this attribute set to true.

</div>

<div id="errors_uddi_get_servicedetail_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115391" class="table">

**Table 24.100. Errors signalled by uddi_get_serviceDetail**

<div class="table-contents">

| Error Code                                         | Description                                                                                                                                                                                                                     |
|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`serviceKey`* values. No partial results will be returned; if any *`serviceKey `* values passed are not valid, this error will be returned. |

</div>

</div>

  

</div>

</div>
