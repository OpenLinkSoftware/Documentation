<div id="xmlxmla" class="section">

<div class="titlepage">

<div>

<div>

## 17.9. XML for Analysis Provider

</div>

</div>

</div>

XML for Analysis (XMLA) is a SOAP based XML API for data access
interaction between a client application and a data provider working
over the Web. The Virtuoso SOAP server can act as an XMLA data provider,
also the Virtuoso SOAP client can be used as a client to talk with an
XMLA data provider.

The following terms: result-set and row-set will be used interchangeably
to designate repeating content with identical structure. The mention of
a result-set and row-set in this document is related to an SQL/ODBC
result set which is represented as XML for use in XMLA.

The implementation is based on the "XML for Analysis Specification v
1.0" by Microsoft Corp, found on the
<a href="https://msdn.microsoft.com/en-us/library/ms977626.aspx"
class="ulink" target="_top">MSDN</a> website.

The XMLA protocol consists of two SOAP operations: "Discover" and
"Execute" which are described below:

The <span class="emphasis">*Discover*</span> operation is used to
retrieve settings and database object information. It accepts the
following input parameters:

|                                                                                                                                                                             |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*RequestType* </span> - enumerated string.                                                                                                           |
| <span class="emphasis">*Restrictions* </span> - a structure of restrictions to be applied to the processing of request, the type values may vary, depending on the request. |
| <span class="emphasis">*Properties*</span> - properties to the request, such as data source name, initial catalog etc.                                                      |

Upon success the "Discover" operation will return a specific rowset. The
'specific' means that its structure depends of type of request.

The XMLA data provider supports the following discovery rowsets:

|                                                                         |
|-------------------------------------------------------------------------|
| `DISCOVER_DATASOURCES ` - to discover available data sources            |
| `DISCOVER_PROPERTIES ` - the properties which can be used/set           |
| `DISCOVER_SCHEMA_ROWSETS ` - this list itself with allowed restrictions |
| `DISCOVER_ENUMERATORS ` - enumeration values supported by provider      |
| `DISCOVER_KEYWORDS ` - reserved words                                   |
| `DISCOVER_LITERALS ` - restrictions on database object names etc.       |
| `DBSCHEMA_CATALOGS ` - list of catalogs                                 |
| `DBSCHEMA_TABLES ` - list of tables                                     |
| `DBSCHEMA_TABLES_INFO ` - list of info about tables                     |
| `DBSCHEMA_COLUMNS ` - list of columns                                   |
| `DBSCHEMA_PROVIDER_TYPES ` - list of datatypes                          |

Here is an example of a response message to the Discover invocation:

``` programlisting
----
<SOAP:Envelope SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
  <SOAP:Body>
    <cli:DiscoverResponse xmlns:cli="urn:schemas-microsoft-com:xml-analysis">
      <Result xmlns="">
        <root xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
          <n0:schema xmlns:n0="http://www.w3.org/2001/XMLSchema"
                 targetNamespace="urn:schemas-microsoft-com:xml-analysis:rowset"
             elementFormDefault="qualified">
            <n0:element name="root" type="n2:root" xmlns:n2="urn:schemas-microsoft-com:xml-analysis:rowset"/>
        ... more declarations ...
          </n0:schema>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
        ... rowset data ...
          </row>
        </root>
      </Result>
    </cli:DiscoverResponse>
  </SOAP:Body>
</SOAP:Envelope>
  ----
```

The client can use information retrieved with the "Discover" operation
for automatically formulating queries etc.

The <span class="emphasis">*Execute*</span> operation is used to process
a SQL statement on the server and to return resultset or/and schema
description for the resultset. The current implementation supports only
SQL statements. It accepts the following input parameters:

|                                                                                                                             |
|-----------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Command*</span> - a structure with single element - "Statement" , which contains the SQL statement. |
| <span class="emphasis">*Properties* </span> - properties to the execution process.                                          |

On success the "Execute" operation will return the rowset and/or XSD for
the rowset.

