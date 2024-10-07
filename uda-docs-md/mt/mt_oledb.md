<div id="mt_oledb" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 5. OpenLink OLE-DB Provider

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
regsvr32 /u oploleod.dll
```

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">5.1. [Testing an OLEDB
Connection](mt_oledbtest.html)</span>

<span class="section">5.2. [Call Tracing](mt_oldedbdebug.html)</span>

<span class="section">5.3. [Provider Specific Connection
Information](mt_oledbconinfo.html)</span>

<span class="section">5.3.1. [Using a Consumer Supplied Prompting
Interface](mt_oledbconinfo.html#mt_consumerprompting)</span>

<span class="section">5.3.2. [Using a Connection
String](mt_oledbconinfo.html#mt_oledbuseconnstring)</span>

<span class="section">5.3.3. [Using The DBPROP_INIT_PROVIDERSTRING
Property](mt_oledbconinfo.html#mt_oldedbuseinitprop)</span>

<span class="section">5.4. [Controlling ODBC Cursor Library
Usage](mt_oledbctrlodbcursor.html)</span>

<span class="section">5.5. [Controlling the Default Bookmark Setting for
Rowsets](mt_oledbdefbmk.html)</span>

<span class="section">5.6. [Known
Issues](mt_oledbknownissuse.html)</span>

<span class="section">5.6.1. [General
Issues](mt_oledbknownissuse.html#mt_oledbnigen)</span>

<span class="section">5.6.2.
[.Net](mt_oledbknownissuse.html#mt_oledbdotnet)</span>

<span class="section">5.6.3. [Visual Interdev
6](mt_oledbknownissuse.html#mt_oledbvi6)</span>

<span class="section">5.6.4. [Visual Basic 6 and
ADO](mt_oledbknownissuse.html#mt_oledbvb6ado)</span>

<span class="section">5.6.5. [SQL Server Data Transformation
Services](mt_oledbknownissuse.html#mt_oledbsqlsrvdts)</span>

<span class="section">5.7. [Objects and Interfaces Implemented by the
OpenLink Provider](mt_oledbobjsints.html)</span>

<span class="section">5.7.1. [Invoking the OpenLink
Provider](mt_oledbobjsints.html#mt_oledbinvprov)</span>

<span class="section">5.7.2. [Connecting from ADO or
.Net](mt_oledbobjsints.html#mt_oledbconnadodotnet)</span>

<span class="section">5.7.3. [Initialization
Properties](mt_oledbobjsints.html#mt_initializprops)</span>

<span class="section">5.7.4. [Initializing and Uninitializing the Data
Source Object](mt_oledbobjsints.html#mt_inuninitdsnobj)</span>

<span class="section">5.7.5. [Creating a
Session](mt_oledbobjsints.html#mt_createsession)</span>

<span class="section">5.7.6. [Creating a
Rowset](mt_oledbobjsints.html#mt_createrowset)</span>

<span class="section">5.7.7. [Exposing
Metadata](mt_oledbobjsints.html#mt_exposmetadata)</span>

<span class="section">5.7.8. [Supported
Conversions](mt_oledbobjsints.html#mt_supportedoledbconversions)</span>

<span class="section">5.7.9. [Creating and Using
Accessors](mt_oledbobjsints.html#mt_createuseaccessors)</span>

<span class="section">5.7.10. [Rowset
MetaData](mt_oledbobjsints.html#mt_oledbrowsetmetadata)</span>

</div>

</div>
