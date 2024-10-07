<div id="me_uddi_get_businessdetail" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_get_businessDetail — returns complete *`businessEntity `*
information for one or more specified *`businessEntities `*

</div>

<div id="syntax_uddi_get_businessdetail_01" class="refsect1">

## Syntax

``` screen
<uddi_get_businessDetail
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <businessKey/>
    [ <businessKey/> ...]
</uddi_get_businessDetail>
```

</div>

<div id="params_uddi_get_businessdetail_01" class="refsect1">

## Attributes & Children

<div id="id115214" class="refsect2">

### businessKey

one or more *`uuid_key `* values that represent specific instances of
known *`businessEntity `* data.

</div>

</div>

<div id="ret_uddi_get_businessdetail_01" class="refsect1">

## Return Types

This function returns a *`businessDetail`* message on successful match
of one or more *`businessKey`* values. If multiple *`businessKey`*
values were passed, the results will be returned in the same order as
the keys passed.

In the event of a large number of matches, a server may truncate the
result set. If this occurs, the *`businessDetail`* response message will
contain the *`truncated`* attribute with the value of this attribute set
to true.

</div>

<div id="errors_uddi_get_businessdetail_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115232" class="table">

**Table 24.97. Errors signalled by uddi_get_businessDetail**

<div class="table-contents">

| Error Code                                         | Description                                                                                                                                                                                                                       |
|----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`businessKey`* values. No partial results will be returned; if any *`businessKey `* values passed are not valid, this error will be returned. |

</div>

</div>

  

</div>

</div>
