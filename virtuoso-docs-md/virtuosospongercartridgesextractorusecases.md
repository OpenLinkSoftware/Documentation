<div id="virtuosospongercartridgesextractorusecases" class="section">

<div class="titlepage">

<div>

<div>

### 16.10.7. RDF Cartridges Use Cases

</div>

</div>

</div>

This section contains examples of Web resources which can be transformed
by RDF Cartridges. It also states where additional setup for given
cartridges is needed i.e. keys account names etc.

<span class="emphasis">*Service based:*</span>

<div class="itemizedlist">

- amazon

  ``` programlisting
  needs: api key
  example: http://www.amazon.com/gp/product/0553383043
  ```

- ebay

  ``` programlisting
  needs: account, api-key
  example: http://cgi.ebay.com/RARE-DAY-IN-FAIRY-LAND-ELEPHANT-FOLIO-20-FULL-COLOR_W0QQitemZ140209597189QQihZ004QQcategoryZ29223QQssPageNameZWDVWQQrdZ1QQcmdZViewItem
  ```

- flickr needs: api-key example:
  http://farm1.static.flickr.com/212/496684670_7122c831ed.jpg

  ``` programlisting
  ```

- mbz

  ``` programlisting
  example: http://musicbrainz.org/release/37e955d4-a53c-45aa-a812-1b23b88dbc13.html
  ```

- mql (freebase)

  ``` programlisting
  example: http://www.freebase.com/view/en/beta_ursae_majoris
  ```

- facebook

  ``` programlisting
  needs: api-key, secret, persistent-session-id
  example: http://www.facebook.com/profile.php?id=841100003
  ```

- yahoo-stock

  ``` programlisting
  example: http://finance.yahoo.com/q?s=AAPL
  ```

- yahoo-traffic

  ``` programlisting
  example: http://local.yahooapis.com/MapsService/V1/trafficData?appid=YahooDemo&street=701+First+Street&city=Sunnyvale&state=CA
  ```

- Bugzilla

  ``` programlisting
  example: https://bugzilla.mozilla.org/show_bug.cgi?id=251714
  ```

- SVG

- OO document

  ``` programlisting
  needs: unzip plugin
  ```

- Wikipedia

  ``` programlisting
  needs: php plugin & dbpedia extractor
  example: http://wikipedia.org/wiki/London
  ```

- Opencalais

- iCalendar

</div>

<span class="emphasis">*GRDDL*</span>

<div class="itemizedlist">

- Google Base (google)

  ``` programlisting
  example: http://www.google.com/base/feeds/snippets/17891817243016304554
  ```

- eRDF

- RDFa

- hCard

- hCalendar

- hReview

- relLicense

- XBRL

- HR-XML

- DC

- geoURL

- Ning

- XFN

- xFolk

</div>

<span class="emphasis">*URN handlers*</span>

<div id="id52630" class="decimalstyle">

**Table 16.11. URN handlers List**

<div class="decimalstyle-contents">

| URN handler | Sample URI                                | Resource Description                                                                   | Linked Data View                                                                          | Linked Data Graph                                                                    | Needs                                                                |
|:------------|-------------------------------------------|----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| LSID        | urn:lsid:ubio.org:namebank:12292          | <a                                                                                     
                                                           href="http://demo.openlinksw.com/about/html/urn:lsid:ubio.org:namebank:12292"           
                                                           class="ulink" target="_top">HTML Representation</a>                                     | <a                                                                                        
                                                                                                                                                    href="http://demo.openlinksw.com/describe/?url=urn:lsid:ubio.org:namebank:12292"           
                                                                                                                                                    class="ulink" target="_top">Linked Data View</a>                                           | <a                                                                                   
                                                                                                                                                                                                                                                href="http://demo.openlinksw.com/ode/?uri=urn:lsid:ubio.org:namebank:12292"           
                                                                                                                                                                                                                                                class="ulink" target="_top">Data Explorer View</a>                                    | none                                                                 |
| DOI         | doi:10.1038/35057062                      | <a href="http://demo.openlinksw.com/about/html/doi:10.1038/35057062"                   
                                                           class="ulink" target="_top">HTML Representation</a>                                     | <a href="http://demo.openlinksw.com/describe/?url=doi:10.1038/35057062"                   
                                                                                                                                                    class="ulink" target="_top">Linked Data View</a>                                           | <a href="http://demo.openlinksw.com/ode/?uri=doi:10.1038/35057062"                   
                                                                                                                                                                                                                                                class="ulink" target="_top">Data Explorer View</a>                                    | Needs hslookup plugin, relevant html, pdf, xml etc. mappers enabled. |
| OAI         | oai:dcmi.ischool.washington.edu:article/8 | <a                                                                                     
                                                           href="http://demo.openlinksw.com/about/html/oai:dcmi.ischool.washington.edu:article/8"  
                                                           class="ulink" target="_top">HTML Representation</a>                                     | <a                                                                                        
                                                                                                                                                    href="http://demo.openlinksw.com/describe/?url=oai:dcmi.ischool.washington.edu:article/8"  
                                                                                                                                                    class="ulink" target="_top">Linked Data View</a>                                           | <a                                                                                   
                                                                                                                                                                                                                                                href="http://demo.openlinksw.com/ode/?uri=oai:dcmi.ischool.washington.edu:article/8"  
                                                                                                                                                                                                                                                class="ulink" target="_top">Data Explorer View</a>                                    | none                                                                 |

</div>

</div>

  

<div id="virtuosospongerrdfmappers" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL IRI Dereferencing

</div>

</div>

</div>

The Virtuoso SPARQL engine (called for brevity just SPARQL below)
supports IRI Dereferencing, however it understands only RDF data, that
is it can retrieve only files containing RDF/XML, turtle or N3
serialized RDF data, if format is unknown it will try mapping with
built-in WebDAV metadata extractor. In order to extend this feature with
dereferencing web or file resources which naturally don't have RDF data
(like PDF, JPEG files for example) is provided a special mechanism in
SPARQL engine. This mechanism is called RDF mappers for translation of
non-RDF data files to RDF.

In order to instruct the SPARQL to call a RDF mapper it needs to be
registered and it will be called for a given URL or MIME type pattern.
In other words, when unknown for SPARQL format is received during URL
dereferencing process, it will look into a special registry (a table) to
match either the MIME type or IRI using a regular expression, if match
is found the mapper function will be called.

<div id="virtuosospongerproxy" class="section">

<div class="titlepage">

<div>

<div>

##### Sponger Proxy service

</div>

</div>

</div>

Sponger functionality is also exposed via Virtuoso's "/proxy/rdf/"
endpoint, as an in-built REST style Web service available in any
Virtuoso standard installation. This web service takes a target URL and
either returns the content "as is" or tries to transform (by sponging)
to RDF. Thus, the proxy service can be used as a 'pipe' for RDF browsers
to browse non-RDF sources.

For more information see
<a href="rdfsparqlprotocolendpoint.html#rdfproxyservice" class="link"
title="Sponger Proxy URI Service">RDF Sponger Proxy service</a>

</div>

<div id="virtuosospongercache" class="section">

<div class="titlepage">

<div>

<div>

##### Cache Invalidation

</div>

</div>

</div>

To clear cache on all values of HS_LOCAL_IRI of the SYS_HTTP_SPONGE
table use:

``` programlisting
SPARQL clear graph <A-Named-Graph>;
```

</div>

</div>

</div>
