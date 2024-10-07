<div id="rdfsparqlprotocolendpoint" class="section">

<div class="titlepage">

<div>

<div>

### 16.2.3. SPARQL Web Services & APIs

</div>

</div>

</div>

<div id="rdfsparqlprotocolendpointintro" class="section">

<div class="titlepage">

<div>

<div>

#### Introduction

</div>

</div>

</div>

The Virtuoso SPARQL query service implements the
<a href="http://www.w3.org/TR/rdf-sparql-protocol/" class="ulink"
target="_top">SPARQL Protocol for RDF</a> (W3C Working Draft 25 January
2006) providing SPARQL query processing for RDF data available on the
open internet.

The query processor extends the standard protocol to provide support for
multiple output formats. At present this uses additional query
parameters.

Supported features include:

<div class="itemizedlist">

- Support for GET and POST requests

- Support for a variety of transfer MIME-types, including RDF /XML and
  TURTLE

- Support for: <span class="emphasis">*default-graph-uri*</span>,
  <span class="emphasis">*named-graph-uri*</span>,
  <span class="emphasis">*using-graph-uri*</span>,
  <span class="emphasis">*using-named-graph-uri*</span>,
  <span class="emphasis">*format*</span> parameters

- Support for: <span class="emphasis">*debug*</span>,
  <span class="emphasis">*timeout*</span>,
  <span class="emphasis">*maxrows*</span>,
  <span class="emphasis">*qtxt*</span>,
  <span class="emphasis">*query*</span> parameters

- Support for a variety of query types including CONSTRUCT, ASK,
  DESCRIBE

</div>

Virtuoso also supports /sparql-graph-crud/ web service endpoint that
implements the current draft of
<a href="http://www.w3.org/TR/sparql11-http-rdf-update/" class="ulink"
target="_top">W3C SPARQL Graph Update protocol</a> . Both /sparql
/sparql-graph-crud/ endpoints use the same SPARQL user account, so this
user should be member of SPARQL_UPDATE group in order to modify data via
Graph Update protocol. Note that /sparql/ endpoint has /sparql-auth/
variant that uses web authentication. Similarly, /sparql-graph-crud/ has
/sparql-graph-crud-auth/ variant. As soon as user is member of
SPARQL_UPDATE group, she/he can modify the stored data via
/sparql-graph-crud-auth/ as well as via /sparql-auth/ . The
/sparql-graph-crud/ endpoint is primarily for serving requests from
applications, not for manual interactions via browser. See more
information in our
<a href="rdfsparqlprotocolendpoint.html#sparqloauthendpointauth"
class="link" title="Authentication">SPARQL Authentication</a> section.

</div>

<div id="rdfsupportedprotocolendpoint" class="section">

<div class="titlepage">

<div>

<div>

#### Service Endpoint

</div>

</div>

</div>

Virtuoso uses the pre-assigned endpoints "/sparql" and "/SPARQL" as the
defaults for exposing its REST based SPARQL Web Services.

The port number associated with the SPARQL services is determined by the
'ServerPort' key value in the '\[HTTPServer\]' section of the
virtuoso.ini file. Thus, if the Virtuoso instance is configured to
listen at a none default port e.g. 8890, the SPARQL endpoints would be
accessible at http://example.com:8890/sparql/.

The SPARQL endpoint supports both GET and POST requests. The client
chooses between GET and POST automatically, using the length of query
text as the criterion. If the SPARQL endpoint is accessed without any
URL and requisite SPARQL protocol parameters, an interactive HTML page
for capturing SPARQL input will be presented.

<div id="rdfsupportedprotocolendpointuricustm" class="section">

<div class="titlepage">

<div>

<div>

##### Customizing SPARQL Endpoint Page

</div>

</div>

</div>

The SPARQL Endpoint Page can now be customized using a xsl stylesheet.

This works by adding the following line with isql:

``` programlisting
SQL> registry_set ('sparql_endpoint_xsl', 'http://host:port/path/isparql.xsl');
```

where obviously host, port, path and the name isparql.xsl can be set to
anything.

</div>

</div>

<div id="rdfrequestparamsextensions" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL Protocol Extensions

</div>

</div>

</div>

<div id="rdfrequestparamsofunctions" class="section">

<div class="titlepage">

<div>

<div>

##### Request Parameters

</div>

</div>

</div>

<div id="id47688" class="decimalstyle">

**Table 16.1. Request Parameters List**

<div class="decimalstyle-contents">

| Parameter    | Notes                                                                                                                                          | Required? |
|:-------------|------------------------------------------------------------------------------------------------------------------------------------------------|-----------|
| service      | Service URI such as 'http://example.com/sparql/'                                                                                               | Yes       |
| query        | Text of the query                                                                                                                              | Yes       |
| dflt_graph   | Default graph URI (string or NULL)                                                                                                             | No        |
| named_graphs | Vector of named graphs (or NULL to prevent overriding named graphs specified in the query)                                                     | Yes       |
| req_hdr      | Additional HTTP headers that should be passed to the service, e.g. 'Host: ...'                                                                 | No        |
| maxrows      | Limit on the numbers of rows that should be returned (the actual size of the result set may differ)                                            | No        |
| xslt-uri     | Absolute URL of any XSLT stylesheet file to be applied to the SPARQL query results                                                             | No        |
| timeout      | Timeout for "anytime" query execution, in milliseconds, values less than 1000 are ignored; see <a href="anytimequeries.html" class="link"      
                title="9.25. Anytime Queries">Anytime Queries</a> for more details                                                                              | No        |
| debug        | If set to on, SPARQL Compiler will check if all variables are declared, and if there is variable that is not declared, an error will be raised | No        |

</div>

</div>

  

</div>

<div id="rdfresponsecodeofprotocol" class="section">

<div class="titlepage">

<div>

<div>

##### Response Codes

</div>

</div>

</div>

If the query is a CONSTRUCT or a DESCRIBE then the result set consists
of a single row and a single column. The value inside is a dictionary of
triples in 'long valmode'. Note that the dictionary object cannot be
sent to a SQL client, say, via ODBC. The client may lose the database
connection trying to fetch a result set row that contains a dictionary
object. This disconnection does not disrupt the server, so the client
may readily reconnect to the server, but the disconnected transaction
will have been rolled back.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="odbcimplementationext.html#virtodbcsparql" class="link"
title="Virtuoso ODBC RDF Extensions for SPASQL">Virtuoso ODBC RDF
extensions for SPASQL</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="rdfsupportedmimesofprotocol" class="section">

<div class="titlepage">

<div>

<div>

##### Response Format

</div>

</div>

</div>

All the SPARQL protocol standard MIME types are supported by a SPARQL
web service client. Moreover, SPARQL web service endpont supports
additional MIME types and in some cases additional query types for
standard MIME types.

<div id="rdfsupportedmimesofprotocolserver" class="section">

<div class="titlepage">

<div>

<div>

###### Server Response Formats

</div>

</div>

</div>

<div id="id47749" class="decimalstyle">

**Table 16.2. Server Response Formats**

<div class="decimalstyle-contents">

| Content-Type                      | SPARQL query type                | Description                                                                                                                                                                                                   |
|:----------------------------------|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 'application/sparql-results+xml'  | SELECT, ASK                      | Canonical XML presentation of SPARQL result set                                                                                                                                                               |
| 'text/rdf+n3'                     | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'text/rdf+ttl'                    | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'text/rdf+turtle'                 | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'text/turtle'                     | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'text/n3'                         | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'application/turtle'              | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'application/x-turtle'            | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle                                                                                                                                                                                                        |
| 'application/x-nice-turtle'       | SELECT, ASK, CONSTRUCT, DESCRIBE | Turtle, like above, but the server will try to use "list" and "\[...\]" notations to make the document easier to read. This formatting is a slow procedure so long results will be formatted as plain Turtle. |
| 'text/rdf+nt'                     | SELECT                           | Format for NT (each triple is printed separately without abbreviations)                                                                                                                                       |
| 'text/plain'                      | SELECT                           | Format for NT (each triple is printed separately without abbreviations)                                                                                                                                       |
| 'text/ntriples'                   | SELECT, CONSTRUCT, DESCRIBE      | Format for NT (each triple is printed separately without abbreviations)                                                                                                                                       |
| 'application/x-trig'              | SELECT, CONSTRUCT, DESCRIBE      | TriG syntax for result sets, triples and quads (or sets of graphs with triples). While it is not used for quads, the output is same as for Turtle.                                                            |
| 'application/rdf+xml'             | SELECT, CONSTRUCT, DESCRIBE      | Canonical RDF/XML presentation                                                                                                                                                                                |
| 'application/soap+xml'            | SELECT                           | SOAP XML                                                                                                                                                                                                      |
| 'application/soap+xml;11'         | SELECT                           | SOAP XML                                                                                                                                                                                                      |
| 'text/html'                       | SELECT                           | HTML document for plain browsing; it's a TABLE for result set and HTML with micro-data for triples                                                                                                            |
| 'text/md+html'                    | SELECT, CONSTRUCT, DESCRIBE      | HTML with microdata; for triples only                                                                                                                                                                         |
| 'text/microdata+html'             | SELECT, CONSTRUCT, DESCRIBE      | HTML with microdata; for triples only                                                                                                                                                                         |
| 'text/x-html+ul'                  | SELECT, CONSTRUCT, DESCRIBE      | HTML with triples grouped into hierarchical list                                                                                                                                                              |
| 'text/x-html+tr'                  | SELECT, CONSTRUCT, DESCRIBE      | HTML with triples in form of a table                                                                                                                                                                          |
| 'application/vnd.ms-excel'        | SELECT                           | HTML table for loading data into stylesheets                                                                                                                                                                  |
| 'text/csv'                        | SELECT, CONSTRUCT, DESCRIBE      | Comma-separated values                                                                                                                                                                                        |
| 'text/tab-separated-values'       | SELECT                           | Tab-separated values                                                                                                                                                                                          |
| 'application/javascript'          | SELECT                           | JavaScript data fragment                                                                                                                                                                                      |
| 'application/json'                | SELECT                           | JSON                                                                                                                                                                                                          |
| 'application/sparql-results+json' | SELECT, ASK                      | JSON result set                                                                                                                                                                                               |
| 'application/odata+json'          | SELECT, ASK, CONSTRUCT, DESCRIBE | JSON in ODATA style                                                                                                                                                                                           |
| 'application/microdata+json'      | SELECT, CONSTRUCT, DESCRIBE      | Microdata as JSON; for triples only                                                                                                                                                                           |
| 'application/rdf+json'            | CONSTRUCT, DESCRIBE              | JSON in TALIS style; for triples only                                                                                                                                                                         |
| 'application/x-rdf+json'          | CONSTRUCT, DESCRIBE              | JSON in TALIS style; for triples only                                                                                                                                                                         |
| 'application/x-json+ld'           | CONSTRUCT, DESCRIBE              | JSON in Linked Data style; for triples only                                                                                                                                                                   |
| 'application/ld+json'             | CONSTRUCT, DESCRIBE              | JSON in Linked Data style; for triples only                                                                                                                                                                   |
| 'text/cxml'                       | SELECT, CONSTRUCT, DESCRIBE      | CXML output for rendering in Pivot Viewer of MS SilverLight?. Result sets and triples are handled in different ways.                                                                                          |
| 'text/cxml+qrcode'                | SELECT,CONSTRUCT, DESCRIBE       | CXML output with QRcode imprinted into each picture; for result sets and triples                                                                                                                              |
| 'application/atom+xml'            | SELECT, CONSTRUCT, DESCRIBE      | Atom-style XML                                                                                                                                                                                                |
| 'application/xhtml+xml'           | SELECT                           | RDFa placed into XHTML; for triples only                                                                                                                                                                      |
|                                   |                                  |                                                                                                                                                                                                               |

</div>

</div>

  

</div>

<div id="rdfsupportedmimesofprotocolclient" class="section">

<div class="titlepage">

<div>

<div>

###### Client Response Formats

</div>

</div>

</div>

<div id="id47911" class="decimalstyle">

**Table 16.3. Client Response Formats**

<div class="decimalstyle-contents">

| Content-Type                     | SPARQL query type   | Description                                     |
|:---------------------------------|---------------------|-------------------------------------------------|
| 'application/sparql-results+xml' | SELECT, ASK         | Canonical XML presentation of SPARQL result set |
| 'text/rdf+n3'                    | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'text/rdf+ttl'                   | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'text/rdf+turtle'                | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'text/turtle'                    | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'text/n3'                        | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'application/turtle'             | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'application/x-turtle'           | CONSTRUCT, DESCRIBE | Turtle                                          |
| 'application/rdf+xml'            | CONSTRUCT, DESCRIBE | Canonical RDF/XML presentation                  |
|                                  |                     |                                                 |

</div>

</div>

  

The current implementation does not support returning the results of
SELECT as RDF/XML or 'sparql-results-2'.

If the HTTP header returned by the remote server does not contain a
'Content-Type' line, the client may guess MIME type from the text of the
returned body.

Error messages returned from the service are returned as XML documents,
using the MIME type application/xml. The documents consist of a single
element containing an error message.

</div>

</div>

<div id="rdfsupportedmimesofprotocoladdselect" class="section">

<div class="titlepage">

<div>

<div>

##### Additional Response Formats -- SELECT

</div>

</div>

</div>

Use the format parameter to select one of the following alternate output
formats:

<div id="id47965" class="decimalstyle">

**Table 16.4. Additional Response formats list -- SELECT**

<div class="decimalstyle-contents">

