<div id="lite" class="book">

<div class="titlepage">

<div>

<div>

# OpenLink ODBC Driver (Lite Edition) Documentation

</div>

<div>

<div class="authorgroup">

<div class="author">

### <span class="orgname">OpenLink Software Documentation Team </span> `<`<a href="mailto:docs@openlinksw.com" class="email"><code
class="sourceCode email">docs@openlinksw.com</code></a>`>`

`<`<a href="mailto:docs@openlinksw.com" class="email"><code
class="sourceCode email">docs@openlinksw.com</code></a>`>`

</div>

</div>

</div>

<div>

Copyright © 1999 - 2024 OpenLink Software

</div>

</div>

------------------------------------------------------------------------

</div>

<div class="toc">

**Table of Contents**

<span class="preface">[Preface](bk03pr01.html)</span>

<span class="section">1. [Conventions](lite_docuventions.html)</span>

<span class="section">2. [Copyright](lite_thecopyright.html)</span>

<span class="chapter">1. [Overview](lite_odbcintro.html)</span>

<span class="section">1.1. [OpenLink ODBC Driver (Single-Tier Edition)
Introduction](lite_introodbc.html)</span>

<span class="section">1.1.1. [About
ODBC](lite_introodbc.html#lite_aboutodbc)</span>

<span class="section">1.1.2. [How ODBC
Works](lite_introodbc.html#lite_howodbcworks)</span>

<span class="section">1.1.3. [What You Can Do With
ODBC](lite_introodbc.html#lite_whatcanudowodbc)</span>

<span class="section">1.2. [Using ODBC on a
PC](lite_UsingOdbcOnAPC.html)</span>

<span class="section">1.3. [Finding Further Information About ODBC &
Utilities](lite_furtherinfo.html)</span>

<span class="chapter">2. [New Features in OpenLink
UDA](lite_newfeatures.html)</span>

<span class="section">2.1. [New Features in OpenLink UDA
v6.0](lite_newfeatures60.html)</span>

<span class="section">2.2. [New Features in OpenLink UDA
v5.2](lite_newfeatures52.html)</span>

<span class="chapter">3. [OpenLink ODBC Driver (Single-Tier Edition)
System Requirements and Basic
Instructions](lite_requirements.html)</span>

<span class="section">3.1. [Installing OpenLink Single-Tier Drivers for
ODBC](lite_installoverview.html)</span>

<span class="section">3.2. [System
Requirements](lite_systemreq.html)</span>

<span class="section">3.2.1. [Software
Requirements](lite_systemreq.html#lite_softreq)</span>

<span class="section">3.2.2. [Hardware
Requirements](lite_systemreq.html#lite_hardware)</span>

<span class="section">3.3. [Downloading OpenLink Single-Tier Drivers for
ODBC](lite_downloading.html)</span>

<span class="chapter">4. [OpenLink ODBC Driver (Single-Tier Edition)
Installation](lite_installation.html)</span>

<span class="section">4.1. [OpenLink License Manager Usage
Notes](lite_oplmgr.html) </span>

<span class="section">4.1.1.
[Background](lite_oplmgr.html#lite_oplmgrbckgrnd) </span>

<span class="section">4.1.2.
[Single-Tier](lite_oplmgr.html#lite_oplmgrst) </span>

<span class="section">4.1.3.
[Multi-Tier](lite_oplmgr.html#lite_oplmgrmt) </span>

<span class="section">4.1.4. [How to stop/start the OpenLink License
Manager](lite_oplmgr.html#lite_oplmgrhowto) </span>

<span class="section">4.1.5. [Environment
Variables](lite_oplmgr.html#lite_oplmgrenvvar) </span>

<span class="section">4.1.6. [OpenLink License Manager Networking
Considerations](lite_oplmgr.html#lite_oplmgrnetwork) </span>

<span class="section">4.2. [Windows
(32-bit)](lite_wininstall.html)</span>

<span class="section">4.3. [Windows
(64-bit)](lite_lt64bitinst.html)</span>

<span class="section">4.4. [UNIX & Linux](lite_uliteinst.html)</span>

<span class="section">4.5. [Mac OS X](lite_osxinstall.html)</span>

<span class="section">4.6. [Product
Licensing](lite_productlic.html)</span>

<span class="section">4.6.1. [Initial
License](lite_productlic.html#lite_startlic)</span>

<span class="section">4.6.2. [How to apply the
License](lite_productlic.html#lite_applylic)</span>

<span class="section">4.6.3. [Upgrading the
License](lite_productlic.html#lite_getlic)</span>

<span class="section">4.6.4. [See
Also](lite_productlic.html#id1361)</span>

<span class="section">4.7. [Oracle 10g Instant Client: Connection String
Formats](lite_orainstantclient.html)</span>

<span class="section">4.7.1. [OpenLink Single-Tier Connections using
Instant
Client](lite_orainstantclient.html#lite_orainstclientlite)</span>

<span class="section">4.7.2. [Oracle Instant Client Related
Links](lite_orainstantclient.html#lite_orainstclientrelatedlinks)</span>

<span class="section">4.8. [Oracle Real Application Cluster (RAC) / TAF
Support](lite_udauserrac.html)</span>

<span class="section">4.8.1. [What it
is](lite_udauserrac.html#lite_udauserracwhat)</span>

<span class="section">4.8.2. [What you have to do to use
it](lite_udauserrac.html#lite_udauserrachowto)</span>

<span class="section">4.8.3. [Related
Links](lite_udauserrac.html#lite_udauserracrelatedlinks)</span>

<span class="chapter">5. [OpenLink ODBC Driver (Single-Tier Edition)
Configuration](lite_datasource.html)</span>

<span class="section">5.1. [Windows Data Source
Configuration](lite_dsnconfwin.html)</span>

<span class="section">5.1.1. [Creating ODBC Data
Sources](lite_dsnconfwin.html#lite_odbcsetup)</span>

<span class="section">5.1.2.
[DB2](lite_dsnconfwin.html#liteusedb2)</span>

<span class="section">5.1.3. [Informix 7 and
9](lite_dsnconfwin.html#liteuseinformix9)</span>

<span class="section">5.1.4. [Ingres and
OpenIngres](lite_dsnconfwin.html#liteuseoping)</span>

<span class="section">5.1.5. [Oracle 8, 9, and
10](lite_dsnconfwin.html#liteuseora)</span>

<span class="section">5.1.6. [Progress 9.1
SQL-92](lite_dsnconfwin.html#liteuseprosql)</span>

<span class="section">5.1.7. [Other
Progress](lite_dsnconfwin.html#liteusepro)</span>

<span class="section">5.1.8. [Microsoft or Sybase SQL Server
(TDS)](lite_dsnconfwin.html#liteusetds)</span>

<span class="section">5.1.9. [ODBC-JDBC Lite Bridges for
Java](lite_dsnconfwin.html#liteuseoj)</span>

<span class="section">5.1.10.
[MySQL](lite_dsnconfwin.html#liteusemy)</span>

<span class="section">5.1.11.
[PostgreSQL](lite_dsnconfwin.html#liteusepgr)</span>

<span class="section">5.1.12. [Connect String
parameters](lite_dsnconfwin.html#lite_connstring)</span>

<span class="section">5.1.13. [Testing the ODBC Data
Source](lite_dsnconfwin.html#lite_odbctesting)</span>

<span class="section">5.2. [Unix Data Source
Configuration](lite_unixliteconf.html)</span>

<span class="section">5.2.1. [Creating Data Sources Using iODBC
Administrator](lite_unixliteconf.html#lite_ulitestart)</span>

<span class="section">5.2.2. [Manual
Configuration](lite_unixliteconf.html#lite_ulitedsnman)</span>

<span class="section">5.2.3.
[DB2](lite_unixliteconf.html#lite_unixlitedb2)</span>

<span class="section">5.2.4.
[Informix](lite_unixliteconf.html#lite_unixliteinformix)</span>

<span class="section">5.2.5.
[Ingres](lite_unixliteconf.html#lite_unixliteingres)</span>

<span class="section">5.2.6.
[Oracle](lite_unixliteconf.html#lite_unixliteoracle)</span>

<span class="section">5.2.7.
[PostgreSQL](lite_unixliteconf.html#lite_unixlitepostgres)</span>

<span class="section">5.2.8.
[MySQL](lite_unixliteconf.html#lite_unixlitemysql)</span>

<span class="section">5.2.9. [Progress
SQL92](lite_unixliteconf.html#lite_unixliteprogresssql92)</span>

<span class="section">5.2.10. [Microsoft or Sybase SQL Server
(TDS)](lite_unixliteconf.html#lite_unixlitemssql)</span>

<span class="section">5.2.11. [ODBC-JDBC Bridges for
Java](lite_unixliteconf.html#lite_unixliteoj)</span>

<span class="section">5.3. [Mac OS X Data Source
Configuration](lite_osxliteconf.html)</span>

<span class="section">5.3.1. [Creating ODBC Data
Sources](lite_osxliteconf.html#lite_osxodbcsetup)</span>

<span class="section">5.3.2.
[MySQL](lite_osxliteconf.html#lite_osxliteusemysql)</span>

<span class="section">5.3.3. [Oracle 8 (or
9)](lite_osxliteconf.html#lite_osxliteuseora)</span>

<span class="section">5.3.4.
[PostgreSQL](lite_osxliteconf.html#lite_osxliteusepost)</span>

<span class="section">5.3.5. [ODBC-JDBC Lite Bridges for
Java](lite_osxliteconf.html#lite_osxliteuseoj)</span>

<span class="section">5.3.6. [Microsoft or Sybase SQL Server
(TDS)](lite_osxliteconf.html#lite_osxliteusesql)</span>

<span class="section">5.3.7.
[Virtuoso](lite_osxliteconf.html#lite_osxliteusevirt)</span>

<span class="section">5.3.8. [Testing the ODBC Data
Source](lite_osxliteconf.html#lite_osxodbctesting)</span>

<span class="section">5.4. [ODBC to Jet Data Type
Mapping](lite_jetfix.html)</span>

<span class="section">5.4.1.
[Overview](lite_jetfix.html#lite_jetoverview)</span>

<span class="section">5.4.2. [ODBC to Jet Data Type
Mapping](lite_jetfix.html#lite_jetmap)</span>

<span class="section">5.4.3. [Jet Data Type
Ranges](lite_jetfix.html#lite_jetranges)</span>

<span class="section">5.4.4.
[References](lite_jetfix.html#lite_jetref)</span>

<span class="section">5.4.5. [Informix Jet
Support](lite_jetfix.html#lite_jetinf)</span>

<span class="section">5.4.6. [Oracle Jet
Support](lite_jetfix.html#lite_jetora)</span>

<span class="section">5.5. [New
Features](lite_features_odbc.xml.html)</span>

<span class="section">5.6. [Oracle Connection Pooling
Support](lite_oraconcpoolgeneric.html)</span>

<span class="section">5.6.1. [What it
is](lite_oraconcpoolgeneric.html#lite_oraconpoolwhat)</span>

<span class="section">5.6.2.
[Benefits](lite_oraconcpoolgeneric.html#lite_oraconpooladvant)</span>

<span class="section">5.6.3. [How it
Works](lite_oraconcpoolgeneric.html#lite_oraconpoolhow)</span>

<span class="section">5.6.4. [The OpenLink Perspective: what you do to
use it](lite_oraconcpoolgeneric.html#lite_oraconpooloplhow)</span>

<span class="section">5.6.5.
[](lite_oraconcpoolgeneric.html#lite_oraconcpoollite)</span>

<span class="chapter">6. [OpenLink ADO.NET Data
Providers](lite_dotnet.html)</span>

<span class="section">6.1. [Architecture](lite_dnetarch.html)</span>

<span class="section">6.1.1. [Managed Data
Provider](lite_dnetarch.html#lite_dnetmanage)</span>

<span class="section">6.1.2. [Unmanaged Data
Provider](lite_dnetarch.html#lite_dnetunmanage)</span>

<span class="section">6.2. [Developing .NET Data Provider
Application](lite_dnetdevel.html)</span>

<span class="section">6.3. [OpenLink .NET Data Providers Connect String
Attributes](lite_dnetconnstr.html)</span>

<span class="section">6.3.1. [Managed Generic Multi-Tier .NET Data
Provider
(OpenLink.Data.GenericClient)](lite_dnetconnstr.html#lite_dnetmconnstr_opl)</span>

<span class="section">6.3.2. [Managed Microsoft SQLServer .NET Data
Provider
(OpenLink.Data.SQLServer)](lite_dnetconnstr.html#lite_dnetmconnstr_sqlserver)</span>

<span class="section">6.3.3. [Managed Sybase .NET Data Provider
(OpenLink.Data.Sybase)](lite_dnetconnstr.html#lite_dnetmconnstr_sybase)</span>

<span class="section">6.3.4. [Unmanaged .NET Data Provider
(OpenLink.Data.OdbcClient)](lite_dnetconnstr.html#lite_dnetuconnstr)</span>

<span class="section">6.4. [OpenLink .NET Data Providers Class
Implementation](lite_dnetclasses.html)</span>

<span class="section">6.5. [OpenLink.Data
Namespace](lite_dnetnamespace.html)</span>

<span class="section">6.5.1.
[OPLCommand](lite_dnetnamespace.html#lite_cloplcommand)</span>

<span class="section">6.5.2.
[OPLCommandBuilder](lite_dnetnamespace.html#lite_cloplcommandbuild)</span>

<span class="section">6.5.3.
[OPLConnect](lite_dnetnamespace.html#lite_cloplconnect)</span>

<span class="section">6.5.4.
[OPLDataAdapter](lite_dnetnamespace.html#lite_clopldataadapter)</span>

<span class="section">6.5.5.
[OPLDataReader](lite_dnetnamespace.html#lite_clopldatareader)</span>

<span class="section">6.5.6.
[OPLError](lite_dnetnamespace.html#lite_cloplerror)</span>

<span class="section">6.5.7.
[OPLErrorCollection](lite_dnetnamespace.html#lite_cloplerrorcol)</span>

<span class="section">6.5.8.
[OPLException](lite_dnetnamespace.html#lite_cloplexcept)</span>

<span class="section">6.5.9.
[OPLParameter](lite_dnetnamespace.html#lite_cloplparam)</span>

<span class="section">6.5.10.
[OPLParameterCollection](lite_dnetnamespace.html#lite_cloplparamcol)</span>

<span class="section">6.5.11.
[OPLRowUpdatedEventArgs](lite_dnetnamespace.html#lite_rUpdated)</span>

<span class="section">6.5.12.
[OPLRowUpdatedEventHandler](lite_dnetnamespace.html#lite_rUpdatedHan)</span>

<span class="section">6.5.13.
[OPLRowUpdatingEventArgs](lite_dnetnamespace.html#lite_rUpdating)</span>

<span class="section">6.5.14.
[OPLRowUpdatingEventHandler](lite_dnetnamespace.html#lite_rUpdatingHan)</span>

<span class="section">6.5.15.
[OPLTransaction](lite_dnetnamespace.html#lite_clopltran)</span>

<span class="section">6.6. [Known Issues](lite_dnetissues.html)</span>

<span class="section">6.6.1. [Unsigned Type
Handling](lite_dnetissues.html#lite_dnetunsign)</span>

<span class="section">6.6.2. [Timestamp
Precision](lite_dnetissues.html#lite_dnettimestamp)</span>

<span class="section">6.7. [.Net Provider Test
Program](lite_dnettest.html)</span>

<span class="section">6.8. [New
Features](lite_features_dotnet.xml.html)</span>

<span class="chapter">7. [OpenLink OLE-DB
Provider](lite_oledb.html)</span>

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

<span class="chapter">8. [OpenLink JDBC Driver (Single-Tier
Edition)](lite_jdbcinstandconf.html)</span>

<span class="section">8.1. [OpenLink JDBC Driver (Single-Tier Edition)
for Java Database Connectivity (JDBC)](lite_opljava.html)</span>

<span class="section">8.1.1. [New JDBC Driver
Packages](lite_opljava.html#lite_New_Features_Summary)</span>

<span class="section">8.1.2. [New Features &
Enhancements](lite_opljava.html#lite_newfeat)</span>

<span class="section">8.2. [Downloading Driver
Software](lite_downloadingjdbc.html)</span>

<span class="section">8.2.1. [OpenLink Web Download Wizard Interaction
for obtaining OpenLink Drivers for JDBC
Bundle](lite_downloadingjdbc.html#lite_downwizintjbundle)</span>

<span class="section">8.2.2. [Download Wizard Interaction for obtaining
OpenLink Megathin Drivers for
JDBC](lite_downloadingjdbc.html#lite_downwizjmthin)</span>

<span class="section">8.3. [OpenLink JDBC Driver (Single-Tier Lite
Edition) Configuration](lite_jdbcliteinst.html)</span>

<span class="section">8.4. [OpenLink JDBC Driver (Single-Tier Edition)
for JDBC Utilization](lite_OPLDriversUtilization.html)</span>

<span class="section">8.4.1. [OpenLink Driver for JDBC Type
1](lite_OPLDriversUtilization.html#lite_JDBCType1) </span>

<span class="section">8.4.2. [OpenLink Driver for JDBC Type
2](lite_OPLDriversUtilization.html#lite_JDBCType2) </span>

<span class="section">8.4.3. [OpenLink Driver for JDBC Type
3](lite_OPLDriversUtilization.html#lite_JDBCType3)</span>

<span class="section">8.4.4.
[Examples](lite_OPLDriversUtilization.html#lite_examples)</span>

<span class="section">8.5. [OpenLink JDBC Driver (Single-Tier Edition)
Demonstration Programs](lite_JDBCDemos.html)</span>

<span class="section">8.5.1. [JDBC Compliant Applet
Demos](lite_JDBCDemos.html#lite_JDBCAppletDemos)</span>

<span class="section">8.5.2.
[JDBCDemo](lite_JDBCDemos.html#lite_SimpleJDBCDemo)</span>

<span class="section">8.5.3.
[ScrollDemo](lite_JDBCDemos.html#lite_ScrollDemo)</span>

<span class="section">8.5.4.
[ScrollDemo2](lite_JDBCDemos.html#lite_Scroll2Demo)</span>

<span class="section">8.5.5.
[RowSetDemo](lite_JDBCDemos.html#lite_RowSetDemo)</span>

<span class="section">8.5.6. [JDBC compliant Application
Demos](lite_JDBCDemos.html#lite_JDBCDemoApplications)</span>

<span class="section">8.6. [OpenLink JDBC Driver (Single-Tier Edition)
Important Multi-User JDBC Solution Development & Utilization
Issues](lite_ImportantJDBCIssues.html)</span>

<span class="section">8.6.1. [Sensitivity To Changes In Underlying
Database](lite_ImportantJDBCIssues.html#lite_ChangeSensitivity)</span>

<span class="section">8.6.2. [Concurrency
Control](lite_ImportantJDBCIssues.html#lite_ConcurrencyControl)</span>

<span class="chapter">9. [Distributed Transaction Processing
(XA)](lite_xamt.html)</span>

<span class="section">9.1. [Distributed Transaction Processing
(DTP)](lite_xa.html)</span>

<span class="section">9.1.1. [X/Open DTP
Model](lite_xa.html#lite_xadtpover)</span>

<span class="section">9.1.2. [OpenLink Resource Manager XA Interface
Implementation](lite_xa.html#lite_xadtpormxaii)</span>

<span class="section">9.1.3. [Configuring Databases for XA
support](lite_xa.html#lite_xadtpdbconfig) </span>

<span class="section">9.1.4. [OpenLink XA Connection String
Formats](lite_xa.html#lite_xadtpconnstrfmt)</span>

<span class="section">9.1.5. [Tracing XA calls in OpenLink ODBC
Drivers](lite_xa.html#lite_xadtpodbctrace)</span>

<span class="section">9.1.6. [Enabling XA Transactions on Windows XP SP2
and Windows Server 2003](lite_xa.html#lite_xadtptransenablewin) </span>

<span class="section">9.1.7. [Using OpenLink Drivers with Tuxedo on
Unix](lite_xa.html#lite_xaenabletuxedounix)</span>

<span class="chapter">10. [OpenLink ODBC Driver (Single-Tier Edition)
Unicode Support](lite_unicodechapter.html)</span>

<span class="section">10.1. [Database Configuration for
Unicode](lite_unicode.html)</span>

<span class="section">10.1.1. [Oracle 8 &
9](lite_unicode.html#lite_uniora)</span>

<span class="section">10.1.2. [Informix
9.x](lite_unicode.html#lite_uniinf)</span>

<span class="section">10.1.3. [Sybase 12.5
+](lite_unicode.html#lite_unisyb)</span>

<span class="section">10.1.4. [Progress 9.1
(SQL-92)](lite_unicode.html#lite_unipro)</span>

<span class="section">10.1.5. [DB/2
v7.x](lite_unicode.html#lite_unidb2)</span>

<span class="section">10.1.6. [MS SQLServer
2000](lite_unicode.html#lite_unisql)</span>

<span class="section">10.1.7. [Operational
Notes](lite_unicode.html#lite_unigeninfo)</span>

<span class="chapter">11. [OpenLink ODBC Driver Manager (iODBC
SDK)](lite_iodbc.html)</span>

<span class="section">11.1. [iODBC SDK on
Unix](lite_iodbcsdklinux.html)</span>

<span class="section">11.2. [Configuring Data
Sources](lite_iodbcsdkconfdsn.html)</span>

<span class="section">11.2.1. [The Configuration
Files](lite_iodbcsdkconfdsn.html#lite_iodbcsdkunixfiles)</span>

<span class="section">11.2.2. [Making a Test
Connection](lite_iodbcsdkconfdsn.html#lite_iodbcsdktestunix)</span>

<span class="section">11.2.3. [Compiling Sample
Program](lite_iodbcsdkconfdsn.html#lite_compsampodbc)</span>

<span class="section">11.2.4. [Developing ODBC
Applications](lite_iodbcsdkconfdsn.html#lite_devodbc)</span>

<span class="section">11.2.5. [Further
Reading:](lite_iodbcsdkconfdsn.html#lite_furtherread)</span>

<span class="section">11.3. [Linking iODBC and ODBC Applications on Mac
OS](lite_iodbcappsmacos.html)</span>

<span class="section">11.3.1. [Mac OS
Classic](lite_iodbcappsmacos.html#lite_iodbcmacclassic)</span>

<span class="section">11.3.2. [Mac OS
X](lite_iodbcappsmacos.html#lite_iodbcmacosx)</span>

<span class="section">11.3.3.
[References](lite_iodbcappsmacos.html#lite_iodbcsdkrefs)</span>

<span class="section">11.3.4. [Porting Mac OS Classic ODBC applications
to Mac OS X](lite_iodbcappsmacos.html#lite_iodbcportappmac)</span>

<span class="chapter">12. [Bugs Fixed](lite_bugsfixed.html)</span>

</div>

</div>
