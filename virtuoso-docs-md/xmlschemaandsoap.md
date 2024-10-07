<div id="xmlschemaandsoap" class="section">

<div class="titlepage">

<div>

<div>

### 15.7.5. XML Schema & SOAP

</div>

</div>

</div>

The XML Schema defines primitive types, such as "integer","string" and
"float". Users may extend or restrict the primitive types to build their
own type system. For example, a type "monthCode" could be an enumerated
list of three character strings corresponding to JAN, FEB, etc... SOAP
types can use any of these types: native, primitive XML Schema types or
complex types which should be fully described using XML Schema.

SOAP messages that use XML Schema types or complex types contain a
fragment of XML Schema or a reference to a schema file so that the data
types can be determined and messages validated.

The Virtuoso tutorials contain many examples from the SOAP Interop test
suite. Each tutorial displays both the request message and response
message from the server when the tests are executed. Below is a sample
message exchange of the echoStruct tutorial (SO-S-20) which uses a
trivial complex struct composed of an integer, float and a string:

<div id="ex_schemaandsoap" class="example">

**Example 15.21. Sample Run of Tutorial SO-S-20**

<div class="example-contents">

Struct parameter inputs:

``` programlisting
 varString = hello
 varInt = 42
 varFloat = 99.004997253418
```

Return value:

``` programlisting
 varString = hello
 varInt = 42
 varFloat = 99.004997253418
```

Request message:

``` programlisting
<?xml version='1.0' ?>
<SOAP:Envelope
    SOAP:encodingType='http://schemas.xmlsoap.org/soap/encoding/'
    xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'
    xmlns:xsd='http://www.w3.org/2001/XMLSchema'
    xmlns:SOAP='http://schemas.xmlsoap.org/soap/envelope/'
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"  xmlns:dt='urn:schemas-microsoft-com:datatypes'>
  <SOAP:Body>
    <cli:echoStruct SOAP:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'
        xmlns:cli='http://soapinterop/' >
      <inputStruct>
        <varInt xsi:type="xsd:int" dt:dt="int">42</varInt>
        <varFloat xsi:type="xsd:float" dt:dt="float">99.004997</varFloat>
        <varString xsi:type="xsd:string" dt:dt="string">hello</varString>
      </inputStruct>
    </cli:echoStruct>
  </SOAP:Body>
</SOAP:Envelope>
```

Response message:

``` programlisting
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<SOAP-ENV:Envelope
    xmlns:SOAPSDK1="http://www.w3.org/2001/XMLSchema"
    xmlns:SOAPSDK2="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:SOAPSDK3="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP-ENV:Body SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <SOAPSDK4:echoStructResponse
        xmlns:SOAPSDK4="http://soapinterop/">
      <Result href="#id1"/>
    </SOAPSDK4:echoStructResponse>
    <SOAPSDK5:SOAPStruct
        xmlns:SOAPSDK5="http://soapinterop.org/xsd"

xml:id="id1" SOAPSDK3:root="0"
        SOAPSDK2:type="SOAPSDK5:SOAPStruct">
      <varString>hello</varString>
      <varInt>42</varInt>
      <varFloat>99.004997253418</varFloat>
    </SOAPSDK5:SOAPStruct>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="ch-webservices.html#dtschsoaps" class="link"
title="17.1.3. Extending Datatypes for SOAP Objects">Extending SOAP
Types</a></p>
<p><a href="ch-webservices.html#soapdoclitenc1" class="link"
title="17.1.18. Document Literal Encoding">SOAP Literal
Encodings</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
