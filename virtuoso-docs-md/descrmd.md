<div>

<div>

<div>

<div>

### 1.5.28. How does default describe mode work?

</div>

</div>

</div>

The default describe mode works only if subject has a type/class. To get
any anonymous subject described CBD mode should be used:

``` programlisting
$ curl -i -L -H "Accept: application/rdf+xml" http://lod.openlinksw.com/describe/?url=http%3A%2F%2Fwww.mpii.de%2Fyago%2Fresource%2FEddie%255FMurphy
HTTP/1.1 303 See Other
Date: Mon, 21 Mar 2011 14:24:36 GMT
Server: Virtuoso/06.02.3129 (Linux) x86_64-generic-linux-glibc25-64  VDB
Content-Type: text/html; charset=UTF-8
Accept-Ranges: bytes
TCN: choice
Vary: negotiate,accept,Accept-Encoding
Location: http://lod.openlinksw.com/sparql?query=%20DESCRIBE%20%3Chttp%3A%2F%2Fwww.mpii.de%2Fyago%2Fresource%2FEddie%255FMurphy%3E&format=application%
2Frdf%2Bxml
Content-Length: 0

HTTP/1.1 200 OK
Date: Mon, 21 Mar 2011 14:24:37 GMT
Server: Virtuoso/06.02.3129 (Linux) x86_64-generic-linux-glibc25-64  VDB
Accept-Ranges: bytes
Content-Type: application/rdf+xml; charset=UTF-8
Content-Length: 467967

<?xml version="1.0" encoding="utf-8" ?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
<rdf:Description rdf:about="http://www.mpii.de/yago/resource/MTV%5FMovie%5FAward%5Ffor%5FBest%5FComedic%5FPerformance"><n0pred:hasInternalWikipediaLinkTo xmlns:n0pred="http://www.mpii.de/yago/resource/" rdf:resource="http://www.mpii.de/yago/resource/Eddie%5FMurphy"/></rdf:Description>
<rdf:Description rdf:about="http://www.mpii.de/yago/resource/#fact_23536547421"><rdf:subject rdf:resource="http://www.mpii.de/yago/resource/Eddie%5FMurphy"/></rdf:Description>
<rdf:Description rdf:about="http://www.mpii.de/yago/resource/#fact_23536896725"><rdf:object rdf:resource="http://www.mpii.de/yago/resource/Eddie%5FMurphy"/></rdf:Description>
...
```

</div>
