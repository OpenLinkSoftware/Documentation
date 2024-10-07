<div id="soaprequestoversparqlendpoint" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.69. How Can I send SOAP requests to Virtuoso SPARQL Endpoint?

</div>

</div>

</div>

This section presents sample scenario how to execute SPARQL query in
SOAP request over Virtuoso SPARQL Endpoint.

<div class="orderedlist">

1.  Assume the following sample SOAP request containing simple SPARQL
    query:

    ``` programlisting
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
       <soapenv:Body>
          <query-request xmlns="http://www.w3.org/2005/09/sparql-protocol-types/#">
             <query xmlns="">SELECT DISTINCT ?z FROM virtrdf: {?x ?y ?z .} LIMIT 10</query>
          </query-request>
       </soapenv:Body>
    </soapenv:Envelope>
    ```

2.  Save locally the content from above for ex. to file with name
    "soap.xml".

3.  To pass the SOAP request to a Virtuoso SPARQL Endpoint, execute the
    following curl command:

    ``` programlisting
    $ curl -d@soap.xml -H "Content-Type:text/xml" -H "SOAPAction: ''" http://example.com/sparql
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
      <soapenv:Body>
        <query-result xmlns="http://www.w3.org/2005/09/sparql-protocol-types/#">
          <sparql xmlns="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/2001/sw/DataAccess/rf1/result2.xsd">
            <head>
             <variable name="z"/>
            </head>
            <results distinct="false" ordered="true">
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadStorage</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapFormat</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadMap</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadMapValue</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapColumn</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadMapColumn</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#array-of-QuadMapATable</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadMapATable</uri>
                </binding>
              </result>
              <result>
                <binding name="z">
                 <uri>http://www.openlinksw.com/schemas/virtrdf#QuadMapFText</uri>
                </binding>
              </result>
            </results>
          </sparql>
        </query-result>
      </soapenv:Body>
    </soapenv:Envelope>
    ```

</div>

</div>