``` programlisting
----
<SOAP:Envelope SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
  <SOAP:Body>
    <cli:ExecuteResponse xmlns:cli="urn:schemas-microsoft-com:xml-analysis">
      <Result xmlns="">
        <root xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
          <n0:schema xmlns:n0="http://www.w3.org/2001/XMLSchema"
                 targetNamespace="urn:schemas-microsoft-com:xml-analysis:rowset"
             elementFormDefault="qualified">
            <n0:element name="root" type="n2:root" xmlns:n2="urn:schemas-microsoft-com:xml-analysis:rowset"/>
        ... more XSD declarations ...
          </n0:schema>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
        ... rowset data ...
          </row>
      more <row> elements
        </root>
      </Result>
    </cli:ExecuteResponse>
  </SOAP:Body>
</SOAP:Envelope>
 ----
```

The XML representation of the result sets can have three forms: Tabular,
Multidimensional and Custom. As the Virtuoso server is a tabular data
provider itself, hence the current XMLA implementation supports only
Tabular representation.

The Tabular representation of the result set consist of two main parts:

|                                                                                                         |
|---------------------------------------------------------------------------------------------------------|
| schema - XML Schema definition of result                                                                |
| data - sequence of repeating elements, each consisting of elements representing the cells in the rowset |

**Security . ** The Execute operation needs the properties Username and
Password to be supplied in order to execute the statement on behalf of
an SQL user account. If these are not supplied the request will be
rejected with SOAP:Fault message. To prevent a network sniffer from
catching the password in clear text, it is strongly recommended that
sending of these properties be done via HTTPS (SSL/TLS) connection (for
HTTPS setup see Web server section, and tutorials).

**State Support . ** The Virtuoso XMLA provider implements statelessness
for the settable properties. This means that properties such as UserName
and Password can be set in the beginning and they will be restored on
server side on the next request ID for which they are not supplied. This
mechanism is very similar to URL poisoning state support, which is
described in the Web server section of the documentation. In short, the
XMLA client asks to begin a session, the XMLA provider returns a session
ID and from that point the client sends this ID to the server. If the
client wishes, it may cancel the session with an end session request.

The above requests are SOAP messages carried in the SOAP Header element.
Please note that these headers can be sent together with Discover or
Execute operations.

Here is a a simple session:

``` programlisting
- client requests a session
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
                   SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
<SOAP-ENV:Header>
  <xmla:BeginSession xmlns:xmla="urn:schemas-microsoft-com:xml-analysis" mustUnderstand="1"/>
</SOAP-ENV:Header>
<SOAP-ENV:Body>
   <!-- Discover or Execute call -->

</SOAP-ENV:Body>
</SOAP-ENV:Envelope>

- server returns the SessionID
<SOAP-ENV:Header>
  <xmla:Session xmlns:xmla="urn:schemas-microsoft-com:xml-analysis" mustUnderstand="1" SessionID="NNNNNN" />
</SOAP-ENV:Header>

- sequential requests of client contains:
<SOAP-ENV:Header>
  <xmla:Session xmlns:xmla="urn:schemas-microsoft-com:xml-analysis" mustUnderstand="1" SessionID="NNNNNN" />
</SOAP-ENV:Header>

- and finally client cancel the session:
<SOAP-ENV:Header>
  <xmla:EndSession xmlns:xmla="urn:schemas-microsoft-com:xml-analysis" mustUnderstand="1" SessionID="NNNNNN" />
</SOAP-ENV:Header>
```

### Namespaces

The request and response are in the
"urn:schemas-microsoft-com:xml-analysis" namespace. Also SOAPAction
header field must be "urn:schemas-microsoft-com:xml-analysis:Discover"
and "urn:schemas-microsoft-com:xml-analysis:Execute" for Discover and
Execute operations.

### Virtuoso extensions

The following settable properties are available to the execute request:

direction - one of forward, backward

skip - integer

n-rows integer

bookmark-from - string

retrieve-row-count - string

The direction indicates in which direction the cursor moves from the
bookmark-from. If there is no bookmark-from, the query is always forward
from the start of the evaluation.

skip allows skipping a number of rows in the selected direction. n-rows
gives the number of rows to return after the skip. Fewer rows will be
returned if the evaluation does not extend  this far.

