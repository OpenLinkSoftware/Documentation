<div id="uddiexamples" class="section">

<div class="titlepage">

<div>

<div>

### 17.12.6. Examples

</div>

</div>

</div>

<div id="ex_uddi_genfind" class="example">

**Example 17.40. Generic Find**

<div class="example-contents">

Finds all registry entries for names beginning with 'M':

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<name>M</name>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_findbyname1" class="example">

**Example 17.41. Find By Name 1**

<div class="example-contents">

Find by name with sort options by name and date, both ascending:

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<findQualifiers>
<findQualifier>sortByNameAsc</findQualifier>
<findQualifier>sortByDateAsc</findQualifier>
</findQualifiers>
<name></name>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_findbyname2" class="example">

**Example 17.42. Find By Name 2**

<div class="example-contents">

Find by name, sorted by name descending and date ascending:

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<findQualifiers>
<findQualifier>sortByNameDesc</findQualifier>
<findQualifier>sortByDateAsc</findQualifier>
</findQualifiers>
<name></name>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_findbynameematch" class="example">

**Example 17.43. Find By Name 3**

<div class="example-contents">

Find by exact name match, case-sensitive, and sorted by name and date
ascending:

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<findQualifiers>
<findQualifier>exactNameMatch</findQualifier>
<findQualifier>caseSensitiveMatch</findQualifier>
<findQualifier>sortByNameAsc</findQualifier>
<findQualifier>sortByDateAsc</findQualifier>
</findQualifiers>
<name>Microsoft Corporation</name>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_findbyidbay" class="example">

**Example 17.44. Find By *`identifierBag `* Element 'DUNS':**

<div class="example-contents">

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<findQualifiers>
<findQualifier>exactNameMatch</findQualifier>
<findQualifier>caseSensitiveMatch</findQualifier>
<findQualifier>sortByNameAsc</findQualifier>
<findQualifier>sortByDateAsc</findQualifier>
</findQualifiers>
<identifierBag>
<keyedReference keyName="D-U-N-S" keyValue="08-146-6849"
  tModelKey="UUID:8609C81E-EE1F-4D5A-B202-3EB13AD01823"/>
</identifierBag>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_findbytmodel" class="example">

**Example 17.45. Find by *`tModel `***

<div class="example-contents">

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<findQualifiers>
<findQualifier>exactNameMatch</findQualifier>
<findQualifier>caseSensitiveMatch</findQualifier>
<findQualifier>sortByNameAsc</findQualifier>
<findQualifier>sortByDateAsc</findQualifier>
</findQualifiers>
<tModelBag>
<tModelKey>UUID:68DE9E80-AD09-469D-8A37-088422BFBC36</tModelKey>
</tModelBag>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_findbydiscovery" class="example">

**Example 17.46. Find by discovery URL**

<div class="example-contents">

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<find_business xmlns="urn:uddi-org:api" generic="1.0">
<findQualifiers>
<findQualifier>exactNameMatch</findQualifier>
<findQualifier>caseSensitiveMatch</findQualifier>
<findQualifier>sortByNameAsc</findQualifier>
<findQualifier>sortByDateAsc</findQualifier>
</findQualifiers>
<discoveryURLs>
<discoveryURL>
http://uddi.microsoft.com/discovery?businessKey=D94B25A4-BD6D-4426-AEAC-1087DCC21421
</discoveryURL>
</discoveryURLs>
</find_business>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_getauth" class="example">

**Example 17.47. Get authentication token**

<div class="example-contents">

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<get_authToken xmlns="urn:uddi-org:api" generic="1.0">
<userID>dav</userID>
<cred>dav</cred>
</get_authToken>
</Body>
</Envelope>');
```

</div>

</div>

  

<div id="ex_uddi_discardauth" class="example">

**Example 17.48. Discard Authentication Token**

<div class="example-contents">

``` programlisting
select http_get ('http://example.com/SOAP', null, 'POST',
  'Content-Type: text/xml\r\nSOAPAction: ""',
  '<?xml version="1.0" encoding="UTF-8"?>
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
<Body>
<discard_authToken xmlns="urn:uddi-org:api" generic="1.0">
<authInfo>71255ffc5b0a22b4699bfcee74cba97f</authInfo>
</discard_authToken>
</Body>
</Envelope>');
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                         |
|:--------------------------:|:------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                               |
|                            | <a href="uddischema.html" class="link" title="23.6.6. UDDI Schema">UDDI 
                              System Tables</a>                                                        |

</div>

</div>
