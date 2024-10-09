<div>

<div>

</div>

<div>

## Name

soap_client — Invoke a SOAP service and returns result value.

</div>

<div>

## Synopsis

<div>

|                          |                                               |
|--------------------------|-----------------------------------------------|
| ` `**`soap_client`**` (` | in `url ` varchar ,                           |
|                          | in `operation ` varchar ,                     |
|                          | in `target_namespace ` varchar default null , |
|                          | in `parameters ` any default null ,           |
|                          | in `headers ` any default null ,              |
|                          | in `soap_action ` varchar default '' ,        |
|                          | in `attachments ` any default null ,          |
|                          | in `ticket ` any default null ,               |
|                          | in `passwd ` varchar default null ,           |
|                          | in `user_name ` varchar default null ,        |
|                          | in `user_password ` varchar default null ,    |
|                          | in `auth_type ` varchar default 'none' ,      |
|                          | in `security_type ` varchar default null ,    |
|                          | in `debug ` integer default 0 ,               |
|                          | in `template ` varchar default null ,         |
|                          | in `style ` integer default 0 ,               |
|                          | in `version ` integer default 11 ,            |
|                          | in `direction ` integer default 0 ,           |
|                          | in `http_header ` varchar default null ,      |
|                          | in `security_schema ` any default null ,      |
|                          | in `time_out ` int default 100 `)`;           |

<div>

 

</div>

</div>

</div>

<div>

## Description

This will invoke the specified SOAP service.

</div>

<div>

## Parameters

<div>

### url

The target SOAP service endpoint URL. For SSL connections this must
begin with 'https:' schema.

</div>

<div>

### operation

The name of the SOAP method to be invoked.

</div>

<div>

### target_namespace

The namespace of the SOAP request.

</div>

<div>

### parameters

parameters contained inside a vector in one of two ways:

vector ("name", "value" ....)

or

vector (vector ("name", "type") , "value" ....)

The second way is used when parameters are complex datatypes, or in
other words "value" datatype will be validated and encoded following
rules for "type" specified. This means that string "value" for example
could not be passed and error will be generated if "type" is specified
to be 'int' for example. Also this is a way to pass user defined XSD
types to SOAP server.

</div>

<div>

### headers

the parameters to be printed in SOAP header element. They are contained
inside a vector in following way:

vector (vector ("name", "type", \[mustUnderstand-0/1\], \[SOAP:actor
attribute value\]) , "value" ....)

The mustUnderstand and actor value may be omitted. Also in the case of
special type '\_\_XML\_\_' the parameter value will be expected to be an
XML entity, hence in that way we can put in a Header any content.

The rules for datatype of "value" are same as for 'parameters' parameter
(see above).

</div>

<div>

### soap_action

The exact value of the SOAPAction header attribute.

</div>

<div>

### attachments

DIME/MIME message attachments as array of (id, type, content)

</div>

<div>

### ticket

The key instance to perform XML signature and encryption for outgoing
SOAP message. Or path to PKCS#12 file containing x509 certificate to
perform secure connection over SSL with server's certificate
verification. To indicate to use SSL for connection encryption only,
then a number as string greater than 0 must be specified (i.e. '1').

</div>

<div>

### passwd

The password for opening the x509 certificate specified in 'ticket'.

</div>

<div>

### user_name

name for basic/digest HTTP authentication.

</div>

<div>

### user_password

The password for basic/digest HTTP authentication.

</div>

<div>

### auth_type

The type of authentication to use. Valid types are:

|                                                                                             |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*none* </span> do not perform authentication or encryption. Default. |
| <span class="emphasis">*digest* </span> perform digest HTTP authentication.                 |
| <span class="emphasis">*basic* </span> perform basic HTTP authentication.                   |
| <span class="emphasis">*key* </span> encrypt/and sign the message.                          |
| <span class="emphasis">*x509* </span> sign the message using x509 certificate.              |

</div>

<div>

### security_type

This parameter governs the security method of the outgoing messages.
Valid values are "encrypt" or "sign", to encrypt the message or sign it
only.

</div>

<div>

### debug

If this flag is set to 1 then debug mode will be enabled. When enabled
the returned message will be an array of 3 elements consisting of the
request, response, and error if one occurred.

</div>

<div>

### template

The content of an XML signature template. If the default template is to
be used only "\[key reference for signing\]" (note '\[\]' around name).
need be specified. The server will generate a default template based on
the key and default rules for making a signature.

</div>

<div>

### style

This is a bit-mask parameter that is used to specify the outgoing
message format. The mask relies on the following values:

<div>

- <span class="emphasis">*0* </span> RPC-encoded SOAP message

- <span class="emphasis">*1* </span> Document/Literal (free-form)
  encoded SOAP message

- <span class="emphasis">*4* </span> Document/Literal encoded SOAP
  message with wrapped parameters

- <span class="emphasis">*8* </span> outgoing message will be DIME
  encoded

- <span class="emphasis">*0x10* </span> element form default, if
  supplied the Document/Literal with wrapped parameters outgoing message
  will be qualified. applicable to Document/Literal encoded SOAP
  messages only.

