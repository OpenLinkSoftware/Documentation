<div id="vwsssectemplates" class="section">

<div class="titlepage">

<div>

<div>

### 17.5.5. Signature Templates

</div>

</div>

</div>

Signature templates are used to define how signatures are generated for
SOAP messages. They are XML files containing a structure of Signature
elements as per XML Signature standard. The DigestValue and
SignatureValue elements are empty, so they will be filled upon output.
The most important element is the KeyName element. This must contain a
reference to an existing key from the user account space. This key
reference does not need to be the same as key for data encryption, it
can be a different key. Please note that XML encoding routines will
resolve the key automatically, so there is no need to specify how the
key instance will be obtained, hence no relation to "WSS-Key" from SOAP
options section (above).

<div id="vwssdefaulttemplate" class="section">

<div class="titlepage">

<div>

<div>

#### Default Template Generation

</div>

</div>

</div>

The default template will create an XML Signature using the following
definitions:

a\) have a simple template corresponding to a key reference (and it's
algorithm) as:

``` programlisting
TEMP := <?xml version="1.0" encoding="UTF-8"?>
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#" >
  <SignedInfo>
    <CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" />
    <SignatureMethod Algorithm="[key algorithm]" />
  </SignedInfo>
  <SignatureValue></SignatureValue>
  <KeyInfo>
    <KeyName>[key reference]</KeyName>
  </KeyInfo>
</Signature>'
```

b\) generate references to template a), using the `dsig_template_ext()`
function and BODY of the SOAP request.

``` programlisting
TEMPLATE :=  dsig_template_ext (xtree_doc (SOAP_BODY), TEMP,
      'http://schemas.xmlsoap.org/soap/envelope/', 'Body',
      'http://schemas.xmlsoap.org/rp', 'action',
      'http://schemas.xmlsoap.org/rp', 'to',
      'http://schemas.xmlsoap.org/rp', 'id',
      'http://schemas.xmlsoap.org/ws/2002/07/utility', 'Created',
      'http://schemas.xmlsoap.org/ws/2002/07/utility', 'Expires');
```

In other words, the 'Body' of the SOAP message, part of the routing
header elements ('action,'to','id') and, if it exists, Timestamp headers
('Created', 'Expires').

<div id="vwssusingdefaulttemplate" class="example">

**Example 17.28. Using default templates**

<div class="example-contents">

This example demonstrates the use of the default template mechanism and
X.509 certificate with RSA key:

``` programlisting
--------------- SOAP message
<SOAP:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema"
 xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"
 xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
 xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
 xmlns:xenc="http://www.w3.org/2001/04/xmlenc#"
 xmlns:wsse="http://schemas.xmlsoap.org/ws/2002/07/secext"
 xmlns:dt="urn:schemas-microsoft-com:datatypes">
  <SOAP:Header />
  <SOAP:Body
xml:id="id-2e7c29c7-8645-4ad8-af59-06bed179d2fb">
    <AddInt xmlns="http://microsoft.com/wsdk/samples/SumService">
      <a>3</a>
      <b>4</b>
    </AddInt>
  </SOAP:Body>
</SOAP:Envelope>

--------------- Generated signature template
<ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
          xmlns:wsse="http://schemas.xmlsoap.org/ws/2002/07/secext"
          xmlns:wsu="http://schemas.xmlsoap.org/ws/2002/07/utility">
   <ds:SignedInfo>
      <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">
      </ds:CanonicalizationMethod>
      <ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"></ds:SignatureMethod>
      <ds:Reference URI="#Id-2e7c29c7-8645-4ad8-af59-06bed179d2fb">
        <ds:Transforms>
      <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">
        </ds:Transform>
      </ds:Transforms>
    <ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"></ds:DigestMethod>
    <ds:DigestValue></ds:DigestValue>
      </ds:Reference>
   </ds:SignedInfo>
   <ds:SignatureValue></ds:SignatureValue>
    <ds:KeyInfo>
      <wsse:SecurityTokenReference>
        <wsse:Reference URI="#SecurityToken-24c152e3-26e0-d611-bb59-90b4c67d3be5"></wsse:Reference>
      </wsse:SecurityTokenReference>
    </ds:KeyInfo>
</ds:Signature>
```

Now, an example of a user defined template:

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
    <SignedInfo>
      <CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" />
      <SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#dsa-sha1" />
      <Reference URI="">
        <Transforms>
          <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" />
        </Transforms>
        <DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />
        <DigestValue></DigestValue>
      </Reference>
    </SignedInfo>
    <SignatureValue></SignatureValue>
    <KeyInfo>
        <KeyName>file:dsa.der</KeyName>
    </KeyInfo>
</Signature>
```

</div>

</div>

  

</div>

</div>
