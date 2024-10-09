<div>

<div>

</div>

<div>

## Name

uddi_get_tModelDetail — Request full information about a known
*`tModel `* structure.

</div>

<div>

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

<div>

## Attributes & Children

<div>

### tModelKey

one or more URN qualified *`uuid_key `* values that represent specific
instances of known *`tModel`* data. All *`tModelKey`* values begin with
a uuid URN qualifier such as "uuid:" followed by a known *`tModel `*
uuid value.

</div>

</div>

<div>

## Return Types

This message returns a *`tModelDetail`* message on successful match of
one or more *`tModelKey`* values. If multiple *`tModelKey`* values were
passed, the results will be returned in the same order as the keys
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

**Table 24.100. Errors signalled by uddi_get_tModelDetail**

<div>

| Error Code                                         | Description                                                                                                                                                                                                                                                                                                                         |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the URN-qualified *`uuid_key `* values passed did not match with any known *`tModelKey`* values. No partial results will be returned; if any *`tModelKey`* values passed are not valid, this error will be returned. Any *`tModelKey`* values passed without a uuid URN qualifier will be considered invalid. |
| <span class="errorcode">E_keyRetired </span>       | signifies that the request cannot be satisfied because the owner has retired the *`tModel`* information. The *`tModel`* reference may still be valid and used as intended, but the information defining the *`tModel `* behind the key is unavailable.                                                                              |

</div>

</div>

  

</div>

</div>
