<div id="me_uddi_find_tmodel" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uddi_find_tModel — locate list of tModel entries matching supplied
criteria

</div>

<div id="syntax_uddi_find_tmodel_01" class="refsect1">

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

<div id="desc_uddi_find_tmodel_01" class="refsect1">

## Description

This uddi_find_tModel message is for locating a list of tModel entries
that match a set of specific criteria. The response will be a list of
abbreviated information about tModels that match the criteria
(tModelList).

</div>

<div id="params_uddi_find_tmodel_01" class="refsect1">

## Attributes & Children

The arguments to this call are mutually exclusive except findQualifiers

<div id="id115052" class="refsect2">

### maxRows

This optional integer value allows the requesting program to limit the
number of results returned.

</div>

<div id="id115055" class="refsect2">

### findQualifiers

This collection of findQualifier elements can be used to alter the
default behavior of search functionality.

</div>

<div id="id115058" class="refsect2">

### name

This string value represents a partial name. The returned tModelList
contains tModelInfo structures for businesses whose name matches the
value passed (leftmost match).

</div>

<div id="id115061" class="refsect2">

### IdentifierBag

This is a list of business identifier references. The returned
tModelList contains tModelInfo structures matching any of the
identifiers passed (logical OR).

</div>

<div id="id115064" class="refsect2">

### categoryBag

This is a list of category references. The returned tModelList contains
tModelInfo structures matching all of the categories passed (logical
AND).

</div>

</div>

<div id="ret_uddi_find_tmodel_01" class="refsect1">

## Return Types

This function returns a tModelList on success. In the event that no
matches were located for the specified criteria, an empty tModelList
structure will be returned (e.g. will contain zero tModelInfo
structures). This signifies zero matches.

In the event of a large number of matches, a UDDI-enabled server may
truncate the result set. If this occurs, the tModelList will contain the
*`truncated`* attribute with the value of this attribute set to true.

</div>

<div id="errors_uddi_find_tmodel_01" class="refsect1">

## Errors

If an error occurs in processing this message, a *`dispositionReport`*
structure will be returned to the caller in a SOAP Fault. The following
error information will be relevant:

<div id="id115076" class="table">

**Table 24.94. Errors signalled by uddi_find_tModel**

<div class="table-contents">

| Error Code                                       | Description                                                                                                         |
|--------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">E_nameTooLong </span>    | signifies that the partial name value passed exceeds the maximum name length designated by the UDDI-enabled server. |
| <span class="errorcode">E_tooManyOptions </span> | signifies that more than one mutually exclusive argument was passed.                                                |
| <span class="errorcode">E_unsupported </span>    | signifies that one of the findQualifier values passed was invalid.                                                  |

</div>

</div>

  

</div>

</div>