- <span class="emphasis">*0x20* </span> SOAP to XML-RPC translation
  filter

- <span class="emphasis">*0x40* </span> return parsed SOAP response
  Envelope

- <span class="emphasis">*0x80* </span> do not signal of SOAP Fault
  response, return fault as result

- <span class="emphasis">*0x100* </span> do not send response to server,
  just return the request to be sent

- <span class="emphasis">*0x200* </span> outgoing message will be MIME
  encoded

- <span class="emphasis">*2* </span> advanced mode : output will consist
  of vector of 5 items as:

  |                                                                                                      |
  |------------------------------------------------------------------------------------------------------|
  | parsed response - XML tree of the SOAP response                                                      |
  | outgoing message (wire dump) - string representing the SOAP request                                  |
  | incoming message - string representing the SOAP response from server                                 |
  | error if any - a vector of code, SQL code and SQL message describing the error                       |
  | attachments if any - an array of SOAP attachments, structure is same as for 'attachments' parameter. |

</div>

</div>

<div>

### version

the SOAP version used in call (SOAP 1.0 = 1, SOAP 1.1 = 11, SOAP 1.2 =
12). Default value = SOAP 1.1.

</div>

<div>

### direction

This flag if turned on (1) then one-way messages will be sent. In that
case client doesn't expect response from SOAP server, except HTTP
headers.

</div>

<div>

### http_header

This parameter is used to include custom HTTP headers in the SOAP POST
request. The usual purpose of it to pass special 'X-\<extension name\>'
header to server in order to send data that can't be included in SOAP
message. For example this could be used for loop-to-self detection when
replicating data collection(s) via SOAP.

</div>

<div>

### security_schema

This parameter is used to designate version of WS-Security and
WS-Utility protocol to be used when secure SOAP calls will be made. The
value is an array containing name/value pairs for 'wsse' (WS-Security)
and 'wsu' (WS-Utility) namespace URLs. An example of the value is:
vector ('wsse', WSSE_OASIS_URI, 'wsu', WSSU_OASIS_URI).

</div>

<div>

### time_out

The connection timeout. Elapsing this value and having no response from
server will cause client to disconnect with an connection error.

</div>

</div>

<div>

## Return Types

The function will return a XML tree of the SOAP response in simple mode.
Also if one-way message is sent and no body from the SOAP server, then
NULL will be returned. When advanced mode is set i.e. 'style' have
second bit set, then response will be as described earlier in 'style'
parameter description.

</div>

<div>

## Requirements for certificate files for HTTPS operation

When users going to do operation with an HTTPS endpoint the following
are requirements to the PKCS#12 file. The file specified in parameter
'ticket' MUST contain: valid x509 certificate, certificate chain and
private key. The password for opening the private key must be specified
in the 'passwd' parameter. How client and server certificates and
private keys are created are not subject of this document. Also see Web
server documentation about how to run an HTTPS listener.

</div>

<div>

## Example

<div>

**Example 24.383. **

<div>

References: tutorial/services WS-S-2 (triple-des), WS-S-3 (RSA), WS-S-4
(X.509 signing)

The following is an excerpt from the WS-S-2 Services tutorial to make
encoded SOAP message with a shared key.

``` programlisting
resp :=
    SOAP_CLIENT (
      url=>'http://example.com/SecureWebServices',
      operation=>'AddInt',
      parameters=>vector (vector ('a', 'int'), 3, vector ('b', 'int'), 4),
      auth_type=>'key',
      ticket=>xenc_key_inst_create ('WSDK Sample Symmetric Key'),
      security_type=>'encrypt',
      target_namespace=>'http://temp.uri/',
      soap_action=>'"http://temp.uri/#AddInt"',
      style=>6);
```

This will produce following SOAP message:

The encoded SOAP request

``` programlisting
------------ REQUEST ------------------
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"
          encodingType="http://schemas.xmlsoap.org/soap/encoding/" >
  <Header xmlns="http://schemas.xmlsoap.org/soap/envelope/" >
    <Security xmlns="http://schemas.xmlsoap.org/ws/2002/07/secext" >
      <ReferenceList xmlns="http://www.w3.org/2001/04/xmlenc#" >
        <DataReference xmlns="http://www.w3.org/2001/04/xmlenc#"
         URI="#Id-6831bf5c-f4dc-d611-bb59-90b4c67d3be5" />
      </ReferenceList>
    </Security>
  </Header>
  <Body xmlns="http://schemas.xmlsoap.org/soap/envelope/">
      <EncryptedData xmlns="http://www.w3.org/2001/04/xmlenc#"
                   Type="http://www.w3.org/2001/04/xmlenc#Content"

xml:id="id-6831bf5c-f4dc-d611-bb59-90b4c67d3be5" >
      <EncryptionMethod xmlns="http://www.w3.org/2001/04/xmlenc#"
                      Algorithm="http://www.w3.org/2001/04/xmlenc#tripledes-cbc" />
      <KeyInfo xmlns="http://www.w3.org/2000/09/xmldsig#" >
         <KeyName xmlns="http://www.w3.org/2000/09/xmldsig#" >WSDK Sample Symmetric Key</KeyName>
      </KeyInfo>
      <CipherData xmlns="http://www.w3.org/2001/04/xmlenc#" >
        <CipherValue xmlns="http://www.w3.org/2001/04/xmlenc#" >s8YHzbGSxsgfslN6
        eJu7UeiTExKeqwCHrqFml24C6mY8SLxhNE0Vy6xBuS50uchjbupjE4Z8EtkSuyljR8mkpmrW
        GCfUQEvrW7iu1ji0j4XR7m5P4dgxh7RYwqxqoprwTnCZ9b6X9D/UpN0aAYVdNs+S6l2Rw56d
        s5Gf4sv2f/sTYpEHTYPReqyo+9LSm9CsbtlPXia9djkH+75PUtsKZXZvHnVfHICQGjBJPpsh
        eE7Dq7mt8AkKVQ==</CipherValue>
       </CipherData>
    </EncryptedData>
  </Body>
</Envelope>
---------------------------------------
```

