<div>

<div>

</div>

<div>

## Name

soap_print_box — Formats an SQL value and returns it as a generated XML
fragment.

</div>

<div>

## Synopsis

<div>

|                             |                                                    |
|-----------------------------|----------------------------------------------------|
| ` `**`soap_print_box`**` (` | in `value ` any ,                                  |
|                             | in `enclosing_tag ` varchar ,                      |
|                             | in `date_encoding_type|soap_version ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function formats an SQL value as an XML fragment and returns it.
This is used internally by the SOAP server to encode the output
parameter values and return values when processing a SOAP request.

</div>

<div>

## Parameters

<div>

### value

Required. Any SQL value to be represented as an XML fragment.

</div>

<div>

### enclosing_tag

Required. The XML tag to place the value into.

</div>

<div>

### date_encoding_type

Optional. Valid only if a value is a datetime. If supplied, the
*`enclosing_tag `* is ignored and the date is printed out in one of the
following formats:

|                                                                      |
|----------------------------------------------------------------------|
| 0 - ISO 8601                                                         |
| 1 - RFC 1123                                                         |
| 3 - Microsoft specific, recognized by some of the WebFolders clients |

</div>

<div>

### soap_version

Optional(Default 1). Valid only if the value type is not a datetime. The
soap_version (1 for SOAP 1.0, 11 for SOAP 1.1).

</div>

</div>

<div>

## Return Types

Generated XML fragment.

</div>

</div>
