<div id="wsdl" class="section">

<div class="titlepage">

<div>

<div>

## 17.2. WSDL

</div>

</div>

</div>

The Web Services Description Language (WSDL) is a standard, structured
way of describing SOAP messages and Web services. It is an XML format
for describing the network services offered by a service provider. The
provider will publish a WSDL file that contains details about the
services provided, and the set of operations within each service that
the provider supports. For each of the operations, the WSDL file also
describes the format that the client must follow in requesting an
operation.

Since the WSDL file sets up requirements for both the provider and
service requester, this file is like a contract between the two. The
provider agrees to provide certain services if the client sends a
properly formatted SOAP request. Suppose that we have a WSDL file
defining a service called StockQuoteService. This service describes
operations such as getTradePrice, getLowestTradePrice, and
getHighestTradePrice. You place this WSDL file on the service provider
server. A client who wishes to send a SOAP request to this server must
first obtain a copy of the WSDL file from the provider, and then use it
to format a suitable SOAP request. The client sends this request to the
provider. The provider executes the requested operation and sends the
results back to the client requester as a SOAP response.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                           |
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                 |
|                            | The specification of WSDL and its file structures can be found on <a href="http://www.w3.org/TR/wsdl" class="ulink" target="_top">the W3C 
                              site</a> .                                                                                                                                 |

</div>

<div id="exposplaswsdl" class="section">

<div class="titlepage">

<div>

<div>

### 17.2.1. Exposing Stored Procedures as WSDL Services

</div>

</div>

</div>

Virtuoso can be both a provider and a client of WSDL. In this section we
will explain how to use Virtuoso to expose procedures as SOAP messages,
and then publish them as WSDL consumables.

In the descriptions below, lines preceded by

``` programlisting
SQL>
```

denote that the command is intended to be issued using the
<a href="configuringvirtuosoclients.html#isql" class="link"
title="Native Virtuoso Interactive SQL Query (ISQL)">ISQL</a> command
line interface to Virtuoso.

Virtuoso procedures can easily be published as WSDL consumables. We
follow the same steps as we would take to create SOAP objects and then
for every SOAP object Virtuoso automatically generates a WSDL file
entry. The default Virtuoso has the user SOAP and reserved HTTP path of
`/SOAP/` . All procedures that are created in the default qualifier
namespace of the SOAP user (WS.SOAP) and have had a 'grant execute to
SOAP' permissions established in the database are available to SOAP and
thus are automatically available to WSDL. In Virtuoso this is done by
requesting the file `services.wsdl` from the server via HTTP from the
`/SOAP/` path:

``` programlisting
http://[host:port]/SOAP/services.wsdl
```

. WSDL files such as this are often referred to as "endpoints" for
services.

<a href="ch-webappdevelopment.html#virtdir" class="link"
title="14.1.2. Virtual Directories">Virtual directories</a> increase our
flexibility by allowing us to map logical HTTP paths to the location
`/SOAP/` . This means that we can separate WSDL/SOAP functionality,
making groups of services available under different locations. We will
now demonstrate this:

<div class="orderedlist">

1.  First, create a new user in the database for creating the stored
    procedures as SOAP messages:

    ``` programlisting
    SQL>CREATE USER SOAPDEMO;
    ```

2.  Now, set the default catalogue/qualifier for the new user to the WS
    catalogue where we will create procedures to be used as SOAP
    objects:

    ``` programlisting
    SQL>USER_SET_QUALIFIER ('SOAPDEMO', 'WS');
    ```

3.  Now create a new
    <a href="ch-webappdevelopment.html#virtdir" class="link"
    title="14.1.2. Virtual Directories">virtual host</a> definition,
    using the
    <a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
    class="function">vhost_define()</code></a> , so that we can find our
    SOAP objects later at a desired location.

    ``` programlisting
    SQL>VHOST_DEFINE (vhost=>'*ini*',lhost=>'*ini*',lpath=>'/services',ppath=>'/SOAP/',soap_user=>'SOAPDEMO');
    ```

    If the mapping already exists, producing an error in the call above,
    and is not being used, then you can remove it using the command:

    ``` programlisting
    SQL>VHOST_REMOVE (vhost=>'*ini*',lhost=>'*ini*',lpath=>'/services')
    ```

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                          |
    |:----------------------------:|:---------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                    |
    |                              | \*ini\* is a special indicator telling Virtuoso to take the default values from its initialization file. |

    </div>