The bookmark is an opaque string, acceptable values are values that have
been in a bookmark element of a result row.

return-bookmark boolean

If true, a bookmark element is added to each row of the result set.

A simple request / response is added to samples.

The retrieve-row-count element of the query options must be true for
rowcount returning to be enabled.

If retrieve-row-count is specified, the response has a row-count element
with a text value containing the total result set size of the query,
irrespective of the specified window of rows retrieved. Note that for
large result sets getting the row count can be prohibitively expensive.

### Virtual directory Setup

To make a virtual directory work as an XMLA data provider it is enough
to grant execute permissions on Discover and Execute procedures to the
SQL account specified for SOAP execution in this virtual directory.

For compliance with XMLA, the virtual directory attribute
elementFormDefault must have the value "qualified" in the XMLA SOAP end
point.

Here are the steps for setting up a virtual directory for use with XMLA:

``` programlisting
create user "XMLA";

user_set_qualifier ('XMLA', 'XMLA');

VHOST_REMOVE (lpath=>'/XMLA');
VHOST_DEFINE (lpath=>'/XMLA', ppath=>'/SOAP/', soap_user => 'XMLA',
              soap_opts => vector ('ServiceName', 'XMLAnalysis', 'elementFormDefault', 'qualified'));

grant execute on DB.."Discover" to "XMLA";
grant execute on DB.."Execute" to "XMLA";
```

<div id="ex_virtdir4xmla" class="example">

**Example 17.36. Simple Discovery Request/Response examples**

<div class="example-contents">

The following example shows a simple request for discovering data
sources and response from server.

``` programlisting
<?xml version="1.0"?>
<SOAP:Envelope SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
  <SOAP:Body>
    <cli:Discover xmlns:cli="urn:schemas-microsoft-com:xml-analysis">
      <RequestType xsi:type="xsd:string" dt:dt="string">DISCOVER_DATASOURCES</RequestType>
      <Restrictions xsi:nil="1"/>
      <Properties xsi:nil="1" />
      </Properties>
    </cli:Discover>
  </SOAP:Body>
</SOAP:Envelope>

<SOAP:Envelope SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
  <SOAP:Body>
    <cli:DiscoverResponse xmlns:cli="urn:schemas-microsoft-com:xml-analysis">
      <Result xmlns="">
        <root xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
          <n0:schema xmlns:n0="http://www.w3.org/2001/XMLSchema"
                 targetNamespace="urn:schemas-microsoft-com:xml-analysis:rowset"
             elementFormDefault="qualified">
            <n0:element name="root" type="n2:root" xmlns:n2="urn:schemas-microsoft-com:xml-analysis:rowset"/>
            <n0:complexType name="root">
              <n0:sequence minOccurs="0" maxOccurs="unbounded">
                <n0:element name="row" type="n2:row" xmlns:n2="urn:schemas-microsoft-com:xml-analysis:rowset"/>
              </n0:sequence>
            </n0:complexType>
            <n0:complexType name="row">
              <n0:choice maxOccurs="unbounded" minOccurs="0">
                <n0:element name="DataSourceName" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="DataSourceName" nillable="0"/>
                <n0:element name="DataSourceDescription" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="DataSourceDescription" nillable="0"/>
                <n0:element name="URL" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="URL" nillable="0"/>
                <n0:element name="DataSourceInfo" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="DataSourceInfo" nillable="0"/>
                <n0:element name="ProviderName" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="ProviderName" nillable="0"/>
                <n0:element name="ProviderType" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="ProviderType">
                  <n0:complexType>
                    <n0:sequence minOccurs="0" maxOccurs="unbounded">
                      <n0:any processContents="lax" maxOccurs="unbounded"/>
                    </n0:sequence>
                  </n0:complexType>
                </n0:element>
                <n0:element name="AuthenticationMode" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="AuthenticationMode" nillable="0"/>
              </n0:choice>
            </n0:complexType>
          </n0:schema>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
            <DataSourceName>Local Server</DataSourceName>
            <DataSourceDescription>Virtuoso Server</DataSourceDescription>
            <URL>http://example.com/XMLA</URL>
            <DataSourceInfo>DSN=__local</DataSourceInfo>
            <ProviderName>Virtuoso XML for Analysis</ProviderName>
            <ProviderType>
              <TDP xsi:type="xsd:string" dt:dt="string"/>
            </ProviderType>
            <AuthenticationMode>Unauthenticated</AuthenticationMode>
          </row>
        </root>
      </Result>
    </cli:DiscoverResponse>
  </SOAP:Body>
</SOAP:Envelope>
```