| Format Value | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Mimetype                        |
|:-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------|
| HTML         | The result is a HTML document containing query summary and tabular results. The format is human-readable but not intended for using by applications because it makes strings undistinguishable from IRIs and loses other details such as exact datatypes of returned values.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | text/html                       |
| json         | Two separate MIME types exist for JSON: JSON serialization of results is 'application/sparql-results+json' and confirms to the draft specification "Serializing SPARQL Query Results in JSON". JSON serialization of triples is 'application/rdf+json' and interoperable with Talis. Sometimes a client needs a JSON but it does not know the type of query it sends to Virtuoso web service endpoint. In this case the client can specify either one MIME-type 'application/json' or both 'application/sparql-results+json' and 'application/rdf+json' in the "Accept" header line and Virtuoso will chose the appropriate one automatically. Similar trick works for other sorts of result types: Virtuoso inspects the whole "Accept" header line to find out the most appropriate return type for the given query. | application/sparql-results+json |
| json         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | application/rdf+json            |
| js           | Javascript serialization of results generates an HTML table with the CSS class sparql. The table contains a column indicating row number and additional columns for each query variable. Each query solution contributes one row of the table. Unbound variables are indicated with a non-breaking space in the appropriate table cells.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | application/javascript          |
| table        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | text/html                       |
| XML          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | text/html                       |
| TURTLE       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | text/html                       |

</div>

</div>

  

</div>

<div id="rdfsupportedmimesofprotocoladdcons" class="section">

<div class="titlepage">

<div>

<div>

##### Additional Response Formats -- CONSTRUCT & DESCRIBE

</div>

</div>

</div>

<span class="emphasis">*Example output of DESCRIBE in rdf+json
serialization format*</span>

<div class="orderedlist">

1.  Go to the sparql endpoint at http://host:port/sparql, for ex. at
    http://dbpedia.org/sparql

2.  Enter query in the "Query text" area, for ex.:

    ``` programlisting
    DESCRIBE <http://dbpedia.org/resource/%22S%22_Bridge_II>
    ```

3.  Select for "Display Results As": JSON

4.  Click "Run Query" button.

5.  As result should be produced the following output:

    ``` programlisting
    {
      { 'http://dbpedia.org/resource/%22S%22_Bridge_II' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/ontology/Place' } ,
          { 'type' : 'uri', 'value' : 'http://dbpedia.org/ontology/Resource' } ,
          { 'type' : 'uri', 'value' : 'http://dbpedia.org/ontology/HistoricPlace' } } ,
        { 'http://dbpedia.org/ontology/added' : { 'type' : 'literal', 'value' : '1973-04-23' , 'datatype' : 'http://www.w3.org/2001/XMLSchema#date' } } ,
        { 'http://www.w3.org/2003/01/geo/wgs84_pos#lat' : { 'type' : 'literal', 'value' : 39.99305725097656 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#float' } } ,
        { 'http://www.w3.org/2003/01/geo/wgs84_pos#long' : { 'type' : 'literal', 'value' : -81.74666595458984 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#float' } } ,
        { 'http://dbpedia.org/property/wikiPageUsesTemplate' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Template:infobox_nrhp' } } ,
        { 'http://dbpedia.org/property/name' : { 'type' : 'literal', 'value' : '"S" Bridge II' , 'lang' : 'en' } } ,
        { 'http://dbpedia.org/property/nearestCity' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/New_Concord%2C_Ohio' } ,
          { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Ohio' } } ,
        { 'http://dbpedia.org/property/latDirection' : { 'type' : 'literal', 'value' : 'N' , 'lang' : 'en' } } ,
        { 'http://dbpedia.org/property/governingBody' : { 'type' : 'literal', 'value' : 'State' , 'lang' : 'en' } } ,
        { 'http://www.georss.org/georss/point' : { 'type' : 'literal', 'value' : '39.99305556 -81.74666667' } ,
          { 'type' : 'literal', 'value' : '39.9930555556 -81.7466666667' } } ,
        { 'http://xmlns.com/foaf/0.1/name' : { 'type' : 'literal', 'value' : '"S" Bridge II' } } ,
        { 'http://dbpedia.org/property/latDegrees' : { 'type' : 'literal', 'value' : 39 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://dbpedia.org/property/latMinutes' : { 'type' : 'literal', 'value' : 59 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://dbpedia.org/property/latSeconds' : { 'type' : 'literal', 'value' : 35 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://dbpedia.org/property/longDirection' : { 'type' : 'literal', 'value' : 'W' , 'lang' : 'en' } } ,
        { 'http://dbpedia.org/property/architect' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Benjamin_Latrobe' } } ,
        { 'http://dbpedia.org/property/added' : { 'type' : 'literal', 'value' : '1973-04-23' , 'datatype' : 'http://www.w3.org/2001/XMLSchema#date' } } ,
        { 'http://www.w3.org/2000/01/rdf-schema#label' : { 'type' : 'literal', 'value' : '"S" Bridge II (Muskingum County, Ohio)' , 'lang' : 'nl' } ,
          { 'type' : 'literal', 'value' : '"S" Bridge II' , 'lang' : 'en' } } ,
        { 'http://dbpedia.org/ontology/architect' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Benjamin_Latrobe' } } ,
        { 'http://xmlns.com/foaf/0.1/img' : { 'type' : 'uri', 'value' : 'http://upload.wikimedia.org/wikipedia/commons/d/d4/FoxRunS-Bridge_NewConcordOH.jpg' } } ,
        { 'http://dbpedia.org/property/locmapin' : { 'type' : 'literal', 'value' : 'Ohio' , 'lang' : 'en' } } ,
        { 'http://dbpedia.org/property/refnum' : { 'type' : 'literal', 'value' : 73001513 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://dbpedia.org/property/abstract' : { 'type' : 'literal', 'value' : '"S" Bridge II is a historic S bridge near New Concord, Ohio, United States. A part of the National Road, the first federally-financed highway in the United States, it was built in 1828. Its peculiar shape, typical for an S bridge, is designed to minimize the span and allow easy access. In 1973, it was listed on the National Register of Historic Places.' , 'lang' : 'en' } ,
          { 'type' : 'literal', 'value' : '"S" Bridge II bij New Concord, Ohio, is een deel van de National Road, een van de eerste highways die door de federale overheid vanaf 1811 werden aangelegd. De vorm, die de brug als een S Brug kenmerkt, is bedoeld om de overspanning zo klein mogelijk te houden en toch gemakkelijk toegang tot de brug te verlenen. De brug staat sinds 1973 op de lijst van het National Register of Historic Places als monument vermeld.' , 'lang' : 'nl' } } ,
        { 'http://www.w3.org/2004/02/skos/core#subject' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Category:National_Register_of_Historic_Places_in_Ohio' } ,
          { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Category:Bridges_on_the_National_Register_of_Historic_Places' } } ,
        { 'http://dbpedia.org/ontology/nearestCity' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/Ohio' } ,
          { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/New_Concord%2C_Ohio' } } ,
        { 'http://xmlns.com/foaf/0.1/depiction' : { 'type' : 'uri', 'value' : 'http://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/FoxRunS-Bridge_NewConcordOH.jpg/200px-FoxRunS-Bridge_NewConcordOH.jpg' } } ,
        { 'http://dbpedia.org/property/caption' : { 'type' : 'literal', 'value' : 'The bridge in the fall' , 'lang' : 'en' } } ,
        { 'http://dbpedia.org/property/longDegrees' : { 'type' : 'literal', 'value' : 81 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://dbpedia.org/property/longMinutes' : { 'type' : 'literal', 'value' : 44 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://dbpedia.org/property/longSeconds' : { 'type' : 'literal', 'value' : 48 , 'datatype' : 'http://www.w3.org/2001/XMLSchema#integer' } } ,
        { 'http://www.w3.org/2000/01/rdf-schema#comment' : { 'type' : 'literal', 'value' : '"S" Bridge II is a historic S bridge near New Concord, Ohio, United States.' , 'lang' : 'en' } ,
          { 'type' : 'literal', 'value' : '"S" Bridge II bij New Concord, Ohio, is een deel van de National Road, een van de eerste highways die door de federale overheid vanaf 1811 werden aangelegd.' , 'lang' : 'nl' } } ,
        { 'http://xmlns.com/foaf/0.1/page' : { 'type' : 'uri', 'value' : 'http://en.wikipedia.org/wiki/%22S%22_Bridge_II' } } } ,
      { 'http://dbpedia.org/resource/%22S%22_Bridge_II_%28Muskingum_County%2C_Ohio%29' : { 'http://dbpedia.org/property/redirect' : { 'type' : 'uri', 'value' : 'http://dbpedia.org/resource/%22S%22_Bridge_II' } } }
    }
    ```

</div>

<span class="emphasis">*Example output of CONSTRUCT in rdf+json
serialization format*</span>

<div class="orderedlist">

1.  Go to the sparql endpoint at http://host:port/sparql, for ex. at
    http://dbpedia.org/sparql

2.  Enter query in the "Query text" area, for ex.:

    ``` programlisting
    CONSTRUCT
    {
     ?s a ?Concept .
    }
    WHERE
    {
     ?s a ?Concept .
    }
    LIMIT 10
    ```

3.  Select for "Display Results As": JSON

4.  Click "Run Query" button.

5.  As result should be produced the following output:

    ``` programlisting
    {
      { 'http://dbpedia.org/ontology/Place' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/Area' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/City' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/River' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/Road' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/Lake' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/LunarCrater' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/ShoppingMall' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/Park' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } } ,
      { 'http://dbpedia.org/ontology/SiteOfSpecialScientificInterest' : { 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' : { 'type' : 'uri', 'value' : 'http://www.w3.org/2002/07/owl#Class' } } }
    }
    ```

</div>

For interoperability with clients that were developed before current
versions of SPARQL protocol and format specs are issued, Virtuoso
supports some obsolete variants of standard MIME types. 'text/rdf+n3',
'text/rdf+ttl', 'application/turtle' and 'application/x-turtle' are
understood for TURTLE output, 'application/x-rdf+json' and
'application/rdf+json' are for "Serializing SPARQL Query Results in
JSON". When a client specifies obsolete MIME type but not its standard
variant, an obsolete variant is returned for interoperability.

</div>

<div id="viewresultspagesparqldebug" class="section">

<div class="titlepage">

<div>

<div>

##### Strict checking of void variables

</div>

</div>

</div>

To set SPARQL Endpoint to check if all variables in a given query are
declared correctly, one should hatch the the Options "Strict checking of
void variables" check-box. In that case, if a variable declaration is
missing, i.e. not included in the SPARQL Query WHERE clause, then an
error will be raised. For example, on attempt to execute the following
query:

``` programlisting
--  Options "Strict checking of void variables" check-box is checked:
select ?y
where
 {
  ?s ?p ?o
 }
```

since the variable `?y` is not declared, the following error will be
raised:

``` programlisting
Virtuoso 37000 Error SP031: SPARQL compiler:
Variable 'y' is used in the query result set but not assigned

SPARQL query:

#output-format:text/html
define sql:signal-void-variables 1 define sql:gs-app-callback "ODS" select ?y
where
{
?s ?p ?o
}
```

</div>

<div id="viewresultspagesparqlqex" class="section">

<div class="titlepage">

<div>

<div>

##### View Results Page of SPARQL Query Execution

</div>

</div>

</div>

To view SPARQL Endpoint Results page of SPARQL query execution should be
used the parameter <span class="emphasis">*query*</span> i.e the SPARQL
Protocol URL should look like:

``` programlisting
http://cname/sparql?default-graph-uri=&query=...
```

<span class="emphasis">*Example*</span>

Suppose the following simple query:

``` programlisting
SELECT *
WHERE
  {
    ?s ?p ?o
  }
LIMIT 10
```

See <a
href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=SELECT+*+%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%3Fs+%3Fp+%3Fo%0D%0A++%7D%09%0D%0ALIMIT+10++&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
class="ulink" target="_top">this example link</a> against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URL.

</div>

<div id="viewresultspagesparqlqed" class="section">

<div class="titlepage">

<div>

<div>

##### View Editor Page of SPARQL Query

</div>

</div>

</div>

To view the SPARQL Endpoint editor page of SPARQL query execution should
be used the parameter <span class="emphasis">*qtxt*</span> i.e the
SPARQL Protocol URL should look like:

``` programlisting
http://cname/sparql?default-graph-uri=&qtxt=...
```

<span class="emphasis">*Example*</span>

Suppose the following simple query:

``` programlisting
SELECT *
WHERE
  {
    ?s ?p ?o
  }
LIMIT 10
```

Suppose also <a
href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=SELECT+*+%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%3Fs+%3Fp+%3Fo%0D%0A++%7D%09%0D%0ALIMIT+10++&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
class="ulink" target="_top">this results page link</a> against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URL.

Replace the parameter name <span class="emphasis">*query*</span> with
<span class="emphasis">*qtxt*</span> .

<a
href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=SELECT+*+%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%3Fs+%3Fp+%3Fo%0D%0A++%7D%09%0D%0ALIMIT+10++&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
class="ulink" target="_top">Access the new link</a> , which should
present the SPARQL Endpoint Editor page with "Query Text" area filled in
with the SPARQL Query from above.

</div>

<div id="rdfsupportedmimesaddofprotocol" class="section">

<div class="titlepage">

<div>

<div>

##### Virtuoso/PL APIs

</div>

</div>

</div>

Virtuoso also provides SPARQL protocol client APIs in Virtuoso PL, so
you can communicate with SPARQL Query Services from Virtuoso stored
procedures. The APIs are as follows:

