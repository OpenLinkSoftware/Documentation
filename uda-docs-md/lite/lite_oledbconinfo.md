<div id="lite_oledbconinfo" class="section">

<div class="titlepage">

<div>

<div>

## 7.3. Provider Specific Connection Information

</div>

</div>

</div>

OLE DB predefines a number of property sets and the properties in them.
The <span class="emphasis">*Extended Properties*</span> property in the
Initialization property group provides a means of supplying
provider-specific extended connection information. The OpenLink provider
supports extended properties to control:

|                                                     |
|-----------------------------------------------------|
| ODBC Cursor Library usage                           |
| whether bookmarks are enabled by default on rowsets |

There are three ways to enter extended properties:

|                                                                                          |
|------------------------------------------------------------------------------------------|
| Through a prompting interface supplied by the consumer application.                      |
| Initialise a Data Source object through a connection string.                             |
| Explicitly set the DBPROP_INIT_PROVIDERSTRING property in the consumer application code. |

<div id="lite_consumerprompting" class="section">

<div class="titlepage">

<div>

<div>

### 7.3.1. Using a Consumer Supplied Prompting Interface

</div>

</div>

</div>

The OpenLink provider does not display a prompting interface of its own
for entering OLE DB specific connection information. It relies instead
upon the application supplying it.

OLE DB provides several core components, one of which is the Data Link
component. The Data Link component provides a default prompting
interface and is used by numerous Microsoft applications. It typically
includes a page displayed by the ‘All’ tab, which allows users to set
values for all the Initialization properties supported by an OLE DB
provider. The ‘Extended Properties’ property can be set on this page.
For the OpenLink provider, you should enter key-value pairs for any
supported extended properties you wish to set, such as:

``` programlisting
Cursors=Driver
```

</div>

<div id="lite_oledbuseconnstring" class="section">

<div class="titlepage">

<div>

<div>

### 7.3.2. Using a Connection String

</div>

</div>

</div>

The connection string is used to contain connection specific details as
semi-colon delimited key=value pairs so that the Broker/Agent
facilitating the connection can chose the correct database and method.
The details provided on various setup panels form the connect string
automatically upon use. Applications can use hand made connection
strings to avoid DSN configurations or prompting during exection. The
parameters that can be used are as follows:

The connection string should contain a key-value pair for the “Extended
Properties” keyword, such as:

|                                              |
|----------------------------------------------|
| PROVIDER=OpenLinkODBC                        |
| DRIVER={OpenLink Generic 32 Bit driver v4.0} |
| HOST=BrokerHostNameOrIP                      |
| PORT=BrokerListenPort                        |
| SVT=DBMSType/Provider                        |
| DATABASE=myDatabaseName                      |
| UID=myUsername                               |
| PWD=myPassword                               |
| PROTOCOL=TCP/IP                              |
| FBS=FetchBufferSize (Rows 1-99)              |
| DLF=DeferLongFetch \[y\|n\]                  |
| OPTIONS=opts                                 |
| READONLY=\[y\|n\]                            |
| DSN=myDSNname                                |

``` programlisting
 ;Extended Properties=Cursors=ODBC; 
```

Which is used for setting the cursor mode and/or bookmarking.

</div>

<div id="lite_oldedbuseinitprop" class="section">

<div class="titlepage">

<div>

<div>

### 7.3.3. Using The DBPROP_INIT_PROVIDERSTRING Property

</div>

</div>

</div>

Applications can set this initialization property directly.

</div>

</div>
