<div id="fn_soap_print_box" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_print_box — Formats an SQL value and returns it as a generated XML
fragment.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_print_box" class="funcsynopsis">

|                             |                                                    |
|-----------------------------|----------------------------------------------------|
| ` `**`soap_print_box`**` (` | in `value ` any ,                                  |
|                             | in `enclosing_tag ` varchar ,                      |
|                             | in `date_encoding_type|soap_version ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_print_box" class="refsect1">

## Description

This function formats an SQL value as an XML fragment and returns it.
This is used internally by the SOAP server to encode the output
parameter values and return values when processing a SOAP request.

</div>

<div id="params_soap_print_box" class="refsect1">

## Parameters

<div id="id110780" class="refsect2">

### value

Required. Any SQL value to be represented as an XML fragment.

</div>

<div id="id110783" class="refsect2">

### enclosing_tag

Required. The XML tag to place the value into.

</div>

<div id="id110786" class="refsect2">

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

<div id="id110794" class="refsect2">

### soap_version

Optional(Default 1). Valid only if the value type is not a datetime. The
soap_version (1 for SOAP 1.0, 11 for SOAP 1.1).

</div>

</div>

<div id="ret_soap_print_box" class="refsect1">

## Return Types

Generated XML fragment.

</div>

</div>