<div id="id48075" class="decimalstyle">

**Table 16.5. Virtuoso/PL APIs**

<div class="decimalstyle-contents">

| API                           | Notes                                                                                                                                                                                       |
|:------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DB.DBA.SPARQL_REXEC           | Behaves like DBA.SPARQL_EVAL, but executes the query on the specified server. The procedure does not return anything. Instead, it creates a result set.                                     |
| DB.DBA.SPARQL_REXEC_TO_ARRAY  | Behaves like DBA.SPARQL_EXEC_TO_ARRAY(), but executes the query on the specified server. The function returns a vector of rows, where every row is represented by a vector of field values. |
| DB.DBA.SPARQL_REXEC_WITH_META | Has no local SPARQL_EVAL analog. It produces not only an array of result rows together with an array of result set metadata in a format used by the exec() function.                        |

</div>

</div>

  

</div>

<div id="anytimequeriessparql" class="section">

<div class="titlepage">

<div>

<div>

##### SPARQL Anytime Queries

</div>

</div>

</div>

Starting with version 6, Virtuoso offers a partial query evaluation
feature that guarantees answers to arbitrary queries within a fixed
time. This is intended for use in publicly available SPARQL or SQL end
points on large databases. This enforces a finite duration to all
queries and will strive to return meaningful partial results. Thus this
provides the same security as a transaction timeout but will be more
user friendly since results will generally be returned, also for
aggregate queries. Outside of a public query service, this may also be
handy when exploring a large data set with unknown properties.

The feature is activated with the statement

``` programlisting
set result_timeout == <expression>;
```

Find more detailed information in the
<a href="anytimequeries.html" class="link"
title="9.25. Anytime Queries">Anytime Queries</a> section.

<div id="anytimequeriessparqlex" class="section">

<div class="titlepage">

<div>

<div>

###### Example Dump arbitrary query result as N-Triples

</div>

</div>

</div>

Assume the following arbitrary query:

``` programlisting
SPARQL define output:format "NT"
CONSTRUCT { ?s a ?t }
FROM virtrdf:
WHERE { ?s a ?t };
```

For iteration over result-set of an arbitrary query, use
<a href="fn_exec_next.html" class="link" title="exec_next"><code
class="function">exec_next()</code></a> in a loop that begins with
<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec()</code></a> with cursor output variable as an
argument and ends with
<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close()</code></a> after it is out of data.

</div>

</div>

</div>

<div id="rdfsupportedprotocolendpointuri" class="section">

<div class="titlepage">

<div>

<div>

#### Service Endpoint Security

</div>

</div>

</div>

Earlier releases of Virtuoso secured the SPARQL endpoint via privileges
assigned to the service- specific SQL user account "SPARQL". This
account was optionally granted "SPARQL_SELECT" or "SPARQL_UPDATE" roles.
By default only the "SPARQL_SELECT" role was assigned, enabling all
users to at least perform SELECT queries. The "SPARQL_UPDATE" role must
be granted to allow updates to the Quad Store - a pre-requisite for the
Virtuoso Sponger services to be functional i.e. to allow the Sponger to
populate and update the Quad Store. In Virtuoso release 5.0.7, there is
a new "SPARQL_SPONGE" role which can be assigned specifically to allow
Sponger services to update the Quad Store but not SPARQL users via the
SPARQL endpoint.

Restricting a user's access to specific graphs can be done using
Virtuoso Graph security functionality, via one of the Virtuoso Data
Access APIs: ODBC, JDBC, ADO.Net or PL code.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="odbcimplementationext.html#virtodbcsparql" class="link"
title="Virtuoso ODBC RDF Extensions for SPASQL">Virtuoso ODBC RDF
extensions for SPASQL</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

For example, users of OpenLink Data Space (ODS) applications are
restricted in the RDF graphs accessible to them as follows:

``` programlisting
DB.DBA.TABLE_DROP_POLICY ('DB.DBA.RDF_QUAD', 'S');

create procedure DB.DBA.RDF_POLICY (in tb varchar, in op varchar)
{
 declare chost, ret varchar;
 chost := DB.DBA.WA_CNAME ();
 ret := sprintf ('(ID_TO_IRI (G) NOT LIKE \'http://%s/dataspace/%%/private#\' ' ||
 'OR G = IRI_TO_ID (sprintf (\'http://%s/dataspace/%%U/private#\', USER)))', chost, chost);
 return ret;
}
;

grant execute on DB.DBA.RDF_POLICY to public;

DB.DBA.TABLE_SET_POLICY ('DB.DBA.RDF_QUAD', 'DB.DBA.RDF_POLICY', 'S');
```

where DB.DBA.WA_CNAME () is an ODS function returning the default host
name.

The effect of this policy is to restrict user 'user' to the graph
http://cname/dataspace/user/private#

<div id="rdfsupportedprotocolendpointurisparqlauthex" class="section">

<div class="titlepage">

<div>

<div>

##### SPARQL Auth Endpoint Usage Example

</div>

</div>

</div>

Virtuoso reserves the path '/sparql-auth/' for a SPARQL service
supporting authenticated SPARUL. This endpoint allows specific SQL
accounts to perform SPARUL over the SPARQL protocol. To be allowed to
login via SQL or ODBC and update physical triples, a user must be
granted "SPARQL_UPDATE" privileges. To grant this role:

<div class="orderedlist">

1.  Go to the Virtuoso administration UI i.e. http://host:port/conductor

2.  Login as user dba

3.  Go to System Admin-\>User Accounts-\>Users

    <div class="figure-float">

    <div id="rdf1" class="figure">

    **Figure 16.1. Conductor UI**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor UI](images/ui/usr1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click the link "Edit"

5.  Set "User type" to "SQL/ODBC Logins and WebDAV".

6.  Select from the list of available Account Roles "SPARQL_UPDATE" role
    and click the "\>\>" button so to add it to the right-hand list.

7.  <div class="figure-float">

    <div id="rdf2" class="figure">

    **Figure 16.2. Conductor UI**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor UI](images/ui/usr2.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click the "Save" button.

</div>

Note that if a table is used in an Linked Data View, and this table is
not granted to SPARQL_SELECT permission (or SPARQL_UPDATE, which
implicitly confers SPARQL_SELECT), then all SELECTs on a graph defined
by an Linked Data View will return an access violation error as the user
account has no permissions to read the table. The user must have
appropriate privileges on all tables included in an Linked Data View in
order to be able to select on <span class="emphasis">*all*</span>
graphs.

</div>

<div id="sparqwebservicetbl" class="section">

<div class="titlepage">

<div>

<div>

##### Managing a SPARQL Web Service Endpoint

</div>

</div>

</div>

Virtuoso web service endpoints may provide different default
configurations for different host names mentioned in an HTTP request.
Host name configuration for SPARQL web service endpoints can be managed
via the table <span class="emphasis">*DB.DBA.SYS_SPARQL_HOST*</span> .

``` programlisting
create table DB.DBA.SYS_SPARQL_HOST (
  SH_HOST   varchar not null primary key, -- host mask
  SH_GRAPH_URI varchar,                 -- default graph uri
  SH_USER_URI   varchar,                  -- reserved for any use in applications
  SH_BASE_URI varchar,                  -- for future use (not used currently) to set BASE in sparql queries. Should be NULL for now.
  SH_DEFINES long varchar,              -- additional defines for requests
  PRIMARY KEY (SH_HOST)
)
```

You can find detailed descriptions of the table columns
<a href="rdfdefaultgraph.html" class="link"
title="16.2.8. Default and Named Graphs">here</a> . Also, please read
<a href="rdfperfindexes.html" class="link"
title="16.17.4. Manage Public Web Service Endpoints">these notes</a> on
managing public web service endpoints.

</div>

<div id="sparqloauthendpointauth" class="section">

<div class="titlepage">

<div>

<div>

##### Authentication

</div>

</div>

</div>

Virtuoso 5.0.7 introduced a new "SPARQL_SPONGE" role which can be
assigned specifically for controlling Sponger middleware services which
perform writes and graph creation in the RDF Quad Store. This role only
allows updates through the Sponger. Quad Store updates via any other
route require granting the SPARQL_UPDATE role.

Virtuoso 5.0.11 onwards added three new methods for securing SPARQL
endpoints that include:

<div class="itemizedlist">

- SQL authentication

- OAuth

- WebID Protocol based authentication

</div>

Each of these authentication methods is associated with a purpose
specific default SPARQL endpoint along the following lines:

<div class="itemizedlist">

- http://\<cname\>/sparql-auth (SQL authentication)

- http://\<cname\>/sparql-oauth (OAuth)

- http://\<cname\>/sparql-graph-crud-auth (OAuth CRUD)

- https://\<cname\>/sparql and https://\<cname\>/sparql-webid (WebID
  Protocol)

</div>

Note: sparql-ssl is alias of sparql-webid.

The Virtuoso Authentication Server offers a UI with options for
managing:

<div class="itemizedlist">

- Application keys and protected SPARQL endpoints: OAuth provides a
  secure data transmission level mechanism for your SPARQL endpoint. It
  enables you to interact securely with your RDF database from a variety
  of locations. It also allows you to provide controlled access to
  private data to selected user profiles.

- WebID Protocol ACLs: WebID Protocol is an implementation of a
  conceptual authentication and authorization protocol that links a Web
  ID to a public key to create a global, decentralized/distributed, and
  open yet secure authentication system that functions with existing
  browsers.

</div>

Virtuoso Authentication Server can be installed by downloading and
installing the conductor_dav.vad package.

The Authentication UI is accessible from the Conductor UI -\> Linked
Data -\> Access Control -\> SPARQL-WebID. Here is sample scenario:

<div id="sparqloauthendpointauthexample" class="section">

<div class="titlepage">

<div>

<div>

###### SPARQL-WebID Authentication Example

</div>

</div>

</div>

<div class="orderedlist">

1.  Download and install the <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
    class="ulink" target="_top">conductor_dav.vad</a> package.

2.  <a
    href="http://ods.openlinksw.com/dataspace/dav/wiki/ODS/ODSGenerateX509Certificate"
    class="ulink" target="_top">Generate an X.509 Certificate hosted
    WebID</a> .

3.  Go to http://\<cname\>:\<port\>/conductor, where \<cname\>:\<port\>
    are replaced by your local server values.

4.  Log in as user "dba" or another user with DBA privileges.

5.  Go to Linked Data -\> Access Controls -\> SPARQL-WebID:

    <div class="figure-float">

    <div id="sparqlssl1" class="figure">

    **Figure 16.3. SPARQL-WebID**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL-WebID](images/ui/auth1.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Enter in the presented form Web ID for ex.:

    ``` programlisting
    http://id.myopenlink.net/dataspace/person/demo#this
    ```

    and select "SPARQL Role" for ex. "Sponge".

    <div class="figure-float">

    <div id="sparqlssl2" class="figure">

    **Figure 16.4. SPARQL-WebID**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL-WebID](images/ui/auth3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click the "Register" button.

8.  As result the WebID Protocol ACLs will be created:

    <div class="figure-float">

    <div id="sparqlssl3" class="figure">

    **Figure 16.5. SPARQL-WebID**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL-WebID](images/ui/auth4.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Go to the SPARQL-WebID endpoint
    https://\<cname\>:\<port\>/sparql-webid

10. Select the user's certificate from above:

    <div class="figure-float">

    <div id="sparqlssl4" class="figure">

    **Figure 16.6. SPARQL-WebID**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL-WebID](images/ui/auth5.png)

    </div>

    </div>

    </div>

      

    </div>

11. As result the SPARQL Query UI will be presented:

    <div class="figure-float">

    <div id="sparqlssl5" class="figure">

    **Figure 16.7. SPARQL-WebID**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL-WebID](images/ui/auth6.png)

    </div>

    </div>

    </div>

      

    </div>

12. Execute sample query and view the results:

    <div class="figure-float">

    <div id="sparqlssl7" class="figure">

    **Figure 16.8. SPARQL-WebID**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL-WebID](images/ui/auth6a.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

<div id="sparqloauthendpoint" class="section">

<div class="titlepage">

<div>

<div>

##### SPARQL OAuth Endpoint

</div>

</div>

</div>

OAuth provides a secure data transmission level mechanism for your
SPARQL endpoint. It enables you to interact securely with your RDF
database from a variety of locations. It also allows you to provide
controlled access to private data to selected users.

Virtuoso OAuth Server can be installed by downloading and installing the
<a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/ods_framework_dav.vad"
class="ulink" target="_top">ods_framework_dav.vad</a> package. The OAuth
UI is accessible from the URL http://cname:port/oauth

A user must have SQL privileges in order to run secured SPARQL
statements.

Here is a sample scenario:

<div class="orderedlist">

1.  Download and install the <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
    class="ulink" target="_top">conductor_dav.vad</a> and <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/ods_framework_dav.vad"
    class="ulink" target="_top">ods_framework_dav.vad</a> packages.

2.  <a
    href="http://ods.openlinksw.com/dataspace/dav/wiki/ODS/ODSGenerateX509Certificate"
    class="ulink" target="_top">Generate an X.509 Certificate hosted
    WebID</a> .

3.  Go to http://\<cname\>:\<port\>/conductor, where \<cname\>:\<port\>
    are replaced by your local server values.

4.  Log in as user "dba" or another user with DBA privileges.

5.  Go to System Admin-\>User Accounts:

    <div class="figure-float">

    <div id="sparqloauthendpoint1" class="figure">

    **Figure 16.9. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so1.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click "Create New Account":

    <div class="figure-float">

    <div id="sparqloauthendpoint2" class="figure">

    **Figure 16.10. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so2.png)

    </div>

    </div>

    </div>

      

    </div>

