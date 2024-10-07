<div id="lite_oledb" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 7. OpenLink OLE-DB Provider

</div>

<div>

<div class="abstract">

**Abstract**

The OpenLink ODBC Provider for OLEDB is delivered as an OLEDB - ODBC
bridge. It utilizes ODBC data sources to connect to databases, much like
the Microsoft ODBC Provider; so you will require a working ODBC
installation first.

The OpenLink Provider also requires that the Microsoft Data Access
Components have been installed. To gain any functionality with .Net you
will require MDAC 2.7 RTM (2.70.7713.4) or later. This particular
version of the MDAC is included with Visual Studio .Net and with the
.Net Framework SDK. Alternatively it can be downloaded from
<a href="http://www.microsoft.com/data" class="ulink"
target="_top">www.microsoft.com/data</a>. Releases prior to 2.70.7713.4,
specifically MDAC 2.7 included in the .Net SDK Beta 2, will not allow
non-Microsoft OLE DB providers to work with the .Net Data Provider for
OLE DB.

Although not completely necessary if you are using a newer OpenLink
installer, before installing this provider, any previous release of the
driver should be deinstalled fully. If a full deinstall using Install
Shield is not performed, the old driver should be unregistered using the
regsvr32 utility as follows:

``` programlisting
regsvr32 /u
        oploleod.dll
```

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">7.1. [Testing an OLEDB
Connection](lite_oledbtest.html)</span>

<span class="section">7.2. [Call Tracing](lite_oldedbdebug.html)</span>

<span class="section">7.3. [Provider Specific Connection
Information](lite_oledbconinfo.html)</span>

<span class="section">7.3.1. [Using a Consumer Supplied Prompting
Interface](lite_oledbconinfo.html#lite_consumerprompting)</span>

<span class="section">7.3.2. [Using a Connection
String](lite_oledbconinfo.html#lite_oledbuseconnstring)</span>

<span class="section">7.3.3. [Using The DBPROP_INIT_PROVIDERSTRING
Property](lite_oledbconinfo.html#lite_oldedbuseinitprop)</span>

<span class="section">7.4. [Controlling ODBC Cursor Library
Usage](lite_oledbctrlodbcursor.html)</span>

<span class="section">7.5. [Controlling the Default Bookmark Setting for
Rowsets](lite_oledbdefbmk.html)</span>

<span class="section">7.6. [Known
Issues](lite_oledbknownissuse.html)</span>

<span class="section">7.6.1. [General
Issues](lite_oledbknownissuse.html#lite_oledbnigen)</span>

<span class="section">7.6.2.
[.Net](lite_oledbknownissuse.html#lite_oledbdotnet)</span>

<span class="section">7.6.3. [Visual Interdev
6](lite_oledbknownissuse.html#lite_oledbvi6)</span>

<span class="section">7.6.4. [Visual Basic 6 and
ADO](lite_oledbknownissuse.html#lite_oledbvb6ado)</span>

<span class="section">7.6.5. [SQL Server Data Transformation
Services](lite_oledbknownissuse.html#lite_oledbsqlsrvdts)</span>

<span class="section">7.7. [Objects and Interfaces Implemented by the
OpenLink Provider](lite_oledbobjsints.html)</span>

<span class="section">7.7.1. [Invoking the OpenLink
Provider](lite_oledbobjsints.html#lite_oledbinvprov)</span>

<span class="section">7.7.2. [Connecting from ADO or
.Net](lite_oledbobjsints.html#lite_oledbconnadodotnet)</span>

<span class="section">7.7.3. [Initialization
Properties](lite_oledbobjsints.html#lite_initializprops)</span>

<span class="section">7.7.4. [Initializing and Uninitializing the Data
Source Object](lite_oledbobjsints.html#lite_inuninitdsnobj)</span>

<span class="section">7.7.5. [Creating a
Session](lite_oledbobjsints.html#lite_createsession)</span>

<span class="section">7.7.6. [Creating a
Rowset](lite_oledbobjsints.html#lite_createrowset)</span>

<span class="section">7.7.7. [Exposing
Metadata](lite_oledbobjsints.html#lite_exposmetadata)</span>

<span class="section">7.7.8. [Supported
Conversions](lite_oledbobjsints.html#lite_supportedoledbconversions)</span>

<span class="section">7.7.9. [Creating and Using
Accessors](lite_oledbobjsints.html#lite_createuseaccessors)</span>

<span class="section">7.7.10. [Rowset
MetaData](lite_oledbobjsints.html#lite_oledbrowsetmetadata)</span>

</div>

</div>
