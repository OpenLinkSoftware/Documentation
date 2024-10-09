<div>

<div>

</div>

<div>

## Name

uddi_get_businessDetail — returns complete *`businessEntity `*
information for one or more specified *`businessEntities `*

</div>

<div>

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

<div>

## Attributes & Children

<div>

### businessKey

one or more *`uuid_key `* values that represent specific instances of
known *`businessEntity `* data.

</div>

</div>

<div>

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

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.96. Errors signalled by uddi_get_businessDetail**

<div>

| Error Code                                         | Description                                                                                                                                                                                                                       |
|----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`businessKey`* values. No partial results will be returned; if any *`businessKey `* values passed are not valid, this error will be returned. |

</div>

</div>

  

</div>

</div>