7.  In the presented form enter respectively:

    <div class="orderedlist">

    1.  Account name, for ex:demo1; a password and then confirm the
        password;

    2.  User type: SQL/ODBC and WebDAV;

    3.  Account role: SPARQL_UPDATE

        <div class="figure-float">

        <div id="sparqloauthendpoint3" class="figure">

        **Figure 16.11. SPARQL OAuth Endpoint**

        <div class="figure-contents">

        <div class="mediaobject">

        ![SPARQL OAuth Endpoint](images/ui/so3.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

8.  Click the "Save" button.

9.  The created user should be shown in the list of registered users:

    <div class="figure-float">

    <div id="sparqloauthendpoint4" class="figure">

    **Figure 16.12. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so4.png)

    </div>

    </div>

    </div>

      

    </div>

10. Go to http://\<cname\>:\<port\>/oauth/, where \<cname\>:\<port\> are
    replaced by your local server values.

    <div class="figure-float">

    <div id="sparqloauthendpoint5" class="figure">

    **Figure 16.13. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so5.png)

    </div>

    </div>

    </div>

      

    </div>

11. Click the "OAuth keys" link:

    <div class="figure-float">

    <div id="sparqloauthendpoint6" class="figure">

    **Figure 16.14. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so6.png)

    </div>

    </div>

    </div>

      

    </div>

12. Log in as user demo1:

    <div class="figure-float">

    <div id="sparqloauthendpoint7" class="figure">

    **Figure 16.15. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so7.png)

    </div>

    </div>

    </div>

      

    </div>

13. The OAuth application registration form will be shown.

    <div class="figure-float">

    <div id="sparqloauthendpoint8" class="figure">

    **Figure 16.16. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so8.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select SPARQL from the "Application name" list, and click the
    "Generate Keys" button.

15. A Consumer Key for SPARQL will be generated:

    ``` programlisting
    90baa79108b1d972525bacc76c0279c02d6421e8
    ```

    <div class="figure-float">

    <div id="sparqloauthendpoint9" class="figure">

    **Figure 16.17. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so9.png)

    </div>

    </div>

    </div>

      

    </div>

16. Click the "Back to main menu" link.

17. Click the "Protected SPARQL Endpoint" link.

18. The OpenLink Virtuoso SPARQL Query form will be displayed.

    <div class="figure-float">

    <div id="sparqloauthendpoint11" class="figure">

    **Figure 16.18. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so11.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="sparqloauthendpoint12" class="figure">

    **Figure 16.19. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so12.png)

    </div>

    </div>

    </div>

      

    </div>

19. Enter a simple query, for ex:

    ``` programlisting
    SELECT *
    WHERE
      {
        ?s ?p ?o
      }
    LIMIT 10
    ```

20. Enter the value from below for the "OAuth token":

    ``` programlisting
    90baa79108b1d972525bacc76c0279c02d6421e8
    ```

    <div class="figure-float">

    <div id="sparqloauthendpoint13" class="figure">

    **Figure 16.20. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so13.png)

    </div>

    </div>

    </div>

      

    </div>

21. Click the "Run Query" button.

22. In the OAuth Authorization Service form enter the password for user
    demo1 and click the "Login" button.

    <div class="figure-float">

    <div id="sparqloauthendpoint14" class="figure">

    **Figure 16.21. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so16.png)

    </div>

    </div>

    </div>

      

    </div>

23. Next you should authorize the request:

    <div class="figure-float">

    <div id="sparqloauthendpoint15" class="figure">

    **Figure 16.22. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so15.png)

    </div>

    </div>

    </div>

      

    </div>

24. On successful authentication and authorization, the query results
    should be shown:

    <div class="figure-float">

    <div id="sparqloauthendpoint14_01" class="figure">

    **Figure 16.23. SPARQL OAuth Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SPARQL OAuth Endpoint](images/ui/so14.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="sparqloauthendpointfoafssl" class="section">

<div class="titlepage">

<div>

<div>

##### WebID Protocol ACLs

</div>

</div>

</div>

WebID Protocol is an implementation of a conceptual authentication and
authorization protocol that links a Web ID to a public key, to create a
global decentralized/distributed, and open yet secure authentication
system that functions with existing browsers.

To use WebID Protocol, download and install the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
class="ulink" target="_top">conductor_dav.vad</a> VAD package. Once
installed, to access the WebID Protocol ACLs UI, go to URL
http://cname:port/conductor -\> Linked Data -\> Access Controls -\>
SPARQL-WebID .

<div class="figure-float">

<div id="sparqloauthendpoint1_01" class="figure">

**Figure 16.24. WebID**

<div class="figure-contents">

<div class="mediaobject">

![WebID](images/ui/auth4.png)

</div>

</div>

</div>

  

</div>

Configuring WebID Protocol ACLs is with a WebID Protocol certificate and
a Web ID allows secure SPARQL queries to be performed against a Virtuoso
SPARQL-WebID endpoint and viewing of the query results. The SPARQL-WebID
endpoint URL is of the form https://cname:port/sparql-webid

Note: SPARQL-SSL is alias of SPARQL-WebID.

See
<a href="rdfsparqlprotocolendpoint.html#sparqloauthendpointauthexample"
class="link" title="SPARQL-WebID Authentication Example">sample
example</a> how to configure a sample WebID Protocol ACL are outlined
below:

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                  |
|:--------------------------:|:-----------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                        |
|                            | <a href="secureodbcx509.html#secureodbcx509foafsll" class="link" 
                              title="WebID Protocol ODBC Login">WebID Protocol ODBC Login</a>   |

</div>

</div>

<div id="sparqloauthendpointfoafsslsparql" class="section">

<div class="titlepage">

<div>

<div>

##### Creating and Using a SPARQL-WebID based Endpoint

</div>

</div>

</div>

The following section describes the basic steps for setting up an SSL
protected and WebID based SPARQL Endpoint (SPARQL-WebID). The guide also
covers the use of Virtuoso PL functions and the Virtuoso Conductor for
SPARQL endpoint creation and configuration. It also covers the use of
cURL for exercising the newly generated SPARQL-SSL endpoint. Note:
SPARQL-SSL is alias of SPARQL-WebID.

<div class="orderedlist">

1.  <a href="vfoafsslst509issuer.html" class="link"
    title="17.3.9. Set Up X.509 certificate issuer, HTTPS listener and generate ODS user&#39;s certificates">Setup
    the CA issuer and https listener</a>

2.  To create the /sparql-webid endpoint, install the <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/policy_manager_dav.vad"
    class="ulink" target="_top">policy_manager.vad</a> manage or
    manually define the /sparql-webid endpoint on an HTTPS based
    listener (HTTPS service endpoint), for example using Virtuoso PL:

    ``` programlisting
    DB.DBA.VHOST_DEFINE (
         lhost=>'127.0.0.1:443',
         vhost=>'localhost',
         lpath=>'/sparql-webid',
         ppath=>'/!sparql/',
         is_dav=>1,
         auth_fn=>'DB.DBA.FOAF_SSL_AUTH',
         vsp_user=>'dba',
         ses_vars=>0,
         auth_opts=>vector ( 'https_cert',
                             'db:https_key_localhost',
                             'https_key',
                             'db:https_key_localhost',
                             'https_verify',
                             3,
                             'https_cv_depth',
                             10 ),
         opts=>vector ('noinherit', 1),
         is_default_host=>0
    );
    ```

3.  <a href="rdfsparqlprotocolendpoint.html#sparqloauthendpointfoafssl"
    class="link" title="WebID Protocol ACLs">Setup the SPARQL-WebID endpoint
    and define ACLs</a> using the Virtuoso Conductor

4.  Export your private key and its associated WebID based X.509
    certificate from your Firefox browser or System's Key Manager into
    PEM (PKCS12) file

    <div class="orderedlist">

    1.  If using Firefox use the menu path: Advanced -\> View
        Certificates, then click Backup for your certificate with name
        "mykey".

    2.  The file "mykey.p12" will be created. To disable password
        protection so that you can use this file in non-interactive mode
        (e.g. with cURL and other HTTP clients) execute:

        ``` programlisting
        openssl pkcs12 -in mykey.p12 -out mykey.pem -nodes
        ```

    </div>

5.  Test the SPARQL-WebID endpoint with cURL: (listening on default
    HTTPS 443 port):

    <div class="itemizedlist">

    - Note: In this example we use the "-k / --insecure" option with
      cURL since we are going to be using self-signed X.509 certificates
      signed by self-signed root CA.

    </div>

    ``` programlisting
        curl -k -E mykey.pem "https://example.com/sparql-webid?query=select+*+where+\{+%3Fx+%3Fy+%3Fz+.+\}+limit+10&format=text%2Fn3"

    @prefix res: <http://www.w3.org/2005/sparql-results#> .
    @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    _:_ a res:ResultSet .
    _:_ res:resultVariable "x" , "y" , "z" .
    @prefix ns0:    <https://example.com/tutorial/> .
    @prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:hosting ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:xml ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:repl ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:rdfview ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:services ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:wap ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:bpeldemo ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:web ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:web2 ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    _:_ res:solution [
          res:binding [ res:variable "x" ; res:value ns0:xmlxslt ] ;
          res:binding [ res:variable "y" ; res:value rdf:type ] ;
          res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
    ```

6.  Import your key it via Conductor UI:

    <div class="orderedlist">

    1.  Go to Conductor -\> System Admin-\>User Accounts

        <div class="figure-float">

        <div id="foafsslsparql1" class="figure">

        **Figure 16.25. Import key it via Conductor UI**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Import key it via Conductor UI](images/ui/fsp1.png)

        </div>

        </div>

        </div>

          

        </div>

    2.  Click "Edit" for your user

        <div class="figure-float">

        <div id="foafsslsparql2" class="figure">

        **Figure 16.26. Import key it via Conductor UI**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Import key it via Conductor UI](images/ui/fsp2.png)

        </div>

        </div>

        </div>

          

        </div>

    3.  Change "User type" to: SQL/ODBC and WebDAV

        <div class="figure-float">

        <div id="foafsslsparql3" class="figure">

        **Figure 16.27. Import key it via Conductor UI**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Import key it via Conductor UI](images/ui/fsp3.png)

        </div>

        </div>

        </div>

          

        </div>

    4.  Enter your ODS user WebID:

        ``` programlisting
        http://cname:port/dataspace/person/username#this
        ```

        <div class="figure-float">

        <div id="foafsslsparql4" class="figure">

        **Figure 16.28. Import key it via Conductor UI**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Import key it via Conductor UI](images/ui/fsp4.png)

        </div>

        </div>

        </div>

          

        </div>

    5.  Click "Save"

    6.  Click again "Edit" for your user

    7.  In "PKCS12 file:" click the Browse" button and select your key.

    8.  Enter a local Key Name, for e.g., "cli_key"

    9.  Enter key password

        <div class="figure-float">

        <div id="foafsslsparql5" class="figure">

        **Figure 16.29. Import key it via Conductor UI**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Import key it via Conductor UI](images/ui/fsp5.png)

        </div>

        </div>

        </div>

          

        </div>

    10. Click "Import Key"

    11. As result the key will be stored with name for ex. cli_key

        <div class="figure-float">

        <div id="foafsslsparql6" class="figure">

        **Figure 16.30. Import key it via Conductor UI**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Import key it via Conductor UI](images/ui/fsp6.png)

        </div>

        </div>

        </div>

          

        </div>

    12. Click "Save"

    </div>

7.  Test the SPARQL-WebID endpoint with http_client (listening on
    default HTTPS 443 port):

    <div class="orderedlist">

    1.  Log in at Virtuos ISQL with your user credentials:

        ``` programlisting
        C:\>isql localhost:1111 johndoe****
        Connected to OpenLink Virtuoso
        Driver: 06.01.3127 OpenLink Virtuoso ODBC Driver
        OpenLink Interactive SQL (Virtuoso), version 0.9849b.
        Type HELP; for help and EXIT; to exit.
        SQL>
        ```

    2.  Execute:

        ``` programlisting
        SQL>select http_client ('https://example.com/sparql-webid?query=select+*+where+{+%3Fx+%3Fy+%3Fz+.+}+limit+10&format=text%2Fn3', cert_file=>'d
        b:cli_key', insecure=>1);
        callret
        VARCHAR
        _______________________________________________________________________________

        @prefix res: <http://www.w3.org/2005/sparql-results#> .
        @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
        _:_ a res:ResultSet .
        _:_ res:resultVariable "x" , "y" , "z" .
        @prefix ns0:    <https://example.com/tutorial/> .
        @prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:hosting ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:xml ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:repl ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:rdfview ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:services ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:wap ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:bpeldemo ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [
              res:binding [ res:variable "x" ; res:value ns0:web ] ;
              res:binding [ res:variable "y" ; res:value rdf:type ] ;
              res:binding [ res:variable "z" ; res:value "Tutorial" ] ] .
        _:_ res:solution [

        1 Rows. -- 281 msec.
        ```

    </div>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                      |
|:--------------------------:|:-----------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                            |
|                            | <a href="http://demo.openlinksw.com/tutorial/rdf/fs_s_1/fs_s_1.vsp"                                  
                              class="ulink" target="_top">Demo Example</a> Using HTTP client to perform WebID Protocol connection.  |

</div>

</div>

<div id="sparqloauthendpointfoafsslsparqldisable" class="section">

<div class="titlepage">

<div>