The following example shows a query against the Northwind's database's
Customers table

Request/Response

``` programlisting
<?xml version="1.0"?>
<SOAP:Envelope SOAP:encodingType="http://schemas.xmlsoap.org/soap/encoding/" SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:ref="http://schemas.xmlsoap.org/ws/2002/04/reference/" xmlns:dt="urn:schemas-microsoft-com:datatypes">
  <SOAP:Body>
    <cli:Execute xmlns:cli="urn:schemas-microsoft-com:xml-analysis">
      <Command>
        <Statement xsi:type="xsd:string" dt:dt="string">select CustomerID , CompanyName from Demo..Customers where CustomerID like 'A%'</Statement>
      </Command>
      <Restrictions xsi:nil="1"/>
      <Properties>
        <PropertyList>
          <DataSourceInfo xsi:type="xsd:string" dt:dt="string">DSN=__local</DataSourceInfo>
      <Password type="http://www.w3.org/2001/XMLSchema:string" dt="string" >demo</Password>
      <UserName type="http://www.w3.org/2001/XMLSchema:string" dt="string" >demo</UserName>
        </PropertyList>
      </Properties>
    </cli:Execute>
  </SOAP:Body>
</SOAP:Envelope>

<SOAP:Envelope SOAP:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xenc="http://www.w3.org/2001/04/xmlenc#" xmlns:wsse="http://schemas.xmlsoap.org/ws/2002/07/secext" xmlns:ref="http://schemas.xmlsoap.org/ws/2002/04/reference/" xmlns:wsdl="services.wsdl">
  <SOAP:Body>
    <cli:ExecuteResponse xmlns:cli="urn:schemas-microsoft-com:xml-analysis">
      <Result xmlns="">
        <root xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
          <n0:schema xmlns:n0="http://www.w3.org/2001/XMLSchema" targetNamespace="urn:schemas-microsoft-com:xml-analysis:rowset" elementFormDefault="qualified">
            <n0:element name="root" type="n2:root" xmlns:n2="urn:schemas-microsoft-com:xml-analysis:rowset"/>
            <n0:complexType name="root">
              <n0:sequence minOccurs="0" maxOccurs="unbounded">
                <n0:element name="row" type="n2:row" xmlns:n2="urn:schemas-microsoft-com:xml-analysis:rowset"/>
              </n0:sequence>
            </n0:complexType>
            <n0:complexType name="row">
              <n0:choice maxOccurs="unbounded" minOccurs="0">
                <n0:element name="CustomerID" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="CustomerID" nillable="0"/>
                <n0:element name="CompanyName" type="string" xmlns:n2="urn:schemas-microsoft-com:xml-sql" n2:field="CompanyName" nillable="1"/>
              </n0:choice>
            </n0:complexType>
          </n0:schema>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
            <CustomerID>ALFKI</CustomerID>
            <CompanyName>Alfreds Futterkiste</CompanyName>
          </row>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
            <CustomerID>ANATR</CustomerID>
            <CompanyName>Ana Trujillo Emparedados y helados</CompanyName>
          </row>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
            <CustomerID>ANTON</CustomerID>
            <CompanyName>Antonio Moreno Taquería</CompanyName>
          </row>
          <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
            <CustomerID>AROUT</CustomerID>
            <CompanyName>Around the Horn</CompanyName>
          </row>
        </root>
      </Result>
    </cli:ExecuteResponse>
  </SOAP:Body>
</SOAP:Envelope>
```

The following example shows a simple request for "Execute" operation
whit Virtuoso extension. Sources and response from server.

