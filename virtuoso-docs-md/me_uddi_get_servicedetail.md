<div>

<div>

</div>

<div>

## Name

uddi_get_serviceDetail — request full information about a known
*`businessService `* structure

</div>

<div>

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

<div>

## Attributes & Children

<div>

### serviceKey

one or more *`uuid_key `* values that represent specific instances of
known *`businessService `* data.

</div>

</div>

<div>

## Return Types

This message returns a *`serviceDetail`* message on successful match of
one or more *`serviceKey`* values. If multiple *`serviceKey`* values
were passed, the results will be returned in the same order as the keys
passed.

In the event of a large number of matches, a server may truncate the
result set. If this occurs, the response will contain a *`truncated`*
attribute with the value of this attribute set to true.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.99. Errors signalled by uddi_get_serviceDetail**

<div>

| Error Code                                         | Description                                                                                                                                                                                                                     |
|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`serviceKey`* values. No partial results will be returned; if any *`serviceKey `* values passed are not valid, this error will be returned. |

</div>

</div>

  

</div>

</div>
