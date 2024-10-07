<div id="ch-webservices" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 17. Web Services

</div>

<div>

<div class="abstract">

**Abstract**

The term Web Services describes an application of XML for exposing
application functionality to disparate clients via the Web. This
paradigm provides access to entire applications, modules, objects,
functions, and methods via HTTP and other transport protocols. Web
Services are inherently platform- and programming-language independent.
Services can be developed in one language and consumed in another; this
holds true irrespective of client or server host operating system
combinations.

A collection of core XML-based specifications and standards work in
concert to fulfill the Web services value proposition. These standards
include:

|                                                                                                                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SOAP - XML notation that describes how messages are assembled and transmitted over HTTP between services and service consumers.                                                                                       |
| WSDL - XML notation for describing SOAP services.                                                                                                                                                                     |
| UDDI - Application of the SOAP protocol for registering and publishing information about organizations, contacts within organizations, and Web Services that these organizations have chosen to expose to the public. |

Virtuoso enables stored procedures to be exposed as Web services that
are consumable by any Web services-aware development tool, application,
or environment. The stored procedures exposed by Virtuoso may be native
stored procedures, or may be hosted in any third-party database that
supports stored procedures, and is accessible via an ODBC or JDBC
driver. In Virtuoso, exposing stored procedures as Web services does not
require any programming effort. You simply identify the stored
procedures to be exposed using the Virtuoso Administrative Interface.