Server approves the request and returns an unencrypted message. This
shows one-way encoding only.

``` programlisting
------------ RESPONSE -----------------
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"
          encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" >
  <Body xmlns="http://schemas.xmlsoap.org/soap/envelope/" >
    <AddIntResponse xmlns="http://temp.uri/" >
      <CallReturn type="http://www.w3.org/2001/XMLSchema:int" >7</CallReturn>
    </AddIntResponse>
  </Body>
</Envelope>
---------------------------------------
```

</div>

</div>

  

<div>

**Example 24.384. Adding a SOAP:Header**

<div>

This example makes call to the interop round4 test echoVoidSoapHeader
(exists in the demo DB). Request and response wire dumps are listed
below PL code excerpt.

``` programlisting
     ...
     resp := soap_client (url=>url, operation=>'echoVoidSoapHeader',
                  parameters=>vector(),
                      headers=>vector(
                vector('echoMeStringRequest',
                       'http://soapinterop.org/:echoMeStringRequest',
                   1,
                   'http://schemas.xmlsoap.org/soap/actor/next') ,
                           vector('String')),
                  style=>7,
              soap_action=>'"http://soapinterop.org"',
              target_namespace=>'http://soapinterop.org'
              );
     ...
```

This will produce the following SOAP message:

The SOAP request

``` programlisting
<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"
 xmlns:ns1="http://soapinterop.org/echoheader/"
 xmlns:ns0="http://soapinterop.org/">
   <SOAP:Header>
     <ns0:echoMeStringRequest SOAP:mustUnderstand='1' SOAP:actor='http://schemas.xmlsoap.org/soap/actor/next'>
       <ns1:varString>String</ns1:varString>
     </ns0:echoMeStringRequest>
   </SOAP:Header>
   <SOAP:Body>
     <echoVoidSoapHeader xmlns='http://soapinterop.org' ></echoVoidSoapHeader>
   </SOAP:Body>
</SOAP:Envelope>
```

And will receive the SOAP server response:

``` programlisting
<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"
  xmlns:ns2="http://soapinterop.org/echoheader/"
  xmlns:ns1="http://soapinterop.org/"
  xmlns:ns0="http://soapinterop.org">
  <SOAP:Header>
    <ns1:echoMeStringResponse>
      <ns2:varString>String</ns2:varString>
    </ns1:echoMeStringResponse>
  </SOAP:Header>
  <SOAP:Body>
    <ns1:echoVoidSoapHeaderResponse />
  </SOAP:Body>
</SOAP:Envelope>
```

</div>

</div>

  

<div>

**Example 24.385. Performing SOAP call over secure connection**

<div>

The example code below makes a simple 'upper-case' service, exposes it
under secured endpoint and invoke with x509 certificate. Note that
default HTTPS listener MUST be enable in the INI file. Also the cli5.p12
certificate file MUST exists in server working directory.

``` programlisting
SQL> create procedure
  WS.SOAPDEMO.SOAPTEST (in par varchar)
{
  return (upper(par));
};

SQL> grant execute on WS.SOAPDEMO.SOAPTEST to SOAPDEMO;

SQL> VHOST_DEFINE (vhost=>'*sslini*',lhost=>'*sslini*',lpath=>'/secure',
 ppath=>'/SOAP/',soap_user=>'SOAPDEMO');

-- SSL connection with server's certificate verification
SQL> select xpath_eval ('//CallReturn/text()', xml_tree_doc (
    soap_client (url=>'https://localhost:4443/secure',
    operation=>'SOAPTEST', parameters=>vector('par', 'demotext'),
    ticket=>'cli5.p12', passwd=>'secret')));
-- SSL connection only, no certificate verification
SQL> select xpath_eval ('//CallReturn/text()', xml_tree_doc (
    soap_client (url=>'https://localhost:4443/secure',
    operation=>'SOAPTEST', parameters=>vector('par', 'demotext'),
    ticket=>'1')));
-- response
callret
VARCHAR
_______________________________________________________________________________

DEMOTEXT
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="vwsssectemplates.html" class="link"
title="17.5.5. Signature Templates">Signature Templates</a>

</div>

</div>
