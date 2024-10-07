<div id="fn_soap_call" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_call — calls a function from a SOAP server and returns the result.
value; deprecated, use SOAP_CLIENT () instead

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_call" class="funcsynopsis">

|                           |                                            |
|---------------------------|--------------------------------------------|
| `any `**`soap_call`**` (` | in `host ` string ,                        |
|                           | in `path ` string ,                        |
|                           | in `methodURI ` string ,                   |
|                           | in `methodName ` string ,                  |
|                           | in `params ` array of (ParamName, Value) , |
|                           | in `version ` integer ,                    |
|                           | in `certificate ` varchar ,                |
|                           | in `password ` varchar ,                   |
|                           | in `SOAPAction ` varchar `)`;              |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_call" class="refsect1">

## Description

This calls a function from a SOAP server and returns the result as a
return value. Params is an array of (Parameter name, Value) pairs
representing the parameters passed in the SOAP call. Each of these pairs
become an XML sub-entity of the procedure entity. The return value of
the function is the entity inside the SOAP body of the response. In
debug mode the return value is an array of 3 elements; the non-debug
return value (if any) as element 0, the XML text of the request as
element 1 and the XML text of the server response as element 2. This
function does not use any XML types when creating the XML. It represents
types as a cast to varchar would, with one exception - dates and times
according to ISO8061.

The Virtuoso SOAP client can work with complex datatypes, in which case
the parameters array must conform to the following convention:

``` programlisting
vector ( vector ([name1], [type1]), value1, vector ([name2], [type2]), value2 ...)
```

This will cause type checking and validation of the values to be encoded
for SOAP request.

</div>

<div id="params_soap_call" class="refsect1">

## Parameters

<div id="id110465" class="refsect2">

### host

DNS name or IP address of the SOAP server

</div>

<div id="id110468" class="refsect2">

### path

path into the HTTP server containing the SOAP server page

</div>

<div id="id110471" class="refsect2">

### methodURI

URI of the SOAP method being called

</div>

<div id="id110474" class="refsect2">

### methodName

Name of the SOAP method being called

</div>

<div id="id110477" class="refsect2">

### params

array of parameters to the SOAP call; array of (ParamName, Value). The
Virtuoso SOAP client can work with complex datatypes. In order to
support this the parameters array must conform to the following
convention: vector ( vector (\[name1\], \[type1\]), value1, vector
(\[name2\], \[type2\]), value2 ...). This will cause type checking and
validation of the values to be encoded for SOAP request.

</div>

<div id="id110480" class="refsect2">

### version

the SOAP version used in call (SOAP 1.0 = 1, SOAP 1.1 = 11). Default
value = SOAP 1.0. If the value is negated : i.e. -1 or -11 then the
soap_call procedure enters "debug" mode

</div>

<div id="id110483" class="refsect2">

### certificate

If this parameter is specified (string or null) the HTTPS operation will
be performed. Path to the HTTPS client certificate in PKCS#12 format, if
this parameter is set to NULL then client will do only encrypted
connection.

</div>

<div id="id110486" class="refsect2">

### password

If certificate is supplied this parameter must contain password for
opening the certificate file.

</div>

<div id="id110489" class="refsect2">

### SOAPAction

SOAPAction parameter can be used to make SOAPAction header value
explicit. Normally this is taken from the namespace URI and SOAP method
name.

</div>

</div>

<div id="examples_soap_call" class="refsect1">

## Examples

<div id="vdocs-soapclient-01" class="example">

**Example 24.382. Calling a SQL procedure fishselect (in str varchar)**

<div class="example-contents">

``` programlisting
declare ret any;
ret := soap_call ('example.com', '/SOAP',
     'urn:com-openlinksw-virtuoso',
     'fishselect',
     vector ('str', 'G'));
```

</div>

</div>

  

</div>

</div>
