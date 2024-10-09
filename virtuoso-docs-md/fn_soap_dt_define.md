<div>

<div>

</div>

<div>

## Name

soap_dt_define — define re-define or erase the complex datatype
definition for SOAP calls

</div>

<div>

## Synopsis

<div>

|                             |                                  |
|-----------------------------|----------------------------------|
| ` `**`soap_dt_define`**` (` | in `name ` varchar ,             |
|                             | in `schema_string ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This defines a new complex SOAP datatype (usually array of structure)
named 'name'.

The schema_string string represents definition as complexType element
from XML Schema. The only complexContent, all and sequence elements can
be used within the complexType. This means that optional elements in the
defined datatype are not supported as a variant of the SOAP parameter
datatype. If the schema descriptions contains an unsupported element ,
the SQL error will be signalled and error message will explain what
element is wrong.

</div>

<div>

## Parameters

<div>

### name

A varchar containing the expanded name of SOAP type to be
defined/removed or an empty string (''). If an empty string is supplied
this function will try to extract it from the given schema_string schema
fragment (attribute @name'). Name cannot be an empty string for removing
SOAP types.

his function is implemented as a stored procedure and hence should be
referenced fully qualified as DB.DBA.soap_dt_define() if the current
catalogue cannot be guaranteed to be DB.

</div>

<div>

### schema_string

XMLSchema excerpt as varchar or NULL (null is used for removal).

</div>

</div>

<div>

## Return Types

This function returns a varchar of the name of the registered SOAP type.

</div>

<div>

## Errors

This function can generate the following errors:

<div>

<div>

<span class="errorcode">SODT1 </span> <span class="errortype">22023
</span> <span class="errortext">The element \<element name\> is not
supported \[\<as child of complexContent\>\] </span>

</div>

</div>

</div>

<div>

## Examples

<div>

**Example 24.379. Definition of an Array**

<div>

``` programlisting

<!-- file float_array.xsd -->

<complexType name="ArrayOffloat"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:tns="services.wsdl">
   <complexContent>
   <restriction base="enc:Array">
   <sequence>
   <element name="item" type="float" minOccurs="0" maxOccurs="unbounded" nillable="true"/>
   </sequence>
   <attributeGroup ref="enc:commonAttributes"/>
   <attribute ref="enc:offset"/>
   <attribute ref="enc:arrayType" wsdl:arrayType="float[]"/>
   </restriction>
   </complexContent>
</complexType>

<!-- eof float_array.xsd -->

can be defined from ISQL tool or in the PL procedure
SQL> DB.DBA.soap_dt_define ('ArrayOffloat', file_to_string ('float_array.xsd'));
```

</div>

</div>

  

<div>

**Example 24.380. Definition of an Structure**

<div>

``` programlisting

<!-- file struct.xsd -->

<complexType name="PERSON"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:tns="services.wsdl">

   <sequence>
     <element name="firstName" type="string"/>
     <element name="lastName" type="string"/>
     <element name="ageInYears" type="int"/>
     <element name="weightInLbs" type="float"/>
     <element name="heightInInches" type="float"/>
   </sequence>
</complexType>

<!-- eof struct.xsd -->

can be defined from ISQL tool or in the PL procedure
SQL> DB.DBA.soap_dt_define ('PERSON', file_to_string ('struct.xsd'));
```

</div>

</div>

  

<div>

**Example 24.381. Definition of composite type array of structures**

<div>

``` programlisting

<!-- file array_struct.xsd -->

<complexType name="ArrayOfPERSON"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:tns="services.wsdl">

   <complexContent>
   <restriction base="enc:Array">
   <sequence>
   <element name="item" type="tns:PERSON" minOccurs="0" maxOccurs="unbounded" nillable="true"/>
   </sequence>
   <attributeGroup ref="enc:commonAttributes"/>
   <attribute ref="enc:offset"/>
   <attribute ref="enc:arrayType" wsdl:arrayType="tns:PERSON[]"/>
   </restriction>
   </complexContent>

</complexType>

<!-- eof array_struct.xsd -->

can be defined from ISQL tool or in the PL procedure
SQL> DB.DBA.soap_dt_define ('ArrayOfPERSON', file_to_string ('array_struct.xsd'));
```

</div>

</div>

  

</div>

</div>