<div>

##### Disable Default SPARQL Endpoint

</div>

</div>

</div>

<div id="sparqloauthendpointfoafsslsparqldisableisql" class="section">

<div class="titlepage">

<div>

<div>

###### Using iSQL:

</div>

</div>

</div>

<div class="orderedlist">

1.  To disable /sparql, execute:

    ``` programlisting
    DB.DBA.VHOST_REMOVE (lpath=>'/sparql');
    ```

2.  To add the endpoint again via PL, execute:

    ``` programlisting
    DB.DBA.VHOST_DEFINE (lpath=>'/sparql/', ppath => '/!sparql/', is_dav => 1, vsp_user => 'dba', opts => vector('noinherit', 1));
    ```

</div>

</div>

<div id="sparqloauthendpointfoafsslsparqldisablecond" class="section">

<div class="titlepage">

<div>

<div>

###### Using Conductor UI:

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to http://cname:port/conductor .

2.  Enter user dba credentials.

3.  Go to "Web Application Server" -\> "Virtual Domains & Directories".

    <div class="figure-float">

    <div id="s1" class="figure">

    **Figure 16.31. Disable SPARQL Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Disable SPARQL Endpoint](images/ui/s1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Find the logical path "/sparql".

    <div class="figure-float">

    <div id="s2" class="figure">

    **Figure 16.32. Disable SPARQL Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Disable SPARQL Endpoint](images/ui/s2.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click "Edit" from the "Action" column.

    <div class="figure-float">

    <div id="s3" class="figure">

    **Figure 16.33. Disable SPARQL Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Disable SPARQL Endpoint](images/ui/s3.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Change "VSP User" to "nobody".

    <div class="figure-float">

    <div id="s4" class="figure">

    **Figure 16.34. Disable SPARQL Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Disable SPARQL Endpoint](images/ui/s4.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click "Save Changes".

8.  As result the SPARQL Endpoint should be shown as disabled:

    <div class="figure-float">

    <div id="s5" class="figure">

    **Figure 16.35. Disable SPARQL Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Disable SPARQL Endpoint](images/ui/s5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

<div id="rdfsupportedrequestmethodsofprotocol" class="section">

<div class="titlepage">

<div>

<div>

#### Request Methods

</div>

</div>

</div>

<div id="id48574" class="decimalstyle">

**Table 16.6. Methods List**

<div class="decimalstyle-contents">

| Method | Supported? | Notes                                       |
|:-------|------------|---------------------------------------------|
| GET    | Yes        | Short queries are sent in GET mode          |
| POST   | Yes        | Queries longer than 1900 bytes are POST-ed. |
| DELETE | No         |                                             |
| PUT    | No         |                                             |

</div>

</div>

  

</div>

<div id="rdfsparqlclientfunctions" class="section">

<div class="titlepage">

<div>

<div>

#### Functions

</div>

</div>

</div>

The SPARQL client can be invoked by three similar functions:

<div id="id48603" class="decimalstyle">

**Table 16.7. Functions List**

<div class="decimalstyle-contents">

| Function                      | Notes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |     |
|:------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----|
| DB.DBA.SPARQL_REXEC           | Behaves like DBA.SPARQL_EVAL, but executes the query on the specified server. The procedure does not return anything. Instead, it creates a result set.                                                                                                                                                                                                                                                                                                                                                                                  |     |
| DB.DBA.SPARQL_REXEC_TO_ARRAY  | Behaves like DBA.SPARQL_EXEC_TO_ARRAY (), but executes the query on the specified server. The function return a vector of rows, where every row is represented by a vector of field values.                                                                                                                                                                                                                                                                                                                                              |     |
| DB.DBA.SPARQL_REXEC_WITH_META | Has no local 'SPARQL_EVAL' analog. It produces an array of result rows together with an array of result set metadata in the same format as produced by the exec () function. This function can be used when the result should be passed later to exec_result_names () and exec_result () built-in functions. To process a local query in similar style, an application can use the SQL built-in function exec () - a SPARQL query (with the 'SPARQL' keyword in front) can be passed to exec () instead of a plain SQL SELECT statement. |     |

</div>

</div>

  

``` programlisting
create procedure DB.DBA.SPARQL_REXEC (
    in service varchar, in query varchar, in dflt_graph varchar, in named_graphs any,
    in req_hdr any, in maxrows integer, in bnode_dict any );
```

``` programlisting
create function DB.DBA.SPARQL_REXEC_TO_ARRAY (
    in service varchar, in query varchar, in dflt_graph varchar, in named_graphs any,
    in req_hdr any, in maxrows integer, in bnode_dict any )
    returns any;
```

``` programlisting
create procedure DB.DBA.SPARQL_REXEC_WITH_META (
    in service varchar, in query varchar, in dflt_graph varchar, in named_graphs any,
    in req_hdr any, in maxrows integer, in bnode_dict any,
    out metadata any,  -- metadata like exec () returns.
    out resultset any) -- results as 'long valmode' values.
```

</div>

<div id="rdfsparqlendpointexamples" class="section">

<div class="titlepage">

<div>

<div>

#### Examples

</div>

</div>

</div>

Virtuoso's SPARQL demo offers a live demonstration of Virtuoso's
implementation of the
<a href="http://www.w3.org/TR/rdf-dawg-uc/" class="ulink"
target="_top">DAWG's SPARQL test-suite</a> , a collection of SPARQL
query language use cases that enable interactive and simplified testing
of a triple store implementation. If you have installed the SPARQL Demo
VAD locally, it can be found at a URL similar to
'http://example.com:8080/sparql_demo/', the exact form will depend on
your local configuration. Alternatively, a live version of the
documentation is available at
<a href="http://demo.openlinksw.com/sparql_demo" class="ulink"
target="_top">Virtuoso Demo Server</a> .

<div id="rdfsparqlendpointexamples1" class="section">

<div class="titlepage">

<div>

<div>

##### Example SPARQL query issued via curl

</div>

</div>

</div>

``` programlisting
curl -F "query=SELECT DISTINCT ?p FROM <http://demo.openlinksw.com/DAV/home/demo/rdf_sink/> WHERE {?s ?p ?o}" http://demo.openlinksw.com/sparql
```

The result should be:

``` programlisting
<?xml version="1.0" ?>
<sparql xmlns="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/2001/sw/DataAccess/rf1/result2.xsd">
 <head>
  <variable name="p"/>
 </head>
 <results distinct="false" ordered="true">
  <result>
   <binding name="p"><uri>http://www.w3.org/1999/02/22-rdf-syntax-ns#type</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/nick</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/name</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/homepage</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/knows</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/workplaceHomepage</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/mbox</uri></binding>
  </result>
 </results>
</sparql>
```

</div>

<div id="rdfsparqlendpointexamples2" class="section">

<div class="titlepage">

<div>

<div>

##### Other Examples of SPARQL query issued via curl

</div>

</div>

</div>

<span class="emphasis">*Further example SPARQL queries:*</span>

``` programlisting
curl -F "query=SELECT DISTINCT ?Concept FROM <http://dbpedia.org> WHERE {?s a ?Concept} LIMIT 10" http://dbpedia.org/sparql
```

``` programlisting
curl -F "query=SELECT DISTINCT ?Concept FROM <http://example.com/dataspace/person/kidehen> WHERE {?s a ?Concept} LIMIT 10" http://demo.openlinksw.com/sparql
```

``` programlisting
curl -F "query=SELECT DISTINCT ?Concept FROM <http://data.openlinksw.com/oplweb/product_family/virtuoso> WHERE {?s a ?Concept} LIMIT 10" http://demo.openlinksw.com/sparql
```

``` programlisting
curl -F "query=SELECT DISTINCT ?Concept FROM <http://openlinksw.com/dataspace/organization/openlink> WHERE {?s a ?Concept} LIMIT 10" http://demo.openlinksw.com/sparql
```

</div>

<div id="rdfsparqlendpointexamples3" class="section">

<div class="titlepage">

<div>

<div>

##### Example with curl and SPARQL-WebID endpoint

</div>

</div>

</div>

``` programlisting
$ curl -H "Accept: text/rdf+n3"  --cert test.pem -k https://demo.openlinksw.com/dataspace/person/demo
Enter PEM pass phrase: *****
@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <https://demo.openlinksw.com/dataspace/demo/socialnetwork/demo%27s%20AddressBook/1046#> .
@prefix foaf:   <http://xmlns.com/foaf/0.1/> .
ns1:this        rdf:type        foaf:Person .
@prefix ns3:    <http://www.pipian.com/rdf/tami/juliette.n3#> .
ns3:juliette    rdf:type        foaf:Document .
@prefix ns4:    <https://demo.openlinksw.com/dataspace/person/> .
ns4:demo        rdf:type        foaf:PersonalProfileDocument .
@prefix ns5:    <https://demo.openlinksw.com/dataspace/person/demo#> .
@prefix geo:    <http://www.w3.org/2003/01/geo/wgs84_pos#> .
ns5:based_near  rdf:type        geo:Point .
@prefix ns7:    <https://demo.openlinksw.com/dataspace/demo/socialnetwork/demo%27s%20AddressBook/1042#> .
ns7:this        rdf:type        foaf:Person .
ns5:this        rdf:type        foaf:Person .
@prefix ns8:    <https://demo.openlinksw.com/dataspace/person/demo/online_account/> .
@prefix sioc:   <http://rdfs.org/sioc/ns#> .
ns8:demo        rdf:type        sioc:User .
@prefix ns10:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/myAddressBook/1001#> .
ns10:this       rdf:type        foaf:Person .
@prefix ns11:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/demo%27s%20AddressBook/1045#> .
ns11:this       rdf:type        foaf:Person .
@prefix ns12:   <https://demo.openlinksw.com/dataspace/demo#> .
ns12:this       rdf:type        sioc:User .
ns5:org rdf:type        foaf:Organization .
@prefix ns13:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/demo%27s%20AddressBook/1048#> .
ns13:this       rdf:type        foaf:Person .
@prefix ns14:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/myAddressBook/1001#this#> .
ns14:org        rdf:type        foaf:Organization .
@prefix ns15:   <https://demo.openlinksw.com/dataspace/person/imitko#> .
ns15:this       rdf:type        foaf:Person .
@prefix ns16:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/myAddressBook/1049#> .
ns16:this       rdf:type        foaf:Person .
@prefix ns17:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/myAddressBook/1000#> .
ns17:this       rdf:type        foaf:Person .
ns8:MySpace     rdf:type        sioc:User .
@prefix ns18:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/demo%27s%20AddressBook/1044#> .
ns18:this       rdf:type        foaf:Person .
@prefix dc:     <http://purl.org/dc/elements/1.1/> .
ns4:demo        dc:title        "demo demo's FOAF file" .
ns14:org        dc:title        "OpenLink" .
ns5:org dc:title        "OpenLink" .
ns18:this       foaf:name       "Kingsley Idehen" .
ns13:this       foaf:name       "Juliette" .
ns17:this       foaf:name       "Kingsley Idehen" .
ns5:this        foaf:name       "demo demo" .
ns15:this       foaf:name       "Mitko Iliev" .
ns10:this       foaf:name       "test test12" .
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
ns5:this        rdfs:seeAlso    ns4:demo .
ns15:this       rdfs:seeAlso    ns4:imitko .
ns4:demo        foaf:maker      ns5:this .
ns15:this       foaf:nick       "imitko" .
ns7:this        foaf:nick       "Orri Erling" .
ns13:this       foaf:nick       "Juliette" .
ns10:this       foaf:nick       "test1" .
ns5:this        foaf:nick       "demo" .
ns18:this       foaf:nick       "Kingsley" .
ns17:this       foaf:nick       "Kingsley" .
ns16:this       foaf:nick       "test2" .
ns1:this        foaf:nick       "TEST" .
ns11:this       foaf:nick       "TEST" .
ns5:this        foaf:holdsAccount       ns8:demo ,
                ns8:MySpace ,
                ns12:this .
@prefix ns21:   <http://example.com/dataspace/person/imitko#> .
ns5:this        foaf:knows      ns21:this ,
                ns17:this ,
                ns16:this ,
                ns3:juliette ,
                ns10:this ,
                ns7:this .
@prefix ns22:   <http://example.com/dataspace/person/kidehen#> .
ns5:this        foaf:knows      ns22:this ,
                ns18:this ,
                ns11:this ,
                ns1:this .
@prefix ns23:   <http://bblfish.net/people/henry/card#me\u0020> .
ns5:this        foaf:knows      ns23: ,
                ns13:this ,
                ns15:this ;
        foaf:firstName  "demo" ;
        foaf:family_name        "demo" ;
        foaf:gender     "male" ;
        foaf:icqChatID  "125968" ;
        foaf:msnChatID  "45demo78" ;
        foaf:aimChatID  "demo1234" ;
        foaf:yahooChatID        "demo678" ;
        foaf:based_near ns5:based_near .
@prefix ns24:   <http://www.openlinksw.com> .
ns5:this        foaf:workplaceHomepage  ns24: .
ns5:org foaf:homepage   ns24: .
ns5:this        foaf:homepage   ns24: .
ns14:org        foaf:homepage   ns24: .
ns4:demo        foaf:primaryTopic       ns5:this .
ns5:based_near  geo:lat "47.333332" ;
        geo:long        "13.333333" .
@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <https://demo.openlinksw.com/dataspace/demo#> .
@prefix foaf:   <http://xmlns.com/foaf/0.1/> .
ns1:this        rdf:type        foaf:OnlineAccount .
@prefix ns3:    <https://demo.openlinksw.com/dataspace/person/demo/online_account/> .
ns3:MySpace     rdf:type        foaf:OnlineAccount .
ns3:demo        rdf:type        foaf:OnlineAccount .
@prefix ns4:    <https://demo.openlinksw.com/dataspace/person/demo#> .
ns4:this        foaf:holdsAccount       ns3:MySpace ,
                ns1:this ,
                ns3:demo .
@prefix vcard:  <http://www.w3.org/2001/vcard-rdf/3.0#> .
ns4:this        vcard:ADR       ns4:addr .
ns4:addr        vcard:Country   "United States" ;
        vcard:Locality  "New York" ;
        vcard:Region    "Nebraska" .
@prefix ns6:    <http://myspace.com> .
ns3:MySpace     foaf:accountServiceHomepage     ns6: .
@prefix ns7:    <skype:demo?> .
ns3:demo        foaf:accountServiceHomepage     ns7:chat ;
        foaf:accountName        "demo" .
ns3:MySpace     foaf:accountName        "MySpace" .
@prefix ns8:    <http://vocab.org/bio/0.1/> .
ns4:this        ns8:olb "this is short resume of user Demo." .
@prefix ns9:    <https://demo.openlinksw.com/dataspace/> .
ns4:this        foaf:openid     ns9:demo ;
        ns8:keywords    "demo, openlinksw, virtuoso, weblog, rdf" .
@prefix foaf:   <http://xmlns.com/foaf/0.1/> .
@prefix ns1:    <https://demo.openlinksw.com/dataspace/demo/subscriptions/> .
@prefix ns2:    <https://demo.openlinksw.com/dataspace/person/demo#> .
ns1:DemoFeeds   foaf:maker      ns2:this .
@prefix ns3:    <https://demo.openlinksw.com/dataspace/demo/community/> .
ns3:demoCommunity       foaf:maker      ns2:this .
@prefix ns4:    <https://demo.openlinksw.com/dataspace/demo/eCRM/demo%27s%20eCRM> .
ns4:    foaf:maker      ns2:this .
@prefix ns5:    <https://demo.openlinksw.com/dataspace/demo/calendar/> .
ns5:mycalendar  foaf:maker      ns2:this .
@prefix ns6:    <https://demo.openlinksw.com/dataspace/demo/photos/> .
ns6:MyGallery   foaf:maker      ns2:this .
@prefix ns7:    <https://demo.openlinksw.com/dataspace/demo/briefcase/> .
ns7:mybriefcase foaf:maker      ns2:this .
@prefix ns8:    <https://demo.openlinksw.com/dataspace/demo/wiki/> .
ns8:ESBWiki     foaf:maker      ns2:this .
@prefix ns9:    <https://demo.openlinksw.com/dataspace/demo/bookmark/> .
ns9:mybookmarks foaf:maker      ns2:this .
@prefix ns10:   <https://demo.openlinksw.com/dataspace/demo/weblog/> .
ns10:myblog     foaf:maker      ns2:this .
@prefix ns11:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/demo%27s%20AddressBook> .
ns11:   foaf:maker      ns2:this .
@prefix ns12:   <https://demo.openlinksw.com/dataspace/demo/community/demo%27s%20Community> .
ns12:   foaf:maker      ns2:this .
ns8:mywiki      foaf:maker      ns2:this .
@prefix ns13:   <https://demo.openlinksw.com/dataspace/demo/eCRM/demo%20demo%27s%20eCRM> .
ns13:   foaf:maker      ns2:this .
@prefix ns14:   <https://demo.openlinksw.com/dataspace/demo/polls/> .
ns14:mypolls    foaf:maker      ns2:this .
@prefix ns15:   <https://demo.openlinksw.com/dataspace/demo/socialnetwork/> .
ns15:myAddressBook      foaf:maker      ns2:this .
ns3:SP2 foaf:maker      ns2:this .
ns2:this        foaf:made       ns11: ,
                ns4: ,
                ns3:demoCommunity ,
                ns12: ,
                ns15:myAddressBook ,
                ns10:myblog ,
                ns9:mybookmarks ,
                ns7:mybriefcase ,
                ns5:mycalendar ,
                ns14:mypolls ,
                ns8:mywiki ,
                ns1:DemoFeeds ,
                ns8:ESBWiki ,
                ns6:MyGallery ,
                ns3:SP2 ,
                ns13: .
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
ns9:mybookmarks rdfs:label      "demo demo's Bookmarks" .
ns15:myAddressBook      rdfs:label      "demo demo's AddressBook" .
ns4:    rdfs:label      "demo demo's eCRM" .
ns12:   rdfs:label      "demo's Community" .
ns14:mypolls    rdfs:label      "demo demo's Polls" .
ns13:   rdfs:label      "demo demo's eCRM Description" .
ns8:mywiki      rdfs:label      "demo demo's Wiki" .
ns7:mybriefcase rdfs:label      "demo demo's Briefcase" .
ns1:DemoFeeds   rdfs:label      "demo demo's Feeds" .
ns10:myblog     rdfs:label      "demo's Weblog" .
ns5:mycalendar  rdfs:label      "demo demo's Calendar" .
ns11:   rdfs:label      "demo demo's AddressBook" .
ns6:MyGallery   rdfs:label      "demo demo's Gallery" .
ns8:ESBWiki     rdfs:label      "demo demo's Wiki" .
ns3:demoCommunity       rdfs:label      "demo demo's Community" .
ns3:SP2 rdfs:label      "demo demo's Community" .
@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <https://demo.openlinksw.com/dataspace/person/demo#> .
@prefix ns2:    <http://www.w3.org/ns/auth/rsa#> .
ns1:cert        rdf:type        ns2:RSAPublicKey .
@prefix dc:     <http://purl.org/dc/elements/1.1/> .
@prefix ns4:    <https://demo.openlinksw.com/dataspace/person/demo/projects#ods%20project> .
ns4:    dc:title        "ods project" .
@prefix foaf:   <http://xmlns.com/foaf/0.1/> .
ns4:    foaf:maker      ns1:this .
ns1:this        foaf:made       ns4: .
@prefix ns6:    <http://www.w3.org/ns/auth/cert#> .
ns1:cert        ns6:identity    ns1:this ;
        ns2:modulus     ns1:cert_mod .
ns1:cert_mod    ns6:hex "b8edefa13092d05e85257d6be0aca54218091278583f1d18759c4bced0007948fa6e920018abc3c30b8885d303ec2e679f3a7c15036d38452ddd9ebfcbb41
e1bd08dca66b7737b744fd9e441ebefa425311363711714cd0fe3b334a79ce50be9eb3443193bcbf2f1486481e775382f1a1792a2a8438543ca6f478c3b13c5db2a7f9a12a9a5aed5ec498
6be0169a1859d027170812a28914d158fb76a5933f11777a06c8db64d10f7c02900c4bb4bbf2d24c0e34c6ca135fdb5e05241bc029196ceef13a2006f07d1800f17762c0cfe05b3dac3042
09e1b7a3973122e850e96fcd0396544f82f0b11a46f0d868ba0f3d8efd957e7ef224871905a06c3c5d85ac9" .
ns1:cert        ns2:public_exponent     ns1:cert_exp .
ns1:cert_exp    ns6:decimal     "65537" .
@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <https://demo.openlinksw.com/dataspace/person/demo#> .
@prefix ns2:    <http://vocab.org/bio/0.1/> .
ns1:event       rdf:type        ns2:Birth .
@prefix foaf:   <http://xmlns.com/foaf/0.1/> .
@prefix ns4:    <mailto:demo@openlinksw.com> .
ns1:this        foaf:mbox       ns4: ;
        foaf:birthday   "01-01" .
@prefix dc:     <http://purl.org/dc/elements/1.1/> .
ns1:event       dc:date "1968-01-01" .
ns1:this        ns2:event       ns1:event .
```

</div>

<div id="rdfsparqlendpointexamples4" class="section">

<div class="titlepage">

<div>

<div>

##### Example with curl and SPARQL-OAuth endpoint

</div>

</div>

</div>

Note: this is just an example as token had expired already. You can go
to <a href="rdfsparqlprotocolendpoint.html#sparqloauthendpoint"
class="link" title="SPARQL OAuth Endpoint">this</a> section to see how
to interact with our Virtuoso UI.

``` programlisting
$ curl "http://demo.openlinksw.com/oauth/sparql.vsp?debug=on&default-graph-uri=&format=text%2Fhtml&oauth_consumer_key=27f105a327f5f23163e0636f78901
8dacdd70bb5&oauth_nonce=a14d43339fcb2638&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1242106643&oauth_token=42e2af4d9264ef42521c1010aff99f60a8
ee95a2&oauth_version=1.0&query=select%20distinct%20%3FURI%20%3FObjectType%20where%20%7B%3FURI%20a%20%3FObjectType%7D%20limit%2050&oauth_signature=C
w9yJ2saU1vgHuFxWcughai5cZY%3D"
<table class="sparql" border="1">
  <tr>
    <th>URI</th>
    <th>ObjectType</th>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-nonblank</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-nonblank-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarchar</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarchar-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarbinary</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarbinary-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-uri</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-uri-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-uri</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-uri-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-doubleprecision</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-doubleprecision-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-date</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-date-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-datetime</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-datetime-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#multipart-uri</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#multipart-uri-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#multipart-uri-fn-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#multipart-literal-fn-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-uri-fn</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-uri-fn-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-uri-fn</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-uri-fn-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-literal-fn</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-literal-fn-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-literal-fn</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-integer-literal-fn-nullable</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.w3.org/1999/02/22-rdf-syntax-ns#type</td>
    <td>http://www.w3.org/1999/02/22-rdf-syntax-ns#Property</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-nullable-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-nonblank-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-iid-nonblank-nullable-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#default-nullable-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-nullable-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarchar-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarchar-nullable-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarbinary-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-longvarbinary-nullable-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
  <tr>
    <td>http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-uri-SuperFormats</td>
    <td>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</td>
  </tr>
</table>
```

</div>

<div id="rdfsparqlendpointexamples5" class="section">

<div class="titlepage">

<div>

<div>

##### Example with CONSTRUCT

</div>

</div>

</div>

Go to the sparql endpoint UI: i.e. go to http://host:port/sparql

For the Default Graph URI enter:
http://www.w3.org/2001/sw/DataAccess/proto-tests/data/construct/simple-data.rdf

Select "Retrieve remote RDF data for all missing source graphs".

For the query text enter:

``` programlisting
SELECT * WHERE {?s ?p ?o}
```

Click the "Run Query" button.

The query results, shown below, are cached locally ( network resources
being fetched ). The remote RDF data is saved in the local RDF quad
store as graph
http://www.w3.org/2001/sw/DataAccess/proto-tests/data/construct/simple-data.rdf

``` programlisting
s                                     p                                                o
http://www.example/jose/foaf.rdf#jose     http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://xmlns.com/foaf/0.1/Person
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/nick               Jo
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/name               Jose Jimen~ez
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/knows              http://www.example/jose/foaf.rdf#juan
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/homepage               http://www.example/jose/
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/workplaceHomepage      http://www.corp.example/
http://www.example/jose/foaf.rdf#kendall  http://xmlns.com/foaf/0.1/knows                  http://www.example/jose/foaf.rdf#edd
http://www.example/jose/foaf.rdf#julia    http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://xmlns.com/foaf/0.1/Person
http://www.example/jose/foaf.rdf#julia    http://xmlns.com/foaf/0.1/mbox               mailto:julia@mail.example
http://www.example/jose/foaf.rdf#juan     http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://xmlns.com/foaf/0.1/Person
http://www.example/jose/foaf.rdf#juan     http://xmlns.com/foaf/0.1/mbox               mailto:juan@mail.example
```

Now let's take the CONSTRUCT query:

``` programlisting
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX myfoaf: <http://www.example/jose/foaf.rdf#>
CONSTRUCT
  { myfoaf:jose foaf:depiction <http://www.example/jose/jose.jpg>.
    myfoaf:jose foaf:schoolHomepage <http://www.edu.example/>.
    ?s ?p ?o.
  }
FROM <http://www.w3.org/2001/sw/DataAccess/proto-tests/data/construct/simple-data.rdf>
WHERE
  {
    ?s ?p ?o. myfoaf:jose foaf:nick "Jo".
    FILTER ( ! (?s = myfoaf:kendall && ?p = foaf:knows && ?o = myfoaf:edd )
    && ! ( ?s = myfoaf:julia && ?p = foaf:mbox && ?o = <mailto:julia@mail.example> )
    && ! ( ?s = myfoaf:julia && ?p = rdf:type && ?o = foaf:Person))
  }
```

From an HTTP client, issue the GET command with the above query added as
a URL-encoded parameter value:

``` programlisting
GET -e -s http://host:port/sparql/?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+myfoaf%3A+%3Chttp%3A%2F%2Fwww.example%2Fjose%2Ffoaf.rdf%23%3E%0D%0A%0D%0ACONSTRUCT+%7B+myfoaf%3Ajose+foaf%3Adepiction+%3Chttp%3A%2F%2Fwww.example%2Fjose%2Fjose.jpg%3E.%0D%0A++++++++++++myfoaf%3Ajose+foaf%3AschoolHomepage+%3Chttp%3A%2F%2Fwww.edu.example%2F%3E.%0D%0A++++++++++++%3Fs+%3Fp+%3Fo.%7D%0D%0AFROM+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2Fsw%2FDataAccess%2Fproto-tests%2Fdata%2Fconstruct%2Fsimple-data.rdf%3E%0D%0AWHERE+%7B+%3Fs+%3Fp+%3Fo.+myfoaf%3Ajose+foaf%3Anick+%22Jo%22.%0D%0A+++++++FILTER+%28+%21+%28%3Fs+%3D+myfoaf%3Akendall+%26%26+%3Fp+%3D+foaf%3Aknows+%26%26+%3Fo+%3D+myfoaf%3Aedd+%29%0D%0A++++++++++++++%26%26+%21+%28+%3Fs+%3D+myfoaf%3Ajulia+%26%26+%3Fp+%3D+foaf%3Ambox+%26%26+%3Fo+%3D+%3Cmailto%3Ajulia%40mail.example%3E+%29%0D%0A++++++++++%26%26+%21+%28+%3Fs+%3D+myfoaf%3Ajulia+%26%26+%3Fp+%3D+rdf%3Atype+%26%26+%3Fo+%3D+foaf%3APerson%29%29%0D%0A%7D%0D%0A&format=application%2Frdf%2Bxml
```

The request response will be similar to:

``` programlisting
200 OK
Connection: close
Date: Fri, 28 Dec 2007 10:06:14 GMT
Accept-Ranges: bytes
Server: Virtuoso/05.00.3023 (Win32) i686-generic-win-32  VDB
Content-Length: 2073
Content-Type: application/rdf+xml; charset=UTF-8
Client-Date: Fri, 28 Dec 2007 10:06:14 GMT
Client-Peer: 83.176.40.177:port
Client-Response-Num: 1

<?xml version="1.0" encoding="utf-8" ?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#juan"><ns0pred:mbox xmlns:ns0pred="http://xmlns.com/foaf/0.1/" rdf:resource="mailto:juan@mail.example"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:schoolHomepage xmlns:ns0pred="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.edu.example/"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:type xmlns:ns0pred="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="http://xmlns.com/foaf/0.1/Person"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:homepage xmlns:ns0pred="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.example/jose/"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#juan"><ns0pred:type xmlns:ns0pred="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="http://xmlns.com/foaf/0.1/Person"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:workplaceHomepage xmlns:ns0pred="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.corp.example/"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:nick xmlns:ns0pred="http://xmlns.com/foaf/0.1/">Jo</ns0pred:nick></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:depiction xmlns:ns0pred="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.example/jose/jose.jpg"/></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:name xmlns:ns0pred="http://xmlns.com/foaf/0.1/">Jose Jime?+ez</ns0pred:name></rdf:Description>
<rdf:Description rdf:about="http://www.example/jose/foaf.rdf#jose"><ns0pred:knows xmlns:ns0pred="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.example/jose/foaf.rdf#juan"/></rdf:Description>
</rdf:RDF>
Done
```

</div>

<div id="rdfsparqlendpointexamples6" class="section">

<div class="titlepage">

<div>

<div>

##### Example with extraction part of literal as variable

</div>

</div>

</div>

The following example shows how to extract a part of a literal as a
variable for use in a numeric comparison using SPARQL

Suppose there are the following triples inserted:

``` programlisting
SQL>SPARQL INSERT INTO GRAPH <http://mygraph.com> {  <:a>
                                                     <:p>
                                                     "123 abc" };
callret-0
VARCHAR
_______________________________________________________________________________

Insert into <http://mygraph.com>, 1 triples -- done

1 Rows. -- 30 msec.
SQL>SPARQL INSERT INTO GRAPH <http://mygraph.com> {  <:a>
                                                     <:p>
                                                     "234 abc" };
callret-0
VARCHAR
_______________________________________________________________________________

Insert into <http://mygraph.com>, 1 triples -- done

1 Rows. -- 0 msec.
```

In order to extract the numeric part, and then do a numeric (\<.\>,=),
you can use atoi (), atol or atof in the filter:

``` programlisting
SQL>SPARQL
SELECT *
FROM <http://mygraph.com>
WHERE
  {
    ?s ?p ?o . filter (bif:atoi (?o) > 130)
  };
s        p         o
VARCHAR  VARCHAR   VARCHAR
___________________________________

:a       :p        234 abc

1 Rows. -- 10 msec.
```

</div>

<div id="rdfsparqlendpointexamples7" class="section">

<div class="titlepage">

<div>

<div>

##### Example how to define rule

</div>

</div>

</div>

See details <a href="rdfsparqlruleexamples.html" class="link"
title="16.14.8. Examples">here</a> how to define rule context that is
initialized from the contents of a given graph.

</div>

</div>

<div id="rdfsparqlendpointimplnotes" class="section">

<div class="titlepage">

<div>

<div>

#### Implementation Notes

</div>

</div>

</div>

This service has been implemented using
<a href="http://docs.openlinksw.com/virtuoso" class="ulink"
target="_top">Virtuoso Server</a> .

</div>

<div id="rdftables" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso 'Semantic Bank' End Point

</div>

</div>

</div>

<span class="emphasis">*What is Piggy Bank?*</span>

Piggy Bank is an extension to the Firefox Web browser that turns it into
a Semantic Web browser, letting you make use of existing information on
the Web in more useful and flexible ways not offered by the original Web
sites.

<span class="emphasis">*What is Semantic Bank?*</span>

Semantic Bank is the server companion of Piggy Bank that lets you
persist, share and publish data collected by individuals, groups or
communities. Here is a screen shot of one in action:

<span class="emphasis">*What can I do with this?*</span>

A Semantic Bank allows you to:

<div class="itemizedlist">

- Persist your information remotely on a server - This is useful, for
  example, if you want to share data between two of your computers or to
  avoid losing it due to mistakes or failure.

- Share information with other people - The ability to tag resources
  creates a powerful serendipitous categorization (as proven by things
  like del.icio.us or Flickr).

- Lets you publish your information - Both in the "pure" RDF form (for
  those who know how to make use of it) or to regular web pages, with
  the usual Longwell faceted browsing view of it

</div>

<span class="emphasis">*How can I help?*</span>

Semantic Bank is Open Source software and built around the spirit of
open participation and collaboration.

There are several ways you can help:

<div class="itemizedlist">

- Install a Semantic Bank and let us know about it, so that we can
  update the list of available Semantic Banks.

- Subscribe to our mailing lists to show your interest and give us
  feedback

- Report problems and ask for new features through our issue tracking
  system.

- Send us patches or fixes to the code

</div>

<span class="emphasis">*Licensing and Legal Issues*</span>

Semantic Bank is open source software and is licensed under the BSD
license.

<span class="emphasis">*Note*</span> , however, that this software ships
with libraries that are not released under the same license; that we
interpret their licensing terms to be compatible with ours and that we
are redistributing them unmodified. For more information on the
licensing terms of the libraries Semantic Bank depends on, please refer
to the source code.

<span class="emphasis">*Download location:*</span>

<a href="http://simile.mit.edu/dist/semantic-bank/" class="ulink"
target="_top">"http://simile.mit.edu/dist/semantic-bank/</a>

<span class="emphasis">*The Virtuoso Semantic Bank End Point*</span>

Before you can publish, you must register with one or more Semantic
Banks:

<div class="itemizedlist">

- Invoke the menu command Tools \> Piggy Bank \> My Semantic Bank
  Accounts ...

- Click Add... in the Semantic Bank Accounts dialog box.

- In the popup dialog box, type in the URL to the Virtuoso Semantic Bank
  you want to register with. Example:
  http://server_name:server_port/bank

- Enter the account of a valid Virtuoso DAV user. (Note: currently we do
  not use encryption during authentication; do not use your precious
  password here.)

- Click OK, wait for the account to be registered, and then dismiss the
  Semantic Bank Accounts dialog box.

- To publish an item, just click the corresponding Publish button (much
  like how you save the item). To publish all the items being viewed,
  click the Publish All button.

</div>

<span class="emphasis">*What is the graph name used by Virtuoso for the
triples from PiggyBank?*</span>

http://simile.org/piggybank/\<piggybank-generated-name\>

The piggybank-generated-name is a Virtuoso DAV user ID.

</div>

<div id="rdfsparqlexnpointnorthwindexample" class="section">

<div class="titlepage">

<div>

<div>

#### Making Linked Data Views Dereferenceable - Northwind Example

</div>

</div>

</div>

Consider an application that makes some relational data available for
SPARQL requests, as described in the
<a href="rdfviewsenterpr.html#rdfviewnorthwindexample1" class="link"
title="16.8.1. Simple Mapping Example -- Northwind Linked Data View">first
part of the Northwind Linked Data View example</a> . This may be
sufficient for some clients but the IRIs of the described subjects are
not dereferenceable. This means that external SPARQL processors cannot
retrieve that data using the Virtuoso Sponger or the like. It also means
that if some external resources refer to the IRI of some Northwind
subject and a user browses that resource then he cannot look at the
application's data by clicking on the subject link.

To make RDF access complete, applications can do the following:

<div class="orderedlist">

1.  Create a virtual directory

2.  Instruct the server how to prepare RDF resources on demand

3.  Configure rendering of RDF resources for non-RDF clients (including
    Web search engines)

4.  Make the used ontology available

5.  Provide an index or sitemap page to help users who try to browse
    published data but do not know the proper URLs

</div>

The following sequence of operations demonstrates how to implement the
listed features without writing any special web pages. All requests
(except the application-specific index/sitemap) will be handled by
existing web service endpoints.

As a precaution, we erase any URL rewriting rule lists created by this
example that may be in the database following a previous run of the
script.

``` programlisting
DB.DBA.URLREWRITE_DROP_RULELIST ('demo_nw_rule_list1', 1)
;
```

Do the same for individual rewrite rules:

``` programlisting
DB.DBA.URLREWRITE_DROP_RULE ('demo_nw_rule1', 1)
;
DB.DBA.URLREWRITE_DROP_RULE ('demo_nw_rule2', 1)
;
DB.DBA.URLREWRITE_DROP_RULE ('demo_nw_rule3', 1)
;
DB.DBA.URLREWRITE_DROP_RULE ('demo_nw_rule4', 1)
;
```

As a sanity check we ensure that there are no other similarly named
rules:

``` programlisting
SQL>SELECT signal ('WEIRD', sprintf ('Rewrite rule "%s" found', URR_RULE))
FROM DB.DBA.URL_REWRITE_RULE WHERE URR_RULE like 'demo_nw%'
;
```

Next we create URI rewrite rules based on regular expressions by calling
<a href="fn_urlrewrite_create_regex_rule.html" class="link"
title="URLREWRITE_CREATE_REGEX_RULE"><code
class="function">DB.DBA.URLREWRITE_CREATE_REGEX_RULE</code></a> , so the
same path will be redirected to different places depending on the MIME
types the client can accept.

For a given input path, that is a URI identifying a particular Linked
Data entity, the rewrite rule below generates an N3 or RDF/XML
representation of the entity using a CONSTRUCT query. (Note: In the
regular expression identifying the Accept: MIME types this rule applies
to, i.e. in rdf.n3 and rdf.xml, each period (.) replaces a literal
character because some SPARQL web clients published before the relevant
W3C recommendations produce slightly incorrect "Accept:" strings.)

``` programlisting
SQL>DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Fp+%%3Fo+}+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/Northwind%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|                              | The request URL for the SPARQL web service looks terrible because it is URL-encoded; the sprintf format string for it is even worse! The easiest way of composing encoded strings of this sort is to use the Conductor UI for configuring the rewrite rules. Alternatively open the SPARQL endpoint page (assuming it supports a UI for entering queries, if no query string is specified), type in the desired CONSTRUCT or DESCRIBE statement into the web form (using some sample URI), execute it, cut the URL of the page with results from the address line of the browser window, paste it into the script and then replace the host name with <span class="emphasis">*^{URIQADefaultHost}^*</span> , every percent with double percent, the parts of the sample IRI to be substituted with <span class="emphasis">*%U*</span> ; finally adjust the vector of replacement parameters so that its length is equal to the number of <span class="emphasis">*%U*</span> or other format specifiers in the template. |

</div>

The next rule redirects to the RDF browser service to display a
description of the subject URI and let the user explore related
subjects.

``` programlisting
SQL>DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/rdfbrowser/index.html?uri=http%%3A//^{URIQADefaultHost}^%U%%23this',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );
```

This next rule removes any trailing slash from the input path. Note that
<span class="emphasis">*\x24*</span> is the hex character code for the
end-of-line pattern <span class="emphasis">*\$*</span> . It is written
escaped because the dollar sign indicates the beginning of macro in
ISQL.

``` programlisting
SQL>DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule3',
    1,
    '(/[^#]*)/\x24',
    vector('path'),
    1,
    '%s',
    vector('path'),
    null,
    null,
    0,
    null
    );
