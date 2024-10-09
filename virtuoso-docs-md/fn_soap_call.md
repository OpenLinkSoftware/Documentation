<div>

<div>

</div>

<div>

## Name

soap_call — calls a function from a SOAP server and returns the result.
value; deprecated, use SOAP_CLIENT () instead

</div>

<div>

## Synopsis

<div>

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

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### host

DNS name or IP address of the SOAP server

</div>

<div>

### path

path into the HTTP server containing the SOAP server page

</div>

<div>

### methodURI

URI of the SOAP method being called

</div>

<div>

### methodName

Name of the SOAP method being called

</div>

<div>

### params

array of parameters to the SOAP call; array of (ParamName, Value). The
Virtuoso SOAP client can work with complex datatypes. In order to
support this the parameters array must conform to the following
convention: vector ( vector (\[name1\], \[type1\]), value1, vector
(\[name2\], \[type2\]), value2 ...). This will cause type checking and
validation of the values to be encoded for SOAP request.

</div>

<div>

### version

the SOAP version used in call (SOAP 1.0 = 1, SOAP 1.1 = 11). Default
value = SOAP 1.0. If the value is negated : i.e. -1 or -11 then the
soap_call procedure enters "debug" mode

</div>

<div>

### certificate

If this parameter is specified (string or null) the HTTPS operation will
be performed. Path to the HTTPS client certificate in PKCS#12 format, if
this parameter is set to NULL then client will do only encrypted
connection.

</div>

<div>

### password

If certificate is supplied this parameter must contain password for
opening the certificate file.

</div>

<div>

### SOAPAction

SOAPAction parameter can be used to make SOAPAction header value
explicit. Normally this is taken from the namespace URI and SOAP method
name.

</div>

</div>

<div>

## Examples

<div>

**Example 24.382. Calling a SQL procedure fishselect (in str varchar)**

<div>

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
