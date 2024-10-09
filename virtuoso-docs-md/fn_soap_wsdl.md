<div>

<div>

</div>

<div>

## Name

soap_wsdl — Generate WSDL document for a PL module and return it as a
varchar.

</div>

<div>

## Synopsis

<div>

|                               |                             |
|-------------------------------|-----------------------------|
| `varchar `**`soap_wsdl`**` (` | in `module_name ` varchar , |
|                               | in `URL ` varchar `)`;      |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function generates WSDL for the procedures in a PL module the same
way as /SOAP/services.wsdl is generated for the procedures in WS.SOAP.

</div>

<div>

## Parameters

<div>

### module

Required. The name of the module to describe. This can be partial name.

</div>

<div>

### URL

Optional(default the current VSP path if in VSP context. Otherwise
error). The URL to include in the WSDL file

</div>

</div>

<div>

## Return Types

Returns the WSDL document describing the module as an varchar value.

</div>

</div>
