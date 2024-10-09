<div>

<div>

<div>

<div>

### 17.2.2. Exposing SQL Stored Procedures containing complex datatype definitions

</div>

</div>

</div>

When parameters of a PL procedure or UDT (User Defined Type) methods
contain parameters declared as UDT or/and as ARRAY then WSDL generation
will include XML Schema for them. The schema types in this case will be
generated every time WSDL URL is accessed. Also the XMLSchema datatypes
will be generated following the default encoding rules forced via 'Use'
SOAP option to the given virtual directory.

<div>

**Example 17.24. Exposing a PL Stored procedures containing complex
datatypes**

<div>

The following example will create a virtual directory '/soap-lit' on
default HTTP listener and will expose a single method accepting a array
of structures which contains an array of integers, integer, varchar and
float members. The SOAP message will use the document/literal encoding
rules (option Use=literal).

``` programlisting
create user SOAP_U1;

VHOST_DEFINE (  lpath=>'/soap-lit',
        ppath=>'/SOAP/', soap_user=>'SOAP_U1',
            soap_opts=>
            vector ('ServiceName', 'Literal',
            'Namespace', 'http://temp.uri',
            'SchemaNS', 'http://temp.uri',
            'MethodInSoapAction', 'yes',
            'elementFormDefault', 'unqualified',
            'Use', 'literal'));

create type SOAP_StructA as (varString varchar, varInt integer, varFloat real, varArray integer array);

create procedure echoStructArray (in sa DB.DBA.SOAP_StructA array) returns DB.DBA.SOAP_StructA array
{
  return sa;
};

grant execute on SOAP_StructA to SOAP_U1;
grant execute on echoStructArray to SOAP_U1;
```

This would produce the following WSDL file when accessing the
http://\[host:port\]/soap-lit/services.wsdl URL.

``` programlisting
<?xml version="1.0"?>
<definitions xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:dime="http://schemas.xmlsoap.org/ws/2002/04/dime/wsdl/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:content="http://schemas.xmlsoap.org/ws/2002/04/content-type/" xmlns:ref="http://schemas.xmlsoap.org/ws/2002/04/reference/" xmlns:ns0="http://temp.uri" xmlns:dl="http://temp.uri" xmlns:tns="services.wsdl" xmlns="http://schemas.xmlsoap.org/wsdl/" targetNamespace="services.wsdl" name="VirtuosoLiteral">
  <types>
    <schema xmlns="http://www.w3.org/2001/XMLSchema" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" targetNamespace="http://temp.uri">
      <complexType name="echoStructArray_Response_t">
        <sequence>
          <element name="item" type="ns0:SOAP_StructA" minOccurs="0" maxOccurs="unbounded" nillable="true"/>
        </sequence>
      </complexType>
      <complexType name="echoStructArray_sa_t">
        <sequence>
          <element name="item" type="ns0:SOAP_StructA" minOccurs="0" maxOccurs="unbounded" nillable="true"/>
        </sequence>
      </complexType>
      <complexType name="SOAP_StructA">
        <all>
          <element name="varString" type="string" nillable="true"/>
          <element name="varInt" type="int" nillable="true"/>
          <element name="varFloat" type="float" nillable="true"/>
          <element name="varArray" type="ns0:SOAP_StructA_varArray_t" nillable="true"/>
        </all>
      </complexType>
      <complexType name="SOAP_StructA_varArray_t">
        <sequence>
          <element name="item" type="int" minOccurs="0" maxOccurs="unbounded" nillable="true"/>
        </sequence>
      </complexType>
      <element name="echoStructArray">
        <complexType>
          <sequence>
            <element minOccurs="1" maxOccurs="1" name="sa" type="ns0:echoStructArray_sa_t"/>
          </sequence>
        </complexType>
      </element>
      <element name="echoStructArrayResponse">
        <complexType>
          <all>
            <element minOccurs="1" maxOccurs="1" name="CallReturn" type="ns0:echoStructArray_Response_t"/>
          </all>
        </complexType>
      </element>
    </schema>
  </types>
  <message name="echoStructArrayRequest">
    <part element="dl:echoStructArray" name="parameters"/>
  </message>
  <message name="echoStructArrayResponse">
    <part element="dl:echoStructArrayResponse" name="parameters"/>
  </message>
  <portType name="LiteralDocLiteralPortType">
    <operation name="echoStructArray">
      <input message="tns:echoStructArrayRequest" name="echoStructArrayRequest"/>
      <output message="tns:echoStructArrayResponse" name="echoStructArrayResponse"/>
    </operation>
  </portType>
  <binding name="LiteralDocLiteralBinding" type="tns:LiteralDocLiteralPortType">
    <soap:binding style="document" transport="http://schemas.xmlsoap.org/soap/http"/>
    <operation name="echoStructArray">
      <soap:operation soapAction="http://temp.uri#echoStructArray" style="document"/>
      <input name="echoStructArrayRequest">
        <soap:body use="literal"/>
      </input>
      <output name="echoStructArrayResponse">
        <soap:body use="literal"/>
      </output>
    </operation>
  </binding>
  <service name="VirtuosoLiteral">
    <documentation>Virtuoso SOAP services</documentation>
    <port name="LiteralDocLiteralPort" binding="tns:LiteralDocLiteralBinding">
      <soap:address location="http://example.com/soap-lit"/>
    </port>
  </service>
</definitions>
        
```

</div>

</div>

  

</div>
