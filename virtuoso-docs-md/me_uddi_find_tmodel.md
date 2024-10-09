<div>

<div>

</div>

<div>

## Name

uddi_find_tModel — locate list of tModel entries matching supplied
criteria

</div>

<div>

## Syntax

``` screen
<uddi_find_tModel
  generic="1.0"
  [ maxRows ="nn" ]
  xmlns="urn:uddi-org:api" >
    [<findQualifiers/>]
    <name/> | <identifierBag/> | <categoryBag/>
</uddi_find_tModel>
  
```

</div>

<div>

## Description

This uddi_find_tModel message is for locating a list of tModel entries
that match a set of specific criteria. The response will be a list of
abbreviated information about tModels that match the criteria
(tModelList).

</div>

<div>

## Attributes & Children

The arguments to this call are mutually exclusive except findQualifiers

<div>

### maxRows

This optional integer value allows the requesting program to limit the
number of results returned.

</div>

<div>

### findQualifiers

This collection of findQualifier elements can be used to alter the
default behavior of search functionality.

</div>

<div>

### name

This string value represents a partial name. The returned tModelList
contains tModelInfo structures for businesses whose name matches the
value passed (leftmost match).

</div>

<div>

### IdentifierBag

This is a list of business identifier references. The returned
tModelList contains tModelInfo structures matching any of the
identifiers passed (logical OR).

</div>

<div>

### categoryBag

This is a list of category references. The returned tModelList contains
tModelInfo structures matching all of the categories passed (logical
AND).

</div>

</div>

<div>

## Return Types

This function returns a tModelList on success. In the event that no
matches were located for the specified criteria, an empty tModelList
structure will be returned (e.g. will contain zero tModelInfo
structures). This signifies zero matches.

In the event of a large number of matches, a UDDI-enabled server may
truncate the result set. If this occurs, the tModelList will contain the
*`truncated`* attribute with the value of this attribute set to true.

</div>

<div>

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div>

**Table 24.93. Errors signalled by uddi_find_tModel**

<div>

| Error Code                                       | Description                                                                                                         |
|--------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_nameTooLong </span>    | signifies that the partial name value passed exceeds the maximum name length designated by the UDDI-enabled server. |
| <span class="errorcode">E_tooManyOptions </span> | signifies that more than one mutually exclusive argument was passed.                                                |
| <span class="errorcode">E_unsupported </span>    | signifies that one of the findQualifier values passed was invalid.                                                  |

</div>

</div>

  

</div>

</div>
