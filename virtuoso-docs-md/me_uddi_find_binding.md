<div>

<div>

</div>

<div>

## Name

uddi_find_binding — Retrieves matching bindings

</div>

<div>

## Syntax

``` screen
<uddi_find_binding
  serviceKey="uuid_key"
  generic="1.0"
  [ maxRows="nn" ]
  xmlns="urn:uddi-org:api" >
    [<findQualifiers/>]
    <tModelBag/>
</uddi_find_binding>
  
```

</div>

<div>

## Description

The *`uddi_find_binding`* message returns a *`bindingDetail`* message
that contains a *`bindingTemplates`* structure with zero or more
*`bindingTemplate`* structures matching the criteria specified in the
argument list.

</div>

<div>

## Attributes & Children

<div>

### maxRows

This optional integer value allows the requesting program to limit the
number of results returned.

</div>

<div>

### serviceKey

This *`uuid_key `* is used to specify a particular instance of a
*`businessService`* element in the registered data. Only bindings in the
specific *`businessService`* data identified by the *`serviceKey`*
passed will be searched.

</div>

<div>

### findQualifiers

This collection of *`findQualifier`* elements can be used to alter the
default behavior of search functionality.

</div>

<div>

### tModelBag

This is a list of *`tModel uuid_key `* values that represent the
technical fingerprint the server should locate in a *`bindingTemplate`*
structure contained within the *`businessService`* instance specified by
the *`serviceKey`* value. If more than one *`tModel`* key is specified
in this structure, only *`bindingTemplate`* information that exactly
matches all of the *`tModel`* keys specified will be returned (logical
AND). The order of the keys in the *`tModel`* bag is not relevant. All
*`tModelKey`* values begin with a uuid URN qualifier (e.g. "uuid:"
followed by a known *`tModel `* uuid value.

</div>

</div>

<div>

## Return Types

This function returns a *`bindingDetail`* message on success. In the
event that no matches were located for the specified criteria, the
*`bindingDetail`* structure returned in the response will be empty; that
is, it will contain no *`bindingTemplate`* data.

In the event of a large number of matches, a UDDI-enabled server may
truncate the result set. If this occurs, the response message will
contain the *`truncated`* attribute with the value of this attribute set
to true.

Searching using *`tModelBag`* will also return any *`bindingTemplate`*
information that matches due to *`hostingRedirector`* references. The
resolved *`bindingTemplate`* structure will be returned, even if that
*`bindingTemplate`* is owned by a different *`businessService`*
structure.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.90. Errors signalled by uddi_find_binding**

<div>

| Error Code                                         | Description                                                                                                                                                                             |
|----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span> | signifies that the *`uuid `* \_key value passed did not match with any known *`serviceKey `* or *`tModel `* key values. The error structure will signal which condition occurred first. |
| <span class="errorcode">E_tooManyOptions </span>   | signifies that more than one mutually exclusive argument was passed.                                                                                                                    |
| <span class="errorcode">E_unsupported </span>      | signifies that one of the *`findQualifier `* values passed was invalid.                                                                                                                 |

</div>

</div>

  

</div>

</div>
