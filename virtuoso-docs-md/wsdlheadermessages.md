<div id="wsdlheadermessages" class="section">

<div class="titlepage">

<div>

<div>

### 17.2.4. WSDL Descriptions of SOAP Header Messages

</div>

</div>

</div>

The Virtuoso web server automatically generates WSDL descriptions for
procedures exposed as SOAP messages, and those exposed to have
parameters bound to SOAP Header messages.

Consider the sample of the Interop.INTEROP.echoVoid procedure defined as
an example in the SOAP section as:

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

The WSDL description will now contain the header messages also. No extra
user intervention is required. The WSDL file that will result will look
like:

``` programlisting
 ......... WSDL excerpt (consider http://[host:port]/Interop/services.wsdl of an demo DB) ............
    <message name="echoVoidRequest"></message>
    <message name="echoVoidResponse"></message>
    <message name="echoVoidechoMeStringRequest">
        <part name="echoMeStringRequest" type="xsd:string" />
    </message>
    <message name="echoVoidechoMeStringResponse">
        <part name="echoMeStringResponse" type="xsd:string" />
    </message>
 ........ in bindings section note the soap:header sections.............
    <operation name="echoVoid">
    <soap:operation soapAction="http://soapinterop.org/" />
    <input>
    <soap:body use="encoded" namespace="http://soapinterop.org/" encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" />
    <soap:header use="encoded" message="tns:echoVoidechoMeStringRequest" part="echoMeStringRequest" namespace="http://soapinterop.org/echoheader/" encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" />
    </input>
    <output>
    <soap:body use="encoded" namespace="http://soapinterop.org/" encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" />
    <soap:header use="encoded" message="tns:echoVoidechoMeStringResponse" part="echoMeStringResponse" namespace="http://soapinterop.org/echoheader/" encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" />
    </output>
    </operation>
 ........more..........
 
```

</div>
