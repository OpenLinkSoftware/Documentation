<div>

<div>

</div>

<div>

## Name

uddi_save_business — Save or update information about a complete
*`businessEntity `* structure.

</div>

<div>

## Syntax

``` screen
<uddi_save_business
  generic="1.0"
  xmlns="urn:uddi-org:api" >
    <authInfo/>
    <businessEntity/>
    [<businessEntity/>...] | <uploadRegister/> [<uploadRegister/>...]
</uddi_save_business>
  
```

</div>

<div>

## Description

The *`uddi_save_business`* message is used to save or update information
about a complete *`businessEntity`* structure. This message has the
broadest scope of all of the save calls in the publisher's API, and can
be used to make sweeping changes to the published information for one or
more *`businessEntity`* structures controlled by an identity.

</div>

<div>

## Attributes & Children

Either *`businessEntity`* arguments or *`uploadRegister`* arguments may
be passed in a given *`uddi_save_business`* message, but not both. Any
number of *`businessEntity`* or *`uploadRegister`* values can be passed
in a single save (up to a server-imposed limit), but the two types of
parameters may not be mixed.

<div>

### authInfo

This required argument is an element that contains an authentication
token obtained using the *`get_authToken `* call.

</div>

<div>

### businessEntity

One or more complete *`businessEntity `* structures can be passed. These
structures can be obtained in advance by using the
*`get_businessDetail`* call or by any other means.

</div>

<div>

### uploadRegister

one or more resolvable HTTP URL addresses that each point to a single
and valid *`businessEntity`* or *`businessEntityExt`* structure. This
variant argument allows a registry to be updated to reflect the contents
of an XML document that is URL-addressable. The URL must return a pure
XML document that only contains a *`businessEntity`* structure as its
top-level element, and be accessible using the standard HTTP-GET
protocol.

</div>

<div>

### Behavior

If any of the *`uuid_key `* values within in a *`businessEntity `*
structure (e.g. any data with a key value regulated by a *`businessKey`*
, *`serviceKey`* , *`bindingKey`* , or *`tModelKey`* ) is passed with a
blank value, this is a signal that the data that is so keyed is being
inserted. This does not apply to structures that reference other keyed
data, such as *`tModelKey`* references within *`bindingTemplate`* or
*`keyedReference`* structures, since these are references.

To make this call perform an update to existing registered data, the
keyed entities (*`businessEntity`* , *`businessService`* ,
*`bindingTemplate`* or *`tModel`* ) should have *`uuid_key`* values that
correspond to the registered data.

Data can be deleted with this call when registered information is
different from the new information provided. Any *`businessService`* or
*`bindingTemplate`* structures that are found in the controlling server
but that are missing from the *`businessEntity`* information provided in
or referenced by this call will be deleted from the registry after
processing this call.

Data contained within one or more *`businessEntity`* structures can be
rearranged with this function when data passed to this function
redefines parent container relationships for other registered
information. For instance, if a new *`businessEntity`* is saved with
information about a *`businessService`* that is registered already as
part of a separate *`businessEntity`* , the *`businessService`* is moved
from its current container to the new *`businessEntity`* . This only
applies if the entity controlling the data referenced is the same entity
identified in the *`uddi_save_business`* message.

If the file located by the *`uploadRegister`* URL is an extended
business entity (*`businessEntityExt`* ) structure, only the
*`businessEntity`* data found within that structure will be registered.

If a *`businessEntity`* element is used to save data, then the
UDDI-enabled server will create a URL specific to that server. This URL
can be used to retrieve via HTTP-GET the *`businessEntity`* structure
being registered. This information will be added - if not already
present - to the *`discoveryURL`* 's collection automatically with a
*`useType`* value of *`businessEntity`* .

</div>

</div>

<div>

## Return Types

This message returns a *`businessDetail`* message that reflects the new
registered information for the *`businessEntity`* information provided.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.102. Errors signalled by uddi_save_business**

<div>

| Error Code                                             | Description                                                                                                                                                                                                                     |
|--------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_invalidKeyPassed </span>     | signifies that one of the *`uuid_key `* values passed did not match with any known *`serviceKey`* values. No partial results will be returned; if any *`serviceKey `* values passed are not valid, this error will be returned. |
| <span class="errorcode">E_authTokenExpired </span>     | signifies that the authentication token value passed in the authInfo argument is no longer valid because the token has expired.                                                                                                 |
| <span class="errorcode">E_authTokenRequired </span>    | signifies that the authentication token value passed in the authInfo argument is either missing or is not valid.                                                                                                                |
| <span class="errorcode">E_userMismatch </span>         | signifies that one or more of the *`uuid_key `* values passed refers to data that is not controlled by the individual who is represented by the authentication token.                                                           |
| <span class="errorcode">E_operatorMismatch </span>     | signifies that one or more of the *`businessKey `* values passed refers to data that is not controlled by the UDDI-enabled server that received the request for processing.                                                     |
| <span class="errorcode">E_keyRetired </span>           | signifies that the request cannot be satisfied because one or more *`uuid_key`* values specified has previously been hidden or removed by the requester. This specifically applies to the *`tModelKey `* values passed.         |
| <span class="errorcode">E_invalidURLPassed </span>     | an error occurred with one of the *`uploadRegister `* URL values.                                                                                                                                                               |
| <span class="errorcode">E_accountLimitExceeded </span> | signifies that user account limits have been exceeded.                                                                                                                                                                          |

</div>

</div>

  

</div>

</div>