``` programlisting
  <Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/" xmlns:n1="http://schemas.xmlsoap.org/soap/envelope/" xmlns:n2="http://schemas.xmlsoap.org/soap/envelope/" n1:encodingType="http://schemas.xmlsoap.org/soap/encoding/" n2:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <Body xmlns="http://schemas.xmlsoap.org/soap/envelope/">
      <Execute xmlns="urn:schemas-microsoft-com:xml-analysis">
        <Command>
          <Statement xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:string" n2:dt="string">select CustomerID, CompanyName from Demo..Customers</Statement>
        </Command>
        <Properties>
          <PropertyList>
            <DataSourceInfo xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:string" n2:dt="string">Local_Instance</DataSourceInfo>
            <UserName xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:string" n2:dt="string">dba</UserName>
            <Password xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:string" n2:dt="string">dba</Password>
            <direction xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:string" n2:dt="string">backward</direction>
            <skip xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:int" n2:dt="int">1</skip>
            <n-rows xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:int" n2:dt="int">3</n-rows>
            <return-bookmark xmlns:n1="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="urn:schemas-microsoft-com:datatypes" n1:type="http://www.w3.org/2001/XMLSchema:int" n2:dt="int">1</return-bookmark>
          </PropertyList>
        </Properties>
      </Execute>
    </Body>
  </Envelope>

  <Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/" xmlns:n1="http://schemas.xmlsoap.org/soap/envelope/" n1:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <Body xmlns="http://schemas.xmlsoap.org/soap/envelope/">
      <ExecuteResponse xmlns="urn:schemas-microsoft-com:xml-analysis">
        <return xmlns="urn:schemas-microsoft-com:xml-analysis">
          <root xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
            <schema xmlns="http://www.w3.org/2001/XMLSchema" targetNamespace="urn:schemas-microsoft-com:xml-analysis:rowset" elementFormDefault="qualified">
              <element xmlns="http://www.w3.org/2001/XMLSchema" name="root" type="urn:schemas-microsoft-com:xml-analysis:rowset:root"/>
              <complexType xmlns="http://www.w3.org/2001/XMLSchema" name="root">
                <sequence xmlns="http://www.w3.org/2001/XMLSchema" minOccurs="0" maxOccurs="unbounded">
                  <element xmlns="http://www.w3.org/2001/XMLSchema" name="row" type="urn:schemas-microsoft-com:xml-analysis:rowset:row"/>
                </sequence>
              </complexType>
              <complexType xmlns="http://www.w3.org/2001/XMLSchema" name="row">
                <choice xmlns="http://www.w3.org/2001/XMLSchema" maxOccurs="unbounded" minOccurs="0">
                  <element xmlns="http://www.w3.org/2001/XMLSchema" xmlns:n3="urn:schemas-microsoft-com:xml-sql" name="BOOKMARK" type="string" n3:field="BOOKMARK" nillable="1"/>
                  <element xmlns="http://www.w3.org/2001/XMLSchema" xmlns:n3="urn:schemas-microsoft-com:xml-sql" name="CustomerID" type="string" n3:field="CustomerID" nillable="0"/>
                  <element xmlns="http://www.w3.org/2001/XMLSchema" xmlns:n3="urn:schemas-microsoft-com:xml-sql" name="CompanyName" type="string" n3:field="CompanyName" nillable="1"/>
                </choice>
              </complexType>
            </schema>
            <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
              <BOOKMARK xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">wbwCtQExvAI=</BOOKMARK>
              <CustomerID xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">AROUT</CustomerID>
              <CompanyName xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">Around the Horn</CompanyName>
            </row>
            <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
              <BOOKMARK xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">wbwCtQExvAE=</BOOKMARK>
              <CustomerID xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">ANTON</CustomerID>
              <CompanyName xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">Antonio Moreno Taquera</CompanyName>
            </row>
            <row xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">
              <BOOKMARK xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">wbwCtQExvAA=</BOOKMARK>
              <CustomerID xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">ANATR</CustomerID>
              <CompanyName xmlns="urn:schemas-microsoft-com:xml-analysis:rowset">Ana Trujillo Emparedados y helados</CompanyName>
            </row>
          </root>
        </return>
      </ExecuteResponse>
    </Body>
  </Envelope>
```

</div>

</div>

  

</div>
