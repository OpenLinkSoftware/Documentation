<div id="udtrepressentsoapstruct" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.15. Using User Defined Types to Represent SOAP Structures

</div>

</div>

</div>

The Virtuoso SOAP server is capable of using user defined types (both
native and hosted) to represent structures in SOAP requests/responses.
Normally a SOAP exposed procedure would have references to defined
schema types (\_\_SOAP_TYPE for it's return type and for it's argument
types). When such a schema type represents a structure (see the SOAP RPC
encoding) the Virtuoso SOAP server will map the structure to an array of
name/value pairs for it's members (the type of value returned by the
soap_box_structure VSE). The user defined types however are better
suited for representing such data. In order for a user defined type to
be usable in SOAP, it must have a default constructor (no arguments).
For native types that is always true (since they have the implicit
constructor setting up the member's values to the respective DEFAULT
values from the user defined type declaration). The Virtuoso SOAP
implementation supports two ways of specifying how a SOAP value XML
fragment should be materialized as a user defined type instance, as
follows.

<div id="udtsoapuseschemafrag" class="section">

<div class="titlepage">

<div>

<div>

#### Using Schema Fragments

</div>

</div>

</div>

The <a href="fn_soap_dt_define.html" class="link"
title="soap_dt_define"><code
class="function">SOAP_DT_DEFINE()</code></a> function is used to map a
particular schema fragment describing a composite schema type for SOAP
usage. This now takes an additional optional argument to establish a
link to a user defined type name:

``` programlisting
create type SO_S_30
  as (
      "varString" nvarchar,
      "varInt" integer,
      "varFloat" real,
      "processingResult" nvarchar,
      "vmVersion" nvarchar)
  constructor method SO_S_30 (),
  method process_data () returns nvarchar;

soap_dt_define ('',
'<complexType name="SOAPStruct"
   xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
   xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
   xmlns="http://www.w3.org/2001/XMLSchema"
   targetNamespace="services.wsdl"
   xmlns:tns="services.wsdl">
  <all>
    <element name="varString" type="string" nillable="true"/>
    <element name="varInt" type="int" nillable="true"/>
    <element name="varFloat" type="float" nillable="true"/>
    <element name="processingResult" type="string" nillable="true"/>
    <element name="vmVersion" type="string" nillable="true"/>
  </all>
</complexType>', 'SO_S_30');
```

The CREATE TYPE statement defines the user defined type SO_S_30 as
having 5 data members, a no-parameters constructor and a processing
method. The `soap_dt_define()` call maps the SO_S_30 to a schema type
SOAPStruct which also has 5 data members and makes that schema type
available to SOAP. Now we create a SOAP exposed stored procedure:

``` programlisting
create procedure echoSOAPStructSch (
    in sst SO_S_30 __soap_type 'services.wsdl:SOAPStruct')
returns SO_S_30 __soap_type 'services.wsdl:SOAPStruct'
{
  declare processingResult nvarchar;
  processingResult := sst.process_data ();
  return sst;
};
```

When processing the SOAP request for calling that stored procedure, the
SOAP server will call the default constructor for SO_S_30 (require to
create the empty instance) and will fill up the values from the incoming
XML fragment for the sst parameter to the members of the newly created
SO_S_30 instance. Then it will pass that instance as a value for the sst
parameter of the echoSOAPStructSch function. As a result
echoSOAPStructSch will correctly execute the member function
process_data. Then it will return the (possibly) modified SO_S_30
instance to the SOAP server. The SOAP server will make the XML fragment
for the return value based on the SOAPStruct schema fragment using the
values from the SO_S_30 members.

This approach allows easy migration for the existing SOAP services using
structures. To upgrade a SOAP service procedure to use user defined
types one should define the types and add the additional argument to
`SOAP_DT_DEFINE()` .

For developing new SOAP services, however, it is redundant to create the
schema fragment in addition to creating the user defined type to hold
the SOAP structure.

For this reason, Virtuoso offers a second approach in using user defined
types in SOAP.

</div>

<div id="udtsoapudt" class="section">

<div class="titlepage">

<div>

<div>

#### Using the User Defined Type Definition

</div>

</div>

</div>

Consider the altered definition of SO_S_30 as follows:

``` programlisting
create type SO_S_30
  as (
      varString nvarchar __soap_type 'string' __soap_name 'varString',
      "varInt" integer __soap_type 'int',
      "varFloat" real __soap_type 'float',
      "processingResult" nvarchar __soap_type 'string',
      "vmVersion" nvarchar)
  __soap_type 'services.wsdl:SOAPStruct'
  constructor method SO_S_30 (),
  method process_data () returns nvarchar;
```

and the procedure echoSOAPStructSch as:

``` programlisting
create procedure echoSOAPStructSch (in sst SO_S_30) returns SO_S_30
{
  declare processingResult nvarchar;
  processingResult := sst.process_data ();
  return sst;
};
```

Now all we have to do is expose the echoSOAPStructSch in a SOAP service.
The SOAP server will take into account the fact that the sst type and
the return type are user defined types and automatically make the WSDL
description (including the schema fragments) and will correctly process
the incoming XML.

The SOAP names and data type names inside the user defined type
definition are optional and default to the SQL member's name for names
and employ a straight mapping of the PL types to the SOAP types for data
types.

</div>

</div>
