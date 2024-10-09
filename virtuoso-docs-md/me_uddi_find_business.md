<div>

<div>

</div>

<div>

## Name

uddi_find_business — Retrieves a *`businessList `* message matching
supplied criteria.

</div>

<div>

## Syntax

``` screen
<uddi_find_business
  generic="1.0"
  [ maxRows ="nn" ]
  xmlns="urn:uddi-org:api" >
    [<findQualifiers/>]
    <name/> | <identifierBag/> | <categoryBag/> | <tModelBag/> | <discoveryURLs>
</uddi_find_business>
  
```

</div>

<div>

## Attributes & Children

All arguments listed here are mutually exclusive except
*`findQualifiers`* .

<div>

### maxRows

This optional integer value allows the requesting program to limit the
number of results returned.

</div>

<div>

### findQualifiers

This collection of *`findQualifier`* elements can be used to alter the
default behavior of search functionality.

</div>

<div>

### name

This string value is a partial name. The *`businessList`* return message
contains *`businessInfo`* structures for businesses whose name matches
the value passed (leftmost match).

</div>

<div>

### identifierBag

This is a list of business identifier references. The returned
*`businessList`* contains *`businessInfo`* structures matching any of
the identifiers passed (logical OR).

</div>

<div>

### categoryBag

This is a list of category references. The returned *`businessList`*
contains *`businessInfo`* structures matching all of the categories
passed (logical AND).

</div>

<div>

### tModelBag

The registered *`businessEntity`* data contains *`bindingTemplates`*
that in turn contain specific *`tModel`* references. The *`tModelBag`*
argument lets you search for businesses that have bindings that are
compatible with a specific *`tModel`* pattern. The returned
*`businessList`* contains *`businessInfo`* structures that match all of
the *`tModel`* keys passed (logical AND). *`tModelKey`* values must be
formatted as URN qualified uuid values (e.g. prefixed with "uuid:")

</div>

<div>

### discoveryURLs

This is a list of URLs to be matched against the data associated with
the *`discoveryURLs`* contents of registered *`businessEntity`*
information. To search for a URL without regard to *`useType`* attribute
values, pass the *`useType`* component of the *`discoveryURL`* elements
as empty attributes. If *`useType`* values are included, then the match
will be made only on registered information that matches both the
*`useType`* and URL value. The returned *`businessList`* contains
*`businessInfo`* structures matching any of the URLs passed (logical
OR).

</div>

</div>

<div>

## Return Types

This function returns a *`businessList`* on success. In the event that
no matches were located for the specified criteria, a *`businessList`*
structure with zero *`businessInfo`* structures is returned.

In the event of a large number of matches, a UDDI-enabled server may
truncate the result set. If this occurs, the *`businessList`* will
contain the *`truncated`* attribute with the value set to true.

Searching using *`tModelBag`* will also return any *`businessEntity`*
that contains *`bindingTemplate`* information that matches due to
*`hostingRedirector`* references. In other words, the *`businessEntity`*
that contains a *`bindingTemplate`* with a *`hostingRedirector`* value
referencing a *`bindingTemplate`* that matches the *`tModel`* search
requirements will be returned.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.91. Errors signalled by get_authToken**

<div>

| Error Code                                       | Description                                                                                                         |
|--------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_nameTooLong </span>    | signifies that the partial name value passed exceeds the maximum name length designated by the UDDI-enabled server. |
| <span class="errorcode">E_tooManyOptions </span> | signifies that more than one search argument was passed.                                                            |
| <span class="errorcode">E_unsupported </span>    | signifies that one of the *`findQualifier `* values passed was invalid.                                             |

</div>

</div>

  

</div>

</div>