```

To configure the server to furnish the ontology underpinning the example
Northwind Linked Data View, the procedure LOAD_NW_ONTOLOGY_FROM_DAV,
listed below, takes the ontology described in file
/DAV/VAD/demo/sql/nw.owl and loads it into graph
http://demo.openlinksw.com/schemas/NorthwindOntology/1.0/ in the local
quad store. A rewrite rule is then created to query this graph when the
input path identifies entities from this ontology.

``` programlisting
SQL>create procedure DB.DBA.LOAD_NW_ONTOLOGY_FROM_DAV()
{
  declare content1, urihost varchar;
  SELECT cast (RES_CONTENT as varchar) INTO content1 from WS.WS.SYS_DAV_RES WHERE RES_FULL_PATH = '/DAV/VAD/demo/sql/nw.owl';
  DB.DBA.RDF_LOAD_RDFXML (content1, 'http://demo.openlinksw.com/schemas/northwind#', 'http://demo.openlinksw.com/schemas/NorthwindOntology/1.0/');
  urihost := cfg_item_value(virtuoso_ini_path(), 'URIQA','DefaultHost');
  if (urihost = 'demo.openlinksw.com')
  {
    DB.DBA.VHOST_REMOVE (lpath=>'/schemas/northwind');
    DB.DBA.VHOST_DEFINE (lpath=>'/schemas/northwind', ppath=>'/DAV/VAD/demo/sql/nw.owl', vsp_user=>'dba', is_dav=>1, is_brws=>0);
    DB.DBA.VHOST_REMOVE (lpath=>'/schemas/northwind#');
    DB.DBA.VHOST_DEFINE (lpath=>'/schemas/northwind#', ppath=>'/DAV/VAD/demo/sql/nw.owl', vsp_user=>'dba', is_dav=>1, is_brws=>0);
  }
};