This feature is immensely valuable in situations where organizations are
seeking to transform time-tested stored procedures into Web Services
without having to upgrade or change databases or host operating systems.
In modern enterprises, such stored procedures drive mission-critical
solutions; Virtuoso's approach to Web services enables you to maximize
current investment while minimizing the need for rework.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">17.1.
[SOAP](ch-webservices.html#soap_overview)</span>

<span class="section">17.1.1. [Virtuoso SOAP Support
Overview](ch-webservices.html#soapovervw) </span>

<span class="section">17.1.2. [Handling of SOAP HTTP
Requests](ch-webservices.html#soapcallhandling)</span>

<span class="section">17.1.3. [Extending Datatypes for SOAP
Objects](ch-webservices.html#dtschsoaps)</span>

<span class="section">17.1.4. [Inheritance of Datatypes for SOAP
Objects](ch-webservices.html#dtsch_inherit) </span>

<span class="section">17.1.5. [Complex Types in PL Procedure and UDT
Method Definition](ch-webservices.html#dtsoapcplx) </span>

<span class="section">17.1.6. [Complex Types in Procedure Definition
using a pre-defined XML Schema
datatypes](ch-webservices.html#dtsch_procdef) </span>

<span class="section">17.1.7. [Default SOAP-SQL Datatype
Mappings](ch-webservices.html#defaultsoapsqltypes) </span>

<span class="section">17.1.8. [Exposing Stored Procedures as SOAP
Objects](ch-webservices.html#exposingprocsassoaps) </span>

<span class="section">17.1.9. [Creation of SOAP proxy based on User
Defined Types](ch-webservices.html#soapudtproxy) </span>

<span class="section">17.1.10. [Exposing User Defined Type Methods as
SOAP Objects](ch-webservices.html#exposingudtssoap) </span>

<span class="section">17.1.11. [Exposing Remote Third Party SQL Stored
Procedures as SOAP Services](ch-webservices.html#exposrmtprocsoap)
</span>

<span class="section">17.1.12. [Virtuoso/PL SOAP
Client](ch-webservices.html#soapclient) </span>

<span class="section">17.1.13. [Execution
Privileges](ch-webservices.html#execpriv) </span>

<span class="section">17.1.14. [Custom Soap Server
Support](ch-webservices.html#customsoapsrv)</span>

<span class="section">17.1.15. [PL Procedures and UDT Methods Syntax
Affecting WSDL & SOAP
Processing](ch-webservices.html#soapextendedsyntax) </span>

<span class="section">17.1.16. [Exposing & Processing SOAP Header
Messages](ch-webservices.html#soapheadermessages) </span>

<span class="section">17.1.17. [Exposing & Processing SOAP Fault
Messages](ch-webservices.html#soapfaultmessages) </span>

<span class="section">17.1.18. [Document Literal
Encoding](ch-webservices.html#soapdoclitenc1) </span>

<span class="section">17.1.19. [DIME encapsulation of SOAP
messages](ch-webservices.html#soapdimeenc) </span>

<span class="section">17.1.20. [SOAP Endpoint
Options](ch-webservices.html#soapoptions) </span>

<span class="section">17.2. [WSDL](wsdl.html)</span>

<span class="section">17.2.1. [Exposing Stored Procedures as WSDL
Services](wsdl.html#exposplaswsdl) </span>

<span class="section">17.2.2. [Exposing SQL Stored Procedures containing
complex datatype definitions](expcplx_types.html) </span>

<span class="section">17.2.3. [Exposing Third Party SQL Stored
Procedures as WSDL-Compliant Web Services](exp3rdprtyprocwsdl.html)
</span>

<span class="section">17.2.4. [WSDL Descriptions of SOAP Header
Messages](wsdlheadermessages.html) </span>

<span class="section">17.2.5. [Importing A WSDL File & SOAP/WSDL
Proxying](importwsdl.html) </span>

<span class="section">17.2.6. [SOAP/WSDL
Interoperability](soapwsdlinterop.html) </span>

<span class="section">17.3. [WebID Protocol
Support](vfoafssl.html)</span>

<span class="section">17.3.1. [x.509
certificate](vfoafssl.html#vfoafsslx509)</span>

<span class="section">17.3.2. [Setting up Virtuoso
HTTPS](vfoafsslsethttps.html) </span>

<span class="section">17.3.3. [Setting Up Firefox](vfoafsslff.html)
</span>

<span class="section">17.3.4. [Configuring ODS Account to use WebID
Protocol](vfoafsslconf.html) </span>

<span class="section">17.3.5. [Testing the setup](vfoafssltst.html)
</span>

<span class="section">17.3.6. [WebID Protocol ACLs](vfoafsslacl.html)
</span>

<span class="section">17.3.7. [SPARQL-WebID based
Endpoint](sparqloauthendpointfoafsslsparql_01.html) </span>

<span class="section">17.3.8. [CA Keys Import using
Conductor](vfoafsslcacondt.html) </span>

<span class="section">17.3.9. [Set Up X.509 certificate issuer, HTTPS
listener and generate ODS user's certificates](vfoafsslst509issuer.html)
</span>

<span class="section">17.3.10. [WebID Protocol ODBC
Login](vfoafsslsethttpsfoafsll.html) </span>

<span class="section">17.4. [OAuth Support](voauth.html)</span>

<span class="section">17.4.1. [OAuth Access
Tokens](voauth.html#voauthtokens) </span>

<span class="section">17.4.2. [Virtuoso OAuth server](voauthserver.html)
</span>

<span class="section">17.4.3. [OAuth Implementation in OpenLink Data
Spaces](voauthimplods.html) </span>

<span class="section">17.4.4. [OAuth Generate Keys for ODS Controllers
(Web Services)](voauthcontrollers.html) </span>

<span class="section">17.4.5. [ODS Ubiquity Commands](voauthubc.html)
</span>

<span class="section">17.4.6. [OAuth Test Tool for ODS
Controllers](voauthtool.html) </span>

<span class="section">17.4.7. [OAuth QA](voauthqa.html) </span>

<span class="section">17.5. [WS-Security (WSS) Support in Virtuoso SOAP
Server](vwsssupport.html) </span>

<span class="section">17.5.1. [Client and Server side Certificates &
Keys](vwsssupport.html#vwsssrvclisidecerts)</span>

<span class="section">17.5.2. [SOAP Server WS-Security
Endpoint](vwsssoapendpoint.html) </span>

<span class="section">17.5.3. [Virtual Directory SOAP WSS
Options](vwssvdsoapopt.html) </span>

<span class="section">17.5.4. [Accounting & Accounting
Hook](vwssaccounting.html) </span>

<span class="section">17.5.5. [Signature
Templates](vwsssectemplates.html)</span>

<span class="section">17.5.6. [SOAP Client](vwsssoapclient.html) </span>

<span class="section">17.6. [Web Services Routing Protocol
(WS-Routing)](ws-routing.html)</span>

<span class="section">17.6.1. [Configuration](ws-routing.html#wsrconfig)
</span>

<span class="section">17.6.2. [Traversing Message
Paths](wsrtraversingmsgpaths.html) </span>

<span class="section">17.7. [Web Services Reliable Messaging Protocol
(WS-ReliableMessaging)](warm.html)</span>

<span class="section">17.7.1. [SOAP CLIENT API
Extensions](warm.html#wsrmsoapcliapi) </span>

<span class="section">17.7.2. [WS-RM Sender API](wsrmsndrapi.html)
</span>

<span class="section">17.7.3. [WSRM Receiver API](wsrmrcvrapi.html)
</span>

<span class="section">17.7.4. [WS-RM Protocol Endpoint
Configuration](wsrmsetupendpoint.html) </span>

<span class="section">17.7.5. [Message Examples](wsrmmsgexamples.html)
</span>

<span class="section">17.7.6. [WS-RM Schema](wsrmschema.html)</span>

<span class="section">17.8. [Web Services Trust Protocol
(WS-Trust)](vwstrust.html)</span>

<span class="section">17.9. [XML for Analysis
Provider](xmlxmla.html)</span>

<span class="section">17.10. [XML-RPC support](xmlrpc.html)</span>

<span class="section">17.11. [SyncML](syncml.html)</span>

<span class="section">17.12. [UDDI](uddi_overview.html)</span>

<span class="section">17.12.1.
[Concepts](uddi_overview.html#uddiconcepts)</span>

<span class="section">17.12.2. [Dealing with SOAP](uddisoap.html)</span>

<span class="section">17.12.3. [Supported API
Calls](uddiapisupport.html) </span>

<span class="section">17.12.4. [Authorization
Mechanism](uddiauthmech.html) </span>

<span class="section">17.12.5. [UDDI API
Calls](uddiapicalls.html)</span>

<span class="section">17.12.6. [Examples](uddiexamples.html) </span>

<span class="section">17.13. [Exposing Persistent Stored Modules as Web
Services](expwsmodules.html)</span>

<span class="section">17.13.1. [Publishing Stored Procedures as Web
Services](expwsmodules.html#qstexpwspls_01) </span>

<span class="section">17.13.2. [XML Query
Templates](qstxmlqtemplates_01.html) </span>

<span class="section">17.13.3. [Publishing VSE's as Web
Services](qstpublishbifs_01.html) </span>

<span class="section">17.14. [Testing Web Published Web
Services](vsmx.html)</span>

<span class="section">17.15. [BPEL
Reference](bpel_reference.html)</span>

<span class="section">17.15.1. [Activities](bpel_reference.html#bpelact)
</span>

<span class="section">17.15.2. [Protocol Support](bpelprot.html)</span>

<span class="section">17.15.3. [Process lifecycle](bpellifecycle.html)
</span>

<span class="section">17.15.4. [Using virtual
directories](bpelvdit.html)</span>

<span class="section">17.15.5. [Process archiving](bpelarx.html) </span>

<span class="section">17.15.6. [Configuration parameters](bpelconf.html)
</span>

<span class="section">17.15.7. [Process
Statistics](bpelstats.html)</span>

<span class="section">17.15.8. [Deployment file suitcase
format](bpelsut.html) </span>

<span class="section">17.15.9. [SQL API](bpelapi.html)</span>

<span class="section">17.15.10. [BPEL XPath
Functions](xpathbpelfunctions.html) </span>

<span class="section">17.15.11. [Tables](bpeltables.html) </span>

<span class="section">17.15.12. [Errors](bpelerrors.html) </span>

<span class="section">17.15.13. [Samples](bpelsampl.html) </span>

<span class="section">17.15.14. [References](bpelrefs.html) </span>

<span class="section">17.15.15. [BPEL4WS VAD Package
installation](bpelvadinstall.html) </span>

<span class="section">17.16. [XSQL](xsql.html)</span>

<span class="section">17.16.1. [XSQL
Syntax](xsql.html#xsqlsyntax)</span>

<span class="section">17.16.2. [XSQL Directives](xsqldirectives.html)
</span>

</div>

<div id="soap_overview" class="section">

<div class="titlepage">

<div>

<div>

## 17.1. SOAP

</div>

</div>

</div>

The Simple Object Access Protocol (SOAP) is a lightweight, extensible,
XML-based application layer protocol for information exchange in a
decentralized, distributed environment. SOAP defines a framework for
message structures and a message processing model. SOAP also defines a
set of encoding rules for serializing data and a convention for making
remote procedure calls. The SOAP extensibility model provides a
foundation for a wide range of composable modules and protocols.
Although the most common way to transport SOAP messages is HTTP, it may
also be run on top of other protocols.

SOAP includes:

|                                                                                                |
|------------------------------------------------------------------------------------------------|
| an envelope that defines a framework for describing what is in a message and how to process it |
| a set of encoding rules for expressing instances of application-defined datatypes              |
| a convention for representing remote procedure calls and responses.                            |

<div id="soapovervw" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.1. Virtuoso SOAP Support Overview

</div>

</div>

</div>

Virtuoso provides a framework for both consuming SOAP services (acting
as a client) and producing them (acting as a server). The Virtuoso web
server has a mechanism for handling SOAP messages and passing them to
stored procedures for processing. Both SOAP 1.0 and SOAP 1.1 messages
and data types are supported. You may use all base SQL data types, as
well as heterogeneous arrays, as both arguments and return values of
Virtuoso SOAP services. A full-featured set of functions for handling
SOAP objects is provided. Services using a transport mechanism other
than HTTP can also be constructed using the API. The SOAP framework may
be used independently of any of the other web-related services.

Virtuoso/PL can also issue requests to SOAP servers. SOAP can be used to
access any application servers, including those running within the
Virtuoso server.

The Virtuoso SOAP server extends Virtuoso/PL parameter handling by
adding complex data types declared with XML schema as parameter values
for stored procedures. The Virtuoso SOAP server provides automatic
validation of the parameters in requests, based on schema declarations.

</div>

<div id="soapcallhandling" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.2. Handling of SOAP HTTP Requests

</div>

</div>

</div>

The Virtuoso web server recognizes SOAP HTTP requests and their version
in the POST method handler. When *`SOAPMethodName`* or *`SOAPAction`*
HTTP header attributes are present with

``` programlisting
Content-Type: text/xml
```

, the server initiates SOAP call handling. The XML namespace of the SOAP
method name is stripped off and Virtuoso searches for a stored procedure
with the same name, ignoring case.

The search is done within the default qualifier of the SQL user account
assigned for SOAP call execution defined for the virtual host. For
example, if the database user assigned in the virtual host's definition
for SOAP execution is called SOAPDBUSER and this user has a default
qualifier 'SOAPDB' and the request contains an invocation of method
called

``` programlisting
OurSoapMethod
```

, Virtuoso would attempt to find a stored procedure named
`SOAPDB.SOAPDBUSER.OurSoapMethod` .

When a matching stored procedure is found, any of its parameters that
have names matching parameter entity names in the SOAP call are bound to
the call parameter. The parameter name match is also case-insensitive.

Virtuoso maps the procedure parameter datatypes internally by
<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">casting</a> from XML data (a string) to the
declared parameter datatype of the stored procedure. There is one
exception: When an array is being passed, the server creates an array
with values of types inferred from the XML Schema of its elements. It is
possible to declare that a user defined SQL type be used to represent a
specific XML element in a SOAP request. Thus SQL objects can be
constructed and serialized automatically. Note that this also means that
the implementation of the user defined type instance may be in a hosted
language, thus Java or CLR code may be transparently involved.

Two special parameters - *`ws_soap_headers`* and *`ws_http_headers`* -
are available to a stored procedure handling a SOAP method invocation.
If declared as input parameters for the procedure, *`ws_soap_headers`*
must contain an XML parse tree of the *`SOAP:Header`* in same format as
returned by
<a href="fn_xml_tree.html" class="link" title="xml_tree"><code
class="function">xml_tree()</code></a> . *`ws_http_headers`* should hold
a one-dimensional array of attribute/value pairs representing the HTTP
header fields in the request.

</div>

<div id="dtschsoaps" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.3. Extending Datatypes for SOAP Objects

</div>

</div>

</div>

Complex datatypes can be defined using XMLSchema and represented by
WSDL. Any of the declared types may be used as arguments and return
types of Virtuoso/PL procedures. Any procedures can thus be exposed as
SOAP methods.

Complex data type definitions are used for values that cannot be
contained by simple scalar datatypes. Typical examples are arrays of
scalars, structures of scalars, arrays of structures or structures of
arrays. A complex datatype may contain scalar and complex datatypes.
When a complex type is used in the definition of another complex type,
the definition of the contained complex type must exist.

In addition to 'usual' complex types as structures and arrays Virtuoso
implements support for 'choice', 'enumeration', anyType and anyElement
and extensions to the simple types. Inheritance of complex types is also
possible and is discussed further in next chapter.

The 'nillable' and 'minOccurs' attributes in schema definitions have
special meaning for PL values returned by PL procedure via SOAP. If this
attribute is 'true' then output of NULL values will be serialized in
their XML form with XMLSchema instance attribute 'nil' as 'true'.
Otherwise if elements have 'minOccurs' equal to 0 (zero), the element
will be omitted. If minOccurs is equal to 1 (one) an empty element will
be sent to the client. The same algorithm applies to the serialization
of PL values passed as parameters to soap_client() function. Therefore
it's important to make proper use of these attributes when defining
complex structures.

The '\_\_VOID\_\_' string constant has a special meaning in XMLSchema
Datatypes. It is used to designate no output for return value. In other
words returned value from PL procedure will not be serialized nor
exposed in the WSDL file.

You define complex datatypes using
<a href="fn_soap_dt_define.html" class="link"
title="soap_dt_define"><code
class="function">soap_dt_define()</code></a> . The function accepts a
schema definition excerpt, based on the element *`complexType`* . The
definition must be a valid XML document.

<div id="ex_soap_complex_dt_def" class="example">

**Example 17.1. Declaring and using complex datatypes in SOAP**

<div class="example-contents">

In this example we define two complex datatypes. The first one,
<span class="type">SOAPStruct</span> , consists of scalars; the second
one, <span class="type">ArrayOfSOAPStruct</span> , is an array of these
structures. These schema excerpts are stored in the filesystem as
`struct.xsd` and `array.xsd` .

<span class="emphasis">*struct.xsd:*</span>

``` programlisting

<!-- a SOAPStruct type declaration
     file name: struct.xsd -->

<complexType name="SOAPStruct"
   targetNamespace="http://tempuri.tmp/"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:tns="services.wsdl">

   <sequence>
     <element name="varString" type="string" nillable="true"/>
     <element name="varInt" type="int" nillable="true"/>
     <element name="varFloat" type="float" nillable="true"/>
   </sequence>
</complexType>
```

<span class="emphasis">*array.xsd:*</span>

``` programlisting

<!-- array of SOAPStruct
     file name: array.xsd -->

<complexType name="ArrayOfSOAPStruct"
   targetNamespace="http://tempuri.tmp/"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:tns="services.wsdl">

   <complexContent>
   <restriction base="enc:Array">
   <sequence>
   <element name="item" type="tns:SOAPStruct" minOccurs="0" maxOccurs="unbounded"/>
   </sequence>
   <attribute ref="enc:arrayType" wsdl:arrayType="tns:SOAPStruct[]"/>
   <attributeGroup ref="enc:commonAttributes"/>
   <attribute ref="enc:offset"/>
   </restriction>
   </complexContent>
</complexType>
```

Next, we issue commands to define a new complex datatype. Correct order
is important. (SQL\> is the prompt of the Interactive SQL utility
included with Virtuoso and should not be typed)

``` programlisting
SQL> DB..soap_dt_define ('SOAPStruct', file_to_string ('struct.xsd'));
SQL> DB..soap_dt_define ('ArrayOfSOAPStruct', file_to_string ('array.xsd'));
```

</div>

</div>

  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                          |
|                              | The WSDL specification requires that array names be prefixed with `ArrayOf ` . |

</div>

</div>

<div id="dtsch_inherit" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.4. Inheritance of Datatypes for SOAP Objects

</div>

</div>

</div>

The Virtuoso SOAP server implements handling of inherited XSD types. The
simple example of such relation between types can be explained as

``` programlisting
   Type  A, also know as the 'base' type,
   and type B an extension of A.
   +---+   +---+
   | a |-->

| c |
   | b |   | d |
   +---+   +---+

   which can be defined by two separate types without relation

   A type   B type
   +---+   +---+
   | a |   | a |
   | b |   | b |
   +---+   +- -+
           | c |
           | d |
           +---+
   
```

But when type A has changed, type B will not be changed in second
representation. This is because B is not a relative to A per se.

To work in such situations Virtuoso SOAP server handles extensions to
XSD types as follows:

<div class="orderedlist">

1.  each type and base type have defined a User Defined SQL type (UDT).

2.  the XSD types defined for SOAP processing are defined with UDT
    relation (see soap_dt_define)

3.  the inheritance is declared with 'extension' element in XSD type
    declaration

</div>

When we have these preliminaries the WSDL will declare in 'schema' part
of WSDL all depending types. Furthermore the SOAP processor will handle
inherited members of derived types.

<div id="inhertype" class="example">

**Example 17.2. Declaration and usage of depending types**

<div class="example-contents">

Consider the following XSD and User Defined Type declaration for a base
type 'BaseStruct':

``` programlisting
        <!-- XSD type declaration, file base.xsd -->

    <complexType name="BaseStruct">
        <sequence>
            <element name="floatMessage" type="xsd:float"/>
            <element name="shortMessage" type="xsd:short"/>
        </sequence>
    </complexType>

    -- corresponding user defined sql type
        create type DB.DBA.BaseStruct as (floatMessage real, shortMessage int __soap_type 'short');
    
```

Furthermore we are extending the BaseStruct with adding three more
elements (members) with declaration of ExtendedStruct:

``` programlisting
        <!-- XSD type declaration, file ext.xsd -->

    <complexType name="ExtendedStruct">
        <complexContent>
            <extension base="tns:BaseStruct">
                <sequence>
                    <element name="stringMessage" type="xsd:string"/>
                    <element name="intMessage" type="xsd:int"/>
                    <element name="anotherIntMessage" type="xsd:int"/>
                </sequence>
            </extension>
        </complexContent>
    </complexType>

    -- corresponding user defined SQL type
       create type DB.DBA.ExtendedStruct under DB.DBA.BaseStruct as (
        stringMessage nvarchar __soap_type 'string',
        intMessage int __soap_type 'int',
        anotherIntMessage int __soap_type 'int');
    
```

Once we are done with declarations as XSD files and user defined SQL
types, we must register them as SOAP types for processing:

``` programlisting
SQL> soap_dt_define ('', file_to_string ('base.xsd'), 'DB.DBA.BaseStruct');
SQL> soap_dt_define ('', file_to_string ('ext.xsd'), 'DB.DBA.ExtendedStruct');
    
```

Now we are able to create a PL procedure to use as a SOAP method, which
simply will accept an ExtendedStruct and echo it back to the client.

``` programlisting
create procedure
echoExtendedStruct (in param DB.DBA.ExtendedStruct __soap_type 'http://soapinterop.org/types:ExtendedStruct')
returns DB.DBA.ExtendedStruct __soap_type 'http://soapinterop.org/types:ExtendedStruct'
{
  --  All members  of DB.DBA.ExtendedStruct and DB.DBA.BaseStruct are available in param.
  return param;
}
;

grant execute on echoExtendedStruct to SOAP;
    
```

The SOAP request to that method will be as follows:

``` programlisting
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
  xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
  xmlns:m0="http://soapinterop.org/types">
  <SOAP-ENV:Body>
    <m:echoExtendedStruct xmlns:m="http://soapinterop.org/wsdl">
      <param xsi:type="m0:ExtendedStruct">
        <floatMessage xsi:type="xsd:float">3.14159</floatMessage>
        <shortMessage xsi:type="xsd:short">4096</shortMessage>
        <stringMessage xsi:type="xsd:string">String</stringMessage>
        <intMessage xsi:type="xsd:int">0</intMessage>
        <anotherIntMessage xsi:type="xsd:int">0</anotherIntMessage>
      </param>
    </m:echoExtendedStruct>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
    
```

The SOAP response to the above request will be as follows:

``` programlisting

<SOAP:Envelope
SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:dt="urn:schemas-microsoft-com:datatypes"
xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
xmlns:xenc="http://www.w3.org/2001/04/xmlenc#"
xmlns:wsse="http://schemas.xmlsoap.org/ws/2002/07/secext"
xmlns:ref="http://schemas.xmlsoap.org/ws/2002/04/reference/"
xmlns:ns0="http://soapinterop.org/types" xmlns:wsdl="services.wsdl">

  <SOAP:Body>
    <cli:echoExtendedStructResponse xmlns:cli="http://soapinterop.org/wsdl">
      <CallReturn xsi:type="ns0:ExtendedStruct">
        <stringMessage xsi:type="xsd:string">String</stringMessage>
        <intMessage xsi:type="xsd:int">0</intMessage>
        <anotherIntMessage xsi:type="xsd:int">0</anotherIntMessage>
        <floatMessage xsi:type="xsd:float">3.14159</floatMessage>
        <shortMessage xsi:type="xsd:short">4096</shortMessage>
      </CallReturn>
    </cli:echoExtendedStructResponse>
  </SOAP:Body>
</SOAP:Envelope>
    
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                     |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                               |
|                              | Although the namespace declarations of XSD types are skipped for better readability, these must be present when declaring (see the Extending Datatypes for SOAP Objects section, discussed earlier) |

</div>

</div>

</div>

  

</div>

<div id="dtsoapcplx" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.5. Complex Types in PL Procedure and UDT Method Definition

</div>

</div>

</div>

Virtuoso/PL allows parameters to be declared as complex objects
(structures and arrays) without special XMLSchema datatype defined. To
declare a structure as a type of a parameter an UDT must be created and
parameter to have it as datatype reference. Also all permitted datatypes
(including UDTs) could be declared as elements of an ARRAY of unlimited
or limited length.

Important: when a UDT is used in a SOAP context, it MUST be granted to
the SQL user for SOAP invocation. In other words the user on whose
behalf the SOAP call is processed.

<div id="ex_dtsoapcplx_1" class="example">

**Example 17.3. Procedure definition with a input and output as a
structure**

<div class="example-contents">

The following example defines a UDT 'SOAP_Struct' (containing varchar,
integer and float members) and declares the input parameter and return
value of a PL procedure to be of the SOAP_Struct type. The input will be
verified, UDT will be instantiated with given values for members and it
will be echoed back to the client.

``` programlisting
        create type SOAP_Struct as (varString varchar, varInt integer, varFloat real);

        create procedure echoStruct (in s DB.DBA.SOAP_Struct) returns DB.DBA.SOAP_Struct
        {
          return s;
        };
        
```

</div>

</div>

  

<div id="ex_dtsoapcplx_2" class="example">

**Example 17.4. Procedure definition with a input and output as an
integer array**

<div class="example-contents">

This example declares that input must be an array of integer values with
maximum length of 5. If input or output contains more than five integers
then a SOAP Fault will be sent back to the client containing an
appropriate error message ; otherwise the input array will be echoed
back.

``` programlisting
        create procedure echoIntArray (in ia integer array[5]) returns integer array[5]
        {
          return ia;
        };
        
```

</div>

</div>

  

<div id="ex_dtsoapcplx_3" class="example">

**Example 17.5. Procedure definition with a input and output as a
two-dimensional varchar array**

<div class="example-contents">

This example declares that the input must be an array of integer array
values with unlimited length. If the input SOAP message contains a valid
array following the current XML encoding rules then an array of integer
arrays (vector containing vectors of integers) will be created and
passed to the procedure. On success the input array will be echoed back
to the client.

``` programlisting
        create procedure echoIntMulArray (in iaa integer array array) returns integer array array
        {
          return iaa;
        };
        
```

</div>

</div>

  

<div id="ex_dtsoapcplx_4" class="example">

**Example 17.6. Procedure definition with a input and output as an
struct array**

<div class="example-contents">

This example shows how to use an array of structures (UDTs) and also
shows usage of the array type as an member of the structure. The UDT
'SOAP_StructA' is similar to the those in first example except 4the
member which is an array of integers. This is to demonstrate that arrays
are not limited to the Stored Procedure's parameters declaration, they
also can be used as a type of UDT member. Upon success the procedure
will echo of the input back to the client.

``` programlisting
        create type SOAP_StructA as (varString varchar, varInt integer, varFloat real, varArray integer array);

        create procedure echoStructArray (in sa DB.DBA.SOAP_StructA array) returns DB.DBA.SOAP_StructA array
        {
          return sa;
        };
        
```

The SOAP request to an endpoint which exposes the echoStructArray as a
document/literal encoded SOAP method would be as follows:

``` programlisting
<?xml version="1.0" ?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP-ENV:Body>
    <ns0:echoStructArray xmlns:ns0="http://temp.uri">
      <sa>
        <item>
          <varString>abcd</varString>
          <varInt>1234</varInt>
          <varFloat>3.14</varFloat>
          <varArray>
            <item>3</item>
            <item>4</item>
          </varArray>
        </item>
      </sa>
    </ns0:echoStructArray>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
        
```

The SOAP server will receive and array of one element containing a
structure with string, integer, float and integer array of two elements.
Then the response from the SOAP server to the requestor will be:

``` programlisting
<?xml version="1.0" ?>
<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP:Body>
    <cli:echoStructArrayResponse xmlns:cli="http://temp.uri">
      <CallReturn>
        <item>
          <varString>abcd</varString>
          <varInt>1234</varInt>
          <varFloat>3.14</varFloat>
          <varArray>
            <item>3</item>
            <item>4</item>
          </varArray>
        </item>
      </CallReturn>
    </cli:echoStructArrayResponse>
  </SOAP:Body>
</SOAP:Envelope>
        
```

</div>

</div>

  

See also the WSDL file generation section for details how such PL
procedures with parameters of complex datatypes are exposed via SOAP
enabled virtual HTTP directories.

</div>

<div id="dtsch_procdef" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.6. Complex Types in Procedure Definition using a pre-defined XML Schema datatypes

</div>

</div>

</div>

Declaration of a complex datatype as a parameter is done by adding a
special keyword `__soap_type` followed by the name of the defined
complex type after normal parameter declaration in the parameter list.
The type name is given as a string literal. The same syntax extension
also applies to declaration of the return type. This is shown in the
following example.

<div id="ex_soap_complex_parm_proc_def" class="example">

**Example 17.7. Procedure Definition with Complex Datatype Parameters**

<div class="example-contents">

We create a procedure that will accept an array of structures (as
defined in the previous example) and return it to the client. It
instructs the WSDL generator to assign
<span class="type">ArrayOfSOAPStruct</span> as the input parameter and
return value types when `WS.SOAP.echoSOAPArray()` is exposed as a SOAP
method. The type information is available to SOAP clients that read the
WSDL description. Upon receiving an incoming SOAP request, Virtuoso
converts the XML representation of the data, after validation, to the
form

``` programlisting
vector(vector([varchar],[integer],[real]), ...)
```

and passed to the `WS.SOAP.echoSOAPArray` . Failed parameter validation
is reported to the client.

``` programlisting
SQL> CREATE PROCEDURE WS.SOAP.echoSOAPArray (in inArray any __soap_type 'ArrayOfSOAPStruct')
            RETURNS any __soap_type 'ArrayOfSOAPStruct'
    {
      return inArray;
    };
```

</div>

</div>

  

</div>

<div id="defaultsoapsqltypes" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.7. Default SOAP-SQL Datatype Mappings

</div>

</div>

</div>

When no alternative datatype is assigned, the WSDL generator and SOAP
server will use the default mapping described below:

<div id="dtsh_dtmaptable" class="table">

**Table 17.1. Default datatype mappings in SOAP**

<div class="table-contents">

| Datatype         | Maps to         |
|------------------|-----------------|
| integer          | xsd:int         |
| real             | xsd:float       |
| double precision | xsd:double      |
| numeric          | xsd:decimal     |
| datetime         | xsd:timeInstant |
| any other type   | xsd:string      |

</div>

</div>

  

The REAL SQL type is mapped to the xsd:float SOAP datatype by default
and so loss of precision can occur. To improve the precision, the SOAP
server will map the xsd:float to the PL double precision datatype
instead, but only if the SOAP type is specified. The explicit
declaration of \_\_soap_type 'xsd:float' is required to instruct
Virtuoso to use the mapping to double precision.

All strings from a SOAP request declared with the SOAP datatype
xsd:string will be treated as NVARCHARs on input. All string data such a
CHAR, VARCHAR, or NVARCHAR will be encoded as UTF-8 in a SOAP response.
This makes processing of wide character sets in SOAP operations
possible.

If a User Defined Type (UDT) is used as a type of parameter and no
explicit XML Schema datatype given (see special syntax for PL
procedures) then in WSDL will be included as a struct definition.
Further upon SOAP processing the input struct will be encoded as a UDT
instance and passed to the given PL procedure.

The parameters which are declared as an array (see PL procedure syntax)
and having no explicit XML Schema datatype given will be exposed as
array by means of SOAP encoding rules (see also 'Use' SOAP option to the
virtual directory).

Some SOAP applications need a void return as opposed to an empty return,
from SOAP operations. To distinguish the empty return from the void
return a special SOAP datatype '\_\_VOID\_\_' has been introduced. This
will cause the SOAP server to omit the procedure return value when
responding to a SOAP request. Also, the return message will be discarded
from the WSDL description file.

</div>

<div id="exposingprocsassoaps" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.8. Exposing Stored Procedures as SOAP Objects

</div>

</div>

</div>

The special physical path `/SOAP/` in the Virtuoso Web server is
reserved for SOAP objects. Virtuoso makes available any stored procedure
created in the default qualifier of the SOAP user, with execution
privileges granted to the SOAP user. You can also use Virtuoso's
<a href="ch-webappdevelopment.html#virtdir" class="link"
title="14.1.2. Virtual Directories">virtual host</a> mechanism to create
new logical paths for accessing SOAP objects. A logical path property
`soap_user` determines the db user for SOAP. If a logical path points to
the `/SOAP/` special physical path, it will expose any procedures
created in the default qualifier of, and with execution privileges to,
`soap_user` to the world as SOAP objects.

If the physical path of `/SOAP` exists under the VSP root directory then
any non-SOAP specific HTTP requests will be directed there for content.
This can be useful for helping to establish the presence and location of
a SOAP endpoint - some applications attempt a standard HTTP connection
first. You might configure a virtual directory, intended for SOAP, with
a default page referencing a description of the SOAP endpoint, a page in
the \<VSPROOT\>/SOAP directory, preventing an `HTTP 404` style error
misleading an application into believing the SOAP endpoint is down
regardless of whether it tried to talk SOAP to it or not.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                   |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                             |
|                              | Procedures exposed as SOAP procedures run as any other stored procedure in Virtuoso and can call and get return values from other procedures and functions not exposed through SOAP. The ability to execute procedures attached from remote data sources facilitates SOAP-enabling existing database applications in a heterogeneous environment. |

</div>

<div id="ex_soap_new_vhost" class="example">

**Example 17.8. Creating a new virtual host for SOAP execution**

<div class="example-contents">

Create new user in the database for SOAP:

``` screen
SQL>CREATE USER SOAPDEMO;
```

Set the default catalogue/qualifier for the new user to WS. This is
where procedures to be used as SOAP objects will be created:

``` screen
SQL>USER_SET_QUALIFIER ('SOAPDEMO', 'WS');
```

Create a new virtual host definition, using
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define()</code></a> .

``` screen
SQL>VHOST_DEFINE (vhost=>'*ini*',lhost=>'*ini*',lpath=>'/mysoapdomain',ppath=>'/SOAP/',soap_user=>'SOAPDEMO');
```

An existing mapping could be removed using the command:

``` screen
SQL>VHOST_REMOVE (vhost=>'*ini*',lhost=>'*ini*',lpath=>'/mysoapdomain')
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                        |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                  |
|                              | '`*ini*` ' is a special value that instructs Virtuoso to use the default values from the Virtuoso initialization file. |

</div>

All procedures that are created with the WS.SOAPDEMO qualifier and then
granted execution to SOAPDEMO will be visible to SOAP. Make a simple
SOAPTEST procedure and grant the appropriate privileges to the SOAPDEMO
user:

``` screen
SQL> create procedure
  WS.SOAPDEMO.SOAPTEST (in par varchar)
{
  return (upper(par));
};

SQL> grant execute on WS.SOAPDEMO.SOAPTEST to SOAPDEMO;
```

The SOAP object may now be tested by using the
<a href="fn_soap_client.html" class="link" title="soap_client"><code
class="function">soap_client()</code></a> function, which returns a
vector representation of the SOAP object returned by the call. The
example below simply extracts the returned string with
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref()</code></a> , as the exact format of the object
returned is known:

``` screen
SQL>select aref(aref(
    soap_client (url=>sprintf ('http://example.com:%s/mysoapdomain', server_http_port ()),
    operation=>'SOAPTEST',
    parameters=>vector('par', 'demotext')),
    1), 1);
callret
VARCHAR
_______

DEMOTEXT
```

Printing the output on the console or server log with
<a href="fn_dbg_obj_print.html" class="link" title="dbg_obj_print"><code
class="function">dbg_obj_print()</code></a> would output something like:

``` screen
(("SOAPTESTResponse" ) (("CallReturn" ) "DEMOTEXT" ) )
```

The automatic service description generation can be verified by
retrieving *`http://<server:port>/mysoapdomain/services.wsdl`* , and
preferably tested by pointing a web browser at
*`http://<server:port>/mysoapdomain/services.vsmx`*

``` screen
SQL> select http_get (sprintf ('http://example.com:%s/mysoapdomain/services.wsdl', server_http_port()));
callret
VARCHAR
_______________________________________________________________________________

<?xml version="1.0"?>
<definitions
 xmlns:xsd="http://www.w3.org/2001/XMLSchema"
 xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
 xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
 xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
 xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
 xmlns:s="services.wsdl"
 xmlns:tns="services.wsdl"
 targetNamespace="services.wsdl"
 name="VirtuosoSOAP" xmlns="http://schemas.xmlsoap.org/wsdl/">

  <types>
  <schema targetNamespace="services.wsdl"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
    <complexType name="echoStringArrayResponse">
      <sequence>
        <element name="return" type="ArrayOfstring_literal"/>
      </sequence>
    </complexType>
    <complexType name="echoVoid"/>
    <complexType name="ArrayOffloat">
      <complexContent>
        <restriction base="soapenc:Array">
          <sequence>
            <element name="item" type="float" minOccurs="0" maxOccurs="unbounded"/>
          </sequence>
          <attributeGroup ref="soapenc:commonAttributes"/>
          <attribute ref="soapenc:offset" />
          <attribute ref="soapenc:arrayType" wsdl:arrayType="float[]"/>
        </restriction>
      </complexContent>
    </complexType>
    <complexType name="SOAPStruct">
      <sequence>
        <element name="varString" type="string"/>
        <element name="varInt" type="int"/>
        <element name="varFloat" type="float"/>
      </sequence>
    </complexType>
    <complexType name="echoStructResponse">
      <sequence>
        <element name="return" type="SOAPStruct"/>
      </sequence>
    </complexType>
    <complexType name="echoVoidResponse"/>
    <complexType name="ArrayOfString2D">
    ...
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                              |
|                            | <a href="vsmx.html" class="link"                                       
                              title="17.14. Testing Web Published Web Services">Testing Web Services  
                              using VSMX</a>                                                          |

</div>

</div>

<div id="soapudtproxy" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.9. Creation of SOAP proxy based on User Defined Types

</div>

</div>

</div>

It is possible to automatically generate PL procedures or UDT classes
for invoking a remote SOAP service.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                   |
|:--------------------------:|:----------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                          |
|                            | The <a href="fn_wsdl_import_udt.html" class="link"                                
                              title="wsdl_import_udt"><code                                                      
                              class="function">WSDL_IMPORT_UDT() </code></a> function for details and examples.  |

</div>

The proxy-creation function `WSDL_IMPORT_UDT() ` performs the following
purposes:

|                                                                                          |
|------------------------------------------------------------------------------------------|
| retrieve and expand the WSDL file published by the end point to be called                |
| compile the result and make SQL script with UDT definition                               |
| generate and register XML Schema definition for special types used in the source service |
| optionally execute the SQL script generated                                              |

Once such UDT SOAP proxy is defined it can be used within application
code or be re-exposed as a SOAP service on local server instance (see
next chapter how to expose UDT as service).

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                                                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                                                                                                                                                                 |
|                            | The Virtuoso Administration Interface provides a web based interface for importing WSDL definitions and creating UDTs and procedures. This can be found in the <a href="admui.webservices.html#admiui.wsdl" class="link" 
                              title="Import WSDL">Virtuoso Server Administration Interface</a> Chapter.                                                                                                                                                 |

</div>

</div>

<div id="exposingudtssoap" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.10. Exposing User Defined Type Methods as SOAP Objects

</div>

</div>

</div>

SQL User Defined Types may define methods. In context of Virtuoso SOAP
server they can be exposed as SOAP methods. To do that the UDT must be
published at an endpoint. So publishing could be done in two ways: using
SQL INSERT statement or using Admin UI: Publishing UI via Virtual
directories section.

The published UDTs will then expose all methods to the given virtual
directory assigned for SOAP execution. In this case the default
constructor will be called for method invocation if the UDT method is
non-static.

Note: The method definitions may also contains special SOAP syntax for
XML Schema datatypes, using the same options as for PL procedures. (see
"PL Procedures and UDT Methods Syntax Affecting WSDL & SOAP Processing"
section for details)

The following table specifies which UDTs are published at which end
points.

``` programlisting
create table SYS_SOAP_UDT_PUB
        (SUP_CLASS varchar, -- name of the published UDT, referencing SYS_USER_TYPES.UT_NAME
         SUP_LHOST varchar, -- listen host, referencing HTTP_PATH.HP_LISTEN_HOST
         SUP_HOST varchar,  -- virtual host, referencing HTTP_PATH.HP_HOST
         SUP_END_POINT varchar, -- logical path, referencing HTTP_PATH.HP_LPATH
         primary key (SUP_LHOST, SUP_HOST, SUP_END_POINT, SUP_CLASS))
;
        
```

<div id="ex_soap_expose_udt" class="example">

**Example 17.9. Exposing a UDT Method using SQL statement**

<div class="example-contents">

The below code creates a UDT containing two methods: static and
non-static and exposes them on a virtual directory '/soap-udt'

``` programlisting
create user SOAP_U2;

VHOST_DEFINE (lpath=>'/soap-udt', ppath=>'/SOAP/', soap_user=>'SOAP_U2',
    soap_opts=>
    vector ('ServiceName', 'UDT',
        'Namespace', 'http://temp.uri',
        'SchemaNS', 'http://temp.uri',
        'MethodInSoapAction', 'yes',
        'elementFormDefault', 'unqualified',
        'Use', 'encoded')
);

create type MyWebSvc
static method echoStatInt (in a int) returns int,
method echoInt (in a int) returns int;

create static method echoStatInt (in a int)
returns int for MyWebSvc
{
  return a;
}
;

create method echoInt (in a int)
returns int for MyWebSvc
{
  return a;
}
;

-- Important: without grant publishing is not final as
-- user for SOAP invocation will not have permissions to instantiate the UDT nor
-- to call its methods
grant execute on MyWebSvc to SOAP_U2;

-- exposing the UDT methods to the /soap-udt endpoint
insert soft SYS_SOAP_UDT_PUB values ('MyWebSvc', '*ini*', '*ini*', '/soap-udt');
```

</div>

</div>

  

Exposing the methods of a UDT could be done using Admin UI/Virtual
Directories: Create a new or edit an existing SOAP enabled virtual
directory and navigate to the SOAP options section, click on the
'Publish' button and from presented list of Database qualifiers select
the qualifier containing target UDT, then select it from the User
Defined Types list and follow the wizard.

</div>

<div id="exposrmtprocsoap" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.11. Exposing Remote Third Party SQL Stored Procedures as SOAP Services

</div>

</div>

</div>

Virtuoso can expose any of its available PL resources to the SOAP world.
This includes data from remote attached tables and procedures. To do
this, one needs to write a wrapper procedure in Virtuoso/PL.

<div id="ex_exposrmtprocsoap" class="example">

**Example 17.10. Exposing a MS SQL Server procedure to SOAP using
Virtuoso**

<div class="example-contents">

Here we have a sample MS SQL Server procedure and an accompanying
Virtuoso wrapper function. The MS SQL Server function returns a result
set based on a simple join query with a filter input. The Virtuoso
procedure calls the remote procedure, iterates through the result set
returned and produces XML output. First the MS SQL Server procedure:

``` programlisting
create procedure ms_remote
        @mask varchar(15)
as
  select c.CustomerID, c.CompanyName, o.OrderDate,
      o.ShippedDate,ol.ProductID, ol.Quantity, ol.Discount
    from Northwind..Customers c
      inner join Northwind..Orders o on c.CustomerID = o.CustomerID
      inner join Northwind.."Order Details" ol on o.OrderID = ol.OrderID
    where c.CustomerID like @mask
;
```

Then the Virtuoso wrapper function:

``` programlisting
create procedure WS.SOAP.ms_remote_call (
  in dsn varchar, in uid varchar, in pwd varchar, in mask varchar)
{
  declare m, r, ses any;
  vd_remote_data_source (dsn, '', uid, pwd);
  rexecute (dsn, 'ms_remote ?', null, null, vector (mask), 1000, m, r);
  ses := string_output ();
  http ('<?xml version="1.0" ?>\n<remote>\n', ses);
  if (isarray(m) and isarray (r))
    {
      declare i, l, j, k integer;
      declare md, rs any;
      md := m[0];
      i := 0; l := length (md); k := length (r); j := 0;
      while (j < k)
       {
     http ('<record ', ses);
         i:=0;
         while (i < l)
           {
         dbg_obj_print (md[i][0],r[j][i]);
         http (sprintf (' %s="%s"', trim(md[i][0]), trim(cast (r[j][i] as varchar))), ses);
             i := i + 1;
       }
     http (' />\n', ses);
         j := j + 1;
       }
    }
  http ('</remote>', ses);
  return string_output_string (ses);
};
```

Now, as before, we grant execute rights to the SOAP user:

``` screen
grant execute on WS.SOAP.ms_remote_call to SOAP;
    
```

The remote procedure `ms_remote()` can now be accessed via SOAP.

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                               |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                     |
|                            | The <a href="ch-vdbengine.html#thevdb" class="link"                                                                                           
                              title="8.1. Virtual Database (VDB) Engine">Virtual Database</a> chapter for information regarding use of remote datasources and their tables.  |

</div>

</div>

<div id="soapclient" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.12. Virtuoso/PL SOAP Client

</div>

</div>

</div>

Virtuoso has generic SOAP client functionality. This was demonstrated in
an example above, where we showed that we had correctly exposed a stored
procedure as a SOAP object. The entry point to the SOAP client is
<a href="fn_soap_client.html" class="link" title="soap_client"><code
class="function">soap_client ()</code></a> .

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                |
|                            | <a href="importwsdl.html" class="link"                                   
                              title="17.2.5. Importing A WSDL File &amp; SOAP/WSDL Proxying">Importing  
                              A WSDL File</a>                                                           |

</div>

</div>

<div id="execpriv" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.13. Execution Privileges

</div>

</div>

</div>

<a href="ch-webappdevelopment.html#virtandmultihosting" class="link"
title="Virtual Hosting and Multi Hosting">Virtual directory</a> mappings
allow you to define a specific database user on behalf of which to
execute code invoked via SOAP. By default Virtuoso disables SOAP calls
unless the database account 'SOAP' exists or a virtual directory mapping
is defined for SOAP call execution. If we map a logical HTTP path to
`/SOAP` and specify the user 'demo' as the SOAP user then stored
procedures or UDT methods will be executed with demo's privileges.

</div>

<div id="customsoapsrv" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.14. Custom Soap Server Support

</div>

</div>

</div>

Virtuoso allows any VSP page to act as a SOAP endpoint. This permits
preprocessing of the SOAP requests to extract additional information -
such as one placed for ebXML - and conversion of the SOAP replies to put
any additional information in them. SOAP messages with attachments can
also be processed this way.

SOAP extensions, such as the ones required for ebXML, can be programmed
as VSP services that can handle the additional information contained in
the SOAP requests. The
<a href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval()</code></a> function is useful here. The
SOAP server could be called after removing extension information; this
removal could be done with an XSL transformation. After the SOAP request
is processed, additional information can be placed in the result by
another XSL transformation.

Having a SOAP server outside the `/SOAP` physical path allows a greater
degree of control over what procedures are executed by providing a list
of mappings. Having this suite of functions allows SOAP requests to be
processed outside an HTTP context (for example after doing `mime_tree()`
over an e-mail) and sending the SOAP replies as SMTP messages.

The following built-in functions are relevant in this context:

<a href="fn_soap_server.html" class="link" title="soap_server"><code
class="function">soap_server() </code></a>

<a href="fn_soap_make_error.html" class="link"
title="soap_make_error"><code
class="function">soap_make_error() </code></a>

<a href="fn_soap_box_xml_entity.html" class="link"
title="soap_box_xml_entity"><code
class="function">soap_box_xml_entity() </code></a>

<a href="fn_soap_print_box.html" class="link"
title="soap_print_box"><code
class="function">soap_print_box() </code></a>

<a href="fn_http_body_read.html" class="link"
title="http_body_read"><code
class="function">http_body_read() </code></a>

<div id="soap1.1server" class="example">

**Example 17.11. Sample SOAP 1.1 server**

<div class="example-contents">

``` screen
<?vsp
        dbg_obj_print ('vspsoap called');
    declare content_type, soap_method, soap_xml varchar;
    declare payloads any;

    -- get the encoding to find out where the SOAP request should be searched for

        content_type := http_request_header (lines, 'Content-Type');
    if (isstring (content_type))
           content_type := lower (content_type);

    -- get the SOAP method name to execute

        soap_method := http_request_header (lines, 'SOAPAction');
        soap_xml := NULL;
        payloads := NULL;

    -- get the SOAP request
        if (content_type = 'multipart/related')
      {
        -- as in SOAP messages with attachments
        declare attrs any;
        declare inx integer;
        declare start_req varchar;

        -- the SOAP body is in the root part
        -- so get the root part's name
            start_req := http_request_header (lines, 'Content-Type', 'start');

        -- loop over the parts and get the root one.
        -- Others are placed in the payload array

        inx := 1;
        soap_xml := null;
        attrs := vector (1);
        while (isarray (attrs))
         {
           declare content_id varchar;

           -- get the part's MIME header
           attrs := get_keyword (sprintf ('attr-mime_part%d', inx), params);

           if (isarray (attrs))
         {
           -- extract the Content-ID from it
           content_id := get_keyword ('Content-ID', attrs);
           dbg_obj_print ('cont-id', content_id);

           if (isstring (content_id))
             {
               -- if it is the root part (SOAP request) parse it.
               if (content_id = start_req)
             soap_xml := xml_tree_doc (xml_tree (
                      get_keyword (sprintf ('mime_part%d', inx), params)));
               else
             {
               -- otherwise consider it a payload and store a info about the payload
               -- for later retrieval by get_keyword () VSE based on Content-ID
               if (payloads is null)
                 payloads := vector (vector (content_id, inx));
               else
                 payloads := vector_concat (payloads, vector (content_id, inx));
             }
             }
         }
           inx := inx + 1;
         }
      }
    else if (content_type = 'text/xml')
          {
        -- it's a SOAP request without attachments
            -- so get the POST body and parse it.
        soap_xml := xml_tree_doc (xml_tree (http_body_read ()));
      }
        else
      signal ('42000', 'unsupported encoding');

        -- the things retrieved so far
    dbg_obj_print ('vspsoap message', soap_xml);
    dbg_obj_print ('vspsoap payloads', payloads);

    -- execute the message

    -- catch any subsequent SQL error and generate and return SOAP reply XML for it.

    declare exit handler for SQLSTATE '*' {
      dbg_obj_print ('vspsoap in error handler for ', __SQL_MESSAGE);
      declare err_msg varchar;
      err_msg := soap_make_error ('300', __SQL_STATE, __SQL_MESSAGE);
      dbg_obj_print ('vspsoap error', err_msg);
      http (err_msg);

      -- note the SOAP SQL state - this is required since based on this value the
      -- HTTP server will not generate any additional reply if the SQL state starts with SOAP
      -- and this way the client will get a properly formatted reply
      resignal 'SOAP';
    };

        -- now check what is required and act accordingly
        if (soap_method = 'ebXML')
          {
        signal ('42000', 'ebXML not implemented yet');
      }
        else if (soap_method in ('fake#test'))
          {
        declare res any;

        -- note the mapping here : the SOAP call to fake:test will result in a
            -- call to DB.DBA.SOAPTEST PL procedure and it's results returned.

        res := soap_server (soap_xml, soap_method, lines, 11,
                    vector ('fake:test', 'DB.DBA.SOAPTEST'));

        dbg_obj_print ('vspsoap result', res);
        http (res);
      }
        else
      {
        -- simple signal will do as this will be cached by the handler
          -- and formatted as an SOAP error XML
        signal ('42000', concat ('Procedure ', soap_method, ' not defined'));
      }
?>
```

</div>

</div>

  

</div>

<div id="soapextendedsyntax" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.15. PL Procedures and UDT Methods Syntax Affecting WSDL & SOAP Processing

</div>

</div>

</div>

Special PL syntax can be applied to any of the parameters (including the
return value) in a declaration. All of these begins with \_\_SOAP\_
prefix and have special meaning. To manipulate more than the XMLSchema
type representation and SOAP encoding style, extended syntax is
available. With this syntax we can further override the default
request/response namespace, name of the output elements, "soapAction"
corresponding to the PL procedure and such.

The syntax is as follows:

``` programlisting
   ...
   CREATE (PROCEDURE|METHOD) ([param_decl [rout_alt_type]] ...) { [BODY] } [RETURNS ....] [rout_alt_type]
   ...

rout_alt_type
    :  /* no SOAP options */
    | soap_kwd STRING opt_soap_enc_mode     /* the basic syntax */
    | __SOAP_OPTIONS '(' soap_kwd EQUALS STRING opt_soap_enc_mode ',' soap_proc_opt_list ')'/* extended syntax */
    ;

soap_proc_opt_list
    : soap_proc_opt
    | soap_proc_opt_list ',' soap_proc_opt
    ;

soap_proc_opt /* extension options as PartName:='part2' */
    : NAME EQUALS signed_literal
    ;

soap_kwd
    : __SOAP_TYPE   /* denotes XML datatype, RPC encoding style if applied to the procedure */
    | __SOAP_HEADER /* the parameter is a message in the SOAP Header */
    | __SOAP_FAULT  /* the parameter is a message in SOAP Fault */
    | __SOAP_DOC    /* applies to the procedure, free-form of encoding (literal) */
    | __SOAP_XML_TYPE /*applies to the parameters, the input will be XML tree */
    | __SOAP_DOCW       /* applies to the procedure, literal encoding in style like RPC */
    | __SOAP_HTTP       /* HTTP GET/POST binding will be used */
    ;

opt_soap_enc_mode       /* which part of traffic will be encapsulated and in what way : DIME or MIME */
    : /* no encapsulation */
    | __SOAP_DIME_ENC IN
    | __SOAP_DIME_ENC OUT
    | __SOAP_DIME_ENC INOUT
    | __SOAP_MIME_ENC IN
    | __SOAP_MIME_ENC OUT
    | __SOAP_MIME_ENC INOUT
    ;

param_decl
    : (IN|OUT|INOUT) param_name data_type_ref [(DEFAULT|:=) literal]
    ;

data_type_ref
    : (data_type_name|udt_name) [ARRAY [intnum] ...]
    ;
```

The above syntax can be applied to the parameter and to the whole
procedure, so both places designate different purposes and limitations.
When it is applied to the parameter the following keywords can be used:
\_\_SOAP_TYPE, \_\_SOAP_HEADER, \_\_SOAP_FAULT and \_\_SOAP_XML_TYPE.
The \_\_SOAP_TYPE means that only XSD type will be used to interpret the
data, in contrast \_\_SOAP_XML_TYPE designates no deserialization from
XML, only parses the parameter XML representation to XML tree and passes
it to the procedure. The \_\_SOAP_HEADER and \_\_SOAP_FAULT designate
that parameter will be exposed in the SOAP Header or in the SOAP Fault
elements. In the second case, that parameter needs to be an 'OUT'
parameter (not IN or INOUT). The string after these keywords always
denotes the XSD type for SOAP serialization. When it is applied to the
PL procedure (after procedure's body), the \_\_SOAP_TYPE, \_\_SOAP_DOC,
\_\_SOAP_DOCW, \_\_SOAP_HTTP, \_\_SOAP_DIME_ENC and \_\_SOAP_MIME_ENC
can be used. The string after these keywords always denotes the XSD type
for SOAP serialization, except \_\_SOAP_DIME_ENC and \_\_SOAP_MIME_ENC
which are used for other purposes and can be combined with other
keywords. The \_\_SOAP_TYPE denotes RPC style encoding, \_\_SOAP_DOC for
document literal (bare parameters) encoding, \_\_SOAP_DOCW for the
free-form literal (wrapped) encoding. \_\_SOAP_HTTP is used to denote
HTTP style binding instead of SOAP one, in that way procedure can be
called via HTTP GET/POST methods without SOAP XML encoding.

The following keywords are supported as extended options:

|                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*PartName* </span> - changes the name of a OUT parameter to the string as specified, affects WSDL generation and SOAP serialization.                                              |
| <span class="emphasis">*RequestNamespace*</span> - designate namespace for the message in the request, affects header, fault and body WSDL declaration, and serialization of SOAP in RPC encoding style. |
| <span class="emphasis">*ResponseNamespace*</span> - the same as RequestNamespace, but for SOAP response and output in WSDL declaration.                                                                  |
| <span class="emphasis">*soapAction*</span> - sets the 'soapAction' attribute in WSDL generation, can be applied to the procedure only.                                                                   |

The RequestNamespace and ResponseNamespace can be used only for the
procedure and together with the \_\_SOAP_FAULT and \_\_SOAP_HEADER
keywords.

The 'ARRAY' modifier to the SQL datatype is allowed when no XML Schema
datatype is assigned to the given parameter of the PL procedure or UDT
method. In this case the input and output value will be verified to
confirm to the rules applicable for an array. Furthermore in this case
an XSD definition will be added in the WSDL file at run time.

<div id="ex_soapextsynt" class="example">

**Example 17.12. SOAP Extension**

<div class="example-contents">

This example shows both approaches to define parameters and SOAP
encoding style. In practice this definition is part of the Interop tests
round 4 (group H). The meaning of this is: the SOAP operation is uses
RPC encoding style, 'whichFault' is integer, 'param1' and 'param2' are
strings. The out parameters 'part2_1' and 'part2_2' will be printed in
SOAP:Fault element (see Exposing & Processing SOAP Fault Messages for
more details). The interesting fact is that the last two parameters will
be serialized as "part2" in different namespaces. And finally no return
of the SOAP operation is defined (it's empty).

``` programlisting
create procedure
"echoMultipleFaults3" (
    in whichFault int __soap_type 'http://www.w3.org/2001/XMLSchema:int',
    in param1 varchar __soap_type 'http://www.w3.org/2001/XMLSchema:string',
    in param2 varchar __soap_type 'http://www.w3.org/2001/XMLSchema:string',
    out part2_1 varchar __soap_options (
        __soap_fault:='http://www.w3.org/2001/XMLSchema:string',
    PartName:='part2',
        ResponseNamespace:='http://soapinterop.org/wsdl/fault1'),
    out part2_2 varchar __soap_options (
        __soap_fault:='http://www.w3.org/2001/XMLSchema:string',
    PartName:='part2',
        ResponseNamespace:='http://soapinterop.org/wsdl/fault2')
    )
   __soap_type '__VOID__'
{

  if (whichFault > 2)
    whichFault := mod (whichFault, 3) + 1;
  declare exit handler for sqlstate 'SF000'
    {
      http_request_status ('HTTP/1.1 500 Internal Server Error');
      if (whichFault = 1)
    {
          part2_1 := param1;
    }
      else if (whichFault = 2)
    {
      part2_2 := param2;
    }
      connection_set ('SOAPFault', vector ('400', 'echoMultipleFaults3'));
      return;
    };
  signal ('SF000', 'echoEmptyFault');
}
;
```

</div>

</div>

  

</div>

<div id="soapheadermessages" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.16. Exposing & Processing SOAP Header Messages

</div>

</div>

</div>

The Virtuoso SOAP server can be used to process the SOAP Header messages
as described in the W3C recommendation
(<a href="http://www.w3c.org/TR/SOAP/" class="ulink"
target="_top">http://www.w3c.org/TR/SOAP</a> , SOAP Header section).
They can also be exposed in the WSDL file (services.wsdl) as per W3C
WSDL recommendation, using the RPC style encoding.

To bind a message to a SOAP header the special keyword \_\_soap_header
is reserved for input and output parameters. The \_\_soap_header
followed by the SOAP datatype can be specified for any input or output
parameter after normal datatype declarations. This will expose
parameters as input or output messages separately. Header binding will
also be added to an appropriate section of the WSDL description file for
the SOAP message.

<div id="procsoapheader" class="example">

**Example 17.13. Processing of the SOAP Header element**

<div class="example-contents">

Consider the following simple SOAP request message with Header element:

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope
       xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
       xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
       xmlns:xsd="http://www.w3.org/2001/XMLSchema"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <SOAP-ENV:Header>
      <h:echoMeStringRequest
     xmlns:h="http://soapinterop.org/echoheader/"
     SOAP-ENV:actor="http://schemas.xmlsoap.org/soap/actor/next"
     mustUnderstand="1">hello world</h:echoMeStringRequest>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <m:echoVoid xmlns:m="http://soapinterop.org/"></m:echoVoid>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

This request will be processed by the Virtuoso SOAP server in the
following way:

<div class="orderedlist">

1.  Check whether the echoVoid operation is defined for the given web
    directory mapping (see: exposing a PL procedure as a SOAP operation)

2.  Test whether there is an in-parameter echoMeStringRequest defined
    for header processing (see below exposing a header parameters)

3.  Test the mustUnderstand attribute:

    <div class="itemizedlist">

    - If mustUnderstand is 0 or is undefined the request will continue
      without an error.

    - If mustUnderstand is 1 and the actor attribute is not empty or
      defined with the http://schemas.xmlsoap.org/soap/actor/next
      special URI, the request will continue without an error.

    - If the two conditions about fail then the request will be rejected
      with a SOAP MustUnderstand error.

    </div>

4.  The value of the echoMeStringRequest will be passed as a parameter
    to the echoVoid procedure.

5.  If the call to the echoVoid succeeds, and the corresponding out
    parameter is supplied for the SOAP response header then it will be
    sent to the SOAP client.

</div>

The following procedure, which represents a part from echoHeaderBindings
iterop test (round C), for the demonstration purposes is designed to
process the above SOAP message.

``` programlisting
create procedure
Interop.INTEROP.echoVoid
   (in echoMeStringRequest nvarchar := NULL __soap_header 'http://www.w3.org/2001/XMLSchema:string',
    out echoMeStringResponse nvarchar := NULL __soap_header 'http://www.w3.org/2001/XMLSchema:string')
   __soap_type '__VOID__'
{
  if (echoMeStringRequest is not null)
    echoMeStringResponse := echoMeStringRequest;
};
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                          |
|                              | The \_\_soap_header keyword that instructs the SOAP server to process this parameter via a SOAP Header with datatype string. Also, the condition in the procedure is needed to return the value in SOAP header only if it is supplied. In some other cases it can be returned always, but in this particular example it will be echoed only if the appropriate header is sent. |

</div>

</div>

</div>

  

</div>

<div id="soapfaultmessages" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.17. Exposing & Processing SOAP Fault Messages

</div>

</div>

</div>

The SOAP:Fault message is used to indicate which part of SOAP request
fails, so in its general form it may not have a detailed error. But in
some cases it is useful to report in detail which element's input(s) are
not correct.

Custom soap:fault messages can be generated by application logic as
illustrated below:

Have a procedure to generate custom SOAP:Fault messages with at least
one OUT parameter denoted by \_\_SOAP_FAULT instead of \_\_SOAP_TYPE
keyword following by type to be returned as literal.

Once we have such parameter(s) declared we can set these to some value
(of atomic, simple or complex type) as may be appropriate.

And finally we need to set a special connection variable 'SOAPFault', in
order to signal custom SOAP:Fault on output. The value of the connection
variable needs to be an array of two elements : An integer of 100, 200,
300, 400 which represents the SOAP:VersionMismatch, SOAP:MustUnderstand,
SOAP:Client and SOAP:Server errors. And a string which will be printed
in textual explanation, human readable format. In real life we will not
need to generate 100 or 200 fault messages, but anyway it is possible to
do that.

<div id="procsoapfault" class="example">

**Example 17.14. Signalling a custom SOAP Fault element**

<div class="example-contents">

Consider we need to indicate to the client that some string is not a
valid input, we can use the custom fault message mechanism as.

``` programlisting
create procedure
echoStringFault (in param nvarchar,
                 out part2 nvarchar __soap_fault 'string')
returns nvarchar
{
  declare exit handler for sqlstate 'SF000'
    {
      http_request_status ('HTTP/1.1 500 Internal Server Error');
      -- we are setting the fault message
      part2 := param;
      -- and instructing the SOAP server to make error 400 with text explanation StringFault
      connection_set ('SOAPFault', vector ('400', 'StringFault'));
      ----------------^^^^^^^^^^
      return;
    };
  -- in real life signalling of the error is under some condition
  -- for example if string is longer that 10 chars
  signal ('SF000', 'echoEmptyFault');
}
;

  
```

And an wire dump of SOAP request

``` programlisting
<SOAP-ENV:Envelope SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" ...>
  <SOAP-ENV:Body>
    <m:echoStringFault xmlns:m="http://soapinterop.org/wsdl">
      <param xsi:type="xsd:string">String</param>
    </m:echoStringFault>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  
```

And SOAP Fault response

``` programlisting
<?xml version="1.0"?>
<SOAP:Envelope SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" ...>
  <SOAP:Body>
    <SOAP:Fault>
      <faultcode>SOAP:Server</faultcode>
      <faultstring>[Virtuoso SOAP server] StringFault</faultstring>
      <detail>
        <h:part2 xmlns:h="http://soapinterop.org/wsdl" xsi:type="xsd:string">String</h:part2>
      </detail>
    </SOAP:Fault>
  </SOAP:Body>
</SOAP:Envelope>
  
```

Please note that in wire dumps there is no namespace declarations for
brevity (places are denoted with '...').

</div>

</div>

  

</div>

<div id="soapdoclitenc1" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.18. Document Literal Encoding

</div>

</div>

</div>

The Virtuoso SOAP server and client support Document Literal encoding
for processing as an alternative to SOAP/RPC. The document/literal
encoding allows the transmission of any arbitrary valid XML document
instead of a SOAP call following rules from section 5 from SOAP/1.1
specification. This allows us to send and receive SOAP packets that are
more free-form ("document" style). If you create a service that can
accept more free-form type packets, you can employ constraints within
the methods so that they can be independent (bare) or serialized as
embedded elements within the method's SOAP structure (wrapped parameters
style).

<div id="ex_soapi3doclit" class="example">

**Example 17.15. Comparing SOAP Types**

<div class="example-contents">

Here are examples of SOAP requests that represent the RPC, Doc/Literal
and Doc/Literal with parameters types of SOAP message

-- RPC encoded --

``` programlisting
<?xml version="1.0"?>
<SOAP-ENV:Envelope
      xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
   <SOAP-ENV:Body>
     <m:echoString
         SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
     xmlns:m="http://soapinterop.org/">
       <param0 xsi:type="xsd:string">Enter a message here</param0>
     </m:echoString>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

-- Document Literal --

``` programlisting
<?xml version="1.0"?>
<SOAP-ENV:Envelope
      xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
   <SOAP-ENV:Body>
     <ns1:echoStringParam xmlns:ns1="http://soapinterop.org/xsd">Enter a message here</ns1:echoStringParam>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

-- Document Literal with parameters --

``` programlisting
<?xml version="1.0"?>
<SOAP-ENV:Envelope
      xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
   <SOAP-ENV:Body>
     <ns1:echoString xmlns:ns1="http://soapinterop.org/xsd">
       <param0>Enter a message here</param0>
     </ns1:echoString>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

</div>

</div>

  

SOAP operations can be designated as document/literal or RPC by using
the appropriate values in the WSDL description file associated to that
SOAP endpoint. As Virtuoso SOAP operations are PL procedures special
keywords are used within the procedure to indicate that the
document/literal encoding should be used. These special keywords are:

|               |
|---------------|
| \_\_soap_doc  |
| \_\_soap_docw |

These should be placed after the 'returns' keyword in a Virtuoso
procedure definition. If 'returns ... \_\_soap_type' is omitted the
procedure return type will be equivalent to 'returns varchar
\_\_soap_type 'http://www.w3.org/2001/XMLSchema:string'.

Another way to expose a PL procedure or UDT method as a document/literal
SOAP methods is to use non-explicit XMLSchema datatypes and to force
encoding rules via virtual directory option 'Use' (see also SOAP options
section in this chapter and in WSDL chapter section: "Exposing SQL
Stored Procedures containing complex datatype definitions" for details
and examples).

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                |
|                            | <a href="http://www.w3.org/TR/wsdl" class="ulink" target="_top">WSDL 1.1 
                              Specification</a>                                                         |

</div>

<div id="ex_soapreturnrpc" class="example">

**Example 17.16. SOAP Returns RPC**

<div class="example-contents">

The following example shows a procedure that will be exposed as an RPC
encoded SOAP operation:

``` programlisting
create procedure
Import1.echoString (in x nvarchar __soap_type 'http://www.w3.org/2001/XMLSchema:string')
returns nvarchar __soap_type 'http://www.w3.org/2001/XMLSchema:string'
{
  return x;
};
```

</div>

</div>

  

<div id="ex_soapreturndoclit" class="example">

**Example 17.17. SOAP Returns Document Literal**

<div class="example-contents">

The following example shows a procedure that will be exposed as a
document literal encoded operation. Note the \_\_soap_doc keyword after
'returns', also in this case \_\_soap_type for each parameter must be
specified since the incoming request must be validated by the given
schema element declaration (see below for XMLSchema elements
declaration).

``` programlisting
create procedure
DocLit.echoString (in echoStringParam varchar __soap_type 'http://soapinterop.org/xsd:echoStringParam')
      returns any __soap_doc 'http://soapinterop.org/xsd:echoStringReturn'
{
      return echoStringParam;
};
```

</div>

</div>

  

<div id="ex_soapreturndoclitwrapped" class="example">

**Example 17.18. SOAP Returns Document Literal with Parameters**

<div class="example-contents">

The following example shows a procedure that will be exposed as document
literal encoding operation with parameters style (wrapped). note the
\_\_soap_docw keyword after 'returns'.

``` programlisting
create procedure
DocPars.echoString (in echoString varchar __soap_type 'http://soapinterop.org/xsd:echoString')
      returns any __soap_docw 'http://soapinterop.org/xsd:echoStringResponse'
{
      return echoString;
};
```

</div>

</div>

  

In both cases of Document Literal encoding we need to specify the schema
element for validation of the incoming SOAP request. Furthermore, this
applies to the output elements and return value, as they need to be
encoded/validated properly.

<div id="wsdlschemadtandelts" class="section">

<div class="titlepage">

<div>

<div>

#### Defining WSDL Schema Data Type and Elements

</div>

</div>

</div>

When defining a schema data type (for use within SOAP) the
'targetNamespace' attribute on top level element must be specified in
order to describe in which namespace this type is valid. In other words,
this type will be used to validate request only within this namespace.
Therefore it will be exposed only at this WSDL point where it is used to
describe a parameter of an operation associated to it.

<div class="important" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                        |                                                                                                                                                                                                                                                                 |
|:--------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Important\]](images/important.png) | Important                                                                                                                                                                                                                                                       |
|                                        | All datatypes and elements defined for use in SOAP must have namespace (QName), which means that 'targetNamespace' must be specified in the definition. All non-qualified types will be rejected in SOAP validation and will not be described in the WSDL file. |

</div>

<div id="ex_soapi3stringarray" class="example">

**Example 17.19. Making an array of string data type**

<div class="example-contents">

Here is an example demonstrating making an array-of-string datatype:

``` programlisting
select soap_dt_define('','<complexType name="ArrayOfstring"
   targetNamespace="http://soapinterop.org/xsd"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:tns="http://soapinterop.org/xsd">
  <complexContent>
     <restriction base="enc:Array">
    <sequence>
       <element name="item" type="string" minOccurs="0" maxOccurs="unbounded" nillable="true"/>
    </sequence>
    <attributeGroup ref="enc:commonAttributes"/>
    <attribute ref="enc:arrayType" wsdl:arrayType="string[]"/>
     </restriction>
  </complexContent>
</complexType>');
```

</div>

</div>

  

As document literal encodings work with elements, the elements must be
declared as a part of the WSDL file (in the types/schema section). The
declared elements can be used to define a doc/literal encoded SOAP
operation. This allows for the definition of an element of request and
response to enable the server to understand the requests (validate and
process) and respond to them (validate the PL data and serialize
properly).

<div id="ex_si3params" class="example">

**Example 17.20. Example of defining elements**

<div class="example-contents">

Here is an example for the DocLit.echoString SOAP operation using
parameters (input parameter and return type):

``` programlisting
select soap_dt_define('','<element xmlns="http://www.w3.org/2001/XMLSchema"
                                   name="echoStringParam"
                                   targetNamespace="http://soapinterop.org/xsd" type="string" />');

select soap_dt_define('','<element xmlns="http://www.w3.org/2001/XMLSchema"
                                   name="echoStringReturn"
                   targetNamespace="http://soapinterop.org/xsd" type="string" />');
```

</div>

</div>

  

</div>

<div id="soapexttosimptypes" class="section">

<div class="titlepage">

<div>

<div>

#### Extensions to Simple Types

</div>

</div>

</div>

The attribute extensions to the simple types (string, float, etc...) can
be defined and used in SOAP messages. In that case a PL value is
represented as a special structure of 3 elements as follows:

``` programlisting
vector (<composite>, vector (<attr-name>, <attr-value>, ...), <simple type value>)
```

<div id="ex_defsimptypedocument" class="example">

**Example 17.21. An example to define a simple type 'Document'**

<div class="example-contents">

``` programlisting
select soap_dt_define('','<complexType name="Document"
             xmlns="http://www.w3.org/2001/XMLSchema"
             xmlns:xsd="http://www.w3.org/2001/XMLSchema"
             targetNamespace="http://soapinterop.org/xsd">
  <simpleContent>
    <extension base="string">
      <xsd:attribute name ="ID" type="string"/>
    </extension>
  </simpleContent>
</complexType>');
```

Note that soap_dt_define() does not need the name to be specified when
adding a new type, the name/namespace will be extracted from XSD
fragment.

</div>

</div>

  

</div>

<div id="wsdlgeneration" class="section">

<div class="titlepage">

<div>

<div>

#### WSDL Generation

</div>

</div>

</div>

As the WSDL file generation is based on granted PL procedures exposed to
a given SOAP endpoint, only SOAP datatypes and schema elements used for
them will be printed in \<types\> section. If an undeclared datatype is
used for an exposed procedure, the error will be printed in an XML
comment where the type definition was expected and not found. If an
element or datatype refers to other (dependent) types they will also be
automatically included. For example, if we have exposed for a SOAP
endpoint only the following procedure:

``` programlisting
create procedure
INTEROP.echoStructArray (
    in inputStructArray any __soap_type 'http://soapinterop.org/xsd:ArrayOfSOAPStruct')
    __soap_type 'http://soapinterop.org/xsd:ArrayOfSOAPStruct'
{
  return inputStructArray;
};
```

The schema fragment will consist of both SOAPStructure and
ArrayOfSOAPStruct data types declaration:

``` programlisting
<schema targetNamespace="http://soapinterop.org/xsd"
   xmlns="http://www.w3.org/2001/XMLSchema"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" >
     <complexType name="ArrayOfSOAPStruct" >
       <complexContent>
         <restriction base="soapenc:Array">
           <sequence>
             <element name="item" type="ns0:SOAPStruct" minOccurs="0" maxOccurs="unbounded"/>
           </sequence>
           <attribute ref="soapenc:arrayType" wsdl:arrayType="ns0:SOAPStruct[]"/>
           <attributeGroup ref="soapenc:commonAttributes"/>
           <attribute ref="soapenc:offset"/>
         </restriction>
      </complexContent>
    </complexType>
    <!-- Note this fragment, it's included because ArrayOfSOAPStruct depends from it -->

    <complexType name="SOAPStruct" >
       <all>
      <element name="varString" type="string" nillable="true"/>
      <element name="varInt" type="int" nillable="true"/>
      <element name="varFloat" type="float" nillable="true"/>
       </all>
    </complexType>
</schema>
```

</div>

<div id="multnswsdlsoap" class="section">

<div class="titlepage">

<div>

<div>

#### Multiple Namespaces in WSDL and SOAP

</div>

</div>

</div>

When you define a SOAP operation that has parameters from different
namespaces or a type referring to a type in another namespace, both will
be defined and printed as a separate schema definition in the WSDL file.
Hence, we can define a data type in different namespace so they will
live together in a single WSDL file. This allows us to make more complex
and flexible document-centric style SOAP operations.

<div id="ex_mnsi3test" class="example">

**Example 17.22. Example from the SOAP Interop 3 Tests**

<div class="example-contents">

This example is of the echoEmployee operation from interop 3 tests:

``` programlisting
create procedure
Compound2.echoEmployee (in x any __soap_type 'http://soapinterop.org/employee:x_Employee')
      returns any __soap_doc 'http://soapinterop.org/employee:result_Employee'
{
  return x;
};
```

This will generate the following schema in the WSDL file (only affected
parts are shown):

``` programlisting
<definitions
...
xmlns:ns1="http://soapinterop.org/person"
xmlns:ns0="http://soapinterop.org/employee"
... >

<types>
    <schema targetNamespace="http://soapinterop.org/person"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" elementFormDefault="qualified" >
       <complexType name="Person" >
          <sequence>
        <element minOccurs="1" maxOccurs="1" name="Name" type="string"/>
            <element minOccurs="1" maxOccurs="1" name="Male" type="boolean"/>
          </sequence>
       </complexType>
    </schema>

    <schema targetNamespace="http://soapinterop.org/employee"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" elementFormDefault="qualified" >
        <import namespace='http://soapinterop.org/person' />
        <complexType name="Employee" >
        <sequence>
           <element minOccurs="1" maxOccurs="1" name="person" type="ns1:Person"/>
           <element minOccurs="1" maxOccurs="1" name="salary" type="double"/>
               <element minOccurs="1" maxOccurs="1" name="ID" type="int"/>
            </sequence>
       </complexType>

       <element name="result_Employee" type="ns0:Employee" />
       <element name="x_Employee" type="ns0:Employee" />

    </schema>
</types>
...
```

The PL procedure is defined to use element declaration x_Employee and
result_Employee, so this will automatically include the Employee and
Person type, upon which they depend. Also, as these types are defined in
different namespace, two schema parts will be specified in the WSDL
file.

</div>

</div>

  

In practice the SOAP developer needs to define elements and types (using
soap_dt_define() function), after this, specifying a parameter of PL
procedure (or return type) will cause automatic generation of the
associated WSDL description in the manner described. Hence, no user
intervention is required besides the initial element/type definition.

</div>

<div id="soapi3endpoints" class="section">

<div class="titlepage">

<div>

<div>

#### SOAP Interop round III Endpoints

</div>

</div>

</div>

The following endpoints are pre-defined in the Demo database for SOAP
interop III testing (the WSDL files are in the usual services.wsdl for
each group of tests):

<div class="itemizedlist">

- <span class="emphasis">*D tests* </span>

  <div class="itemizedlist">

  - /r3/EmptySA/ - echoString operation with empty ("") soapAction (PRC
    encoded)

  - /r3/Import1/ - echoString operation, rpc encoded

  - /r3/Import2/ - echoStruct operation, rpc encoded

  - /r3/Import3/ - echoStruct and adds method echoStructArray, rpc
    encoded (echoStruct is in different namespace)

  - /r3/Compound1/ - Use of attributes in SOAP payload, including
    attribute on element of simpleType , doc/literal

  - /r3/Compound2/ - Two schema sections, types in 1st schema references
    types in the 2nd schema, doc/literal

  - /r3/DocPars/ - Reduced version of SOAPBuilders Interop test wsdl
    with "parameters" way of describing rpc requests in Document/Literal
    (Document/Literal - Wrapped). Version has operations echoString,
    echoArrayOfString and echoStruct

  - /r3/DocLit/ - Reduced version of SOAPBuilders InteropTest test,
    document/literal mode. Version has operations echoString,
    echoArrayOfString and echoStruct

  - /r3/RpcEnc/ - Reduced version of SOAPBuilders InteropTest test,
    rpc/encoded mode. Version has operations echoString,
    echoArrayOfString and echoStruct

  </div>

- <span class="emphasis">*E tests* </span>

  <div class="itemizedlist">

  - /r3/List/ - echo of list structure (as shown) , RPC encoded

    ``` programlisting
    struct list {
      int varInt;
      string varString;
      list child; //nullable
    }
    ```

  </div>

- <span class="emphasis">*F tests* </span>

  <div class="itemizedlist">

  - /r3/Hdr/ - Modified version of SOAPBuilders InteropTest test,
    document/literal mode Version has one operation echoString with 2
    headers defined.

  </div>

</div>

</div>

</div>

<div id="soapdimeenc" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.19. DIME encapsulation of SOAP messages

</div>

</div>

</div>

The Direct Message Encapsulation (DiME) format is a message format that
can be used to encapsulate one or more payloads of arbitrary type and
size. This format can be used in place of MIME, but benefits of DIME are
ease of parsing and low memory consumption, as DIME does not require
loading the whole message body in order to parse it. This is due to the
fact that MIME does not have mechanism for specifying the length of
payloads etc. DIME prefixes all data with length and type information.

The structure of a DIME message as per draft-nielsen-dime-02 is:

``` programlisting
/*
      Legend:

      VERSION = 0x01
      RESRVD  = 0x00
      MB - begin mark
      ME - end mark
      CF - chunked flag
      TYPE_T - type of content type field

      0                   1                   2                   3
      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |         |M|M|C|       |       |                               |
     | VERSION |B|E|F| TYPE_T| RESRVD|         OPTIONS_LENGTH        |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |            ID_LENGTH          |           TYPE_LENGTH         |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |                          DATA_LENGTH                          |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |                                                               /
     /                     OPTIONS + PADDING                         /
     /                                                               |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |                                                               /
     /                          ID + PADDING                         /
     /                                                               |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |                                                               /
     /                        TYPE + PADDING                         /
     /                                                               |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
     |                                                               /
     /                        DATA + PADDING                         /
     /                                                               |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
*/
   
```

The MB,ME,CF flags are used to indicate which part of the DIME message
is the current block of data. Also, we notice that there are four length
fields of fixed length before any data, id or type payload. This is to
make the payload easier to read.

The Virtuoso server implements a DIME parser and composer as functions
and filter for DIME in SOAP server. Furthermore the Virtuoso WSDL
generator can be instructed to specify a DIME extension to the PL
procedure exposed as SOAP method. The implementation is based on
draft-nielsen-dime-02 RFC proposal. Please note that in the rest of
document we will use 'DIME attachment' term , which is about SOAP
message with attachment encapsulated with DIME as per
draft-nielsen-dime-soap-01. The special case in these messages is type
of first payload, so it's supposed to be a SOAP:Envelope message.

Note: Option fields are not supported.

To setup a SOAP endpoint to recognize DIME encapsulation the "DIME-ENC"
option to SOAP in virtual directory must be set to 'yes'. Furthermore
the WSDL description of endpoint defined as DIME enabled will contain
WSDL extensions to DIME.

As not in all cases input and output of the SOAP server needs to be DIME
encoded, the particular PL procedure exposed as SOAP method needs to be
defined in special way to indicate which traffic is encoded as DIME.
This is done by using special keywords on procedure declaration:

``` programlisting
   CREATE PROCEDURE ([PARAMETERS DECLARATION])
    [RETURNS TYPE] [(__SOAP_TYPE|__SOAP_DOC|_SOAP_DOCW) 'LITERAL'] [__SOAP_DIME_ENC (IN/OUT/INOUT)]
   
```

The '\_\_SOAP_DIME_ENC IN' indicate that the procedure expects a DIME
attachments on input. This can also be used with OUT and INOUT. This
will also be indicated in WSDL file (services.wsdl) as DIME extension in
appropriate place of 'soap:operation' element.

The format of SOAP attachments passed to PL procedure defined in this
way is an array which consists of three string elements: ID,
content-type, and attachment data itself. The same format must be used
when parameter is an output which needs to be sent as DIME attachment.
There is also a special parameter of PL procedure exposed as SOAP method
named 'ws_soap_attachments', so when we have such, all attachments
received will be passed thru it. In practice we will not need to use
'ws_soap_attachments' , but anyway it's practical use is to handle
unreferenced parameters or to debug the request.

Finally we must say that type of parameter needs to have datatype
declared as per 'WSDL Extension for SOAP in DIME' proposal, this is
needed for indicating in the WSDL what to expect and how to send the
attachment. See also the example below.

<div id="procdimesoap" class="example">

**Example 17.23. Using DIME encapsulation**

<div class="example-contents">

Suppose we need to accept a binary attachment and echo it back as string
encoded in the popular 'base64'.

We first need to enable DIME encapsulation to an endpoint, with virtual
directory definition:

``` programlisting
SQL> VHOST_DEFINE (lpath=>'/r4/groupG/dime/rpc', ppath=>'/SOAP/', soap_user=>'interop4',
    soap_opts => vector ('DIME-ENC', 'yes')) ;
```

The sample PL procedure that takes a binary attachment and transforms it
to a base64 encoded string must be declared as:

``` programlisting
create procedure
EchoAttachmentAsBase64 (in "In" nvarchar __soap_type 'http://soapinterop.org/attachments/xsd:ReferencedBinary')
returns nvarchar __soap_type 'base64Binary'
__soap_dime_enc in
{
  -- we are getting the attachment as the 3rd element of input,
  -- do the base64 encoding for it and return it to the requestor
  return encode_base64 (cast ("In"[2] as varchar));
}
;
```

As we have noticed an 'ReferencedBinary' is used to declare 'In'
parameter. This has a special purpose for WSDL definition, not for SOAP
processing itself. In that case clients are instructed to look at
annotation/appinfo of a simple type declared as:

``` programlisting
    <complexType name="ReferencedBinary">
        <simpleContent>
            <restriction base="soap-enc:base64Binary">
                <annotation>
                    <appinfo>
                        <content:mediaType value="application/octetstream"/>
                    </appinfo>
                </annotation>
                <attributeGroup ref="soap-enc:commonAttributes"/>
            </restriction>
        </simpleContent>
    </complexType>
```

This is a little-bit tricky, but this is how to indicate the type of the
content and how to resolve the references to the attachments as per the
WSDL Extension for SOAP in DIME' proposal.

</div>

</div>

  

</div>

<div id="soapoptions" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.20. SOAP Endpoint Options

</div>

</div>

</div>

The virtual directory mechanism provides a special SOAP options for SOAP
processing. The SOAP options are name-value pairs contained in a vector:
i.e. vector ('name1', 'value1', ....). The SOAP server accepts the
following optional parameters settable in the SOAP Options field of the
<a href="admui.internetdomains.html#httpvirtualdirs" class="link"
title="HTTP Virtual Directories">HTTP Virtual Directories Setup</a>
interface, or using the
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define()</code></a> function:

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*ServiceName*</span> : name of the SOAP service, will be prefixed with 'Virtuoso'. That name is shown in WSDL description.                                                                                                                                                                                                                                                                                                                                                                          |
| <span class="emphasis">*Namespace*</span> : namespace URI of the SOAP:Body request and response.                                                                                                                                                                                                                                                                                                                                                                                                                           |
| <span class="emphasis">*HeaderNS* </span> : namespace URI for SOAP:Header messages.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| <span class="emphasis">*FaultNS* </span> : namespace URI for SOAP:Fault messages.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| <span class="emphasis">*MethodInSoapAction* </span> : enable or disable appending of the method name in the soapAction attribute (WSDL) after namespace URI.                                                                                                                                                                                                                                                                                                                                                               |
| <span class="emphasis">*CR-escape*</span> : enable or disable escaping of the CRs on wire as &#0xd                                                                                                                                                                                                                                                                                                                                                                                                                         |
| <span class="emphasis">*elementFormDefault=(unqualified\|qualified);*</span> Sets the elementFormDefault for schema specification. if qualified is used the elementFormDefault attribute will be set to qualified, in which case elements required to be unqualified can be declared with value of "form" attribute "unqualified".                                                                                                                                                                                         |
| <span class="emphasis">*Use=(encoded\|literal)*</span> Sets the default SOAP message encoding rules for those PL procedures which have no explicit encoding rule assigned (see SOAP special syntax for PL procedures). The default is 'encoded' which means to follow SOAP RPC encoding as described in SOAP v1.1 specification section 5.1. The 'literal' mode forces the SOAP server to expose PL procedures with the document/literal parameter encoding style.                                                         |
| <span class="emphasis">*MethodInSoapAction=(no\|yes\|empty\|only);* </span> Controls soapAction attribute manipulation. <span class="emphasis">*no* </span> - only URL for soap requests will be printed. <span class="emphasis">*yes*</span> (default) - the URL and soap method will be printed in form: \<url\>#\<method name\>. <span class="emphasis">*empty*</span> - no value will be specified for soapAction. <span class="emphasis">*only*</span> - only the method will be specified in form \#\<method name\>. |
| <span class="emphasis">*DIME-ENC*</span> : Controls DIME encapsulation on particular SOAP endpoint, valid values are <span class="emphasis">*no*</span> - (default) not enabled. <span class="emphasis">*yes*</span> - DIME encapsulation is enabled on endpoint                                                                                                                                                                                                                                                           |
| <span class="emphasis">*WS-SEC*</span> : WS-Security processing is enabled on the endpoint, if it's <span class="emphasis">*yes*</span> , otherwise disabled (default)                                                                                                                                                                                                                                                                                                                                                     |
| <span class="emphasis">*WSS-KEY*</span> : name of PL procedure, which is supposed to return a key instance, used together with "WS-SEC" option.                                                                                                                                                                                                                                                                                                                                                                            |
| <span class="emphasis">*WSS-Template*</span> : path to the file for making the XML Signature in response message. The "\[key reference for signing\]" denotes using a default template for signing, see WS Security signing SOAP messages.                                                                                                                                                                                                                                                                                 |
| <span class="emphasis">*WSS-Validate-Signature*</span> : This option controls the input behavior, i.e. how to verify the incoming message. Possible values are "0", "1" or "2", where 0 does not verify signatures, 1 expects a signature to exist, 2 will verify signature if one exists.                                                                                                                                                                                                                                 |
| <span class="emphasis">*WS-RP*</span> : to enable WS-Routing protocol on particular endpoint, if it's <span class="emphasis">*yes*</span> , otherwise disabled (default).                                                                                                                                                                                                                                                                                                                                                  |
| <span class="emphasis">*wsrp-from*</span> : Constant for identification of endpoint, an example is 'some@user.network'. This will be included in 'form' element in WS Routing header.                                                                                                                                                                                                                                                                                                                                      |

</div>

</div>

</div>
