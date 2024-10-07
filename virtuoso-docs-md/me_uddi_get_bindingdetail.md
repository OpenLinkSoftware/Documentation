<div id="me_uddi_get_bindingdetail" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_get_bindingDetail — Request run-time *`bindingTemplate `* location
information.

</div>

<div id="syntax_uddi_get_bindingdetail_01" class="refsect1">

## Syntax

``` screen
<uddi_get_bindingDetail
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <bindingKey/>
    [ <bindingKey/> ...]
</uddi_get_bindingDetail>
  
```

</div>

<div id="desc_uddi_get_bindingdetail_01" class="refsect1">

## Description

The *`uddi_get_bindingDetail`* message requests the run-time
*`bindingTemplate`* information for the purpose of invoking a registered
business API.

</div>

<div id="params_uddi_get_bindingdetail_01" class="refsect1">

## Attributes & Children

<div id="id115159" class="refsect2">

### bindingKey

One or more *`uuid `* \_key values that represent specific instances of
known *`bindingTemplate `* data.

</div>

<div id="id115164" class="refsect2">

### Behavior

In general, it is recommended that *`bindingTemplate`* information be
cached locally by applications so that repeated calls to a service
described by a *`bindingTemplate`* can be made without having to make
repeated round trips to a registry. In the event that a call made with
cached data fails, the *`uddi`* \_get_bindingDetail message can be used
to get fresh *`bindingTemplate`* data. This is useful in cases such as
when a service you are using relocates to another server or is restored
at a disaster recovery site.

</div>

</div>

<div id="ret_uddi_get_bindingdetail_01" class="refsect1">

## Return Types

This function returns a *`bindingDetail`* message on successful match of
one or more *`bindingKey`* values. If multiple *`bindingKey`* values
were passed, the results will be returned in the same order as the keys
passed.

In the event of a large number of matches, a server may truncate the
result set. If this occurs, the *`bindingDetail`* result will contain
the *`truncated`* attribute with the value of this attribute set to
true.

</div>

<div id="errors_uddi_get_bindingdetail_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115184" class="table">

**Table 24.96. Errors signalled by uddi_get_bindingDetail**

<div class="table-contents">

| Error Code                                         | Description                                                                                                                                                                                                                                              |
|----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`bindingKey`* key values. No partial results will be returned; if any *`bindingKey`* values passed are not valid *`bindingKey`* values, this error will be returned. |

</div>

</div>

  

</div>

</div>