DB.DBA.LOAD_NW_ONTOLOGY_FROM_DAV();

drop procedure DB.DBA.LOAD_NW_ONTOLOGY_FROM_DAV;

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule4',
    1,
    '/schemas/northwind#(.*)',
    vector('path'),
    1,
    '/sparql?query=DESCRIBE%20%3Chttp%3A//demo.openlinksw.com/schemas/northwind%23%U%3E%20FROM%20%3Chttp%3A//demo.openlinksw.com/schemas/NorthwindOntology/1.0/%3E',
    vector('path'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );
```

Next we define virtual directory
<span class="emphasis">*/Northwind*</span> and associate with this a
rulelist containing the URL rewriting rules defined above. Requests
matching the rewriting rules should then be properly redirected to
produce the requested data. Attempts to access the virtual directory
root will execute the application's default VSP page, namely
<span class="emphasis">*sfront.vspx*</span> .

``` programlisting
SQL>DB.DBA.URLREWRITE_CREATE_RULELIST (
    'demo_nw_rule_list1',
    1,
    vector (
                'demo_nw_rule1',
                'demo_nw_rule2',
                'demo_nw_rule3',
                'demo_nw_rule4'
          ));

VHOST_REMOVE (lpath=>'/Northwind');
DB.DBA.VHOST_DEFINE (lpath=>'/Northwind', ppath=>'/DAV/home/demo/', vsp_user=>'dba', is_dav=>1, def_page=>'sfront.vspx',
          is_brws=>0, opts=>vector ('url_rewrite', 'demo_nw_rule_list1'));
