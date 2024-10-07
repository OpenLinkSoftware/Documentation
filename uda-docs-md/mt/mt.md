<div id="mt" class="book">

<div class="titlepage">

<div>

<div>

# OpenLink ODBC Driver (Multi-Tier Edition) Documentation

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

<span class="preface">[Preface](bk01pr01.html)</span>

<span class="section">1. [Conventions](mt_docuventions.html)</span>

<span class="section">2. [Copyright](mt_thecopyright.html)</span>

<span class="chapter">1. [Overview](mt_overview.html)</span>

<span class="chapter">2. [New Features in OpenLink
UDA](mt_newfeatures.html)</span>

<span class="section">2.1. [New Features in OpenLink UDA
v6.0](mt_newfeatures60.html)</span>

<span class="section">2.2. [New Features in OpenLink UDA
v5.2](mt_newfeatures52.html)</span>

<span class="chapter">3. [OpenLink ODBC Driver (Multi-Tier Edition)
Client Component](mt_clientcompinstall.html)</span>

<span class="section">3.1. [Generic Client for
Windows](mt_clientcompw32.html)</span>

<span class="section">3.1.1. [Installation
(32-bit)](mt_clientcompw32.html#mt_cci)</span>

<span class="section">3.1.2. [Installation
(64-bit)](mt_clientcompw32.html#mt64bitinstsect)</span>

<span class="section">3.1.3. [Data Source
Configuration](mt_clientcompw32.html#mt_dsnconfigw)</span>

<span class="section">3.1.4. [ODBC System & User Data
Sources](mt_clientcompw32.html#mt_Confudsn)</span>

<span class="section">3.1.5. [Creating a File Data
Source](mt_clientcompw32.html#mt_Creatfdsn)</span>

<span class="section">3.1.6. [Advanced
Settings](mt_clientcompw32.html#mt_Advanced_Settings)</span>

<span class="section">3.2. [Generic Client For Macintosh OS
8.6+](mt_macinstall.html)</span>

<span class="section">3.2.1.
[Installation](mt_macinstall.html#mt_maccci)</span>

<span class="section">3.2.2. [Data Source
Configuration](mt_macinstall.html#mt_macdsn)</span>

<span class="section">3.2.3. [Tracing Data
Sources](mt_macinstall.html#mt_tracemacdsn)</span>

<span class="section">3.2.4. [Testing Data
Sources](mt_macinstall.html#mt_testmacdsn)</span>

<span class="section">3.3. [Mac OS X](mt_cliinstmacosx.html)</span>

<span class="section">3.3.1.
[Installation](mt_cliinstmacosx.html#mt_cliinstmacxinstall)</span>

<span class="section">3.3.2. [Data Source
Configuration](mt_cliinstmacosx.html#mt_cliinstmacxdsnconf)</span>

<span class="section">3.3.3. [Testing Data
Sources](mt_cliinstmacosx.html#mt_cliinstmacxtsts)</span>

<span class="section">3.3.4. [Troubleshooting ODBC Connections and
Sessions](mt_cliinstmacosx.html#mt_cliinstmacxtracedsn)</span>

<span class="section">3.4. [Generic Client for
UNIX](mt_occunix.html)</span>

<span class="section">3.4.1.
[Installation](mt_occunix.html#mt_uocintro)</span>

<span class="section">3.4.2.
[Configuration](mt_occunix.html#mt_unixconfiguration)</span>

<span class="section">3.4.3. [Sample
Application](mt_occunix.html#mt_Sample_App)</span>

<span class="section">3.4.4. [UDBC Data Source
Configuration](mt_occunix.html#mt_clientcompinstallClient_Comp_Installucconf)</span>

<span class="section">3.5. [New Features](mt_features.html)</span>

<span class="section">3.6. [Oracle Connection Pooling
Support](mt_oraconcpoolgeneric.html)</span>

<span class="section">3.6.1. [What it
is](mt_oraconcpoolgeneric.html#mt_oraconpoolwhat)</span>

<span class="section">3.6.2.
[Benefits](mt_oraconcpoolgeneric.html#mt_oraconpooladvant)</span>

<span class="section">3.6.3. [How it
Works](mt_oraconcpoolgeneric.html#mt_oraconpoolhow)</span>

<span class="section">3.6.4. [The OpenLink Perspective: what you do to
use it](mt_oraconcpoolgeneric.html#mt_oraconpooloplhow)</span>

<span class="section">3.7. [Multi-Tier-specific
Connection-Pooling](mt_oraconpoolmtspecific.html)</span>

<span class="section">3.7.1. [Multi-Tier-specific
configuration](mt_oraconpoolmtspecific.html#mt_oraconcpoolmt)</span>

<span class="section">3.8. [Oracle 10g Instant Client: Connection String
Formats](mt_orainstantclient.html)</span>

<span class="section">3.8.1. [OpenLink Multi-Tier Connections using
Instant Client](mt_orainstantclient.html#mt_orainstclientmt)</span>

<span class="section">3.8.2. [Oracle Client Installation related
links](mt_orainstantclient.html#mt_orainstclientrelatedlinks) </span>

<span class="chapter">4. [OpenLink ADO.NET Data
Providers](mt_dotnet.html)</span>

<span class="section">4.1. [Architecture](mt_dnetarch.html)</span>

<span class="section">4.1.1. [Managed Data
Provider](mt_dnetarch.html#mt_dnetmanage)</span>

<span class="section">4.1.2. [Unmanaged Data
Provider](mt_dnetarch.html#mt_dnetunmanage)</span>

<span class="section">4.2. [Developing .NET Data Provider
Application](mt_dnetdevel.html)</span>

<span class="section">4.3. [OpenLink .NET Data Providers Connect String
Attributes](mt_dnetconnstr.html)</span>

<span class="section">4.3.1. [Managed Generic Multi-Tier .NET Data
Provider
(OpenLink.Data.GenericClient)](mt_dnetconnstr.html#mt_dnetmconnstr_opl)</span>

<span class="section">4.3.2. [Managed Microsoft SQLServer .NET Data
Provider
(OpenLink.Data.SQLServer)](mt_dnetconnstr.html#mt_dnetmconnstr_sqlserver)</span>

<span class="section">4.3.3. [Managed Sybase .NET Data Provider
(OpenLink.Data.Sybase)](mt_dnetconnstr.html#mt_dnetmconnstr_sybase)</span>

<span class="section">4.3.4. [Unmanaged .NET Data Provider
(OpenLink.Data.OdbcClient)](mt_dnetconnstr.html#mt_dnetuconnstr)</span>

<span class="section">4.4. [OpenLink .NET Data Providers Class
Implementation](mt_dnetclasses.html)</span>

<span class="section">4.5. [OpenLink.Data
Namespace](mt_dnetnamespace.html)</span>

<span class="section">4.5.1.
[OPLCommand](mt_dnetnamespace.html#mt_cloplcommand)</span>

<span class="section">4.5.2.
[OPLCommandBuilder](mt_dnetnamespace.html#mt_cloplcommandbuild)</span>

<span class="section">4.5.3.
[OPLConnect](mt_dnetnamespace.html#mt_cloplconnect)</span>

<span class="section">4.5.4.
[OPLDataAdapter](mt_dnetnamespace.html#mt_clopldataadapter)</span>

<span class="section">4.5.5.
[OPLDataReader](mt_dnetnamespace.html#mt_clopldatareader)</span>

<span class="section">4.5.6.
[OPLError](mt_dnetnamespace.html#mt_cloplerror)</span>

<span class="section">4.5.7.
[OPLErrorCollection](mt_dnetnamespace.html#mt_cloplerrorcol)</span>

<span class="section">4.5.8.
[OPLException](mt_dnetnamespace.html#mt_cloplexcept)</span>

<span class="section">4.5.9.
[OPLParameter](mt_dnetnamespace.html#mt_cloplparam)</span>

<span class="section">4.5.10.
[OPLParameterCollection](mt_dnetnamespace.html#mt_cloplparamcol)</span>

<span class="section">4.5.11.
[OPLRowUpdatedEventArgs](mt_dnetnamespace.html#mt_rUpdated)</span>

<span class="section">4.5.12.
[OPLRowUpdatedEventHandler](mt_dnetnamespace.html#mt_rUpdatedHan)</span>

<span class="section">4.5.13.
[OPLRowUpdatingEventArgs](mt_dnetnamespace.html#mt_rUpdating)</span>

<span class="section">4.5.14.
[OPLRowUpdatingEventHandler](mt_dnetnamespace.html#mt_rUpdatingHan)</span>

<span class="section">4.5.15.
[OPLTransaction](mt_dnetnamespace.html#mt_clopltran)</span>

<span class="section">4.6. [Known Issues](mt_dnetissues.html)</span>

<span class="section">4.6.1. [Unsigned Type
Handling](mt_dnetissues.html#mt_dnetunsign)</span>

<span class="section">4.6.2. [Timestamp
Precision](mt_dnetissues.html#mt_dnettimestamp)</span>

<span class="section">4.7. [.Net Provider Test
Program](mt_dnettest.html)</span>

<span class="section">4.8. [New
Features](mt_features_dotnet.html)</span>

<span class="chapter">5. [OpenLink OLE-DB
Provider](mt_oledb.html)</span>

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

<span class="chapter">6. [Server Components
Installation](mt_srvcompinstall.html)</span>

<span class="section">6.1. [OpenLink License Manager Usage
Notes](mt_oplmgr.html) </span>

<span class="section">6.1.1.
[Background](mt_oplmgr.html#mt_oplmgrbckgrnd) </span>

<span class="section">6.1.2. [Single-Tier](mt_oplmgr.html#mt_oplmgrst)
</span>

<span class="section">6.1.3. [Multi-Tier](mt_oplmgr.html#mt_oplmgrmt)
</span>

<span class="section">6.1.4. [How to stop/start the OpenLink License
Manager](mt_oplmgr.html#mt_oplmgrhowto) </span>

<span class="section">6.1.5. [Environment
Variables](mt_oplmgr.html#mt_oplmgrenvvar) </span>

<span class="section">6.1.6. [OpenLink License Manager Networking
Considerations](mt_oplmgr.html#mt_oplmgrnetwork) </span>

<span class="section">6.2. [Product
Licensing](mt_winproductlic.html)</span>

<span class="section">6.2.1. [Initial
License](mt_winproductlic.html#mt_wstartlic)</span>

<span class="section">6.2.2. [How to apply the
License](mt_winproductlic.html#mt_wapplylic)</span>

<span class="section">6.3. [Upgrading the
License](mt_getlic.html)</span>

<span class="section">6.4. [Windows 95/98/NT/XP/2000
Install](mt_wsrvcompinst.html)</span>

<span class="section">6.5. [Mac OS X](mt_macxsrvinst.html)</span>

<span class="section">6.5.1.
[Installation](mt_macxsrvinst.html#mt_macxsrvinstinstallation)</span>

<span class="section">6.6. [UNIX & Linux
Install](mt_unixsrvcompinst.html)</span>

<span class="section">6.7. [Installed Files &
Locations](mt_servcompinstcont.html)</span>

<span class="section">6.7.1. [The "bin"
sub-directory:](mt_servcompinstcont.html#mt_binsubdir)</span>

<span class="section">6.7.2. [The "bin/w3config"
sub-directory:](mt_servcompinstcont.html#mt_w3configdir)</span>

<span class="section">6.8. [Obtaining Component Details From The Command
Line](mt_versionnos.html)</span>

<span class="section">6.8.1. [OpenLink Request
Broker:](mt_versionnos.html#mt_oplrqb)</span>

<span class="section">6.8.2. [Web Service
Agent:](mt_versionnos.html#mt_webage)</span>

<span class="section">6.9. [Configuring a Firewall for use with UDA
Multi-Tier](mtfirewalling.html)</span>

<span class="chapter">7. [Request Broker
Administration](mt_SrvCompAdm.html)</span>

<span class="section">7.1. [Request Broker Startup &
Shutdown](mt_startandstop.html)</span>

<span class="section">7.1.1. [Startup
Options](mt_startandstop.html#mt_startup)</span>

<span class="section">7.1.2. [Shutdown
Options](mt_startandstop.html#mt_shutdownopts)</span>

<span class="section">7.1.3.
[Security](mt_startandstop.html#mt_securityutil)</span>

<span class="section">7.1.4. [Multiple Request
Brokers](mt_startandstop.html#mt_multibroker)</span>

<span class="section">7.2. [Request Broker Session
Parameters](mt_rqbsessparams.html)</span>

<span class="section">7.2.1. [General
Information](mt_rqbsessparams.html#mt_adinfoadmasist)</span>

<span class="section">7.2.2. [Using Admin Assistant
Wizards](mt_rqbsessparams.html#mt_sessconfwiz)</span>

<span class="section">7.2.3. [Using Admin Assistant
Forms](mt_rqbsessparams.html#mt_sesconffrms)</span>

<span class="section">7.3. [OpenLink Session Rules Administration &
Configuration Guide](mt_oplsessadminconf.html) </span>

<span class="section">7.3.1. [OpenLink Session Rules
Concepts](mt_oplsessadminconf.html#mt_sessrulconcept)</span>

<span class="section">7.3.2. [OpenLink Connection
Attributes](mt_oplsessadminconf.html#mt_oplconnattr)</span>

<span class="section">7.3.3. [OpenLink Session
Templates](mt_oplsessadminconf.html#mt_sesstemplate)</span>

<span class="section">7.3.4. [Session Rules Execution
Process](mt_oplsessadminconf.html#mt_sessrulexec)</span>

<span class="section">7.3.5. [Creating Custom Aliases For Use By
OpenLink Data Access
Clients](mt_oplsessadminconf.html#mt_custali)</span>

<span class="section">7.3.6. [Using the Admin Assistant To Create
Session Rules](mt_oplsessadminconf.html#mt_adass4cr8tingrules)</span>

<span class="chapter">8. [Server Agent
Administration](mt_AgentCompAdm.html)</span>

<span class="section">8.1. [Administration
Assistant](mt_agentconfig.html)</span>

<span class="section">8.1.1. [Wizard Based
Administration](mt_agentconfig.html#mt_wizbasedconf)</span>

<span class="section">8.1.2. [Forms Based
Administration](mt_agentconfig.html#mt_frmagntadm)</span>

<span class="section">8.2. [Agent-Specific
Settings](mt_dbspecset.html)</span>

<span class="section">8.2.1. [Common Agent Configuration
Options](mt_dbspecset.html#mt_oplconfaall)</span>

<span class="section">8.2.2.
[Virtuoso](mt_dbspecset.html#mt_virtspecset)</span>

<span class="section">8.2.3.
[Informix](mt_dbspecset.html#mt_infspecset)</span>

<span class="section">8.2.4.
[Ingres](mt_dbspecset.html#mt_ingspec)</span>

<span class="section">8.2.5.
[Progress](mt_dbspecset.html#mt_prospec)</span>

<span class="section">8.2.6.
[Oracle](mt_dbspecset.html#mt_oraspec)</span>

<span class="section">8.2.7.
[Sybase](mt_dbspecset.html#mt_sybspec)</span>

<span class="section">8.2.8. [Microsoft SQL
Server](mt_dbspecset.html#mt_sqlservspec)</span>

<span class="section">8.2.9. [TDS](mt_dbspecset.html#mt_tdsspec)</span>

<span class="section">8.2.10. [DB2](mt_dbspecset.html#mt_db2spec)</span>

<span class="section">8.2.11.
[PostgresSQL](mt_dbspecset.html#mt_postgresspec)</span>

<span class="section">8.2.12.
[MySQL](mt_dbspecset.html#mt_mysqlspec)</span>

<span class="section">8.2.13. [OpenLink ODBC Agent Installation &
Configuration](mt_dbspecset.html#mt_odbcconf)</span>

<span class="section">8.2.14. [OpenLink ODBC-JDBC Agent Bridge
Installation & Configuration](mt_dbspecset.html#mt_odbcjdbcconf)</span>

<span class="section">8.2.15. [OpenLink Proxy
Agent](mt_dbspecset.html#mt_oplprxyag)</span>

<span class="section">8.3. [Database Configuration for
Unicode](mt_unicode.html)</span>

<span class="section">8.3.1. [Oracle 8 &
9](mt_unicode.html#mt_uniora)</span>

<span class="section">8.3.2. [Informix
9.x](mt_unicode.html#mt_uniinf)</span>

<span class="section">8.3.3. [Sybase 12.5
+](mt_unicode.html#mt_unisyb)</span>

<span class="section">8.3.4. [Progress 9.1
(SQL-92)](mt_unicode.html#mt_unipro)</span>

<span class="section">8.3.5. [DB/2
v7.x](mt_unicode.html#mt_unidb2)</span>

<span class="section">8.3.6. [MS SQLServer
2000](mt_unicode.html#mt_unisql)</span>

<span class="section">8.3.7. [Operational
Notes](mt_unicode.html#mt_unigeninfo)</span>

<span class="section">8.4. [Obtaining Agent
Information](mt_getagntinfo.html)</span>

<span class="section">8.4.1. [Specific Agent
Information](mt_getagntinfo.html#mt_verrelfuncinfo)</span>

<span class="section">8.5. [Linking OpenLink DB
Agents](mt_relinkdb.html)</span>

<span class="section">8.5.1. [General Linking
Approach](mt_relinkdb.html#mt_relinkgeneral)</span>

<span class="section">8.5.2. [Relinking Progress
Agents](mt_relinkdb.html#mt_relinkpro)</span>

<span class="section">8.6. [Progress Troubleshooting & Advanced
Configuration](mt_conprog.html)</span>

<span class="section">8.6.1. [OpenLink Data Access
Components](mt_conprog.html#mt_conprogudacomps)</span>

<span class="section">8.6.2. [How OpenLink's Data Access Drivers Connect
To Your Progress Database](mt_conprog.html#mt_conproghowtoprog)</span>

<span class="section">8.6.3. [Initial Connection
Problems](mt_conprog.html#mt_conprogtrblesht)</span>

<span class="section">8.6.4. [Making OpenLink Database Agent Use a
Sockets Based IPC](mt_conprog.html#mt_conprogsocketspro)</span>

<span class="section">8.6.5. [Distributed Databases, Array Fields,
Database
Triggers](mt_conprog.html#mt_conprogDistributedDatabases)</span>

<span class="section">8.6.6. [Using OpenLink ODBC, Progress & Microsoft
Access](mt_conprog.html#mt_conprogusingoplodbc)</span>

<span class="section">8.6.7. [Key Microsoft Access Jet Engines Setting
That Can Affect Your OpenLink ODBC
Experience](mt_conprog.html#mt_conprogjetsetngs)</span>

<span class="section">8.7. [Application Server
Architecture](mt_appserverarchitect.html)</span>

<span class="chapter">9. [Securing a Multi-Tier connection using
SSL](mt_uda52ssl.html)</span>

<span class="section">9.1. [Overview](mt_ssloverview.html)</span>

<span class="section">9.2. [Implementing SSL
Encryption](mt_sslimplementation.html)</span>

<span class="section">9.2.1. [Server-side Configuration for
SSL](mt_sslimplementation.html#mt_sslserverside)</span>

<span class="section">9.2.2. [Client-side Configuration for
SSL](mt_sslimplementation.html#mt_sslclientside)</span>

<span class="section">9.2.3. [Error
Messages](mt_sslimplementation.html#mt_sslpossibleerrors)</span>

<span class="chapter">10. [Zero Configuration
Networking](mt_UDAZeroConf.html)</span>

<span class="section">10.1. [Introduction](mt_zeroconfintro.html)</span>

<span class="section">10.2. [Server
Configuration](mt_zerosrvconf.html)</span>

<span class="section">10.2.1. [Configuration by Rule Book
Edit](mt_zerosrvconf.html#mt_zeroconfini)</span>

<span class="section">10.2.2. [Configuration by
Wizard](mt_zerosrvconf.html#mt_zeroconfwiz)</span>

<span class="section">10.2.3. [Configuration by
Form](mt_zerosrvconf.html#mt_zeroconfform)</span>

<span class="section">10.3. [Client
Configuration](mt_zeroclientconf.html)</span>

<span class="section">10.3.1. [Configuration by Windows ODBC Driver
Manager](mt_zeroclientconf.html#mt_zeroclientdm)</span>

<span class="section">10.3.2. [Configuration by Admin
Assistant](mt_zeroclientconf.html#mt_zeroclientaa)</span>

<span class="chapter">11. [JDBC
Components](mt_JDBCClientClasses.html)</span>

<span class="section">11.1. [OpenLink JDBC
Drivers](mt_opljava.html)</span>

<span class="section">11.1.1. [New JDBC Driver
Packages](mt_opljava.html#mt_New_Features_Summary)</span>

<span class="section">11.1.2. [New Features &
Enhancements](mt_opljava.html#mt_newfeat)</span>

<span class="section">11.2. [Downloading Driver
Software](mt_downloading.html)</span>

<span class="section">11.2.1. [OpenLink Web Download Wizard Interaction
for obtaining OpenLink Drivers for JDBC
Bundle](mt_downloading.html#mt_downwizintjbundle)</span>

<span class="section">11.2.2. [Download Wizard Interaction for obtaining
OpenLink Megathin Drivers for
JDBC](mt_downloading.html#mt_downwizjmthin)</span>

<span class="section">11.3. [OpenLink Drivers for JDBC Installation &
Configuration](mt_InstallConfig.html)</span>

<span class="section">11.3.1. [Windows 95/98/NT/2000 Based Local
Client-Server
Environment](mt_InstallConfig.html#mt_WIN32LocalClientServer)</span>

<span class="section">11.3.2. [Windows 95/98/NT/2000 Based Client-Server
(2-Tier Configuration)
Environment](mt_InstallConfig.html#mt_WIN32ClientServer)</span>

<span class="section">11.3.3. [Windows 95/98/NT/2000 Based
Application-Server (3-Tier Configuration)
Environment](mt_InstallConfig.html#mt_WIN32AppServer)</span>

<span class="section">11.4. [Java Based Local
Client-Server](mt_JavaLocalClientServer.html)</span>

<span class="section">11.4.1. [Client Components Installation
Process](mt_JavaLocalClientServer.html#mt_clicompins)</span>

<span class="section">11.4.2. [Server Components
Installation](mt_JavaLocalClientServer.html#mt_servcomp)</span>

<span class="section">11.4.3. [Linux or UNIX Server Components
Installation](mt_JavaLocalClientServer.html#mt_linunixsrvcomp)</span>

<span class="section">11.5. [Java Based Client-Server (2-Tier)
Installation](mt_JavaClientServer.html)</span>

<span class="section">11.5.1. [Windows 95/98/NT/2000 Client Components
Installation Process](mt_JavaClientServer.html#mt_winclicomp)</span>

<span class="section">11.5.2. [Linux or UNIX Client Components
Installation](mt_JavaClientServer.html#mt_linunixclicomp)</span>

<span class="section">11.5.3. [Server Components
Installation](mt_JavaClientServer.html#mt_srvcompinst)</span>

<span class="section">11.5.4. [Linux or UNIX Server Components
Installation](mt_JavaClientServer.html#mt_linunixsrccompi)</span>

<span class="section">11.6. [Java Based Application-Server (3-Tier)
Installation](mt_JavaAppServer.html)</span>

<span class="section">11.6.1. [Windows 95/98/NT/2000 Client Components
Installation Process.](mt_JavaAppServer.html#mt_wincli)</span>

<span class="section">11.6.2. [Linux or UNIX Application Server
Components
Installation](mt_JavaAppServer.html#mt_linunixappsrvcomp)</span>

<span class="section">11.6.3. [Database Server Components
Installation](mt_JavaAppServer.html#mt_dbsrvcmpins)</span>

<span class="section">11.6.4. [Mixed Environment
Installations](mt_JavaAppServer.html#mt_MixedEnvironmentInstallations)</span>

<span class="section">11.7. [OpenLink Server Components
Configuration](mt_OpenLinkMiddleware.html)</span>

<span class="section">11.8. [OpenLink Drivers for JDBC
Utilization](mt_OPLDriversUtilization.html)</span>

<span class="section">11.8.1. [OpenLink Driver for JDBC Type
1](mt_OPLDriversUtilization.html#mt_JDBCType1) </span>

<span class="section">11.8.2. [OpenLink Driver for JDBC Type
3](mt_OPLDriversUtilization.html#mt_JDBCType3)</span>

<span class="section">11.8.3.
[Examples](mt_OPLDriversUtilization.html#mt_examples)</span>

<span class="section">11.9. [OpenLink Demonstration
Programs](mt_JDBCDemos.html)</span>

<span class="section">11.9.1. [JDBC Compliant Applet
Demos](mt_JDBCDemos.html#mt_JDBCAppletDemos)</span>

<span class="section">11.9.2.
[JDBCDemo](mt_JDBCDemos.html#mt_SimpleJDBCDemo)</span>

<span class="section">11.9.3.
[ScrollDemo](mt_JDBCDemos.html#mt_ScrollDemo)</span>

<span class="section">11.9.4.
[ScrollDemo2](mt_JDBCDemos.html#mt_Scroll2Demo)</span>

<span class="section">11.9.5.
[RowSetDemo](mt_JDBCDemos.html#mt_RowSetDemo)</span>

<span class="section">11.9.6. [JDBC compliant Application
Demos](mt_JDBCDemos.html#mt_JDBCDemoApplications)</span>

<span class="section">11.10. [Important Multi-User JDBC Solution
Development & Utilization Issues](mt_ImportantJDBCIssues.html)</span>

<span class="section">11.10.1. [Sensitivity To Changes In Underlying
Database](mt_ImportantJDBCIssues.html#mt_ChangeSensitivity)</span>

<span class="section">11.10.2. [Concurrency
Control](mt_ImportantJDBCIssues.html#mt_ConcurrencyControl)</span>

<span class="section">11.11. [JDBC 3 Driver
Classes](mt_jdbcref.html)</span>

<span class="section">11.11.1. [Class
BaseRowSet](mt_jdbcref.html#mt_jd1.1)</span>

<span class="section">11.11.2. [Class
OPLCachedRowSet](mt_jdbcref.html#mt_jd1.2)</span>

<span class="section">11.11.3. [Class
OPLConnectionPoolDataSource](mt_jdbcref.html#mt_jd1.3)</span>

<span class="section">11.11.4. [Class
OPLDataSource](mt_jdbcref.html#mt_jd1.4)</span>

<span class="section">11.11.5. [Class
OPLDataSourceFactory](mt_jdbcref.html#mt_jd1.5)</span>

<span class="section">11.11.6. [Class
OPLJdbcRowSet](mt_jdbcref.html#mt_jd1.6)</span>

<span class="section">11.11.7. [Class
OPLPooledConnection](mt_jdbcref.html#mt_jd1.7)</span>

<span class="section">11.11.8. [Class
OPLPoolStatistic](mt_jdbcref.html#mt_jd1.8)</span>

<span class="section">11.11.9. [Class
OPLRowSetMetaData](mt_jdbcref.html#mt_jd1.9)</span>

<span class="section">11.12. [New
Features](mt_features_jdbc.html)</span>

<span class="chapter">12. [Distributed Transaction Processing
(XA)](mt_xamt.html)</span>

<span class="section">12.1. [Distributed Transaction Processing
(DTP)](mt_xa.html)</span>

<span class="section">12.1.1. [X/Open DTP
Model](mt_xa.html#mt_xadtpover)</span>

<span class="section">12.1.2. [OpenLink Resource Manager XA Interface
Implementation](mt_xa.html#mt_xadtpormxaii)</span>

<span class="section">12.1.3. [Configuring Databases for XA
support](mt_xa.html#mt_xadtpdbconfig) </span>

<span class="section">12.1.4. [OpenLink XA Connection String
Formats](mt_xa.html#mt_xadtpconnstrfmt)</span>

<span class="section">12.1.5. [Tracing XA calls in OpenLink ODBC
Drivers](mt_xa.html#mt_xadtpodbctrace)</span>

<span class="section">12.1.6. [Enabling XA Transactions on Windows XP
SP2 and Windows Server 2003](mt_xa.html#mt_xadtptransenablewin) </span>

<span class="section">12.1.7. [Using OpenLink Drivers with Tuxedo on
Unix](mt_xa.html#mt_xaenabletuxedounix)</span>

<span class="chapter">13. [Real Application Cluster (RAC) / TAF
Support](mt_udauserrac.html)</span>

<span class="section">13.1. [What you have to do to use
it](mt_udauserrachowtouse.html)</span>

<span class="section">13.1.1.
[Configuration](mt_udauserrachowtouse.html#id1354)</span>

<span class="section">13.1.2. [Programmatic
Considerations](mt_udauserrachowtouse.html#id1357)</span>

<span class="section">13.2. [Related
Links](mt_udauserracrelatedlinks.html)</span>

<span class="chapter">14. [OpenLink ODBC Driver Manager (iODBC
SDK)](mt_iodbc.html)</span>

<span class="section">14.1. [iODBC SDK on
Unix](mt_iodbcsdklinux.html)</span>

<span class="section">14.2. [Configuring Data
Sources](mt_iodbcsdkconfdsn.html)</span>

<span class="section">14.2.1. [The Configuration
Files](mt_iodbcsdkconfdsn.html#mt_iodbcsdkunixfiles)</span>

<span class="section">14.2.2. [Making a Test
Connection](mt_iodbcsdkconfdsn.html#mt_iodbcsdktestunix)</span>

<span class="section">14.2.3. [Compiling Sample
Program](mt_iodbcsdkconfdsn.html#mt_compsampodbc)</span>

<span class="section">14.2.4. [Developing ODBC
Applications](mt_iodbcsdkconfdsn.html#mt_devodbc)</span>

<span class="section">14.2.5. [Further
Reading:](mt_iodbcsdkconfdsn.html#mt_furtherread)</span>

<span class="section">14.3. [Linking iODBC and ODBC Applications on Mac
OS](mt_iodbcappsmacos.html)</span>

<span class="section">14.3.1. [Mac OS
Classic](mt_iodbcappsmacos.html#mt_iodbcmacclassic)</span>

<span class="section">14.3.2. [Mac OS
X](mt_iodbcappsmacos.html#mt_iodbcmacosx)</span>

<span class="section">14.3.3.
[References](mt_iodbcappsmacos.html#mt_iodbcsdkrefs)</span>

<span class="section">14.3.4. [Porting Mac OS Classic ODBC applications
to Mac OS X](mt_iodbcappsmacos.html#mt_iodbcportappmac)</span>

<span class="chapter">15. [Sample
Applications](mt_sampleapps.html)</span>

<span class="section">15.1. [Binary & Source File
Locations](mt_bindir.html)</span>

<span class="section">15.1.1. [ODBC Demonstration
Applications](mt_bindir.html#mt_obindir)</span>

<span class="section">15.1.2. [JDBC Demonstration
Applications](mt_bindir.html#mt_jbindir)</span>

<span class="section">15.2. [Windows 95/98/NT/2000 Based ODBC Sample
Applications](mt_odbcsam.html)</span>

<span class="section">15.2.1. [C++
Demo](mt_odbcsam.html#mt_cppdemo)</span>

<span class="section">15.2.2. [ODBC Bench Test
32](mt_odbcsam.html#mt_odbcbench)</span>

<span class="section">15.2.3. [Linux & UNIX Based ODBC Sample
Applications](mt_odbcsam.html#mt_odbcsaml)</span>

<span class="section">15.2.4. [Mac OS
X](mt_odbcsam.html#mt_macosxsamples)</span>

<span class="section">15.2.5. [JDBC Sample Applications
&Applets](mt_odbcsam.html#mt_jdbcsaa)</span>

<span class="chapter">16. [Bugs Fixed](mt_bugsfixed.html)</span>

<span class="chapter">17. [Technical Appendix](mt_appendix.html)</span>

<span class="section">17.1. [Rulebook Settings](mt_rulebook.html)</span>

<span class="section">17.1.1. [\[Request
Broker\]](mt_rulebook.html#mt_requestbroker)</span>

<span class="section">17.1.2. [\[Protocol
TCP\]](mt_rulebook.html#mt_protocoltcp)</span>

<span class="section">17.1.3. [\[Protocol
SPX\]](mt_rulebook.html#mt_protocolspx)</span>

<span class="section">17.1.4. [\[Protocol
DECnet\]](mt_rulebook.html#mt_protocoldecnet)</span>

<span class="section">17.1.5.
[\[Communications\]](mt_rulebook.html#mt_communications)</span>

<span class="section">17.1.6.
[\[ZeroConf\]](mt_rulebook.html#mt_zeroconfig)</span>

<span class="section">17.1.7.
[\[Security\]](mt_rulebook.html#mt_security)</span>

<span class="section">17.1.8.
[\[generic_agentname\]](mt_rulebook.html#mt_genericagent)</span>

<span class="section">17.1.9. [\[Domain
Aliases\]](mt_rulebook.html#mt_domainaliases)</span>

<span class="section">17.1.10. [\[Database
Aliases\]](mt_rulebook.html#mt_databasealiases)</span>

<span class="section">17.1.11. [\[User
Aliases\]](mt_rulebook.html#mt_useraliases)</span>

<span class="section">17.1.12. [\[Opsys
Aliases\]](mt_rulebook.html#mt_opsysaliases)</span>

<span class="section">17.1.13. [\[Machine
Aliases\]](mt_rulebook.html#mt_rbmachinealiases)</span>

<span class="section">17.1.14. [\[Application
Aliases\]](mt_rulebook.html#mt_applicationaliases)</span>

<span class="section">17.1.15. [\[Mapping
Rules\]](mt_rulebook.html#mt_mappingrules)</span>

<span class="section">17.2. [Error Codes](mt_errorcodes.html)</span>

<span class="section">17.3. [Broker Log
Levels](mt_loglevels.html)</span>

<span class="section">17.4. [ODBC to Jet Data Type
Mapping](mt_jetfix.html)</span>

<span class="section">17.4.1.
[Overview](mt_jetfix.html#mt_jetoverview)</span>

<span class="section">17.4.2. [ODBC to Jet Data Type
Mapping](mt_jetfix.html#mt_jetmap)</span>

<span class="section">17.4.3. [Jet Data Type
Ranges](mt_jetfix.html#mt_jetranges)</span>

<span class="section">17.4.4.
[References](mt_jetfix.html#mt_jetref)</span>

<span class="section">17.4.5. [Informix Jet
Support](mt_jetfix.html#mt_jetinf)</span>

<span class="section">17.4.6. [Oracle Jet
Support](mt_jetfix.html#mt_jetora)</span>

<span class="section">17.5. [SQL Server 2000 – Connection
Options](mt_sql2kconnectopts.html)</span>

<span class="section">17.5.1. [Connection Option
Parameters](mt_sql2kconnectopts.html#mt_sql2kopts)</span>

<span class="section">17.5.2. [Entry
Format](mt_sql2kconnectopts.html#mt_sql2kentry)</span>

<span class="section">17.5.3. [Disallowed
Keywords](mt_sql2kconnectopts.html#mt_sql2kkeywords)</span>

</div>

</div>
