<div>

<div>

</div>

<div>

## Name

soap_box_xml_entity — Converts an XML entity to an SQL value given the
desired SQL type.

</div>

<div>

## Synopsis

<div>

|                                     |                                 |
|-------------------------------------|---------------------------------|
| `any `**`soap_box_xml_entity`**` (` | in `entity ` any ,              |
|                                     | in `try_typed_as ` any ,        |
|                                     | in `soap_version ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Converts an XML entity to an SQL value based on the type of the entity
and the desired SQL type. This function is called internally to convert
a SOAP request parameter to a PL procedure parameter when a SOAP request
is being processed by the SOAP server.

</div>

<div>

## Parameters

<div>

### entity

The XML fragment as a vector (as returned from `xml_tree() ` or a
subpart of it).

</div>

<div>

### try_typed_as

A sample value, whose type is taken as a desired type for conversion.

</div>

<div>

### soap_version

Optional (default 1). The soap version (1 for SOAP 1.0, 11 for SOAP
1.1).

</div>

</div>

<div>

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