```

Finally, to register the namespace prefix
<span class="emphasis">*northwind*</span> as persistent we execute:

``` programlisting
SQL>DB.DBA.XML_SET_NS_DECL ('northwind', 'http://demo.openlinksw.com/schemas/northwind#', 2);
```

</div>

<div id="rdfproxyservice" class="section">

<div class="titlepage">

<div>

<div>

#### Sponger Proxy URI Service

</div>

</div>

</div>

In certain cases, such as Ajax applications, it's prohibited to issue
HTTP requests to a server other than the original server. In other cases
it is necessary to transform the content of a target to an RDF format.
To this end Virtuoso Server provides a Sponger Proxy URI Service. This
service takes as an argument a target URL and may return the target's
content "as is" or the Sponger may try to transform the content and
return an RDF representation of the target. When transforming to RDF,
the RDF format (RDF/XML, N3, TURTLE etc) of the output can be forced by
a URL parameter or by content negotiation.

When the cartridges_dav.vad package is installed, Virtuoso reserves the
path '/about/\[id\|html\|data\|rdf\]/http/' for the RDF proxy service.
In the current implementation, Virtuoso defines virtual directories for
HTTP requests that come to the port specified as 'ServerPort' in the
'\[HTTPServer\]' section of Virtuoso configuration file and refer to the
above path string. So, if the Virtuoso installation on host example.com
listens for HTTP requests on port 8080, client applications should use
the 'service endpoint' string equal to
'http://example.com:8080/about/\[id\|html\|data\|rdf\]/http/'.

If the cartridges_dav.vad VAD package is not installed, then the path
'/proxy/rdf/' is used for the Sponger Proxy URI Service.

The old pattern for the Sponger Proxy URI Service, '/proxy/', is now
deprecated.

<span class="emphasis">*Note:*</span> If you do not have the cartridges
package installed, in order for the Sponger Proxy URI Service to work
correctly, you must grant the SPARQL_UPDATE role to user SPARQL and
grant execute permission on procedure RDF_SPONGE_UP.

To enable SPARQL_UPDATE using the Conductor UI:

<div class="orderedlist">

1.  Go to the Virtuoso Administration Conductor i.e.
    http://host:port/conductor

2.  Login as dba user

3.  Go to System Admin-\>User Accounts-\>Roles

4.  <div class="figure-float">

    <div id="rl1" class="figure">

    **Figure 16.36. Conductor UI**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor UI](images/ui/cn1.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the link "Edit" for "SPARQL_UPDATE

6.  Select from the list of available user/groups "SPARQL" and click the
    "\>\>" button so to add it to the right-positioned list.

7.  <div class="figure-float">

    <div id="rl2" class="figure">

    **Figure 16.37. Conductor UI**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor UI](images/ui/cn2.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click the button "Update".

</div>

To grant execute permission on RDF_SPONGE_UP:

``` programlisting
grant execute on DB.DBA.RDF_SPONGE_UP to "SPARQL";
```

When invoked with a URL of the form http://host:port/proxy?..., the
Sponger Proxy URI Service accepts the following query string parameters:

<div class="itemizedlist">

- <span class="emphasis">*force*</span>

  \- if 'rdf' is specified, the Sponger will try to extract RDF data
  from the target and return it

- <span class="emphasis">*header*</span>

  \- HTTP headers to be sent to the target

- <span class="emphasis">*output-format*</span>

  \- if 'force=rdf' is given, designates the desired output MIME type of
  the RDF data. The default is 'rdf+xml'. Other supported MIME types are
  'n3', 'turtle' or 'ttl'.

</div>

When RDF data is requested and 'output-format' is not specified, the
result will be serialized with a MIME type determined by the request
'Accept' headers i.e. the proxy service will do content negotiation.

Example: RDF file with URL: http://www.w3.org/People/Berners-Lee/card

``` programlisting
-- Access the url in order to view the result in HTML format:
http://host:port/about/html/http/www.w3.org/People/Berners-Lee/card
-- Access the url in order to view the result in RDF:
http://host:port/about/rdf/http://www.w3.org/People/Berners-Lee/card
-- or use the following proxy invocation style:
http://host:port/proxy/rdf/http://www.w3.org/People/Berners-Lee/card
-- or this one:
http://host:port/proxy?url=http://www.w3.org/People/Berners-Lee/card&force=rdf
```

Note: It is not permitted, when using the style
http://host:port/proxy/rdf, to pass URL query string parameters to the
proxy.

Now go to the SPARQL endpoint, i.e. http://host:port/sparql

For the 'Default Graph URI' enter the URL of the RDF file:
http://www.w3.org/People/Berners-Lee/card

For 'Query' enter:

``` programlisting
SELECT *
WHERE
  {
    ?s ?p ?o
  }
```

Query result:

``` programlisting
s                                           p                                              o
http://www.w3.org/People/Berners-Lee/card   http://www.w3.org/1999/02/22-rdf-syntax-ns#type    http://xmlns.com/foaf/0.1/PersonalProfileDocument
http://www.w3.org/People/Berners-Lee/card   http://purl.org/dc/elements/1.1/title              Tim Berners-Lee's FOAF file
http://www.w3.org/People/Berners-Lee/card   http://creativecommons.org/ns#license              http://creativecommons.org/licenses/by-nc/3.0/
http://www.w3.org/People/Berners-Lee/card   http://xmlns.com/foaf/0.1/maker                http://www.w3.org/People/Berners-Lee/card#i
etc ...
```

</div>

<div id="sparqliniservice" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL INI service

</div>

</div>

</div>

The <a href="ch-server.html#ini_sparql" class="link"
title="[SPARQL]">[SPARQL] section</a> of the virtuoso.ini configuration
file sets parameters and limits for the SPARQL query web service. The
values contained in the \[SPARQL\] section can be exposed in RDF form
via the URL pattern http://cname/sparql?ini

Example: http://demo.openlinksw.com/sparql?ini

``` programlisting
<?xml version="1.0" encoding="utf-8" ?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:MaxQueryCostEstimationTime xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">1000</ns0pred:MaxQueryCostEstimationTime></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:ExternalXsltSource xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">1</ns0pred:ExternalXsltSource></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:DefaultQuery xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">SELECT ?Subject ?Concept WHERE {?Subject a ?Concept}</ns0pred:DefaultQuery></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:ResultSetMaxRows xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">100000</ns0pred:ResultSetMaxRows></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:MaxQueryExecutionTime xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">30</ns0pred:MaxQueryExecutionTime></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:ExternalQuerySource xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">1</ns0pred:ExternalQuerySource></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:DefaultGraph xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">http://demo.openlinksw.com/dataspace/person/demo</ns0pred:DefaultGraph></rdf:Description>
<rdf:Description rdf:about="http://www.openlinksw.com/schemas/virtini#SPARQL"><ns0pred:PingService xmlns:ns0pred="http://www.openlinksw.com/schemas/virtini#">http://rpc.pingthesemanticweb.com/</ns0pred:PingService></rdf:Description>
</rdf:RDF>
```

</div>

<div id="sparqlexcel" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL Endpoint with Excel MIME Type Output Option

</div>

</div>

</div>

The SPARQL endpoint offers an Excel MIME type output option.

From http://cname:host/sparql, select "Spreadsheet" for the "Display
Results As:" option and click the "Run Query" button.

<div class="figure-float">

<div id="sparqlexcel1" class="figure">

**Figure 16.38. SPARQL Endpoint with Excel MIME type output**

<div class="figure-contents">

<div class="mediaobject">

![SPARQL Endpoint with Excel MIME type output](images/ui/Excel1.png)

</div>

</div>

</div>

  

</div>

The resulting query string contains a format parameter value of
<span class="emphasis">*"application/vnd.ms-excel"*</span> . For
example, <a
href="http://demo.openlinksw.com/sparql?default-graph-uri=http%3A%2F%2Fdemo.openlinksw.com%2Fdataspace%2Fperson%2Fdemo&amp;should-sponge=&amp;query=select+*%0D%0Awhere+%7B%3Fs+%3Fp+%3Fo%7D%0D%0Alimit+10&amp;format=application%2Fvnd.ms-excel&amp;debug=on"
class="ulink" target="_top">A URL such as this one</a> will be
generated, and can be opened directly with Excel.

<div class="figure-float">

<div id="sparqlexcel2" class="figure">

**Figure 16.39. SPARQL Endpoint with Excel MIME type output**

<div class="figure-contents">

<div class="mediaobject">

![SPARQL Endpoint with Excel MIME type output](images/ui/Excel2.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="sparqljson" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL Endpoint with RDF+JSON Output: SPARQL UI Example

</div>

</div>

</div>

The SPARQL endpoint also offers a RDF+JSON output option.

From http://cname:host/sparql select "JSON" for "Display Results As:"
and click the "Run Query" button.

<div class="figure-float">

<div id="sparqljson1" class="figure">

**Figure 16.40. SPARQL Endpoint with RDF+JSON output**

<div class="figure-contents">

<div class="mediaobject">

![SPARQL Endpoint with RDF+JSON output](images/ui/JSON1.png)

</div>

</div>

</div>

  

</div>

As result URL containing as parameter the format
<span class="emphasis">*application/sparql-results+json*</span> will be
generated and the content should look like:

<div class="figure-float">

<div id="sparqljson2" class="figure">

**Figure 16.41. SPARQL Endpoint with JSON+RDF**

<div class="figure-contents">

<div class="mediaobject">

![SPARQL Endpoint with JSON+RDF](images/ui/JSON2.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="sparqljsonp" class="section">

<div class="titlepage">

<div>

<div>

#### SPARQL Endpoint with JSON/P Output Option: Curl Example

</div>

</div>

</div>

The SPARQL endpoint also offers a JSON/P output option.

The SPARQL endpoint accepts a 'callback' URL parameter and in this case
when parameter 'format' is 'json', then it will produce JSON/P output.

``` programlisting
$ curl "http://lod.openlinksw.com/sparql?query=select+*+where+\{+%3Fx+a+%3Fz+.+\}+limit+10&format=json&debug=on&callback=func"
func(

{ "head": { "link": [], "vars": ["x", "z"] },
  "results": { "distinct": false, "ordered": true, "bindings": [
    { "x": { "type": "bnode", "value": "nodeID://b196899188" }  , "z": { "type": "uri", "value": "http://www.w3.org/2000/10/swap

    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2005/04/sparqlette/#profile" } , "z": { "type": "uri", "value":
services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/#b-profile" }   , "z": { "type": "uri",
aml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/#a-profile" }   , "z": { "type": "uri",
aml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/index.rdf#a-profile" }  , "z": { "type":
://www.daml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/index.rdf#b-profile" }  , "z": { "type":
://www.daml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2006/06/blogmatrix/#profile" } , "z": { "type": "uri", "value":
services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/#b-profile" }   , "z": { "type": "uri",
aml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/#a-profile" }   , "z": { "type": "uri",
aml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }},
    { "x": { "type": "uri", "value": "http://www.wasab.dk/morten/2003/12/nearestAirport/#b-profile" }   , "z": { "type": "uri",
aml.org/services/owl-s/1.1/Service.owl#ServiceProfile" }} ] } })
```

</div>

</div>
