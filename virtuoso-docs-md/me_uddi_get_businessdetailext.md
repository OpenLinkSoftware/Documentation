<div>

<div>

</div>

<div>

## Name

uddi_get_businessDetailExt — Returns extended *`businessEntity `*
information for one or more specified *`businessEntities `* .

</div>

<div>

## Syntax

``` screen
<uddi_get_businessDetailExt
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <businessKey/>
    [ <businessKey/> ...]
</uddi_get_businessDetailExt>
  
```

</div>

<div>

## Description

The *`uddi_get_businessDetailExt`* message returns extended
*`businessEntity`* information for one or more specified
*`businessEntities`* . This message returns exactly the same information
as the *`get_businessDetail`* message, but may contain additional
attributes if the source is an external registry that is compatible with
this API specification, rather than a UDDI-enabled server.

</div>

<div>

## Attributes & Children

<div>

### businessKey

One or more *`uuid_key `* values that represent specific instances of
known *`businessEntity `* data.

</div>

</div>

<div>

## Return Types

This message returns a *`businessDetailExt`* message on successful match
of one or more *`businessKey`* values. If multiple *`businessKey`*
values were passed, the results will be returned in the same order as
the keys passed.

In the event of a large number of matches, a server may truncate the
result set. If this occurs, the *`businessDetailExt`* response message
will contain the *`truncated`* attribute with the value of this
attribute set to true.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.97. Errors signalled by uddi_get_businessDetailExt**

<div>

| Error Code                                         | Description                                                                                                                                                                                                                                                                                                                                                  |
|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`businessKey`* values. No partial results will be returned; if any *`businessKey`* values passed are not valid, this error will be returned.                                                                                                                             |
| <span class="errorcode">E_unsupported </span>      | signifies that the implementation queried does not support the extended detail function. If this occurs, *`businessDetail`* information should be queried via the *`get_businessDetail`* message. UDDI-enabled servers will not return this code, but will instead return a *`businessDetailExt`* result with full *`businessDetail `* information embedded. |

</div>

</div>

  

</div>

</div>
