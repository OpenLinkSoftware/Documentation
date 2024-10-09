<div>

<div>

</div>

<div>

## Name

soap_server — Execute SOAP request and return XML reply as a varchar.

</div>

<div>

## Synopsis

<div>

|                                 |                                   |
|---------------------------------|-----------------------------------|
| `varchar `**`soap_server`**` (` | in `req_xml ` any ,               |
|                                 | in `soap_method ` varchar ,       |
|                                 | in `lines ` any ,                 |
|                                 | in `soap_version ` long ,         |
|                                 | in `procedure_mappings ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function executes the SOAP request in the same way as it it was
directed to the `/SOAP` physical path. It returns the XML SOAP reply as
a varchar value.

</div>

<div>

## Parameters

<div>

### req_xml

Required. The XML entity of the SOAP request to execute.

</div>

<div>

### soap_method

Optional(default ""). The "SOAPAction" header field value

</div>

<div>

### lines

Optional(default NULL). The Request header fields (the lines parameter
to the VSPs for HTTP)

</div>

<div>

### soap_version

Optional(default 11). The SOAP version (11 for SOAP 1.1 and 1 for SOAP
1.0)

</div>

<div>

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

<div>

## Return Types

Returns the XML SOAP reply as a varchar value.

</div>

</div>
