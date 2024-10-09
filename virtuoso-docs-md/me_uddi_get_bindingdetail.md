<div>

<div>

</div>

<div>

## Name

uddi_get_bindingDetail — Request run-time *`bindingTemplate `* location
information.

</div>

<div>

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

<div>

## Description

The *`uddi_get_bindingDetail`* message requests the run-time
*`bindingTemplate`* information for the purpose of invoking a registered
business API.

</div>

<div>

## Attributes & Children

<div>

### bindingKey

One or more *`uuid `* \_key values that represent specific instances of
known *`bindingTemplate `* data.

</div>

<div>

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

<div>

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

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.95. Errors signalled by uddi_get_bindingDetail**

<div>

| Error Code                                         | Description                                                                                                                                                                                                                                              |
|----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that one of the *`uuid_key `* values passed did not match with any known *`bindingKey`* key values. No partial results will be returned; if any *`bindingKey`* values passed are not valid *`bindingKey`* values, this error will be returned. |

</div>

</div>

  

</div>

</div>
