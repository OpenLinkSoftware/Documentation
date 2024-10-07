<div id="fn_soap_box_xml_entity" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_box_xml_entity — Converts an XML entity to an SQL value given the
desired SQL type.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_box_xml_entity" class="funcsynopsis">

|                                     |                                 |
|-------------------------------------|---------------------------------|
| `any `**`soap_box_xml_entity`**` (` | in `entity ` any ,              |
|                                     | in `try_typed_as ` any ,        |
|                                     | in `soap_version ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_box_xml_entity" class="refsect1">

## Description

Converts an XML entity to an SQL value based on the type of the entity
and the desired SQL type. This function is called internally to convert
a SOAP request parameter to a PL procedure parameter when a SOAP request
is being processed by the SOAP server.

</div>

<div id="params_soap_box_xml_entity" class="refsect1">

## Parameters

<div id="id110347" class="refsect2">

### entity

The XML fragment as a vector (as returned from `xml_tree() ` or a
subpart of it).

</div>

<div id="id110351" class="refsect2">

### try_typed_as

A sample value, whose type is taken as a desired type for conversion.

</div>

<div id="id110354" class="refsect2">

### soap_version

Optional (default 1). The soap version (1 for SOAP 1.0, 11 for SOAP
1.1).

</div>

</div>

<div id="ret_soap_box_xml_entity" class="refsect1">

## Return Types

The return type of `soap_box_xml_entity() ` can vary according to the
type of *`entity`* parameter, described by *`try_typed_as`* as follows:

|                                                                                                                                                                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| If *`entity`* is NULL, the return value will be NULL.                                                                                                                                                                                                                                                                                                    |
| If *`entity`* is not a vector() then its value will be cast to the *`try_typed_as`* type, if possible.                                                                                                                                                                                                                                                   |
| If *`entity`* is a vector() containing XML tree then it will be converted to an appropriate SQL type (vector(), varchar, integer etc.) depending on the SOAP RPC encoding rules (XMLSchema-datatypes and SOAP-RPC encoding schema) for in/out SOAP messages. i.e. it depends on the structure/content of the XML tree passed as the *`entity`* argument. |

</div>

</div>
