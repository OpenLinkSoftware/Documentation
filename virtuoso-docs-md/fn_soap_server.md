<div id="fn_soap_server" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_server — Execute SOAP request and return XML reply as a varchar.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_server" class="funcsynopsis">

|                                 |                                   |
|---------------------------------|-----------------------------------|
| `varchar `**`soap_server`**` (` | in `req_xml ` any ,               |
|                                 | in `soap_method ` varchar ,       |
|                                 | in `lines ` any ,                 |
|                                 | in `soap_version ` long ,         |
|                                 | in `procedure_mappings ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_server" class="refsect1">

## Description

This function executes the SOAP request in the same way as it it was
directed to the `/SOAP` physical path. It returns the XML SOAP reply as
a varchar value.

</div>

<div id="params_soap_server" class="refsect1">

## Parameters

<div id="id110858" class="refsect2">

### req_xml

Required. The XML entity of the SOAP request to execute.

</div>

<div id="id110861" class="refsect2">

### soap_method

Optional(default ""). The "SOAPAction" header field value

</div>

<div id="id110864" class="refsect2">

### lines

Optional(default NULL). The Request header fields (the lines parameter
to the VSPs for HTTP)

</div>

<div id="id110867" class="refsect2">

### soap_version

Optional(default 11). The SOAP version (11 for SOAP 1.1 and 1 for SOAP
1.0)

</div>

<div id="id110870" class="refsect2">

### procedure_mappings

Optional(default NULL). A vector of pairs (\<SOAP_method\>, \<PL
procedure\>) mapping the SOAP call request to the corresponding PL
function name. If empty, then the mapping proceeds by taking the local
name of the SOAP method and finding a procedure with the same name in
the executing user's current qualifier and owner.

If a string is supplied then this string is considered as a PL module
name. Mapping takes place from the local name of the SOAP call to a PL
procedure inside the module. Virtuoso matches procedure names in
case-sensitive fashion.

</div>

</div>

<div id="ret_soap_server" class="refsect1">

## Return Types

Returns the XML SOAP reply as a varchar value.

</div>

</div>
