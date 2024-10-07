<div id="fn_soap_wsdl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_wsdl — Generate WSDL document for a PL module and return it as a
varchar.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_wsdl" class="funcsynopsis">

|                               |                             |
|-------------------------------|-----------------------------|
| `varchar `**`soap_wsdl`**` (` | in `module_name ` varchar , |
|                               | in `URL ` varchar `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_21" class="refsect1">

## Description

This function generates WSDL for the procedures in a PL module the same
way as /SOAP/services.wsdl is generated for the procedures in WS.SOAP.

</div>

<div id="params_05" class="refsect1">

## Parameters

<div id="id110898" class="refsect2">

### module

Required. The name of the module to describe. This can be partial name.

</div>

<div id="id110901" class="refsect2">

### URL

Optional(default the current VSP path if in VSP context. Otherwise
error). The URL to include in the WSDL file

</div>

</div>

<div id="ret_10" class="refsect1">

## Return Types

Returns the WSDL document describing the module as an varchar value.

</div>

</div>