4.  Now create a simple SOAPTEST procedure and grant the appropriate
    privileges to the SOAPDEMO user:

    ``` programlisting
    SQL> create procedure
      WS.SOAPDEMO.SOAPTEST (in par varchar)
    {
      return (upper(par));
    };

    SQL> grant execute on WS.SOAPDEMO.SOAPTEST to SOAPDEMO;
    ```

5.  Now test this new SOAP object's availability by using
    <a href="fn_soap_client.html" class="link" title="soap_client"><code
    class="function">soap_client()</code></a> . This function would
    normally return a vector representation of the SOAP object but since
    we know the dimensions of the object ahead of time we can pin-point
    the entry using the
    <a href="fn_aref.html" class="link" title="aref"><code
    class="function">aref()</code></a> function as follows:

    ``` programlisting
    SQL> select aref(aref(
        soap_client (url=>sprintf ('http://localhost:%s/services', server_http_port ()),
        operation=>'SOAPTEST', parameters=>vector('par', 'demotext')), 1), 1);
    callret
    VARCHAR
    _______

    DEMOTEXT
    ```

    The actual SOAP object looks more like:

    ``` programlisting
    (("SOAPTESTResponse" ) (("CallReturn" ) "DEMOTEXT" ) )
    ```

    which was generated in a Virtuoso server log for debugging purposes
    using the
    <a href="fn_dbg_obj_print.html" class="link" title="dbg_obj_print"><code
    class="function">dbg_obj_print() </code></a> function.

6.  Procedures that exist under the WS.SOAPDEMO namespace and have been
    granted execution to the new SOAPDEMO user are now available as SOAP
    services and described by WSDL in this example, Virtuoso would
    publish them from the URL:

    ``` programlisting
    http://example.com/services/services.wsdl
    ```

    which will yield the following WSDL description:

    ``` screen
    <?xml version='1.0'?>
    <definitions
     targetNamespace='services.wsdl'
     xmlns:xsd='http://www.w3.org/1999/XMLSchema'
     xmlns:soap='http://schemas.xmlsoap.org/wsdl/soap/'
     xmlns:tns ='services.wsdl'
     xmlns ='http://schemas.xmlsoap.org/wsdl/'
     name='VirtuosoSOAP'>
        <message name='SOAPTEST'>
            <part name='par' type='xsd:string'/>
        </message>
        <message name='SOAPTESTResponse'>
            <part name='CallReturn' type='xsd:string'/>
        </message>
        <portType name='SOAPPortType'>
            <operation name='SOAPTEST'>
                <input message='tns:SOAPTEST' name='SOAPTEST'/>
                <output message='tns:SOAPTESTResponse' name='SOAPTESTResponse'/>
            </operation>
        </portType>
        <binding name='SOAPBinding' type='tns:SOAPPortType'>
            <soap:binding style='rpc' transport='http://schemas.xmlsoap.org/soap/http'/>
            <operation name='SOAPTEST'>
                <soap:operation soapAction='urn:openlinksw.com:virtuoso_soap_schema#SOAPTEST'/>
                <input>
                    <soap:body use='encoded' namespace='urn:openlinksw.com:virtuoso_soap_schema' encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' />
                </input>
                <output>
                    <soap:body use='encoded' namespace='urn:openlinksw.com:virtuoso_soap_schema' encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' />
                </output>
            </operation>
        </binding>
        <service name='SOAPService'>
            <port name='SOAPPort' binding='tns:SOAPBinding'>
                <soap:address location='http://example.com/services'/>
            </port>
        </service>
    </definitions>
    ```

    <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                            |                                                                                                                                                                                     |
    |:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                                                           |
    |                            | The <a href="vsmx.html" class="link"                                                                                                                                                
                                  title="17.14. Testing Web Published Web Services">Testing Web Services                                                                                                               
                                  (VSMX)</a> section describes Virtuoso's ability to also automatically generate a test page for your SOAP services, simply by replacing services.wsdl with services.vsmx in the URL.  |

    </div>

</div>

</div>

</div>
