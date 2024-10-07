<div id="ch-accessinterfaces" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 7. Data Access Interfaces

</div>

<div>

<div class="abstract">

**Abstract**

This chapter covers installation, configuration, and utilization of the
data access drivers / providers (ODBC, JDBC, OLE-DB, and ADO.NET ) that
comprise the Virtuoso Client Connectivity kit.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">7.1. [ADO.Net Data
Provider](ch-accessinterfaces.html#virtclientref)</span>

<span class="section">7.1.1.
[Introduction](ch-accessinterfaces.html#virtclientrefintro)</span>

<span class="section">7.1.2. [Installation &
Configuration](ch-accessinterfaces.html#virtclientrefinstallandconfig)</span>

<span class="section">7.1.3. [Programmers
Guide](ch-accessinterfaces.html#virtclientrefprogrammersguide)</span>

<span class="section">7.2. [Interactive SQL
Utility](virtuoso_clients_isql.html)</span>

<span class="section">7.2.1. [Invoking
ISQL](virtuoso_clients_isql.html#invokingisql)</span>

<span class="section">7.2.2. [ISQL Commands](isqlcommands.html)</span>

<span class="section">7.2.3. [ISQL Macro
Substitution](isqlmacrodef.html)</span>

<span class="section">7.2.4. [ISQL Variables](isqlvariables.html)</span>

<span class="section">7.2.5. [Using isql as a General Purpose Test
Driver](isqlgentesttool.html)</span>

<span class="section">7.3. [Virtuoso Driver for
ODBC](odbcimplementation.html)</span>

<span class="section">7.3.1. [Windows ODBC Driver
Configuration](odbcimplementation.html#virtdsnsetup)</span>

<span class="section">7.3.2. [Using X509 Certificates With ODBC
Connection](secureodbcx509.html)</span>

<span class="section">7.3.3. [Manually configuring a Virtuoso ODBC DSN
on Unix](virtmanconfodbcdsnunix.html)</span>

<span class="section">7.3.4. [ODBC
Compliance](odbccompliance.html)</span>

<span class="section">7.3.5. [Virtuoso Scrollable Cursor
Engine](vscrlcursors.html)</span>

<span class="section">7.3.6. [Effect of Connection & Statement
Options](conn_stmt_options.html)</span>

<span class="section">7.3.7. [Efficient Use of
API](efficientapi.html)</span>

<span class="section">7.3.8. [Executing SQL from Python
script](execpythonscript.html)</span>

<span class="section">7.3.9.
[Extensions](odbcimplementationext.html)</span>

<span class="section">7.3.10.
[Examples](odbcimplementationexamples.html)</span>

<span class="section">7.4. [Virtuoso Driver for
JDBC](virtuosodriverjdbc.html)</span>

<span class="section">7.4.1. [Virtuoso Drivers for JDBC
Packaging](virtuosodriverjdbc.html#virtuosodriverpackaging)</span>

<span class="section">7.4.2. [Virtuoso Driver For JDBC URL
Format](jdbcurl4mat.html)</span>

<span class="section">7.4.3. [Virtuoso Driver JDBC 3.0
features](jdbc3features.html)</span>

<span class="section">7.4.4. [Virtuoso Driver JDBC 4.0
features](jdbc4features.html)</span>

<span class="section">7.4.5. [Installation & Configuration
Steps](jdbcdriverinstallconfig.html)</span>

<span class="section">7.4.6. [Virtuoso JDBC Driver Hibernate
Support](jdbcdriverhibernate.html)</span>

<span class="section">7.4.7.
[Examples](jdbcdriverhibernatesetupandtestingexmp.html)</span>

<span class="section">7.5. [OLE DB Provider for
Virtuoso](virtoledb.html)</span>

<span class="section">7.5.1. [Using the OLE DB Provider for
Virtuoso](virtoledb.html#oledbusing)</span>

<span class="section">7.5.2. [Known
Limitations](oledblimitations.html)</span>

<span class="section">7.5.3. [Data Types](oledbdatatypes.html)</span>

<span class="section">7.5.4. [Metadata](metadata.html)</span>

<span class="section">7.5.5. [Supported
Interfaces](interfaces.html)</span>

<span class="section">7.5.6. [Data Source
Objects](oledbdatasource.html)</span>

<span class="section">7.5.7. [Sessions](oledbsessions.html)</span>

<span class="section">7.5.8. [Rowsets](oledbrowsets.html)</span>

<span class="section">7.6. [Virtuoso In-Process
Client](inprocess.html)</span>

<span class="section">7.7. [Unix Domain Socket
Connections](accintudsockets.html)</span>

<span class="section">7.8. [Virtuoso Data Access Clients Connection Fail
over and Load Balancing
Support](dataccessclientsconfailandbalance.html)</span>

<span class="section">7.8.1.
[ODBC](dataccessclientsconfailandbalance.html#dataccessclientsconfailandbalanceodbc)</span>

<span class="section">7.8.2.
[ADO.Net](dataccessclientsconfailandbalanceado.html)</span>

<span class="section">7.8.3.
[JDBC](dataccessclientsconfailandbalancejdbc.html)</span>

<span class="section">7.8.4. [OLE
DB](dataccessclientsconfailandbalanceole.html)</span>

<span class="section">7.8.5.
[Sesame](dataccessclientsconfailandbalancesesm.html)</span>

</div>

<div id="virtclientref" class="section">

<div class="titlepage">

<div>

<div>

## 7.1. ADO.Net Data Provider

</div>

</div>

</div>

<div id="virtclientrefintro" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.1. Introduction

</div>

</div>

</div>

Virtuoso includes an ADO.NET 2.x & 3.x data providers compatible with
Visual Studio 2008 and Entity Frameworks, that provides access to native
Virtuoso data (SQL, XML, and RDF) in addition to any Virtuoso Linked
Tables from external <a href="vdbengineodbcod.html" class="link"
title="8.11. Using Microsoft Entity Frameworks to Access ODBC to ODBC Bridge Schema Objects with Virtuoso">ODBC</a>
and <a href="vdbengineodtjd.html" class="link"
title="8.10. Using Microsoft Entity Frameworks to Access ODBC to JDBC Bridge Schema Objects with Virtuoso">JDBC</a>
accessible data sources. Known-compatible external data sources include
<a href="vdbenginemc.html" class="link"
title="8.2. Using Microsoft Entity Frameworks to Access Oracle Schema Objects with Virtuoso">Oracle
(versions 7.x to 11.x)</a> , <a href="vdbenginemsqls.html" class="link"
title="8.13. Using Microsoft Entity Frameworks to Access Microsoft SQL Server Schema Objects with Virtuoso">Microsoft
SQL Server (6.x to 2005)</a> , <a href="vdbenginedb2.html" class="link"
title="8.6. Using Microsoft Entity Frameworks to Access DB2 Schema Objects with Virtuoso">IBM
DB2</a> , <a href="vdbenginesyb.html" class="link"
title="8.7. Using Microsoft Entity Frameworks to Access Sybase Schema Objects with Virtuoso">Sybase
(4.2 to 15.x)</a> , <a href="vdbengineinf.html" class="link"
title="8.5. Using Microsoft Entity Frameworks to Access Informix Schema Objects with Virtuoso">IBM
Informix (5.x to 11.x)</a> , <a href="vdbengineing.html" class="link"
title="8.4. Using Microsoft Entity Frameworks to Access Ingres Schema Objects with Virtuoso">Ingres
(6.4 to 9.x)</a> , <a href="vdbenginepr.html" class="link"
title="8.3. Using Microsoft Entity Frameworks to Access Progress Schema Objects with Virtuoso">Progress
(7.x to 10.x)</a> , <a href="vdbenginemsql.html" class="link"
title="8.8. Using Microsoft Entity Frameworks to Access MySQL Schema Objects with Virtuoso">MySQL</a>
, <a href="vdbenginepsql.html" class="link"
title="8.9. Using Microsoft Entity Frameworks to Access PostgreSQL Schema Objects with Virtuoso">PostgreSQL</a>
and <a href="vdbenginefirebd.html" class="link"
title="8.12. Using Microsoft Entity Frameworks to Access Firebird Schema Objects with Virtuoso">Firebird</a>
.

<span class="emphasis">*Benefits*</span>

This provider equips Microsoft .NET based applications, development
environments, and programming languages with conceptual entity-based
access to native and heterogeneous data sources.

<span class="emphasis">*Features*</span>

<div class="itemizedlist">

- ADO.NET 3.5 compliance

- .NET Entity Frameworks compatibility

- Full integration with Visual Studio 2008

- ADO.NET Data Services compatibility

- LINQ to Entities compatibility

- High-Performance & Scalability

- High Security

- Support for Native and 3rd party ODBC and JDBC accessible RDBMS
  engines and Web Services

- Tested against all major .NET applications and development
  environments

- Support for Microsoft Siliverlight versions 2 and 3

- Support for .Net RIA Services

</div>

</div>

<div id="virtclientrefinstallandconfig" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.2. Installation & Configuration

</div>

</div>

</div>

There are two installation types to consider:

<div class="itemizedlist">

- If you have an existing Virtuoso instance, or will install Virtuoso on
  a different host, you only need to install of the
  <a href="ch-accessinterfaces.html#virtclientrefinstallandconfigonwin"
  class="link"
  title="Installation of the ADO.Net Provider Client on Windows">ADO.Net
  Provider Client</a> on the Visual Studio host.

- If you have no existing Virtuoso instance, you can
  <a href="ch-accessinterfaces.html#virtclientrefinstallandconfigvirt"
  class="link"
  title="Installation of the ADO.Net Provider Client and Virtuoso Universal Server on Windows">install
  both the ADO.Net Provider Client and the Virtuoso Universal Server</a>
  on the Visual Studio host.

</div>

<div id="virtclientrefinstallandconfigonwin" class="section">

<div class="titlepage">

<div>

<div>

#### Installation of the ADO.Net Provider Client on Windows

</div>

</div>

</div>

The Virtuoso ADO.Net Provider is part of the Virtuoso Client
Connectivity Kit installer, and if the target Virtuoso Server
installation already exists on the network this is the only component
that needs to be installed.

<div class="orderedlist">

1.  Download and run the Virtuoso Client Connectivity Kit installer for
    your target Windows OS:

    <div class="itemizedlist">

    - <a
      href="http://download.openlinksw.com/download/login.vsp?pfam=2&amp;pform=26&amp;pcat=51&amp;prod=virtuoso-connect-psnl&amp;os=i686-generic-win-32&amp;release-dbms=5.0-virt50"
      class="ulink" target="_top">Windows 98/NT/2000/XP/2003/Vista/2008 (32
      Bit) (x86)</a>

    - <a
      href="http://download.openlinksw.com/download/login.vsp?pfam=2&amp;pform=26&amp;pcat=51&amp;prod=virtuoso-connect-psnl&amp;os=x86_64-generic-win-64&amp;release-dbms=5.0-virt50"
      class="ulink" target="_top">Windows XP/2003/Vista/2008 (64 Bit)
      (x86_64)</a>

    </div>

2.  Choose the "run" button to allow the signed "Virtuoso Client
    Connectivity kit" installer to start.

    <div class="figure-float">

    <div id="ado1" class="figure">

    **Figure 7.1. Run**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Run](images/ui/ado1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Choose the "Next" button to begin the installation process.

    <div class="figure-float">

    <div id="ado3" class="figure">

    **Figure 7.2. Installation: Next**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installation: Next](images/ui/ado3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Check the "I agree with license agreement" checkbox and choose the
    "Next" button.

    <div class="figure-float">

    <div id="ado4" class="figure">

    **Figure 7.3. Installation: Agree license**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installation: Agree license](images/ui/ado4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Choose the "Custom" option to manually select what components are
    installed and in which location, or choose the "Typical" or
    "Complete" options as recommended and skip to step 7.

    <div class="figure-float">

    <div id="ado5" class="figure">

    **Figure 7.4. Custom Install**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Custom Install](images/ui/ado5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  If the "Custom" option what chosen, select the installation
    directory or leave default and choose the "Next" button to continue.

    <div class="figure-float">

    <div id="ado6" class="figure">

    **Figure 7.5. Installation**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installation](images/ui/ado6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select which of the ADO.NET Providers are to be installed and choose
    "Next" to continue.

    <div class="figure-float">

    <div id="ado7" class="figure">

    **Figure 7.6. ADO.NET Providers**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ADO.NET Providers](images/ui/ado7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  The installer is now ready to begin the installation, choose the
    "Install" button to commence the process.

    <div class="figure-float">

    <div id="ado8" class="figure">

    **Figure 7.7. Install**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Install](images/ui/ado8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  The installation was successfully completed.

    <div class="figure-float">

    <div id="ado10" class="figure">

    **Figure 7.8. Completed installation**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completed installation](images/ui/ado10.png)

    </div>

    </div>

    </div>

      

    </div>

10. The installation of the Provider can be verified by checking the
    %WINDOWS%\assembly folder and checking that the Provider(s) chosen
    for installation is(are) listed - "virtado3" and/or "virtado2".

    <div class="figure-float">

    <div id="adon8_blank" class="figure">

    **Figure 7.9. Provider**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Provider](images/ui/adon8.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The installation of the ADO.Net Provider Client is complete.

<div id="virtclientrefinstallandconfigonwinuninst" class="section">

<div class="titlepage">

<div>

<div>

##### Uninstallation

</div>

</div>

</div>

<div class="orderedlist">

1.  If you attempt to run the installer again, the following message
    will be displayed.

    <div class="figure-float">

    <div id="adon9" class="figure">

    **Figure 7.10. Installer message**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installer message](images/ui/adon9.png)

    </div>

    </div>

    </div>

      

    </div>

2.  The Provider can be uninstalled from the "Control Panel" -\>
    "Programs and Features" menu, by selecting the "Virtuoso Client
    Connectivity kit" from the list of installed components and clicking
    the "unistall" option presented.

    <div class="figure-float">

    <div id="ado11" class="figure">

    **Figure 7.11. Uninstall**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Uninstall](images/ui/ado11.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Choose "Yes" to uninstall the Virtuoso ADO.Net Provider.

    <div class="figure-float">

    <div id="ado12" class="figure">

    **Figure 7.12. Uninstall**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Uninstall](images/ui/ado12.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

<div id="virtclientrefinstallandconfigvirt" class="section">

<div class="titlepage">

<div>

<div>

#### Installation of the ADO.Net Provider Client and Virtuoso Universal Server on Windows

</div>

</div>

</div>

If both the ADO.Net Provider client and Virtuoso Server are to be
installed on the same Windows machine, then the Virtuoso Universal
Server installer can be used as it includes all the Virtuoso client and
server components available in a single installer. An instance in which
this particular installation type is require would be when using the
Provider to provide Entity Framework connectivity to the remote database
schema objects.

<div class="orderedlist">

1.  Download and run the Virtuoso Universal Server installer for your
    target Windows OS:

    <div class="itemizedlist">

    - <a
      href="http://download.openlinksw.com/download/login.vsp?pfam=2&amp;pform=26&amp;pcat=47&amp;prod=virtuoso-uim-unisvr-psnl&amp;os=i686-generic-win-32&amp;os2=i686-generic-win-32&amp;xpfam=virtuoso&amp;xpform=personal&amp;xpcat=unisvr&amp;xos=i686-generic-win-32&amp;xprod=virtuoso-uim-unisvr-psnl&amp;release-dbms=5.0-virt50&amp;proceed=Next+%3E"
      class="ulink" target="_top">Windows 98/NT/2000/XP/2003/Vista/2008 (32
      Bit) (x86)</a>

    - <a
      href="http://download.openlinksw.com/download/login.vsp?pfam=2&amp;pform=26&amp;pcat=47&amp;prod=virtuoso-uim-unisvr-psnl&amp;os=x86_64-generic-win-64&amp;os2=x86_64-generic-win-64&amp;xpfam=virtuoso&amp;xpform=personal&amp;xpcat=unisvr&amp;xos=x86_64-generic-win-64&amp;xprod=virtuoso-uim-unisvr-psnl&amp;release-dbms=5.0-virt50&amp;proceed=Next+%3E"
      class="ulink" target="_top">Windows XP/2003/Vista/2008 (64 Bit)
      (x86_64)</a>

    </div>

2.  Choose the "run" button to allow the signed "Virtuoso Universal
    Server" installer to start.

    <div class="figure-float">

    <div id="adow1" class="figure">

    **Figure 7.13. Run**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Run](images/ui/adow1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Choose the "Next" button to begin the installation process.

    <div class="figure-float">

    <div id="adow3" class="figure">

    **Figure 7.14. Next**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Next](images/ui/adow3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Check the "I agree with license agreement" checkbox and choose the
    "Next" button.

    <div class="figure-float">

    <div id="adow4" class="figure">

    **Figure 7.15. Agree license**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Agree license](images/ui/adow4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Choose the "Custom" option to manually select what components are
    installed and in which location, or choose the "Typical" or
    "Complete" options as recommended and skip to step 7.

    <div class="figure-float">

    <div id="adow5" class="figure">

    **Figure 7.16. Custom option**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Custom option](images/ui/adow5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  If the "Custom" option what chosen, select the installation
    directory or leave default and choose the "Next" button to continue.

    <div class="figure-float">

    <div id="adow6" class="figure">

    **Figure 7.17. Installation directory**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installation directory](images/ui/adow6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select which of the ADO.NET Providers are to be installed and choose
    "Next" to continue.

    <div class="figure-float">

    <div id="adow8" class="figure">

    **Figure 7.18. ADO.NET Providers**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ADO.NET Providers](images/ui/adow8.png)

    </div>

    </div>

    </div>

      

    </div>

8.  The installer is now ready to begin the installation, choose the
    "Install" button to commence the process.

    <div class="figure-float">

    <div id="adow9" class="figure">

    **Figure 7.19. Begin installation**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Begin installation](images/ui/adow9.png)

    </div>

    </div>

    </div>

      

    </div>

9.  The installation was successfully completed.

    <div class="figure-float">

    <div id="adow11" class="figure">

    **Figure 7.20. Installation completed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installation completed](images/ui/adow11.png)

    </div>

    </div>

    </div>

      

    </div>

10. Post installation the Virtuoso Server can be started by running the
    "Virtuoso Service Manager" which gets added to the Windows "Icons
    Tray" in the status bar.

    <div class="figure-float">

    <div id="adow12" class="figure">

    **Figure 7.21. Post installation**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Post installation](images/ui/adow12.png)

    </div>

    </div>

    </div>

      

    </div>

11. Double click on the "Virtuoso Service Manager" icon in the "Icons
    Tray" to load the application, select the "OpenLink Virtuoso Server"
    instance and press the "Start" button to run the Service.

    <div class="figure-float">

    <div id="adow13" class="figure">

    **Figure 7.22. Virtuoso Service Manager**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso Service Manager](images/ui/adow13.png)

    </div>

    </div>

    </div>

      

    </div>

12. Once the Virtuoso service has successfully started, it is
    \*recommended\* that the default "dba" and "dav" passwords be
    changed to secure values by loading the URL
    "http://example.com/install" in a Web Browser which loads the
    following page for making these changes.

    <div class="figure-float">

    <div id="adow15" class="figure">

    **Figure 7.23. Defaults**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Defaults](images/ui/adow15.png)

    </div>

    </div>

    </div>

      

    </div>

13. The Virtuoso Server is now available for use.

    <div class="figure-float">

    <div id="adow16" class="figure">

    **Figure 7.24. Virtuoso Server**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso Server](images/ui/adow16.png)

    </div>

    </div>

    </div>

      

    </div>

14. The installation of the ADO.Net Provider can be verified by checking
    the %WINDOWS%\assembly folder and checking that the Provider(s)
    chosen for installation is(are) listed - "virtado3" and/or
    "virtado2".

    <div class="figure-float">

    <div id="adon8" class="figure">

    **Figure 7.25. Installation verification**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installation verification](images/ui/adon8.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The installation of the ADO.Net Provider Client and Virtuoso Universal
Server is complete.

<div id="virtclientrefinstallandconfigvirtuninst" class="section">

<div class="titlepage">

<div>

<div>

##### Uninstallation

</div>

</div>

</div>

<div class="orderedlist">

1.  If you attempt to run the installer again, the following message
    will be displayed.

    <div class="figure-float">

    <div id="adon9_01" class="figure">

    **Figure 7.26. Installer message**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Installer message](images/ui/adon9.png)

    </div>

    </div>

    </div>

      

    </div>

2.  The Provider can be uninstalled from the "Control Panel" -\>
    "Programs and Features" menu, by selecting the "Virtuoso Client
    Connectivity kit" from the list of installed components and clicking
    the "unistall" option presented.

    <div class="figure-float">

    <div id="ado11_01" class="figure">

    **Figure 7.27. Uninstall**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Uninstall](images/ui/ado11.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Choose "Yes" to uninstall the Virtuoso ADO.Net Provider.

    <div class="figure-float">

    <div id="ado13" class="figure">

    **Figure 7.28. Uninstall**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Uninstall](images/ui/ado13.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

<div id="virtclientrefprogrammersguide" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.3. Programmers Guide

</div>

</div>

</div>

<div id="virtclientrefprogrammersguidewalk" class="section">

<div class="titlepage">

<div>

<div>

#### Sample Walk through Applications

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="installvsgrid.html" class="link"
  title="2.6. Virtuoso ADO.Net Data Grid Form Application">Using Visual
  Studio 2008 to Build a Data Grid Form Application</a>

- <a href="installvsent.html" class="link"
  title="2.7. Using Visual Studio 2008 to Build an Entity Frameworks based Windows Form Application">Using
  Visual Studio 2008 to Build an Entity Frameworks based Windows Form
  Application</a>

- <a href="installusado.html" class="link"
  title="2.8. Using Visual Studio 2008 to Build an ADO.NET Data Services based Application">Using
  Visual Studio 2008 to Build an ADO.NET Data Services based
  Application</a>

- <a href="installwfas.html" class="link"
  title="2.9. Windows Form Application for accessing Virtuoso RDF data via SPASQL using the Virtuoso ADO.Net Provider">Windows
  Form Application for accessing Virtuoso RDF data via SPASQL using the
  Virtuoso ADO.Net Provider</a>

- <a href="installcrweb.html" class="link"
  title="2.10. Creating a Web Browser Application to Access RDF Data Using The Virtuoso ADO.Net Provider">Web
  Data Service Application for accessing Virtuoso RDF data via SPASQL
  using the Virtuoso ADO.Net Provider</a>

- <a href="installsilver.html" class="link"
  title="2.11. Creating a Silverlight Application to consume the service">Creating
  a Silverlight Application to consume the service</a>

- <a href="installnetriadd.html" class="link"
  title="2.12. Creating A Simple .NET RIA Services Application To Display Data From Virtuoso">Creating
  A Simple .NET RIA Services Application to Display Data from Virtuoso</a>

- <a href="installnetriavd.html" class="link"
  title="2.13. Creating a .Net RIA Services Application That Will Update Virtuoso Data">Creating
  a .Net RIA Services Application that will Update Virtuoso Data</a>

</div>

</div>

<div id="virtclientrefprogrammersguideentfr" class="section">

<div class="titlepage">

<div>

<div>

#### Using Entity Frameworks, ADO.NET, the Virtuoso Virtual Database Engine

</div>

</div>

</div>

Virtuoso's in-built virtual database engine for ODBC and JDBC accessible
databases enables it to act as bridge between Entity Frameworks &
ADO.NET based client applications. Thus, you simply link external
databases into Virtuoso using the browser based Conductor UI or
programmatically using SQL extensions. Once the external tables a
linked/attached, they inherit the functionality prowess of Virtuoso, and
this particular use case scenario, complete compatibility with Entity
Frameworks and ADO.NET 3.5.

<div class="itemizedlist">

- <a href="vdbenginemc.html" class="link"
  title="8.2. Using Microsoft Entity Frameworks to Access Oracle Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Oracle Schema Objects with
  Virtuoso</a>

- <a href="vdbenginepr.html" class="link"
  title="8.3. Using Microsoft Entity Frameworks to Access Progress Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Progress Schema Objects with
  Virtuoso</a>

- <a href="vdbengineing.html" class="link"
  title="8.4. Using Microsoft Entity Frameworks to Access Ingres Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Ingres Schema Objects with
  Virtuoso</a>

- <a href="vdbengineinf.html" class="link"
  title="8.5. Using Microsoft Entity Frameworks to Access Informix Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Informix Schema Objects with
  Virtuoso</a>

- <a href="vdbenginedb2.html" class="link"
  title="8.6. Using Microsoft Entity Frameworks to Access DB2 Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access DB2 Schema Objects with
  Virtuoso</a>

- <a href="vdbenginesyb.html" class="link"
  title="8.7. Using Microsoft Entity Frameworks to Access Sybase Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Sybase Schema Objects with
  Virtuoso</a>

- <a href="vdbenginemsql.html" class="link"
  title="8.8. Using Microsoft Entity Frameworks to Access MySQL Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access MySQL Schema Objects with
  Virtuoso</a>

- <a href="vdbenginepsql.html" class="link"
  title="8.9. Using Microsoft Entity Frameworks to Access PostgreSQL Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access PostgreSQL Schema Objects with
  Virtuoso</a>

- <a href="vdbengineodtjd.html" class="link"
  title="8.10. Using Microsoft Entity Frameworks to Access ODBC to JDBC Bridge Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access JDBC Schema Objects with
  Virtuoso</a>

- <a href="vdbengineodbcod.html" class="link"
  title="8.11. Using Microsoft Entity Frameworks to Access ODBC to ODBC Bridge Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access ODBC Schema Objects with
  Virtuoso</a>

- <a href="vdbenginefirebd.html" class="link"
  title="8.12. Using Microsoft Entity Frameworks to Access Firebird Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Firebird Schema Objects with
  Virtuoso</a>

- <a href="vdbenginemsqls.html" class="link"
  title="8.13. Using Microsoft Entity Frameworks to Access Microsoft SQL Server Schema Objects with Virtuoso">Using
  Microsoft Entity Frameworks to Access Microsoft SQL Server Schema
  Objects with Virtuoso</a>

</div>

</div>

<div id="vcrvirtdbtype" class="section">

<div class="titlepage">

<div>

<div>

#### VirtDbType Enumeration

</div>

</div>

</div>

Specifies Virtuoso data types.

<div id="id1322" class="section">

<div class="titlepage">

<div>

<div>

##### Members

</div>

</div>

</div>

<div id="id16748" class="table">

**Table 7.1. **

<div class="table-contents">

| Member name    | Description                                                                                                |
|----------------|------------------------------------------------------------------------------------------------------------|
| `Binary`       | BINARY data. This maps to an <span class="type">Array</span> of type <span class="type">Byte</span> .      |
| `Char`         | CHAR data. This maps to <span class="type">String</span> .                                                 |
| `Date`         | DATE data. This maps to <span class="type">DateTime</span> .                                               |
| `DateTime`     | DATETIME data. This maps to <span class="type">DateTime</span> .                                           |
| `Decimal`      | This is equal to `Numeric` .                                                                               |
| `Double`       | DOUBLE PRECISION data. This maps to <span class="type">Double</span> .                                     |
| `Float`        | This is equal to Double.                                                                                   |
| `Integer`      | INTEGER data. This maps to <span class="type">Int32</span>                                                 |
| `LongBinary`   | LONG BINARY data. This maps to an <span class="type">Array</span> of type <span class="type">Byte</span> . |
| `LongNVarChar` | LONG NVARCHAR data. This maps to <span class="type">String</span> .                                        |
| `LongVarChar`  | LONG VARCHAR data. This maps to <span class="type">String</span> .                                         |
| `NChar`        | NChar data. This maps to <span class="type">String</span> .                                                |
| `Numeric`      | NUMERIC data. This maps to <span class="type">Decimal</span>                                               |
| `NVarChar`     | NVARCHAR data. This maps to <span class="type">String</span> .                                             |
| `Real`         | REAL data, This maps to <span class="type">Single</span> .                                                 |
| `SmallInt`     | SMALLINT data. This maps to <span class="type">Int16</span>                                                |
| `Time`         | TIME data. This maps to <span class="type">TimeSpan</span>                                                 |
| `TimeStamp`    | TIMESTAMP data. This maps to an <span class="type">Array</span> of type <span class="type">Byte</span> .   |
| `VarBinary`    | VARBINARY data. This maps to an <span class="type">Array</span> of type <span class="type">Byte</span> .   |
| `VarChar`      | VARCHAR data. This maps to <span class="type">String</span> .                                              |

</div>

</div>

  

</div>

</div>

<div id="vcrvirtuosocommandclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoCommand Class

</div>

</div>

</div>

Represents an SQL statement or stored procedure to execute against a
Virtuoso database. This class cannot be inherited.

<div class="figure-float">

<div id="virtprovider001" class="figure">

**Figure 7.29. Virtuoso .Net Provider VirtuosoCommand Class**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso .Net Provider VirtuosoCommand
Class](images/VirtProviderClassHier.jpg)

</div>

</div>

</div>

  

</div>

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoCommand
             extends, 
              Component
            
    implements, 
              ICloneable
            , 
              IDbCommand
             {
}
```

<div id="id1323" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1324" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The VirtuosoCommand class provides the following methods for executing
commands against a Virtuoso database:

<div id="id16883" class="table">

**Table 7.2. **

<div class="table-contents">

| Item            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| ExecuteReader   | Executes commands that return rows.                                         |
| ExecuteNonQuery | Executes commands such as SQL INSERT, DELETE, UPDATE, and SET statements.   |
| ExecuteScalar   | Retrieves a single value (for example, an aggregate value) from a database. |

</div>

</div>

  

</div>

<div id="id1337" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoCommand Constructor

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommand class.

<div id="id1326" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoCommand Constructor ()

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommand class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoCommand`</span>`();`

<div id="id1325" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The base constructor initializes all fields to their default values. The
following table shows initial property values for an instance of
VirtuosoCommand.

<div id="id16910" class="table">

**Table 7.3. **

<div class="table-contents">

| Properties     | Initial Value     |
|----------------|-------------------|
| CommandText    | empty string ("") |
| CommandTimeout | 30                |
| CommandType    | CommandType.Text  |
| Connection     | null              |

</div>

</div>

  

You can change the value for any of these properties through a separate
call to the property.

</div>

</div>

<div id="id1328" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoCommand Constructor (string)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommand class with the text of
the query.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoCommand`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`cmdText`</span>` `</span>`);`

<div id="id1327" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">cmdText</span>  
The text of the query.

</div>

</div>

</div>

<div id="id1330" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoCommand Constructor (string, VirtuosoConnection)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommand class with the text of
the query and an VirtuosoConnection object.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoCommand`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`cmdText`</span>` `</span>`,`  
`                       `<span class="methodparam">` `<span class="type">`VirtuosoConnection `</span>` `<span class="parameter">`connection`</span>` `</span>`);`

<div id="id1329" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">cmdText</span>  
The text of the query.

<span class="term">connection</span>  
A VirtuosoConnection object that represents the connection to a Virtuoso
database.

</div>

</div>

</div>

<div id="id1334" class="section">

<div class="titlepage">

<div>

<div>

###### ConnectionString Property

</div>

</div>

</div>

The Virtuoso ADO.NET Provider ConnectionString property implements the
IDbConnection.ConnectionString property to get or set the string used to
open a Virtuoso database connection, and includes the source database
name and other parameters needed to establish the initial connection.
The default value is an empty string.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`ConnectionString `</span>` ;`

<div id="id1331" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

Includes the source database name and other parameters needed to
establish the initial connection. The default value is an empty string.

ConnectionString has the following syntax: Each connection string is a
sequence of settings Individual settings are separated by semicolons.
Each setting is a pair of name and value delimited by the equal sign.
Whitespace is ignored on either side of both names and values. Names are
case insensitive. The value part can be quoted by either single or
double quote characters or remain unquoted at all. However if it
includes a semicolon, single quote, or double quote characters, it must
be enclosed in either type of quotes. To embed the same character that
is used for enclosing the value the character within the value must be
doubled.

The following table lists the valid names for values within the
ConnectionString:

<div id="id16976" class="table">

**Table 7.4. **

<div class="table-contents">

| Name                                                        | Default | Description                                                                                                                                                                                                                                                                                                                               |
|-------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Connect Timeout or Connection Timeout                       | 15      | The number of seconds to wait for a connection to the server before terminating the attempt and generating an error.                                                                                                                                                                                                                      |
| Connection Lifetime                                         | 0       | When a connection is returned to the pool, its creation time is compared with the current time, and the connection is destroyed if that time span (in seconds) exceeds the value specified by connection lifetime. Useful in clustered configurations to force load balancing between a running server and a server just brought on-line. |
| Charset                                                     | utf-16  | Specifies the character set to be used by the provider when passing string values to and from the database. Must be set to utf-8 to handle Unicode strings passed in SPARQL/SPASQL queries of RDF data.                                                                                                                                   |
| Data Source or Server or Address or Network Address or Host |         | The name or network address of the instance of Virtuoso server to which to connect. Can take comma delimited list of instances for connection fail over.                                                                                                                                                                                  |
| Encrypt                                                     | false   | Specifies if the connection must be SSL encrypted. Currently encryption only works with an ODBC-based provider.                                                                                                                                                                                                                           |
| Enlist                                                      | true    | When true, the pooler automatically enlists the connection in the creation thread's current transaction context.                                                                                                                                                                                                                          |
| Initial Catalog or Database                                 |         | The name of the database.                                                                                                                                                                                                                                                                                                                 |
| Max Pool Size                                               | 100     | The maximum number of connections allowed in the pool.                                                                                                                                                                                                                                                                                    |
| Min Pool Size                                               | 0       | The minimum number of connections allowed in the pool.                                                                                                                                                                                                                                                                                    |
| Password or Pwd                                             |         | The password for the Virtuoso account logging on.                                                                                                                                                                                                                                                                                         |
| Persist Security Info                                       | false   | When set to 'false', security-sensitive information, such as the password, is not returned as part of the connection if the connection is open or has ever been in an open State. Resetting the connection string resets all connection string values including the password.                                                             |
| Pooling                                                     | true    | When true, the VirtuosoConnection object is drawn from the appropriate pool, or if necessary, is created and added to the appropriate pool.                                                                                                                                                                                               |
| RoundRobin                                                  | false   | Enables load balancing in which case the server for the connection is chosen at random from the comma delimited provided as for a Failover connection.                                                                                                                                                                                    |
| User ID or Uid                                              |         | The Virtuoso login name.                                                                                                                                                                                                                                                                                                                  |

</div>

</div>

  

</div>

<div id="id1332" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.ConnectionString

</div>

<div id="id1333" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The <span class="emphasis">*ConnectionString*</span> is similar to an
OLE DB connection string, but is not identical. Unlike OLE DB or ADO,
the connection string that is returned is the same as the user set
<span class="emphasis">*ConnectionString*</span> minus security
information if the <span class="emphasis">*Persist Security Info*</span>
value is set to <span class="emphasis">*false*</span> (default). The
Virtuoso ADO.NET Data Provider neither persists nor returns the password
in a connection string unless you set <span class="emphasis">*Persist
Security Info*</span> to true.

The <span class="emphasis">*ConnectionString*</span> property can be set
only when the connection is closed. Many of the connection string values
have corresponding read-only properties. When the connection string is
set, all of these properties are updated, except when an error is
detected; in this case, none of the properties are updated.
<span class="emphasis">*VirtuosoConnection*</span> properties return
only those settings contained in the
<span class="emphasis">*ConnectionString*</span> .

Resetting the <span class="emphasis">*ConnectionString*</span> on a
closed connection resets all connection string values (and related
properties) including the password. For example, if you set a connection
string that includes "<span class="emphasis">*Database=Demo*</span> ",
and then reset the connection string to "<span class="emphasis">*Data
Source=myserver;User ID=dba;Password=dba*</span> ", the Database
property is no longer set to <span class="emphasis">*Demo*</span> .

The connection string is parsed immediately after being set. If errors
in syntax are found when parsing, a runtime exception (e.g.,
<span class="emphasis">*ArgumentException*</span> ) is generated. Other
errors can be found only when an attempt is made to open the connection.

</div>

</div>

<div id="id1336" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoCommand Constructor (string, VirtuosoConnection, VirtuosoTransaction)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommand class with the text of
the query, an VirtuosoConnection object, and the VirtuosoTransaction.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoCommand`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`cmdText`</span>` `</span>`,`  
`                       `<span class="methodparam">` `<span class="type">`VirtuosoConnection `</span>` `<span class="parameter">`connection`</span>` `</span>`,`  
`                       `<span class="methodparam">` `<span class="type">`VirtuosoTransaction `</span>` `<span class="parameter">`transaction`</span>` `</span>`);`

<div id="id1335" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">cmdText</span>  
The text of the query.

<span class="term">connection</span>  
A VirtuosoConnection object that represents the connection to a Virtuoso
database.

<span class="term">transaction</span>  
The VirtuosoTransaction in which the VirtuosoCommand executes.

</div>

</div>

</div>

</div>

<div id="id1361" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1341" class="section">

<div class="titlepage">

<div>

<div>

###### CommandText Property

</div>

</div>

</div>

Gets or sets the SQL statement or stored procedure to execute against
the Virtuoso database.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`CommandText `</span>` ;`

<div id="id1338" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The SQL statement or stored procedure to execute. The default value is
an empty string ("").

</div>

<div id="id1339" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.CommandText

</div>

<div id="id1340" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When the CommandType property is set to StoredProcedure, the CommandText
property should be set using standard ODBC stored procedure escape
sequences. Setting the CommandText to the name of the stored procedure
does not function as it does for some other .NET data providers.

The Virtuoso .NET Data Provider does not support named parameters for
passing parameters to a SQL statement or a stored procedure called by an
OleDbCommand when CommandType is set to Text. In this case, the question
mark (?) placeholder must be used. For example:

<div class="informalexample">

``` programlisting
SELECT * FROM Customers WHERE CustomerID = ?
```

</div>

As a result, the order in which VirtuosoParameter objects are added to
the VirtuosoParameterCollection must directly correspond to the position
of the question mark placeholder for the parameter.

</div>

</div>

<div id="id1345" class="section">

<div class="titlepage">

<div>

<div>

###### CommandTimeout Property

</div>

</div>

</div>

Gets or sets the wait time before terminating an attempt to execute a
command and generating an error.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`CommandTimeout `</span>` ;`

<div id="id1342" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The time (in seconds) to wait for the command to execute. The default is
30 seconds.

</div>

<div id="id1343" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.CommandTimeout

</div>

<div id="id1344" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

A value of zero (0) specifies no limit to the wait time, rather than no
wait time, and therefore should be avoided.

</div>

</div>

<div id="id1349" class="section">

<div class="titlepage">

<div>

<div>

###### CommandType Property

</div>

</div>

</div>

Gets or sets a value indicating how the CommandText property is
interpreted.

` `<span class="modifier">`public `</span>` `<span class="type">`CommandType `</span>` `<span class="varname">`CommandType `</span>` ;`

<div id="id1346" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

One of the System.Data.CommandType values. The default is Text.

</div>

<div id="id1347" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.CommandType

</div>

<div id="id1348" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When the CommandType property is set to StoredProcedure, you should set
the CommandText property to the full ODBC call syntax. The command then
executes this stored procedure when you call one of the Execute methods
(for example, ExecuteReader or ExecuteNonQuery).

The Connection, CommandType and CommandText properties cannot be set if
the current connection is performing an execute or fetch operation.

The Virtuoso .NET Data Provider does not support passing named
parameters to an SQL statement or to a stored procedure called by a
VirtuosoCommand. In either of these cases, use the question mark (?)
placeholder. For example:

<div class="informalexample">

``` programlisting
SELECT * FROM Customers WHERE CustomerID = ?
```

</div>

The order in which VirtuosoParameter objects are added to the
VirtuosoParameterCollection must directly correspond to the position of
the question mark placeholder for the parameter.

</div>

</div>

<div id="id1351" class="section">

<div class="titlepage">

<div>

<div>

###### Connection Property

</div>

</div>

</div>

Gets or sets the VirtuosoConnection used by this instance of the
VirtuosoCommand.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoConnection `</span>` `<span class="varname">`Connection `</span>` ;`

<div id="id1350" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The connection to a Virtuoso database. The default is a null value.

</div>

</div>

<div id="id1354" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters Property

</div>

</div>

</div>

Gets the VirtuosoParameterCollection.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoParameterCollection `</span>` `<span class="varname">`Connection `</span>` ;`

<div id="id1352" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The parameters of the SQL statement or stored procedure. The default is
an empty collection.

</div>

<div id="id1353" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When CommandType is set to Text, the Virtuoso .NET Data Provider does
not support passing named parameters to an SQL statement or to a stored
procedure called by an VirtuosoCommand. In either of these cases, use
the question mark (?) placeholder. For example:

<div class="informalexample">

``` programlisting
SELECT * FROM Customers WHERE CustomerID = ?
```

</div>

The order in which VirtuosoParameter objects are added to the
VirtuosoParameterCollection must directly correspond to the position of
the question mark placeholder for the parameter in the command text.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                     |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                               |
|                              | If the parameters in the collection do not match the requirements of the query to be executed, an error may result. |

</div>

</div>

</div>

<div id="id1357" class="section">

<div class="titlepage">

<div>

<div>

###### Transaction Property

</div>

</div>

</div>

Gets or sets the VirtuosoTransaction within which the VirtuosoCommand
executes.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoTransaction `</span>` `<span class="varname">`Transaction `</span>` ;`

<div id="id1355" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoTransaction. The default is a null value.

</div>

<div id="id1356" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You cannot set the Transaction property if it is already set to a
specific value, and the command is in the process of executing. If you
set the transaction property to an VirtuosoTransaction object that is
not connected to the same VirtuosoConnection as the VirtuosoCommand
object, an exception will be thrown the next time you attempt to execute
a statement.

</div>

</div>

<div id="id1360" class="section">

<div class="titlepage">

<div>

<div>

###### UpdatedRowSource Property

</div>

</div>

</div>

Gets or sets how command results are applied to the DataRow when used by
the Update method of the DbDataAdapter.

` `<span class="modifier">`public `</span>` `<span class="type">`UpdateRowSource `</span>` `<span class="varname">`UpdatedRowSource `</span>` ;`

<div id="id1358" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

One of the System.Data.UpdateRowSource values.

</div>

<div id="id1359" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.UpdatedRowSource

</div>

</div>

</div>

<div id="id1389" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1362" class="section">

<div class="titlepage">

<div>

<div>

###### Cancel Method

</div>

</div>

</div>

Attempts to cancel the execution of an VirtuosoCommand.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Cancel`</span>`();`

</div>

<div id="id1363" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.Cancel

</div>

<div id="id1364" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

If there is nothing to cancel, nothing happens. However, if there is a
command in process, and the attempt to cancel fails, no exception is
generated.

</div>

<div id="id1367" class="section">

<div class="titlepage">

<div>

<div>

###### CreateParameter Method

</div>

</div>

</div>

Creates a new instance of a VirtuosoParameter object.

<span class="modifier">`public `</span><span class="type">`VirtuosoParameter `</span><span class="methodname">`CreateParameter`</span>`();`

<div id="id1365" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A VirtuosoParameter object.

</div>

<div id="id1366" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The CreateParameter method is a strongly-typed version of
IDbCommand.CreateParameter.

</div>

</div>

<div id="id1371" class="section">

<div class="titlepage">

<div>

<div>

###### ExecuteNonQuery Method

</div>

</div>

</div>

Executes an SQL statement against the Connection and returns the number
of rows affected.

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`ExecuteNonQuery`</span>`();`

<div id="id1368" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

For UPDATE, INSERT, and DELETE statements, the return value is the
number of rows affected by the command. For all other types of
statements, the return value is -1.

</div>

<div id="id1369" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.ExecuteNonQuery

</div>

<div id="id1370" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You can use ExecuteNonQuery to perform catalog operations (for example,
querying the structure of a database or creating database objects such
as tables); or to change the data in a database, without using a
DataSet, by executing UPDATE, INSERT, or DELETE statements.

Although ExecuteNonQuery does not return any rows, any output parameters
or return values mapped to parameters are populated with data.

</div>

</div>

<div id="id1377" class="section">

<div class="titlepage">

<div>

<div>

###### ExecuteReader Method

</div>

</div>

</div>

Sends the CommandText to the Connection and builds a VirtuosoDataReader.

<div id="id1373" class="section">

<div class="titlepage">

<div>

<div>

###### ExecuteReader Method ()

</div>

</div>

</div>

Sends the CommandText to the Connection and builds a VirtuosoDataReader.

<span class="modifier">`public `</span><span class="type">`VirtuosoDataReader `</span><span class="methodname">`ExecuteReader`</span>`();`

<div id="id1372" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A VirtuosoDataReader object.

</div>

</div>

<div id="id1376" class="section">

<div class="titlepage">

<div>

<div>

###### ExecuteReader Method (CommandBehavior)

</div>

</div>

</div>

Sends the CommandText to the Connection and builds a VirtuosoDataReader
using one of the CommandBehavior values.

<span class="modifier">`public `</span><span class="type">`VirtuosoDataReader `</span><span class="methodname">`ExecuteReader`</span>`(`<span class="methodparam">` `<span class="type">`CommandBehavior `</span>` `<span class="parameter">`behavior`</span>` `</span>`);`

<div id="id1374" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">behavior</span>  
One of the System.Data.CommandBehavior values.

</div>

</div>

<div id="id1375" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A VirtuosoDataReader object.

</div>

</div>

</div>

<div id="id1381" class="section">

<div class="titlepage">

<div>

<div>

###### ExecuteScalar Method

</div>

</div>

</div>

Executes the query, and returns the first column of the first row in the
resultset returned by the query. Extra columns or rows are ignored.

<span class="modifier">`public `</span><span class="type">`object `</span><span class="methodname">`ExecuteScalar`</span>`();`

<div id="id1378" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The first column of the first row in the resultset.

</div>

<div id="id1379" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.ExecuteScalar

</div>

<div id="id1380" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Use the ExecuteScalar method to retrieve a single value (for example, an
aggregate value) from a database. This requires less code than using the
ExecuteReader method, and then performing the operations necessary to
generate the single value using the data returned by a
VirtuosoDataReader.

A typical ExecuteScalar query can be formatted as in the following C#
example:

<div class="informalexample">

``` programlisting
command.CommandText = "select count(*) from foobar";
int count = (int) command.ExecuteScalar();
```

</div>

</div>

</div>

<div id="id1382" class="section">

<div class="titlepage">

<div>

<div>

###### ICloneable.Clone Method

</div>

</div>

</div>

This member supports the .NET Framework infrastructure and is not
intended to be used directly from your code.

<span class="type">`object `</span><span class="methodname">`ICloneable.Clone`</span>`();`

</div>

<div id="id1383" class="section">

<div class="titlepage">

<div>

<div>

###### IDbCommand.CreateParameter Method

</div>

</div>

</div>

This member supports the .NET Framework infrastructure and is not
intended to be used directly from your code.

<span class="type">`IDbDataParameter `</span><span class="methodname">`IDbCommand.CreateParameter`</span>`();`

</div>

<div id="id1386" class="section">

<div class="titlepage">

<div>

<div>

###### IDbCommand.ExecuteReader Method

</div>

</div>

</div>

This member supports the .NET Framework infrastructure and is not
intended to be used directly from your code.

<div id="id1384" class="section">

<div class="titlepage">

<div>

<div>

###### IDbCommand.ExecuteReader Method ()

</div>

</div>

</div>

This member supports the .NET Framework infrastructure and is not
intended to be used directly from your code.

<span class="type">`IDataReader `</span><span class="methodname">`IDbCommand.ExecuteReader`</span>`();`

</div>

<div id="id1385" class="section">

<div class="titlepage">

<div>

<div>

###### IDbCommand.ExecuteReader Method (CommandBehavior)

</div>

</div>

</div>

This member supports the .NET Framework infrastructure and is not
intended to be used directly from your code.

<span class="type">`IDataReader `</span><span class="methodname">`IDbCommand.ExecuteReader`</span>`(`<span class="methodparam">` `<span class="type">`CommandBehavior `</span>` `<span class="parameter">`behavior`</span>` `</span>`);`

</div>

</div>

<div id="id1388" class="section">

<div class="titlepage">

<div>

<div>

###### Prepare Method

</div>

</div>

</div>

Creates a prepared (or compiled) version of the command at the Virtuoso
server.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Prepare`</span>`();`

<div id="id1387" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbCommand.Prepare

</div>

</div>

</div>

</div>

<div id="vcrvirtcmdbuildr" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoCommandBuilder Class

</div>

</div>

</div>

Provides a means of automatically generating single-table commands used
to reconcile changes made to a DataSet with the associated Virtuoso
database. This class cannot be inherited.

|                                 |
|---------------------------------|
| System.Object                   |
| System.MarshalByRefObject       |
| System.ComponentModel.Component |
| VirtuosoCommandBuilder          |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoCommandBuilder
             extends, 
              Component
             {
}
```

<div id="id1390" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1391" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The VirtuosoDataAdapter does not automatically generate the SQL
statements required to reconcile changes made to a DataSet associated
with the data source. However, you can create a VirtuosoCommandBuilder
object that generates SQL statements for single-table updates if you set
the SelectCommand property of the VirtuosoDataAdapter. Then, the
VirtuosoCommandBuilder generates any additional SQL statements that you
do not set.

The relationship between a VirtuosoDataAdapter and its corresponding
VirtuosoCommandBuilder is always one-to-one. To create this
correspondence, you set the DataAdapter property of the
VirtuosoCommandBuilder object. This causes the VirtuosoCommandBuilder to
register itself as a listener for RowUpdating events on the specified
VirtuosoDataAdapter object.

To generate INSERT, UPDATE, or DELETE statements, the
VirtuosoCommandBuilder uses the SelectCommand property to retrieve a
required set of metadata. If you change the value of SelectCommand after
the metadata has been retrieved (for example, after the first update),
you then should call the RefreshSchema method to update the metadata.

The VirtuosoCommandBuilder also uses the Connection, CommandTimeout, and
Transaction properties referenced by the SelectCommand. The user should
call RefreshSchema if any of these properties are modified, or if the
value of the SelectCommand property itself is changed. Otherwise the
InsertCommand, UpdateCommand, and DeleteCommand properties retain their
previous values.

If you call Dispose, the VirtuosoCommandBuilder is disassociated from
the VirtuosoDataAdapter, and the generated commands are no longer used.

</div>

<div id="id1396" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoCommandBuilder Constructor

</div>

</div>

</div>

<div id="id1392" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoCommandBuilder Constructor ()

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommandBuilder class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoCommandBuilder`</span>`();`

</div>

<div id="id1395" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoCommandBuilder Constructor (VirtuosoDataAdapter)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoCommandBuilder class with the
associated VirtuosoDataAdapter object.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoCommandBuilder`</span>`(`<span class="methodparam">` `<span class="type">`VirtuosoDataAdapter `</span>` `<span class="parameter">`adapter`</span>` `</span>`);`

<div id="id1393" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">adapter</span>  
A VirtuosoDataAdapter object to associate with this
VirtuosoCommandBuilder.

</div>

</div>

<div id="id1394" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The VirtuosoCommandBuilder registers itself as a listener for
RowUpdating events that are generated by the VirtuosoDataAdapter
specified in this property.

</div>

</div>

</div>

<div id="id1406" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1399" class="section">

<div class="titlepage">

<div>

<div>

###### DataAdapter Property

</div>

</div>

</div>

Gets or sets a VirtuosoDataAdapter object for which SQL statements are
automatically generated.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoDataAdapter `</span>` `<span class="varname">`DataAdapter `</span>` ;`

<div id="id1397" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoDataAdapter object.

</div>

<div id="id1398" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The VirtuosoCommandBuilder registers itself as a listener for
RowUpdating events that are generated by the VirtuosoDataAdapter
specified in this property.

</div>

</div>

<div id="id1402" class="section">

<div class="titlepage">

<div>

<div>

###### QuotePrefix Property

</div>

</div>

</div>

Gets or sets the beginning character or characters to use when working
with database objects (for example, tables or columns) whose names
contain characters such as spaces.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`QuotePrefix `</span>` ;`

<div id="id1400" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The beginning character or characters to use. The default is an empty
string.

</div>

<div id="id1401" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Database objects in Virtuoso servers can contain any valid characters,
including spaces, commas, and semicolons. To accommodate this
capability, use the QuotePrefix and QuoteSuffix properties to specify
delimiters such as a left bracket and a right bracket to encapsulate the
object name.

</div>

</div>

<div id="id1405" class="section">

<div class="titlepage">

<div>

<div>

###### QuoteSuffix Property

</div>

</div>

</div>

Gets or sets the ending character or characters to use when working with
database objects (for example, tables or columns) whose names contain
characters such as spaces.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`QuotePrefix `</span>` ;`

<div id="id1403" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The ending character or characters to use. The default is an empty
string.

</div>

<div id="id1404" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Database objects in Virtuoso servers can contain any valid characters,
including spaces, commas, and semicolons. To accommodate this
capability, use the QuotePrefix and QuoteSuffix properties to specify
delimiters such as a left bracket and a right bracket to encapsulate the
object name.

</div>

</div>

</div>

<div id="id1424" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1409" class="section">

<div class="titlepage">

<div>

<div>

###### DeriveParameters Method

</div>

</div>

</div>

Retrieves parameter information from the stored procedure specified in
the VirtuosoCommand and populates the Parameters collection of the
specified VirtuosoCommand object.

<span class="modifier">`public `</span><span class="modifier">`static `</span><span class="void">`void `</span><span class="methodname">`DeriveParameters`</span>`(`<span class="methodparam">` `<span class="type">`VirtuosoCommand `</span>` `<span class="parameter">`command`</span>` `</span>`);`

<div id="id1407" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">command</span>  
The VirtuosoCommand referencing the stored procedure from which the
parameter information is to be derived. The derived parameters are added
to the Parameters collection of the VirtuosoCommand.

</div>

</div>

<div id="id1408" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

`DeriveParameters` overwrites any existing parameter information for the
VirtuosoCommand. `DeriveParameters` requires an extra call to the data
server to obtain the information. If the parameter information is known
in advance, it is more efficient to populate the parameters collection
by setting the information explicitly.

For more information, see "Using Stored Procedures with a Command" in
the Microsoft® .NET Framework SDK documentation.

</div>

</div>

<div id="id1412" class="section">

<div class="titlepage">

<div>

<div>

###### Dispose Method

</div>

</div>

</div>

Releases the unmanaged and, optionally, the managed resources used by
the VirtuosoCommandBuilder.

<span class="modifier">`protected `</span><span class="modifier">`override `</span><span class="void">`void `</span><span class="methodname">`Dispose`</span>`(`<span class="methodparam">` `<span class="type">`bool `</span>` `<span class="parameter">`disposing`</span>` `</span>`);`

<div id="id1410" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">disposing</span>  
`true` to release both managed and unmanaged resources; `false` to
release only unmanaged resources.

</div>

</div>

<div id="id1411" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

This method is called by the public Dispose method and the Finalize
method. Dispose() invokes the protected Dispose(Boolean) method with the
disposing parameter set to true. Finalize invokes Dispose with disposing
set to false.

When the disposing parameter is true, the method releases all resources
held by any managed objects that this VirtuosoCommand references. It
does this by invoking the Dispose() method of each referenced object.

For more information about Dispose and Finalize, see "Cleaning Up
Unmanaged Resources," and "Overriding the Finalize Method," in the .NET
Framework SDK documentation.

</div>

</div>

<div id="id1415" class="section">

<div class="titlepage">

<div>

<div>

###### GetDeleteCommand Method

</div>

</div>

</div>

Gets the automatically generated VirtuosoCommand object required to
perform deletions on the Virtuoso database.

<span class="modifier">`public `</span><span class="type">`VirtuosoCommand `</span><span class="methodname">`GetDeleteCommand`</span>`();`

<div id="id1413" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The automatically generated VirtuosoCommand object required to perform
deletions.

</div>

<div id="id1414" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You can use the GetDeleteCommand method for informational or
troubleshooting purposes because it returns the VirtuosoCommand object
to be executed.

You can also use GetDeleteCommand as the basis of a modified command.
For example, you might call GetDeleteCommand and modify the
CommandTimeout value, and then explicitly set that on the
VirtuosoDataAdapter.

After the SQL statement is first generated, you must explicitly call
RefreshSchema if you change the statement in any way. Otherwise, the
GetDeleteCommand still will be using information from the previous
statement, which might not be correct. The SQL statements are first
generated when the application calls either Update or GetDeleteCommand.

</div>

</div>

<div id="id1418" class="section">

<div class="titlepage">

<div>

<div>

###### GetInsertCommand Method

</div>

</div>

</div>

Gets the automatically generated VirtuosoCommand object required to
perform insertions on the Virtuoso database.

<span class="modifier">`public `</span><span class="type">`VirtuosoCommand `</span><span class="methodname">`GetInsertCommand`</span>`();`

<div id="id1416" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The automatically generated VirtuosoCommand object required to perform
insertions.

</div>

<div id="id1417" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You can use the GetInsertCommand method for informational or
troubleshooting purposes because it returns the VirtuosoCommand object
to be executed.

You can also use GetInsertCommand as the basis of a modified command.
For example, you might call GetInsertCommand and modify the
CommandTimeout value, and then explicitly set that on the
VirtuosoDataAdapter.

After the SQL statement is first generated, you must explicitly call
RefreshSchema if you change the statement in any way. Otherwise, the
GetInsertCommand still will be using information from the previous
statement, which might not be correct. The SQL statements are first
generated when the application calls either Update or GetInsertCommand.

</div>

</div>

<div id="id1421" class="section">

<div class="titlepage">

<div>

<div>

###### GetUpdateCommand Method

</div>

</div>

</div>

Gets the automatically generated VirtuosoCommand object required to
perform updates on the Virtuoso database.

<span class="modifier">`public `</span><span class="type">`VirtuosoCommand `</span><span class="methodname">`GetUpdateCommand`</span>`();`

<div id="id1419" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The automatically generated VirtuosoCommand object required to perform
updates.

</div>

<div id="id1420" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You can use the GetUpdateCommand method for informational or
troubleshooting purposes because it returns the VirtuosoCommand object
to be executed.

You can also use GetUpdateCommand as the basis of a modified command.
For example, you might call GetUpdateCommand and modify the
CommandTimeout value, and then explicitly set that on the
VirtuosoDataAdapter.

After the SQL statement is first generated, you must explicitly call
RefreshSchema if you change the statement in any way. Otherwise, the
GetUpdateCommand still will be using information from the previous
statement, which might not be correct. The SQL statements are first
generated when the application calls either Update or GetUpdateCommand.

</div>

</div>

<div id="id1423" class="section">

<div class="titlepage">

<div>

<div>

###### RefreshSchema Method

</div>

</div>

</div>

Refreshes the database schema information used to generate INSERT,
UPDATE, or DELETE statements.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`RefreshSchema`</span>`();`

<div id="id1422" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You should call RefreshSchema whenever the SelectCommand value of the
VirtuosoDataAdapter changes.

</div>

</div>

</div>

</div>

<div id="vcrvirtconnclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoConnection Class

</div>

</div>

</div>

Represents an open connection to a Virtuoso database. This class cannot
be inherited.

|                                 |
|---------------------------------|
| System.Object                   |
| System.MarshalByRefObject       |
| System.ComponentModel.Component |
| VirtuosoConnection              |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoConnection
             extends, 
              Component
            
    implements, 
              ICloneable
            , 
              IDbConnection
             {
}
```

<div id="id1425" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1426" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

A VirtuosoConnection object represents a unique session to a Virtuoso
database server.

The VirtuosoConnection object uses native resources such as network
connection handles. You should always explicitly close any open
VirtuosoConnection objects by calling Close or Dispose before the
VirtuosoConnection object goes out of scope. Not doing so leaves the
freeing of these native resources to garbage collection, which may not
free them immediately. This, in turn, may eventually cause the
underlying driver to run out of resources or reach a maximum limit,
resulting in sporadic failures. For example, you might encounter Maximum
Connections-related errors while a number of connections are waiting to
be deleted by the garbage collector. Explicitly closing the connections
by calling Close or Dispose allows a more efficient use of native
resources, enhancing scalability and improving overall application
performance.

</div>

<div id="id1432" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoConnection Constructor

</div>

</div>

</div>

Initializes a new instance of the VirtuosoConnection class.

<div id="id1428" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoConnection Constructor ()

</div>

</div>

</div>

Initializes a new instance of the VirtuosoConnection class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoConnection`</span>`();`

<div id="id1427" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When a new instance of VirtuosoConnection is created, the read/write
properties are set to the following initial values unless they are
specifically set using their associated keywords in the ConnectionString
property.

<div id="id17502" class="table">

**Table 7.5. **

<div class="table-contents">

| Properties        | Initial Value     |
|-------------------|-------------------|
| ConnectionString  | empty string ("") |
| ConnectionTimeout | 15                |
| Database          | empty string ("") |

</div>

</div>

  

You can change the value for these properties only by using the
ConnectionString property

</div>

</div>

<div id="id1431" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoConnection Constructor (string)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoConnection class with the
specified connection string.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoConnection`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`connectionString`</span>` `</span>`);`

<div id="id1429" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">connectionString</span>  
The connection used to open the Virtuoso database.

</div>

</div>

<div id="id1430" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When a new instance of VirtuosoConnection is created, the read/write
properties are set to the following initial values unless they are
specifically set using their associated keywords in the ConnectionString
property.

<div id="id17536" class="table">

**Table 7.6. **

<div class="table-contents">

| Properties        | Initial Value     |
|-------------------|-------------------|
| ConnectionString  | connectionString  |
| ConnectionTimeout | 15                |
| Database          | empty string ("") |

</div>

</div>

  

You can change the value for these properties only by using the
ConnectionString property

</div>

</div>

</div>

<div id="id1448" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1436" class="section">

<div class="titlepage">

<div>

<div>

###### ConnectionString Property

</div>

</div>

</div>

Gets or sets the string used to open a Virtuoso database.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`ConnectionString `</span>` ;`

<div id="id1433" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The connection string that includes the source database name, and other
parameters needed to establish the initial connection. The default value
is an empty string.

</div>

<div id="id1434" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbConnection.ConnectionString

</div>

<div id="id1435" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The ConnectionString is similar to an OLE DB connection string, but is
not identical. Unlike OLE DB or ADO, the connection string that is
returned is the same as the user-set ConnectionString minus security
information if the `Persist Security` Info value is set to `false`
(default). The Virtuoso .NET Data Provider does not persist or return
the password in a connection string unless you set
`Persist Security Info` to true.

The ConnectionString property can be set only when the connection is
closed. Many of the connection string values have corresponding
read-only properties. When the connection string is set, all of these
properties are updated, except when an error is detected. In this case,
none of the properties are updated. VirtuosoConnection properties return
only those settings contained in the ConnectionString.

Resetting the ConnectionString on a closed connection resets all
connection string values (and related properties) including the
password. For example, if you set a connection string that includes
"Database=Demo", and then reset the connection string to "Data
Source=myserver;User ID=dba;Password=dba", the Database property is no
longer set to northwind.

The connection string is parsed immediately after being set. If errors
in syntax are found when parsing, a runtime exception, such as
ArgumentException, is generated. Other errors can be found only when an
attempt is made to Open the connection.

Connection string has the following syntax. Each connection string is a
sequence of settings Individual settings are separated by semicolons.
Each setting is a pair of name and value delimited by the equal sign.
Whitespace is ignored on either side of both names and values. Names are
case insensitive. The value part can be quoted by either single or
double quote characters or remain unquoted at all. However if it
includes a semicolon, single quote, or double quote characters, it must
be enclosed in either type of quotes. To embed the same character that
is used for enclosing the value the character within the value must be
doubled.

The following table lists the valid names for values within the
ConnectionString.

<div id="id17575" class="table">

**Table 7.7. **

<div class="table-contents">

<table data-summary="" data-border="1">
<thead>
<tr class="header">
<th>Name</th>
<th>Default</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Connect Timeout</p>
<p>-or-</p>
<p>Connection Timeout</p></td>
<td>15</td>
<td>The length of time (in seconds) to wait for a connection to the
server before terminating the attempt and generating an error.</td>
</tr>
<tr class="even">
<td>Connection Lifetime</td>
<td>0</td>
<td>When a connection is returned to the pool, its creation time is
compared with the current time, and the connection is destroyed if that
time span (in seconds) exceeds the value specified by connection
lifetime. Useful in clustered configurations to force load balancing
between a running server and a server just brought on-line.</td>
</tr>
<tr class="odd">
<td><p>Data Source</p>
<p>-or-</p>
<p>Server</p>
<p>-or-</p>
<p>Address</p>
<p>-or-</p>
<p>Network Address</p></td>
<td> </td>
<td>The name or network address of the instance of Virtuoso server to
which to connect.</td>
</tr>
<tr class="even">
<td>Encrypt</td>
<td>false</td>
<td>Specifies if the connection must be SSL encrypted. Currently
encryption only works with an ODBC-based provider.</td>
</tr>
<tr class="odd">
<td>Enlist</td>
<td>true</td>
<td>When true, the pooler automatically enlists the connection in the
creation thread's current transaction context.</td>
</tr>
<tr class="even">
<td><p>Initial Catalog</p>
<p>-or-</p>
<p>Database</p></td>
<td> </td>
<td>The name of the database.</td>
</tr>
<tr class="odd">
<td>Max Pool Size</td>
<td>100</td>
<td>The maximum number of connections allowed in the pool.</td>
</tr>
<tr class="even">
<td>Min Pool Size</td>
<td>0</td>
<td>The minimum number of connections allowed in the pool.</td>
</tr>
<tr class="odd">
<td><p>Password</p>
<p>-or-</p>
<p>Pwd</p></td>
<td> </td>
<td>The password for the Virtuoso account logging on.</td>
</tr>
<tr class="even">
<td>Persist Security Info</td>
<td>false</td>
<td>When set to 'false', security-sensitive information, such as the
password, is not returned as part of the connection if the connection is
open or has ever been in an open State. Resetting the connection string
resets all connection string values including the password</td>
</tr>
<tr class="odd">
<td>Pooling</td>
<td>true</td>
<td>When true, the VirtuosoConnection object is drawn from the
appropriate pool, or if necessary, is created and added to the
appropriate pool.</td>
</tr>
<tr class="even">
<td><p>User ID</p>
<p>-or-</p>
<p>Uid</p></td>
<td> </td>
<td>The Virtuoso login name.</td>
</tr>
</tbody>
</table>

</div>

</div>

  

</div>

</div>

<div id="id1440" class="section">

<div class="titlepage">

<div>

<div>

###### ConnectionTimeout Property

</div>

</div>

</div>

Gets or sets the time to wait while trying to establish a connection
before terminating the attempt and generating an error.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`ConnectionTimeout `</span>` ;`

<div id="id1437" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The time (in seconds) to wait for a connection to open. The default
value is 15 seconds.

</div>

<div id="id1438" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbConnection.ConnectionTimeout

</div>

<div id="id1439" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

A value of 0 indicates no limit, and should be avoided in a
ConnectionString because an attempt to connect will wait indefinitely.

</div>

</div>

<div id="id1444" class="section">

<div class="titlepage">

<div>

<div>

###### Database Property

</div>

</div>

</div>

Gets the name of the current database or the database to be used after a
connection is opened.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`Database `</span>` ;`

<div id="id1441" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The name of the current database or the name of the database to be used
once a connection is open. The default value is an empty string.

</div>

<div id="id1442" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbConnection.Database

</div>

<div id="id1443" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Initially, the Database property is set in the connection string. The
Database property can be updated by using the ChangeDatabase method.

</div>

</div>

<div id="id1447" class="section">

<div class="titlepage">

<div>

<div>

###### State Property

</div>

</div>

</div>

Gets the current state of the connection.

` `<span class="modifier">`public `</span>` `<span class="type">`ConnectionState `</span>` `<span class="varname">`State `</span>` ;`

<div id="id1445" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A bitwise combination of the ConnectionState values. The default is
Closed.

</div>

<div id="id1446" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The allowed state changes are:

<div class="itemizedlist">

- From Closed to Open, using the Open method of the connection object.

- From Open to Closed, using either the Close method or the Dispose
  method of the connection object.

</div>

</div>

</div>

</div>

<div id="id1477" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1456" class="section">

<div class="titlepage">

<div>

<div>

###### BeginTransaction Method

</div>

</div>

</div>

Begins a database transaction.

<div id="id1451" class="section">

<div class="titlepage">

<div>

<div>

###### BeginTransaction Method ()

</div>

</div>

</div>

Begins a database transaction.

<span class="modifier">`public `</span><span class="type">`VirtuosoTransaction `</span><span class="methodname">`BeginTransaction`</span>`();`

<div id="id1449" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

An object representing the new transaction.

</div>

<div id="id1450" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

To commit or roll back the transaction, you must explicitly use the
Commit or Rollback methods.

To ensure that the Virtuoso .NET Data Provider transaction management
model performs correctly, avoid using other transaction management
models, such as those provided by the data source.

</div>

</div>

<div id="id1455" class="section">

<div class="titlepage">

<div>

<div>

###### BeginTransaction Method (IsolationLevel)

</div>

</div>

</div>

Begins a database transaction with the specified isolation level.

<span class="modifier">`public `</span><span class="type">`VirtuosoTransaction `</span><span class="methodname">`BeginTransaction`</span>`(`<span class="methodparam">` `<span class="type">`IsolationLevel `</span>` `<span class="parameter">`isoLevel`</span>` `</span>`);`

<div id="id1452" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">isoLevel</span>  
The isolation level under which the transaction should run.

</div>

</div>

<div id="id1453" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

An object representing the new transaction.

</div>

<div id="id1454" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

To commit or roll back the transaction, you must explicitly use the
Commit or Rollback methods.

To ensure that the Virtuoso .NET Data Provider transaction management
model performs correctly, avoid using other transaction management
models, such as those provided by the data source.

</div>

</div>

</div>

<div id="id1460" class="section">

<div class="titlepage">

<div>

<div>

###### ChangeDatabase Method

</div>

</div>

</div>

Changes the current database for an open VirtuosoConnection.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`ChangeDatabase`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`database`</span>` `</span>`);`

<div id="id1457" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">database</span>  
The name of the database to use in place of the current database.

</div>

</div>

<div id="id1458" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbConnection.ChangeDatabase

</div>

<div id="id1459" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The value parameter must contain a valid database name, and cannot
contain a null value, an empty string (""), or a string with only blank
characters.

</div>

</div>

<div id="id1463" class="section">

<div class="titlepage">

<div>

<div>

###### Close Method

</div>

</div>

</div>

Closes the connection to the database. This is the preferred method of
closing any open connection.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Close`</span>`();`

<div id="id1461" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbConnection.Close

</div>

<div id="id1462" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Close method rolls back any pending transactions. It then releases
the connection to the connection pool, or closes the connection if
connection pooling is disabled.

An application can call Close more than one time. No exception is
generated.

</div>

</div>

<div id="id1465" class="section">

<div class="titlepage">

<div>

<div>

###### CreateCommand Method

</div>

</div>

</div>

Creates and returns a VirtuosoCommand object associated with the
VirtuosoConnection.

<span class="modifier">`public `</span><span class="type">`VirtuosoCommand `</span><span class="methodname">`CreateCommand`</span>`();`

<div id="id1464" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A VirtuosoCommand object.

</div>

</div>

<div id="id1468" class="section">

<div class="titlepage">

<div>

<div>

###### EnlistDistributedTransaction Method

</div>

</div>

</div>

Enlists in the specified transaction as a distributed transaction.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`EnlistDistributedTransaction`</span>`(`<span class="methodparam">` `<span class="type">`ITransaction `</span>` `<span class="parameter">`transaction`</span>` `</span>`);`

<div id="id1466" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">transaction</span>  
A reference to an existing transaction in which to enlist or null to
unenlist.

</div>

</div>

<div id="id1467" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You can enlist in an existing distributed transaction using the
EnlistDistributedTransaction method if auto-enlistment is disabled.
Enlisting in an existing distributed transaction ensures that, if the
transaction is committed or rolled back, modifications made by the code
at the data source are also committed or rolled back.

</div>

</div>

<div id="id1469" class="section">

<div class="titlepage">

<div>

<div>

###### ICloneable.Clone Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`object `</span><span class="methodname">`ICloneable.Clone`</span>`();`

</div>

<div id="id1472" class="section">

<div class="titlepage">

<div>

<div>

###### IDbConnection.BeginTransaction Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<div id="id1470" class="section">

<div class="titlepage">

<div>

<div>

###### IDbConnection.BeginTransaction Method ()

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`IDbTransaction `</span><span class="methodname">`IDbConnection.BeginTransaction`</span>`();`

</div>

<div id="id1471" class="section">

<div class="titlepage">

<div>

<div>

###### IDbConnection.BeginTransaction Method (IsolationLevel)

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`IDbTransaction `</span><span class="methodname">`IDbConnection.BeginTransaction`</span>`(`<span class="methodparam">` `<span class="type">`IsolationLevel `</span>` `<span class="parameter">`isoLevel`</span>` `</span>`);`

</div>

</div>

<div id="id1473" class="section">

<div class="titlepage">

<div>

<div>

###### IDbConnection.CreateCommand Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`IDbCommand `</span><span class="methodname">`IDbConnection.CreateCommand`</span>`();`

</div>

<div id="id1476" class="section">

<div class="titlepage">

<div>

<div>

###### Open Method

</div>

</div>

</div>

Opens a database connection with the property settings specified by the
ConnectionString.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Open`</span>`();`

<div id="id1474" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbConnection.Open

</div>

<div id="id1475" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The VirtuosoConnection draws an open connection from the connection pool
if one is available. Otherwise, it establishes a new connection to an
instance of Virtuoso server.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                 |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                           |
|                              | If the VirtuosoConnection goes out of scope, it is not closed. Therefore, you must explicitly close the connection by calling Close or Dispose. |

</div>

</div>

</div>

</div>

</div>

<div id="vcrvirtdataadaclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoDataAdapter Class

</div>

</div>

</div>

Represents a set of data commands and a connection to a data source that
are used to fill the DataSet and update the data source. This class
cannot be inherited.

|                                  |
|----------------------------------|
| System.Object                    |
| System.MarshalByRefObject        |
| System.ComponentModel.Component  |
| System.Data.Common.DataAdapter   |
| System.Data.Common.DbDataAdapter |
| VirtuosoDataAdapter              |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoDataAdapter
             extends, 
              DbDataAdapter
            
    implements, 
              IDbDataAdapter
             {
}
```

<div id="id1478" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Microsoft® Visual Basic®) members of this
type are safe for multithreaded operations. Any instance members are not
guaranteed to be thread safe.

</div>

<div id="id1479" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The VirtuosoDataAdapter serves as a bridge between a DataSet and data
source for retrieving and saving data. The VirtuosoDataAdapter provides
this bridge by using Fill to load data from the data source into the
DataSet, and using Update to send changes made in the DataSet back to
the data source.

The VirtuosoDataAdapter also includes the SelectCommand, InsertCommand,
DeleteCommand, UpdateCommand, and TableMappings properties to facilitate
loading and updating of data.

</div>

<div id="id1489" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoDataAdapter Constructor

</div>

</div>

</div>

<div id="id1481" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoDataAdapter Constructor ()

</div>

</div>

</div>

Initializes a new instance of the VirtuosoDataAdapter class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoDataAdapter`</span>`();`

<div id="id1480" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When you create an instance of VirtuosoDataAdapter, the following
read/write properties are set to their default values, as shown in the
table.

<div id="id17858" class="table">

**Table 7.8. **

<div class="table-contents">

| Properties           | Default Value                    |
|----------------------|----------------------------------|
| MissingMappingAction | MissingMappingAction.Passthrough |
| MissingSchemaAction  | MissingSchemaAction.Add          |

</div>

</div>

  

You can change the value of any of these properties through a separate
call to the property.

</div>

</div>

<div id="id1484" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoDataAdapter Constructor (VirtuosoCommand)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoDataAdapter class with the
specified VirtuosoCommand as the SelectCommand property.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoDataAdapter`</span>`(`<span class="methodparam">` `<span class="type">`VirtuosoCommand `</span>` `<span class="parameter">`selectCommand`</span>` `</span>`);`

<div id="id1482" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">selectCommand</span>  
A VirtuosoCommand that is an SQL SELECT statement or stored procedure,
and is set as the SelectCommand property of the VirtuosoDataAdapter.

</div>

</div>

<div id="id1483" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

This implementation of the VirtuosoDataAdapter constructor sets the
SelectCommand property to the value specified in the selectCommand
parameter.

When you create an instance of VirtuosoDataAdapter, the following
read/write properties are set to their default values, as shown in the
table.

<div id="id17890" class="table">

**Table 7.9. **

<div class="table-contents">

| Properties           | Default Value                    |
|----------------------|----------------------------------|
| MissingMappingAction | MissingMappingAction.Passthrough |
| MissingSchemaAction  | MissingSchemaAction.Add          |

</div>

</div>

  

You can change the value of any of these properties through a separate
call to the property.

</div>

</div>

<div id="id1486" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoDataAdapter Constructor (string, VirtuosoConnection)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoDataAdapter class with an SQL
SELECT statement and a VirtuosoConnection.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoDataAdapter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`selectCommandText`</span>` `</span>`,`  
`                           `<span class="methodparam">` `<span class="type">`VirtuosoConnection `</span>` `<span class="parameter">`selectConnection`</span>` `</span>`);`

<div id="id1485" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">selectCommandText</span>  
A string that is a SQL SELECT statement or stored procedure to be used
by the SelectCommand property of the VirtuosoDataAdapter.

<span class="term">selectConnection</span>  
A VirtuosoConnection that represents the connection.

</div>

</div>

</div>

<div id="id1488" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoDataAdapter Constructor (string, string)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoDataAdapter class with an SQL
SELECT statement and a connection string.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoDataAdapter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`selectCommandText`</span>` `</span>`,`  
`                           `<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`selectConnectionString`</span>` `</span>`);`

<div id="id1487" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">selectCommandText</span>  
A string that is a SQL SELECT statement or stored procedure to be used
by the SelectCommand property of the VirtuosoDataAdapter.

<span class="term">selectConnectionString</span>  
The connection string.

</div>

</div>

</div>

</div>

<div id="id1502" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1492" class="section">

<div class="titlepage">

<div>

<div>

###### DeleteCommand

</div>

</div>

</div>

Gets or sets an SQL statement or stored procedure used to delete records
in the data source.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoCommand `</span>` `<span class="varname">`DeleteCommand `</span>` ;`

<div id="id1490" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoCommand used during an update operation to delete records in
the database that correspond to deleted rows in the DataSet.

</div>

<div id="id1491" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When DeleteCommand is assigned to a previously created VirtuosoCommand,
the VirtuosoCommand is not cloned. The DeleteCommand maintains a
reference to the previously created VirtuosoCommand object.

</div>

</div>

<div id="id1495" class="section">

<div class="titlepage">

<div>

<div>

###### InsertCommand

</div>

</div>

</div>

Gets or sets an SQL statement or stored procedure used to insert new
records in the data source.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoCommand `</span>` `<span class="varname">`InsertCommand `</span>` ;`

<div id="id1493" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoCommand used during an update operation to insert records in
the database that correspond to new rows in the DataSet.

</div>

<div id="id1494" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When InsertCommand is assigned to a previously created VirtuosoCommand,
the VirtuosoCommand is not cloned. The InsertCommand maintains a
reference to the previously created VirtuosoCommand object.

</div>

</div>

<div id="id1498" class="section">

<div class="titlepage">

<div>

<div>

###### SelectCommand

</div>

</div>

</div>

Gets or sets an SQL statement or stored procedure used to select records
in the data source.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoCommand `</span>` `<span class="varname">`SelectCommand `</span>` ;`

<div id="id1496" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoCommand used during Fill to select records from the database
for placement in the DataSet.

</div>

<div id="id1497" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When SelectCommand is assigned to a previously created VirtuosoCommand,
the VirtuosoCommand is not cloned. The SelectCommand maintains a
reference to the previously created VirtuosoCommand object.

If the SelectCommand does not return any rows, no tables are added to
the DataSet, and no exception is raised.

</div>

</div>

<div id="id1501" class="section">

<div class="titlepage">

<div>

<div>

###### UpdateCommand

</div>

</div>

</div>

Gets or sets an SQL statement or stored procedure used to update records
in the data source.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoCommand `</span>` `<span class="varname">`UpdateCommand `</span>` ;`

<div id="id1499" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoCommand used during an update operation to update records in
the database that correspond to modified rows in the DataSet.

</div>

<div id="id1500" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When UpdateCommand is assigned to a previously created VirtuosoCommand,
the VirtuosoCommand is not cloned. The UpdateCommand maintains a
reference to the previously created VirtuosoCommand object.

</div>

</div>

</div>

<div id="id1511" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1503" class="section">

<div class="titlepage">

<div>

<div>

###### CreateRowUpdatedEvent

</div>

</div>

</div>

This member overrides DbDataAdapter.CreateRowUpdatedEvent.

<span class="modifier">`protected `</span><span class="modifier">`override `</span><span class="type">`RowUpdatedEventArgs `</span><span class="methodname">`CreateRowUpdatedEvent`</span>`(`<span class="methodparam">` `<span class="type">`DataRow `</span>` `<span class="parameter">`dataRow`</span>` `</span>`,`  
`                                                             `<span class="methodparam">` `<span class="type">`IDbCommand `</span>` `<span class="parameter">`command`</span>` `</span>`,`  
`                                                             `<span class="methodparam">` `<span class="type">`StatementType `</span>` `<span class="parameter">`statementType`</span>` `</span>`,`  
`                                                             `<span class="methodparam">` `<span class="type">`DataTableMapping `</span>` `<span class="parameter">`tableMapping`</span>` `</span>`);`

</div>

<div id="id1504" class="section">

<div class="titlepage">

<div>

<div>

###### CreateRowUpdatingEvent

</div>

</div>

</div>

This member overrides DbDataAdapter.CreateRowUpdatingEvent.

<span class="modifier">`protected `</span><span class="modifier">`override `</span><span class="type">`RowUpdatedEventArgs `</span><span class="methodname">`CreateRowUpdatingEvent`</span>`(`<span class="methodparam">` `<span class="type">`DataRow `</span>` `<span class="parameter">`dataRow`</span>` `</span>`,`  
`                                                              `<span class="methodparam">` `<span class="type">`IDbCommand `</span>` `<span class="parameter">`command`</span>` `</span>`,`  
`                                                              `<span class="methodparam">` `<span class="type">`StatementType `</span>` `<span class="parameter">`statementType`</span>` `</span>`,`  
`                                                              `<span class="methodparam">` `<span class="type">`DataTableMapping `</span>` `<span class="parameter">`tableMapping`</span>` `</span>`);`

</div>

<div id="id1507" class="section">

<div class="titlepage">

<div>

<div>

###### OnRowUpdated

</div>

</div>

</div>

Raises the RowUpdated event.

<span class="modifier">`protected `</span><span class="modifier">`override `</span><span class="void">`void `</span><span class="methodname">`OnRowUpdated`</span>`(`<span class="methodparam">` `<span class="type">`RowUpdatedEventArgs `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1505" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
A System.Data.Common.RowUpdatedEventArgs object that contains the event
data.

</div>

</div>

<div id="id1506" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Raising an event invokes the event handler through a delegate. For an
overview, see "Raising an Event" in the Microsoft® .NET Framework SDK
documentation.

</div>

</div>

<div id="id1510" class="section">

<div class="titlepage">

<div>

<div>

###### OnRowUpdating

</div>

</div>

</div>

Raises the RowUpdating event.

<span class="modifier">`protected `</span><span class="modifier">`override `</span><span class="void">`void `</span><span class="methodname">`OnRowUpdating`</span>`(`<span class="methodparam">` `<span class="type">`RowUpdatingEventArgs `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1508" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
A System.Data.Common.RowUpdatingEventArgs object that contains the event
data.

</div>

</div>

<div id="id1509" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Raising an event invokes the event handler through a delegate. For an
overview, see "Raising an Event" in the Microsoft® .NET Framework SDK
documentation.

</div>

</div>

</div>

<div id="id1518" class="section">

<div class="titlepage">

<div>

<div>

##### Events

</div>

</div>

</div>

<div id="id1514" class="section">

<div class="titlepage">

<div>

<div>

###### RowUpdated

</div>

</div>

</div>

Occurs during an Update operation after a command is executed against
the data source.

` `<span class="modifier">`public `</span>` `<span class="modifier">`event `</span>` `<span class="type">`VirtuosoRowUpdatedEventHandler `</span>` `<span class="varname">`RowUpdated `</span>` ;`

<div id="id1512" class="section">

<div class="titlepage">

<div>

<div>

###### Event Data

</div>

</div>

</div>

The event handler receives an argument of type
VirtuosoRowUpdatedEventArgs containing data related to this event. The
following VirtuosoRowUpdatedEventArgs properties provide information
specific to this event.

<div id="id18074" class="table">

**Table 7.10. **

<div class="table-contents">

| Property                                             | Description                                                                              |
|------------------------------------------------------|------------------------------------------------------------------------------------------|
| Command                                              | Gets the VirtuosoCommand executed when Update is called.                                 |
| Errors (inherited from RowUpdatedEventArgs)          | Gets any errors generated by the .NET data provider when the Command was executed.       |
| RecordsAffected (inherited from RowUpdatedEventArgs) | Gets the number of rows changed, inserted, or deleted by execution of the SQL statement. |
| Row (inherited from RowUpdatedEventArgs)             | Gets the DataRow sent through an Update.                                                 |
| StatementType (inherited from RowUpdatedEventArgs)   | Gets the type of SQL statement executed.                                                 |
| Status (inherited from RowUpdatedEventArgs)          | Gets the UpdateStatus of the Command.                                                    |
| TableMapping (inherited from RowUpdatedEventArgs)    | Gets the DataTableMapping sent through an Update.                                        |

</div>

</div>

  

</div>

<div id="id1513" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When using the Update method, there are two events that occur per data
row updated. The order of execution is as follows:

<div class="orderedlist">

1.  The values in the DataRow are moved to the parameter values.

2.  The OnRowUpdating event is raised.

3.  The command executes.

4.  If the UpdateRowSource enumeration is set to FirstReturnedRecord,
    the first returned result is placed in the DataRow.

5.  If there are output parameters, they are placed in the DataRow.

6.  The OnRowUpdated event is raised.

7.  AcceptChanges is called.

</div>

</div>

</div>

<div id="id1517" class="section">

<div class="titlepage">

<div>

<div>

###### RowUpdating

</div>

</div>

</div>

Occurs during an Update operation before a command is executed against
the data source.

` `<span class="modifier">`public `</span>` `<span class="modifier">`event `</span>` `<span class="type">`VirtuosoRowUpdatingEventHandler `</span>` `<span class="varname">`RowUpdating `</span>` ;`

<div id="id1515" class="section">

<div class="titlepage">

<div>

<div>

###### Event Data

</div>

</div>

</div>

The event handler receives an argument of type
VirtuosoRowUpdatingEventArgs containing data related to this event. The
following VirtuosoRowUpdatingEventArgs properties provide information
specific to this event.

<div id="id18129" class="table">

**Table 7.11. **

<div class="table-contents">

| Property                                            | Description                                                                    |
|-----------------------------------------------------|--------------------------------------------------------------------------------|
| Command                                             | Gets or sets the VirtuosoCommand to execute when Update is called.             |
| Errors (inherited from RowUpdatingEventArgs)        | Gets any errors generated by the .NET data provider when the Command executes. |
| Row (inherited from RowUpdatingEventArgs)           | Gets the DataRow to send through an Update.                                    |
| StatementType (inherited from RowUpdatingEventArgs) | Gets the type of SQL statement to execute.                                     |
| Status (inherited from RowUpdatingEventArgs)        | Gets the UpdateStatus of the Command.                                          |
| TableMapping (inherited from RowUpdatingEventArgs)  | Gets the DataTableMapping to send through the Update.                          |

</div>

</div>

  

</div>

<div id="id1516" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When using the Update method, there are two events that occur per data
row updated. The order of execution is as follows:

<div class="orderedlist">

1.  The values in the DataRow are moved to the parameter values.

2.  The OnRowUpdating event is raised.

3.  The command executes.

4.  If the UpdateRowSource enumeration is set to FirstReturnedRecord,
    the first returned result is placed in the DataRow.

5.  If there are output parameters, they are placed in the DataRow.

6.  The OnRowUpdated event is raised.

7.  AcceptChanges is called.

</div>

</div>

</div>

</div>

</div>

<div id="vcrvirtdatareadrclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoDataReader Class

</div>

</div>

</div>

Provides a means of reading a forward-only stream of rows from a
Virtuoso database. This class cannot be inherited.

|                           |
|---------------------------|
| System.Object             |
| System.MarshalByRefObject |
| VirtuosoDataReader        |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoDataReader
             extends, 
              MarshalByRefObject
            
    implements, 
              IDataReader
            , 
              IDataRecord
            , 
              IDisposable
            , 
              IEnumerable
             {
}
```

<div id="id1519" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1520" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

To create a VirtuosoDataReader, you must call the ExecuteReader method
of the VirtuosoCommand object, rather than directly using a constructor.

Changes made to a resultset by another process or thread while data is
being read may be visible to the user of the VirtuosoDataReader.
However, the precise behavior is both driver and timing dependent.

IsClosed and RecordsAffected are the only properties that you can call
after the VirtuosoDataReader is closed. In some cases, you must call
Close before you can call RecordsAffected.

</div>

<div id="id1546" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1524" class="section">

<div class="titlepage">

<div>

<div>

###### Depth Property

</div>

</div>

</div>

Gets a value indicating the depth of nesting for the current row.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`Depth `</span>` ;`

<div id="id1521" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The depth of nesting for the current row.

</div>

<div id="id1522" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.Depth

</div>

<div id="id1523" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The outermost table has a depth of zero. The Virtuoso .NET Data Provider
does not support nesting and always returns zero.

</div>

</div>

<div id="id1528" class="section">

<div class="titlepage">

<div>

<div>

###### FieldCount Property

</div>

</div>

</div>

Gets the number of columns in the current row.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`FieldCount `</span>` ;`

<div id="id1525" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

When not positioned in a valid record set, 0; otherwise the number of
columns in the current record. The default is -1.

</div>

<div id="id1526" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.FieldCount

</div>

<div id="id1527" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

After executing a query that does not return rows, FieldCount returns 0.

</div>

</div>

<div id="id1532" class="section">

<div class="titlepage">

<div>

<div>

###### IsClosed Property

</div>

</div>

</div>

Gets a value indicating whether the data reader is closed.

` `<span class="modifier">`public `</span>` `<span class="type">`bool `</span>` `<span class="varname">`IsClosed `</span>` ;`

<div id="id1529" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

`true` if the VirtuosoDataReader is closed; otherwise, `false` .

</div>

<div id="id1530" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.IsClosed

</div>

<div id="id1531" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

IsClosed and RecordsAffected are the only properties that you can call
after the VirtuosoDataReader is closed.

</div>

</div>

<div id="id1541" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property

</div>

</div>

</div>

<div id="id1536" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property (int)

</div>

</div>

</div>

Gets the value of the specified column in its native format given the
column ordinal.

` `<span class="modifier">`public `</span>` `<span class="type">`object `</span>` `<span class="varname">`this[int i] `</span>` ;`

<div id="id1533" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1534" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The value of the specified column in its native format.

</div>

<div id="id1535" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.Item

</div>

</div>

<div id="id1540" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property (string)

</div>

</div>

</div>

Gets the value of the specified column in its native format given the
column name.

` `<span class="modifier">`public `</span>` `<span class="type">`object `</span>` `<span class="varname">`this[string name] `</span>` ;`

<div id="id1537" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">name</span>  
The column name.

</div>

</div>

<div id="id1538" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The value of the specified column in its native format.

</div>

<div id="id1539" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.Item

</div>

</div>

</div>

<div id="id1545" class="section">

<div class="titlepage">

<div>

<div>

###### RecordsAffected Property

</div>

</div>

</div>

Gets the number of rows changed, inserted, or deleted by execution of
the SQL statement.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`RecordsAffected `</span>` ;`

<div id="id1542" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The number of rows changed, inserted, or deleted; 0 if no rows were
affected or the statement failed; and -1 for SELECT statements.

</div>

<div id="id1543" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.RecordsAffected

</div>

<div id="id1544" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

IsClosed and RecordsAffected are the only properties that you can call
after the VirtuosoDataReader is closed.

</div>

</div>

</div>

<div id="id1667" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1549" class="section">

<div class="titlepage">

<div>

<div>

###### Close Method

</div>

</div>

</div>

Closes the VirtuosoDataReader object.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Close`</span>`();`

<div id="id1547" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.Close

</div>

<div id="id1548" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

You must explicitly call the Close method when you are through using the
VirtuosoDataReader to use the associated VirtuosoConnection for any
other purpose.

The Close method fills in the values for output parameters, return
values and RecordsAffected.

</div>

</div>

<div id="id1554" class="section">

<div class="titlepage">

<div>

<div>

###### GetBoolean Method

</div>

</div>

</div>

Gets the value of the specified column as a Boolean.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`GetBoolean`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1550" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1551" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A Boolean that is the value of the column.

</div>

<div id="id1552" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetBoolean

</div>

<div id="id1553" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1559" class="section">

<div class="titlepage">

<div>

<div>

###### GetByte Method

</div>

</div>

</div>

<span class="modifier">`public `</span><span class="type">`byte `</span><span class="methodname">`GetByte`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1555" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1556" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a byte.

</div>

<div id="id1557" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetByte

</div>

<div id="id1558" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1564" class="section">

<div class="titlepage">

<div>

<div>

###### GetBytes Method

</div>

</div>

</div>

Reads a stream of bytes from the specified column offset into the buffer
as an array, starting at the given buffer offset.

<span class="modifier">`public `</span><span class="type">`long `</span><span class="methodname">`GetBytes`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`long `</span>` `<span class="parameter">`fieldOffset`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`byte[] `</span>` `<span class="parameter">`buffer`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`bufferOffset`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`length`</span>` `</span>`);`

<div id="id1560" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

<span class="term">fieldOffset</span>  
The index within the field from which to begin the read operation.

<span class="term">buffer</span>  
The buffer into which to read the stream of bytes.

<span class="term">bufferOffset</span>  
The index for buffer to begin the read operation.

<span class="term">length</span>  
The number of bytes to read.

</div>

</div>

<div id="id1561" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The actual number of bytes read.

</div>

<div id="id1562" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetBytes

</div>

<div id="id1563" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

GetBytes returns the number of available bytes in the field. In most
cases this is the exact length of the field. However, the number
returned may be less than the true length of the field if GetBytes has
already been used to obtain bytes from the field. This may be the case,
for example, if the VirtuosoDataReader is reading a large data structure
into a buffer. For more information, see the SequentialAccess setting of
System.Data.CommandBehavior in the Microsoft® .NET Framework SDK
documentation.

If you pass a buffer that is a null value, GetBytes returns the length
of the field in bytes.

</div>

</div>

<div id="id1569" class="section">

<div class="titlepage">

<div>

<div>

###### GetChar Method

</div>

</div>

</div>

<span class="modifier">`public `</span><span class="type">`char `</span><span class="methodname">`GetChar`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1565" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1566" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a character.

</div>

<div id="id1567" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetChar

</div>

<div id="id1568" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1574" class="section">

<div class="titlepage">

<div>

<div>

###### GetChars Method

</div>

</div>

</div>

Reads a stream of characters from the specified column offset into the
buffer as an array, starting at the given buffer offset.

<span class="modifier">`public `</span><span class="type">`long `</span><span class="methodname">`GetChars`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`long `</span>` `<span class="parameter">`fieldOffset`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`char[] `</span>` `<span class="parameter">`buffer`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`bufferOffset`</span>` `</span>`,`  
`                     `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`length`</span>` `</span>`);`

<div id="id1570" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

<span class="term">fieldOffset</span>  
The index within the field from which to begin the read operation.

<span class="term">buffer</span>  
The buffer into which to copy data..

<span class="term">bufferOffset</span>  
The index for buffer to begin the read operation.

<span class="term">length</span>  
The number of characters to read.

</div>

</div>

<div id="id1571" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The actual number of characters read.

</div>

<div id="id1572" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetChars

</div>

<div id="id1573" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

GetChars returns the number of available characters in the field. In
most cases this is the exact length of the field. However, the number
returned may be less than the true length of the field if GetChars has
already been used to obtain characters from the field. This may be the
case, for example, if the VirtuosoDataReader is reading a large data
structure into a buffer. For more information, see the SequentialAccess
setting of System.Data.CommandBehavior in the Microsoft® .NET Framework
SDK documentation.

If you pass a buffer that is a null value. GetChars returns the length
of the field in characters.

</div>

</div>

<div id="id1576" class="section">

<div class="titlepage">

<div>

<div>

###### GetData Method

</div>

</div>

</div>

Not currently supported.

<span class="modifier">`public `</span><span class="type">`IDataReader `</span><span class="methodname">`GetData`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1575" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetData

</div>

</div>

<div id="id1580" class="section">

<div class="titlepage">

<div>

<div>

###### GetDataTypeName Method

</div>

</div>

</div>

Gets the name of the source data type.

<span class="modifier">`public `</span><span class="type">`string `</span><span class="methodname">`GetDataTypeName`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1577" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1578" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The name of the source data type.

</div>

<div id="id1579" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetDataTypeName

</div>

</div>

<div id="id1585" class="section">

<div class="titlepage">

<div>

<div>

###### GetDateTime Method

</div>

</div>

</div>

Gets the value of the specified column as a DateTime object.

<span class="modifier">`public `</span><span class="type">`DateTime `</span><span class="methodname">`GetDateTime`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1581" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1582" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a DateTime object.

</div>

<div id="id1583" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetDateTime

</div>

<div id="id1584" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1590" class="section">

<div class="titlepage">

<div>

<div>

###### GetDecimal Method

</div>

</div>

</div>

Gets the value of the specified column as a Decimal object.

<span class="modifier">`public `</span><span class="type">`decimal `</span><span class="methodname">`GetDecimal`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1586" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1587" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a Decimal object.

</div>

<div id="id1588" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetDecimal

</div>

<div id="id1589" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1595" class="section">

<div class="titlepage">

<div>

<div>

###### GetDouble Method

</div>

</div>

</div>

<span class="modifier">`public `</span><span class="type">`double `</span><span class="methodname">`GetDouble`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1591" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1592" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a double-precision floating point
number.

</div>

<div id="id1593" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetDouble

</div>

<div id="id1594" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1599" class="section">

<div class="titlepage">

<div>

<div>

###### GetFieldType Method

</div>

</div>

</div>

Gets the Type that is the data type of the object.

<span class="modifier">`public `</span><span class="type">`Type `</span><span class="methodname">`GetFieldType`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1596" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1597" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The Type that is the data type of the object.

</div>

<div id="id1598" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetFieldType

</div>

</div>

<div id="id1604" class="section">

<div class="titlepage">

<div>

<div>

###### GetFloat Method

</div>

</div>

</div>

<span class="modifier">`public `</span><span class="type">`float `</span><span class="methodname">`GetFloat`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1600" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1601" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a single-precision floating-point
number.

</div>

<div id="id1602" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetFloat

</div>

<div id="id1603" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1609" class="section">

<div class="titlepage">

<div>

<div>

###### GetGuid Method

</div>

</div>

</div>

Gets the value of the specified column as a globally-unique identifier
(GUID).

<span class="modifier">`public `</span><span class="type">`Guid `</span><span class="methodname">`GetGuid`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1605" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1606" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a GUID.

</div>

<div id="id1607" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetGuid

</div>

<div id="id1608" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1614" class="section">

<div class="titlepage">

<div>

<div>

###### GetInt16 Method

</div>

</div>

</div>

Gets the value of the specified column as a 16-bit signed integer.

<span class="modifier">`public `</span><span class="type">`short `</span><span class="methodname">`GetInt16`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1610" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1611" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a 16-bit signed integer.

</div>

<div id="id1612" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetInt16

</div>

<div id="id1613" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1619" class="section">

<div class="titlepage">

<div>

<div>

###### GetInt32 Method

</div>

</div>

</div>

Gets the value of the specified column as a 32-bit signed integer

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`GetInt32`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1615" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1616" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a 32-bit signed integer.

</div>

<div id="id1617" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetInt32

</div>

<div id="id1618" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1624" class="section">

<div class="titlepage">

<div>

<div>

###### GetInt64 Method

</div>

</div>

</div>

Gets the value of the specified column as a 64-bit signed integer.

<span class="modifier">`public `</span><span class="type">`long `</span><span class="methodname">`GetInt64`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1620" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1621" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a 64-bit signed integer.

</div>

<div id="id1622" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetInt64

</div>

<div id="id1623" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1628" class="section">

<div class="titlepage">

<div>

<div>

###### GetName Method

</div>

</div>

</div>

Gets the name of the specified column.

<span class="modifier">`public `</span><span class="type">`string `</span><span class="methodname">`GetName`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1625" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1626" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A string that is the name of the specified column.

</div>

<div id="id1627" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetName

</div>

</div>

<div id="id1632" class="section">

<div class="titlepage">

<div>

<div>

###### GetOrdinal Method

</div>

</div>

</div>

Gets the column ordinal, given the name of the column.

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`GetOrdinal`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`name`</span>` `</span>`);`

<div id="id1629" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">name</span>  
The name of the column.

</div>

</div>

<div id="id1630" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The zero-based column ordinal.

</div>

<div id="id1631" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetOrdinal

</div>

</div>

<div id="id1636" class="section">

<div class="titlepage">

<div>

<div>

###### GetSchemaTable Method

</div>

</div>

</div>

Returns a DataTable that describes the column metadata of the
VirtuosoDataReader.

<span class="modifier">`public `</span><span class="type">`DataTable `</span><span class="methodname">`GetSchemaTable`</span>`();`

<div id="id1633" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A DataTable that describes the column metadata.

</div>

<div id="id1634" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.GetSchemaTable

</div>

<div id="id1635" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

For the GetSchemaTable method returns metadata about each column in the
following order:

<div id="id18725" class="table">

**Table 7.12. **

<div class="table-contents">

| DataReader Column | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ColumnName        | The name of the column; this might not be unique. If the column name cannot be determined, a null value is returned. This name always reflects the most recent naming of the column in the current view or command text.                                                                                                                                                                                                                                          |
| ColumnOrdinal     | The ordinal of the column. This is zero for the bookmark column of the row, if any. Other columns are numbered starting with one. This column cannot contain a null value.                                                                                                                                                                                                                                                                                        |
| ColumnSize        | The maximum possible length of a value in the column. For columns that use a fixed-length data type, this is the size of the data type.                                                                                                                                                                                                                                                                                                                           |
| NumericPrecision  | If ProviderType is a numeric data type, this is the maximum precision of the column. The precision depends on the definition of the column. If ProviderType is not a numeric data type, this is a null value.                                                                                                                                                                                                                                                     |
| NumericScale      | If ProviderType is decimal, the number of digits to the right of the decimal point. Otherwise, this is a null value.                                                                                                                                                                                                                                                                                                                                              |
| DataType          | Maps to the .Net Framework type of the column.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ProviderType      | The indicator of the column's data type. If the data type of the column varies from row to row, this must be Object. This column cannot contain a null value.                                                                                                                                                                                                                                                                                                     |
| IsLong            | Set if the column contains a Binary Long Object (BLOB) that contains very long data.                                                                                                                                                                                                                                                                                                                                                                              |
| AllowDBNull       | Set if the consumer can set the column to a null value or if the provider cannot determine whether or not the consumer can set the column to a null value. Otherwise, not set. A column may contain null values, even if it cannot be set to a null value.                                                                                                                                                                                                        |
| IsReadOnly        | `true` if the column can be modified; otherwise `false` .                                                                                                                                                                                                                                                                                                                                                                                                         |
| IsRowVersion      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| IsUnique          | `true` : No two rows in the base table-the table returned in BaseTableName-can have the same value in this column. IsUnique is guaranteed to be true if the column constitutes a key by itself or if there is a constraint of type UNIQUE that applies only to this column. `false` : The column can contain duplicate values in the base table. The default of this column is `false` .                                                                          |
| IsKey             | `true` : The column is one of a set of columns in the rowset that, taken together, uniquely identify the row. The set of columns with IsKey set to `true` must uniquely identify a row in the rowset. There is no requirement that this set of columns is a minimal set of columns. This set of columns may be generated from a base table primary key, a unique constraint or a unique index. `false` : The column is not required to uniquely identify the row. |
| IsAutoIncrement   | `true` : The column assigns values to new rows in fixed increments. `false` : The column does not assign values to new rows in fixed increments. The default of this column is `false` .                                                                                                                                                                                                                                                                          |
| BaseSchemaName    | The name of the schema in the data store that contains the column. A null value if the base schema name cannot be determined. The default of this column is a null value.                                                                                                                                                                                                                                                                                         |
| BaseCatalogName   | The name of the catalog in the data store that contains the column. NULL if the base catalog name cannot be determined. The default of this column is a null value.                                                                                                                                                                                                                                                                                               |
| BaseTableName     | The name of the table or view in the data store that contains the column. A null value if the base table name cannot be determined. The default of this column is a null value.                                                                                                                                                                                                                                                                                   |
| BaseColumnName    | The name of the column in the data store. This might be different than the column name returned in the ColumnName column if an alias was used. A null value if the base column name cannot be determined or if the rowset column is derived, but not identical to, a column in the data store. The default of this column is a null value.                                                                                                                        |

</div>

</div>

  

</div>

</div>

<div id="id1641" class="section">

<div class="titlepage">

<div>

<div>

###### GetString Method

</div>

</div>

</div>

Gets the value of the specified column as a string.

<span class="modifier">`public `</span><span class="type">`string `</span><span class="methodname">`GetString`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1637" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1638" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value of the specified column as a string.

</div>

<div id="id1639" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetString

</div>

<div id="id1640" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Call IsDBNull to check for null values before calling this method.

</div>

</div>

<div id="id1646" class="section">

<div class="titlepage">

<div>

<div>

###### GetValue Method

</div>

</div>

</div>

Gets the value of the column at the specified ordinal in its native
format.

<span class="modifier">`public `</span><span class="type">`object `</span><span class="methodname">`GetValue`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1642" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1643" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The value to return.

</div>

<div id="id1644" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetValue

</div>

<div id="id1645" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

This method returns DBNull for null database columns.

</div>

</div>

<div id="id1651" class="section">

<div class="titlepage">

<div>

<div>

###### GetValues Method

</div>

</div>

</div>

Gets all the attribute columns in the current row.

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`GetValues`</span>`(`<span class="methodparam">` `<span class="type">`object[] `</span>` `<span class="parameter">`values`</span>` `</span>`);`

<div id="id1647" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">values</span>  
An array of type Object into which to copy the attribute columns.

</div>

</div>

<div id="id1648" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The number of instances of Object in the array.

</div>

<div id="id1649" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.GetValues

</div>

<div id="id1650" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

For most applications, the GetValues method provides an efficient means
for retrieving all columns, rather than retrieving each column
individually.

You can pass an Object array that contains fewer than the number of
columns contained in the resulting row. Only the amount of data the
Object array holds is copied to the array. You can also pass an Object
array whose length is more than the number of columns contained in the
resulting row.

This method returns DBNull for null database columns.

</div>

</div>

<div id="id1652" class="section">

<div class="titlepage">

<div>

<div>

###### IDisposable.Dispose Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="void">`void `</span><span class="methodname">`IDisposable.Dispose`</span>`();`

</div>

<div id="id1653" class="section">

<div class="titlepage">

<div>

<div>

###### IEnumerable.GetEnumerator Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`IEnumerable `</span><span class="methodname">`IEnumerable.GetEnumerator`</span>`();`

</div>

<div id="id1658" class="section">

<div class="titlepage">

<div>

<div>

###### IsDBNull Method

</div>

</div>

</div>

Gets a value indicating whether the column contains non-existent or
missing values.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`IsDBNull`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1654" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based column ordinal.

</div>

</div>

<div id="id1655" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if the specified column value is equivalent to DBNull; otherwise,
`false` .

</div>

<div id="id1656" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataRecord.IsDBNull

</div>

<div id="id1657" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

To avoid raising an error, call this method to check for null column
values before calling the typed Get methods (for example, GetByte,
GetChar, and so on).

</div>

</div>

<div id="id1662" class="section">

<div class="titlepage">

<div>

<div>

###### NextResult Method

</div>

</div>

</div>

Advances the VirtuosoDataReader to the next result, when reading the
results of batch SQL statements.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`NextResult`</span>`();`

<div id="id1659" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if there are more result sets; otherwise, `false` .

</div>

<div id="id1660" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.NextResult

</div>

<div id="id1661" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Used to process multiple results, which can be generated by executing
batch SQL statements.

By default, the VirtuosoDataReader is positioned on the first result.

</div>

</div>

<div id="id1666" class="section">

<div class="titlepage">

<div>

<div>

###### Read Method

</div>

</div>

</div>

Advances the VirtuosoDataReader to the next record.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`Read`</span>`();`

<div id="id1663" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if there are more rows; otherwise, `false` .

</div>

<div id="id1664" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataReader.Read

</div>

<div id="id1665" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The default position of the VirtuosoDataReader is prior to the first
record. Therefore, you must call Read to begin accessing any data.

</div>

</div>

</div>

</div>

<div id="vcrvirterrclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoError Class

</div>

</div>

</div>

Collects information relevant to a warning or error returned by Virtuoso
server. This class cannot be inherited.

|               |
|---------------|
| System.Object |
| VirtuosoError |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoError
             {
}
```

<div id="id1668" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1669" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

This class is created by the Virtuoso .NET Data Provider when an error
occurs. An instance of VirtuosoError is created and managed by the
VirtuosoErrorCollection, which in turn is created by the
VirtuosoException class.

</div>

<div id="id1674" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1671" class="section">

<div class="titlepage">

<div>

<div>

###### Message

</div>

</div>

</div>

Gets a short description of the error.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`Message `</span>` ;`

<div id="id1670" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A description of the error.

</div>

</div>

<div id="id1673" class="section">

<div class="titlepage">

<div>

<div>

###### SQLState

</div>

</div>

</div>

Gets the five-character error code that follows the ANSI SQL standard
for the database.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`SQLState `</span>` ;`

<div id="id1672" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The five-character error code, which identifies the source of the error.

</div>

</div>

</div>

</div>

<div id="vcrvirterrcollclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoErrorCollection Class

</div>

</div>

</div>

Collects all errors generated by the Virtuoso .NET Data Provider. This
class cannot be inherited.

|                         |
|-------------------------|
| System.Object           |
| VirtuosoErrorCollection |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoErrorCollection
            implements, 
              ICollection
             {
}
```

<div id="id1675" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1676" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

This class is created by VirtuosoException to collect instances of the
VirtuosoError class. VirtuosoErrorCollection always contains at least
one instance of the VirtuosoError class.

</div>

<div id="id1683" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1679" class="section">

<div class="titlepage">

<div>

<div>

###### Count Property

</div>

</div>

</div>

Gets the number of errors in the collection.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`Count `</span>` ;`

<div id="id1677" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The total number of errors in the collection.

</div>

<div id="id1678" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

ICollection.Count

</div>

</div>

<div id="id1682" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property

</div>

</div>

</div>

Gets the error at the specified index.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoError `</span>` `<span class="varname">`this[int i] `</span>` ;`

<div id="id1680" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">i</span>  
The zero-based index of the error to retrieve.

</div>

</div>

<div id="id1681" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

A VirtuosoError that contains the error at the specified index.

</div>

</div>

</div>

<div id="id1688" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1686" class="section">

<div class="titlepage">

<div>

<div>

###### CopyTo Method

</div>

</div>

</div>

Copies the elements of the VirtuosoErrorCollection into an array,
starting at the given index within the array.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`CopyTo`</span>`(`<span class="methodparam">` `<span class="type">`Array `</span>` `<span class="parameter">`array`</span>` `</span>`,`  
`                   `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`i`</span>` `</span>`);`

<div id="id1684" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">array</span>  
The array into which to copy the elements.

<span class="term">i</span>  
The starting index of array.

</div>

</div>

<div id="id1685" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

ICollection.CopyTo

</div>

</div>

<div id="id1687" class="section">

<div class="titlepage">

<div>

<div>

###### GetEnumerator Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`IEnumerable `</span><span class="methodname">`IEnumerable.GetEnumerator`</span>`();`

</div>

</div>

</div>

<div id="vcrvirtexcepclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoException Class

</div>

</div>

</div>

The exception that is thrown when Virtuoso server returns a warning or
error. This class cannot be inherited.

|                        |
|------------------------|
| System.Object          |
| System.Exception       |
| System.SystemException |
| VirtuosoException      |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoException
             extends, 
              SystemException
             {
}
```

<div id="id1689" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1690" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

This class is created whenever the Virtuoso .NET Data Provider
encounters an error generated by the server (Client-side errors are
raised as standard common language runtime exceptions.). It always
contains at least one instance of VirtuosoError.

</div>

<div id="id1697" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1693" class="section">

<div class="titlepage">

<div>

<div>

###### Errors Property

</div>

</div>

</div>

Gets a collection of one or more VirtuosoError objects that give
detailed information about exceptions generated by the Virtuoso .NET
Data Provider.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoErrorCollection `</span>` `<span class="varname">`Errors `</span>` ;`

<div id="id1691" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The collected instances of the VirtuosoError class.

</div>

<div id="id1692" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

This property is a wrapper for the VirtuosoErrorCollection.

</div>

</div>

<div id="id1696" class="section">

<div class="titlepage">

<div>

<div>

###### Message Property

</div>

</div>

</div>

Gets the text describing the error.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`Message `</span>` ;`

<div id="id1694" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The text describing the error.

</div>

<div id="id1695" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

This is a wrapper for the Message property of the first VirtuosoError in
the Errors property.

</div>

</div>

</div>

</div>

<div id="vcrvirtinfmsgevtargclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoInfoMessageEventArgs Class

</div>

</div>

</div>

Provides data for the InfoMessage event. This class cannot be inherited.

|                              |
|------------------------------|
| System.Object                |
| System.EventArgs             |
| VirtuosoInfoMessageEventArgs |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoInfoMessageEventArgs
             extends, 
              EventArgs
             {
}
```

<div id="id1698" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1699" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The InfoMessage event contains a VirtuosoErrorCollection collection with
warnings sent from the Virtuoso srver.

</div>

<div id="id1702" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1701" class="section">

<div class="titlepage">

<div>

<div>

###### Errors Property

</div>

</div>

</div>

Gets the collection of warnings sent from the Virtuoso server.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoErrorCollection `</span>` `<span class="varname">`Errors `</span>` ;`

<div id="id1700" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The collection of warnings sent from the server.

</div>

</div>

</div>

</div>

<div id="vcrvirtinfmsgevthndlrdel" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoInfoMessageEventHandler Delegate

</div>

</div>

</div>

Represents the method that will handle the InfoMessage event of a
VirtuosoConnection.

<span class="modifier">`public `</span><span class="modifier">`delegate `</span><span class="void">`void `</span><span class="methodname">`VirtuosoInfoMessageEventHandler`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`sender`</span>` `</span>`,`  
`                                                     `<span class="methodparam">` `<span class="type">`VirtuosoInfoMessageEventArgs `</span>` `<span class="parameter">`e`</span>` `</span>`);`

<div id="id1703" class="section">

<div class="titlepage">

<div>

<div>

##### Parameters

</div>

</div>

</div>

The declaration of your event handler must have the same parameters as
the VirtuosoInfoMessageEventHandler delegate declaration.

<div class="variablelist">

<span class="term">sender</span>  
The source of the event.

<span class="term">e</span>  
A VirtuosoInfoMessageEventArgs object that contains the event data.

</div>

</div>

<div id="id1704" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

When you create a VirtuosoInfoMessageEventArgs delegate, you identify
the method that will handle the event. To associate the event with your
event handler, add an instance of the delegate to the event. The event
handler is called whenever the event occurs, unless you remove the
delegate. For more information about event handler delegates, see
"Events and Delegates" in the .NET Framework SDK documentation.

</div>

</div>

<div id="vcrvirtparamclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoParameter Class

</div>

</div>

</div>

Represents a parameter to an VirtuosoCommand and optionally, its mapping
to a DataColumn. This class cannot be inherited.

|                           |
|---------------------------|
| System.Object             |
| System.MarshalByRefObject |
| VirtuosoParameter         |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoParameter
             extends, 
              MarshalByRefObject
            
    implements, 
              IDbDataParameter
            , 
              IDataParameter
            , 
              ICloneable
             {
}
```

<div id="id1705" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1722" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoParameter Constructor

</div>

</div>

</div>

<div id="id1706" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoParameter Constructor ()

</div>

</div>

</div>

Initializes a new instance of the VirtuosoParameter class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoParameter`</span>`();`

</div>

<div id="id1709" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoParameter Constructor (string, object)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoParameter class with the
parameter name and value.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoParameter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`object`</span>` `</span>`);`

<div id="id1707" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to map.

<span class="term">value</span>  
An Object that is the value of the VirtuosoParameter.

</div>

</div>

<div id="id1708" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When you specify an Object in the value parameter, the VirtDbType is
inferred from the .NET Framework type of the Object.

</div>

</div>

<div id="id1712" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoParameter Constructor (string, VirtDbType)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoParameter class with the
parameter name and the data type.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoParameter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`);`

<div id="id1710" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to map.

<span class="term">dbType</span>  
One of the VirtDbType values.

</div>

</div>

<div id="id1711" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The data type, and if appropriate, Size and Precision are inferred from
the value of the dbType parameter.

</div>

</div>

<div id="id1715" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoParameter Constructor (string, VirtDbType, int)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoParameter class with the
parameter name, the VirtDbType, and the size.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoParameter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`size`</span>` `</span>`);`

<div id="id1713" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to map.

<span class="term">dbType</span>  
One of the VirtDbType values.

<span class="term">size</span>  
The width of the parameter.

</div>

</div>

<div id="id1714" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Size is inferred from the value of the dbType parameter if it is not
explicitly set in the size parameter.

</div>

</div>

<div id="id1718" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoParameter Constructor (string, VirtDbType, int, string)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoParameter class with the
parameter name, VirtDbType, size, and source column name.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoParameter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`size`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`sourceColumn`</span>` `</span>`);`

<div id="id1716" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to map.

<span class="term">dbType</span>  
One of the VirtDbType values.

<span class="term">size</span>  
The width of the parameter.

<span class="term">sourceColumn</span>  
The name of the source column.

</div>

</div>

<div id="id1717" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Size is inferred from the value of the dbType parameter if it is not
explicitly set in the size parameter.

</div>

</div>

<div id="id1721" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoParameter Constructor (string, VirtDbType, int, ParameterDirection, Boolean, Byte, Byte, String, DataRowVersion, Object)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoParameter class with the
parameter name, the type of the parameter, the size of the parameter, a
ParameterDirection, the precision of the parameter, the scale of the
parameter, the source column, a DataRowVersion to use, and the value of
the parameter.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoParameter`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`size`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`ParameterDirection `</span>` `<span class="parameter">`direction`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`bool `</span>` `<span class="parameter">`isNullable`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`byte `</span>` `<span class="parameter">`precision`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`byte `</span>` `<span class="parameter">`scale`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`sourceColumn`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`DataRowVersion `</span>` `<span class="parameter">`sourceVersion`</span>` `</span>`,`  
`                         `<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1719" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to map.

<span class="term">dbType</span>  
One of the VirtDbType values.

<span class="term">size</span>  
The width of the parameter.

<span class="term">direction</span>  
One of the System.Data.ParameterDirection values.

<span class="term">isNullable</span>  
`true` if the value of the field can be null, otherwise `false` .

<span class="term">precision</span>  
The total number of digits to the left and right of the decimal point to
which Value is resolved.

<span class="term">scale</span>  
The total number of decimal places to which Value is resolved.

<span class="term">sourceColumn</span>  
The name of the source column.

<span class="term">sourceVersion</span>  
One of the System.Data.DataRowVersion values.

<span class="term">value</span>  
An Object that is the value of the VirtuosoParameter.

</div>

</div>

<div id="id1720" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Size and Precision are inferred from the value of the dbType
parameter if they are not explicitly set in the size and precision
parameters.

</div>

</div>

</div>

<div id="id1766" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1726" class="section">

<div class="titlepage">

<div>

<div>

###### DbType Property

</div>

</div>

</div>

Gets or sets the DbType of the parameter.

` `<span class="modifier">`public `</span>` `<span class="type">`DbType `</span>` `<span class="varname">`DbType `</span>` ;`

<div id="id1723" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

One of the System.Data.DbType values. The default is String.

</div>

<div id="id1724" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.DbType

</div>

<div id="id1725" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The VirtDbType and DbType are linked. Therefore, setting the DbType
changes the VirtDbType to a supporting VirtDbType.

For a list of the supported data types, see the appropriate VirtDbType
member.

</div>

</div>

<div id="id1730" class="section">

<div class="titlepage">

<div>

<div>

###### Direction Property

</div>

</div>

</div>

Gets or sets a value indicating whether the parameter is input-only,
output-only, bidirectional, or a stored procedure return value
parameter.

` `<span class="modifier">`public `</span>` `<span class="type">`ParameterDirection `</span>` `<span class="varname">`Direction `</span>` ;`

<div id="id1727" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

One of the System.Data.ParameterDirection values. The default is Input.

</div>

<div id="id1728" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.Direction

</div>

<div id="id1729" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

If the ParameterDirection is Output, and execution of the associated
VirtuosoCommand does not return a value, the VirtuosoParameter will
contain a null value. Null values are handled using the DBNull class.
After the last row from the last resultset is read, the Output,
InputOut, and ReturnValue parameters are updated.

</div>

</div>

<div id="id1734" class="section">

<div class="titlepage">

<div>

<div>

###### IsNullable Property

</div>

</div>

</div>

Gets or sets a value indicating whether the parameter accepts null
values.

` `<span class="modifier">`public `</span>` `<span class="type">`bool `</span>` `<span class="varname">`IsNullable `</span>` ;`

<div id="id1731" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

`true` if null values are accepted; otherwise, `false` . The default is
`false` .

</div>

<div id="id1732" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.IsNullable

</div>

<div id="id1733" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Null values are handled using the System.DBNull class.

</div>

</div>

<div id="id1738" class="section">

<div class="titlepage">

<div>

<div>

###### ParameterName Property

</div>

</div>

</div>

Gets or sets the name of the VirtuosoParameter.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`ParameterName `</span>` ;`

<div id="id1735" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The name of the VirtuosoParameter. The default is an empty string ("").

</div>

<div id="id1736" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.ParameterName

</div>

<div id="id1737" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Instead of named parameters, the Virtuoso .NET Data Provider uses
positional parameters that are marked with a question mark (?) in the
syntax of the command text. Parameter objects in the
VirtuosoParameterCollection and the actual parameters accepted by the
stored procedure or parameterized SQL statement correspond to each other
based on the order in which the VirtuosoParameter objects are inserted
into the collection rather than by parameter name. Parameter names can
be supplied, but will be ignored during parameter object binding.

</div>

</div>

<div id="id1742" class="section">

<div class="titlepage">

<div>

<div>

###### Precision Property

</div>

</div>

</div>

Gets or sets the maximum number of digits used to represent the Value
property.

` `<span class="modifier">`public `</span>` `<span class="type">`byte `</span>` `<span class="varname">`Precision `</span>` ;`

<div id="id1739" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The maximum number of digits used to represent the Value property. The
default value is 0.

</div>

<div id="id1740" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbDataParameter.Precision

</div>

<div id="id1741" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Precision property is used only for decimal and numeric input
parameters.

</div>

</div>

<div id="id1746" class="section">

<div class="titlepage">

<div>

<div>

###### Scale Property

</div>

</div>

</div>

Gets or sets the number of decimal places to which Value is resolved.

` `<span class="modifier">`public `</span>` `<span class="type">`byte `</span>` `<span class="varname">`Scale `</span>` ;`

<div id="id1743" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The number of decimal places to which Value is resolved. The default is
0.

</div>

<div id="id1744" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbDataParameter.Scale

</div>

<div id="id1745" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Scale property is used only for decimal and numeric input
parameters.

</div>

</div>

<div id="id1750" class="section">

<div class="titlepage">

<div>

<div>

###### Size Property

</div>

</div>

</div>

Gets or sets the maximum size, in bytes, of the data within the column.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`Size `</span>` ;`

<div id="id1747" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The maximum size, in bytes, of the data within the column. The default
value is inferred from the parameter value.

</div>

<div id="id1748" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbDataParameter.Size

</div>

<div id="id1749" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The Size property is used for binary and string types.

For variable-length data types, the Size property describes the maximum
amount of data to transmit to the server. For example, for a string
value, the Size property could be used to limit the amount of data sent
to the server to the first one hundred bytes.

For nonstring data types and ANSI string data, the Size property refers
to the number of bytes. For Unicode string data, the Size property
refers to the number of characters. The count for strings does not
include the terminating character.

If not explicitly set, the value of Size is inferred from the actual
size of the specified parameter value.

For fixed-width data types, the value of Size is ignored. It can be
retrieved for informational purposes, and returns the maximum amount of
bytes the provider uses when transmitting the value of the parameter to
the server.

</div>

</div>

<div id="id1754" class="section">

<div class="titlepage">

<div>

<div>

###### SourceColumn Property

</div>

</div>

</div>

Gets or sets the name of the source column mapped to the DataSet and
used for loading or returning the Value.

` `<span class="modifier">`public `</span>` `<span class="type">`string `</span>` `<span class="varname">`SourceColumn `</span>` ;`

<div id="id1751" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The name of the source column that will be used to set the value of this
parameter. The default is an empty string ("").

</div>

<div id="id1752" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.SourceColumn

</div>

<div id="id1753" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

When SourceColumn is set to anything other than an empty string, the
value of the parameter is retrieved from the column with the
SourceColumn name. If Direction is set to Input, the value is taken from
the DataSet. If Direction is set to Output, the value is taken from the
data source. A Direction of InputOutput is a combination of both.

</div>

</div>

<div id="id1758" class="section">

<div class="titlepage">

<div>

<div>

###### SourceVersion Property

</div>

</div>

</div>

Gets or sets the DataRowVersion to use when loading Value.

` `<span class="modifier">`public `</span>` `<span class="type">`DataRowVersion `</span>` `<span class="varname">`DataRowVersion `</span>` ;`

<div id="id1755" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

One of the System.Data.DataRowVersion values. The default is Current.

</div>

<div id="id1756" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.SourceVersion

</div>

<div id="id1757" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The SourceVersion is used by UpdateCommand during an Update operation to
determine whether the parameter value is set to Current or Original.
This allows primary keys to be updated. This property is ignored by
InsertCommand and DeleteCommand.

This property is set to the version of the DataRow used by either the
Item property (DataRow indexer), or the GetChildRows method of the
DataRow object.

</div>

</div>

<div id="id1762" class="section">

<div class="titlepage">

<div>

<div>

###### Value Property

</div>

</div>

</div>

Gets or sets the value of the parameter.

` `<span class="modifier">`public `</span>` `<span class="type">`object `</span>` `<span class="varname">`Value `</span>` ;`

<div id="id1759" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

An Object that is the value of the parameter. The default value is null.

</div>

<div id="id1760" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameter.Value

</div>

<div id="id1761" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

For input parameters, the value is bound to the VirtuosoCommand that is
sent to the server. For output and return-value parameters, the value is
set on completion of the VirtuosoCommand and after the
VirtuosoDataReader is closed.

When sending a null parameter value to the server, the user must specify
DBNull, not null. A null value in the system is an empty object that has
no value. DBNull is used to represent null values.

If the application specifies the database type, the bound value is
converted to that type when the provider sends the data to the server.
The provider attempts to convert any type of value if it supports the
IConvertible interface. Conversion errors may result if the specified
type is not compatible with the value.

Both the DbType and VirtDbType properties can be inferred by setting
Value. If applicable, the size, precision and scale will also be
inferred from Value.

The Value property is overwritten by the Update method.

</div>

</div>

<div id="id1765" class="section">

<div class="titlepage">

<div>

<div>

###### VirtDbType Property

</div>

</div>

</div>

Gets or sets the VirtDbType of the parameter.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtDbType `</span>` `<span class="varname">`VirtDbType `</span>` ;`

<div id="id1763" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

One of the VirtDbType values. The default is NVarChar.

</div>

<div id="id1764" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The VirtDbType and DbType are linked. Therefore, setting the DbType
changes the VirtDbType to a supporting VirtDbType.

For a list of the supported data types, see the appropriate VirtDbType
member. For more information, see "Using Parameters with a DataAdapter"
in the Microsoft® .NET Framework SDK documentation.

</div>

</div>

</div>

<div id="id1770" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1767" class="section">

<div class="titlepage">

<div>

<div>

###### ICloneable.Clone Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="type">`object `</span><span class="methodname">`ICloneable.Clone`</span>`();`

</div>

<div id="id1769" class="section">

<div class="titlepage">

<div>

<div>

###### ToString Method

</div>

</div>

</div>

Gets a string containing the ParameterName.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`string `</span><span class="methodname">`ToString`</span>`();`

<div id="id1768" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A string containing the ParameterName.

</div>

</div>

</div>

</div>

<div id="vcrvirtparamcollclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoParameterCollection Class

</div>

</div>

</div>

Represents a collection of parameters relevant to a VirtuosoCommand as
well as their respective mappings to columns in a DataSet. This class
cannot be inherited.

|                             |
|-----------------------------|
| System.Object               |
| System.MarshalByRefObject   |
| VirtuosoParameterCollection |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoParameterCollection
             extends, 
              MarshalByRefObject
            
    implements, 
              IDataParameterCollection
            , 
              ICollection
            , 
              IEnumerable
            , 
              IList
             {
}
```

<div id="id1771" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1782" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1774" class="section">

<div class="titlepage">

<div>

<div>

###### Count Property

</div>

</div>

</div>

Gets the number of VirtuosoParameter objects in the collection.

` `<span class="modifier">`public `</span>` `<span class="type">`int `</span>` `<span class="varname">`Count `</span>` ;`

<div id="id1772" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The number of VirtuosoParameter objects in the collection.

</div>

<div id="id1773" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

ICollection.Count

</div>

</div>

<div id="id1781" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property

</div>

</div>

</div>

<div id="id1777" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property (int)

</div>

</div>

</div>

Gets or sets the VirtuosoParameter at the specified index.

` `<span class="modifier">`public `</span>` `<span class="type">`object `</span>` `<span class="varname">`this[int i] `</span>` ;`

<div id="id1775" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">index</span>  
The zero-based index of the parameter to retrieve.

</div>

</div>

<div id="id1776" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The VirtuosoParameter at the specified index.

</div>

</div>

<div id="id1780" class="section">

<div class="titlepage">

<div>

<div>

###### Item Property (string)

</div>

</div>

</div>

Gets or sets the VirtuosoParameter with the specified name.

` `<span class="modifier">`public `</span>` `<span class="type">`object `</span>` `<span class="varname">`this[string parameterName] `</span>` ;`

<div id="id1778" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to retrieve.

</div>

</div>

<div id="id1779" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The VirtuosoParameter with the specified name.

</div>

</div>

</div>

</div>

<div id="id1840" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1802" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method

</div>

</div>

</div>

<div id="id1786" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method (object)

</div>

</div>

</div>

Adds the specified VirtuosoParameter object to the
VirtuosoParameterCollection.

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`Add`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1783" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
The VirtuosoParameter to add to the collection.

</div>

</div>

<div id="id1784" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The index in the collection of the new VirtuosoParameter object.

</div>

<div id="id1785" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.Add

</div>

</div>

<div id="id1789" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method (VirtuosoParameter)

</div>

</div>

</div>

Adds the specified VirtuosoParameter object to the
VirtuosoParameterCollection.

<span class="modifier">`public `</span><span class="type">`VirtuosoParameter `</span><span class="methodname">`Add`</span>`(`<span class="methodparam">` `<span class="type">`VirtuosoParameter `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1787" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
The VirtuosoParameter to add to the collection.

</div>

</div>

<div id="id1788" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A reference to the new VirtuosoParameter object.

</div>

</div>

<div id="id1792" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method (string, object)

</div>

</div>

</div>

Adds a VirtuosoParameter to the VirtuosoParameterCollection with the
specified parameter name and value.

<span class="modifier">`public `</span><span class="type">`VirtuosoParameter `</span><span class="methodname">`Add`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1790" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter.

<span class="term">value</span>  
The Value of the VirtuosoParameter to add to the collection.

</div>

</div>

<div id="id1791" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The new VirtuosoParameter object.

</div>

</div>

<div id="id1795" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method (string, VirtDbType)

</div>

</div>

</div>

Adds a VirtuosoParameter to the VirtuosoParameterCollection with the
specified parameter name and data type.

<span class="modifier">`public `</span><span class="type">`VirtuosoParameter `</span><span class="methodname">`Add`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`);`

<div id="id1793" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter.

<span class="term">value</span>  
One of the VirtDbType values.

</div>

</div>

<div id="id1794" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The new VirtuosoParameter object.

</div>

</div>

<div id="id1798" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method (string, VirtDbType, int)

</div>

</div>

</div>

Adds a VirtuosoParameter to the VirtuosoParameterCollection with the
specified parameter name, data type, and parameter size.

<span class="modifier">`public `</span><span class="type">`VirtuosoParameter `</span><span class="methodname">`Add`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`size`</span>` `</span>`);`

<div id="id1796" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter.

<span class="term">value</span>  
One of the VirtDbType values.

<span class="term">size</span>  
The size of the parameter (width of the column).

</div>

</div>

<div id="id1797" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The new VirtuosoParameter object.

</div>

</div>

<div id="id1801" class="section">

<div class="titlepage">

<div>

<div>

###### Add Method (string, VirtDbType, int, string)

</div>

</div>

</div>

Adds a VirtuosoParameter to the VirtuosoParameterCollection with the
specified parameter name, data type, parameter size, and source column
name.

<span class="modifier">`public `</span><span class="type">`VirtuosoParameter `</span><span class="methodname">`Add`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`VirtDbType `</span>` `<span class="parameter">`dbType`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`size`</span>` `</span>`,`  
`                             `<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`sourceColumn`</span>` `</span>`);`

<div id="id1799" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter.

<span class="term">value</span>  
One of the VirtDbType values.

<span class="term">size</span>  
The size of the parameter (width of the column).

<span class="term">sourceColumn</span>  
The name of the source column.

</div>

</div>

<div id="id1800" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The new VirtuosoParameter object.

</div>

</div>

</div>

<div id="id1804" class="section">

<div class="titlepage">

<div>

<div>

###### Clear Method

</div>

</div>

</div>

Removes all items from the collection.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Clear`</span>`();`

<div id="id1803" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.Clear

</div>

</div>

<div id="id1813" class="section">

<div class="titlepage">

<div>

<div>

###### Contains Method

</div>

</div>

</div>

<div id="id1808" class="section">

<div class="titlepage">

<div>

<div>

###### Contains Method (object)

</div>

</div>

</div>

Gets a value indicating whether a VirtuosoParameter object exists in the
collection.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`Contains`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1805" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
The value of the VirtuosoParameter object to find.

</div>

</div>

<div id="id1806" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if the collection contains the VirtuosoParameter; otherwise,
`false` .

</div>

<div id="id1807" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.Contains

</div>

</div>

<div id="id1812" class="section">

<div class="titlepage">

<div>

<div>

###### Contains Method (string)

</div>

</div>

</div>

Gets a value indicating whether a VirtuosoParameter object with the
specified parameter name exists in the collection.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`Contains`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`);`

<div id="id1809" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the VirtuosoParameter object to find.

</div>

</div>

<div id="id1810" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if the collection contains the VirtuosoParameter; otherwise,
`false` .

</div>

<div id="id1811" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameterCollection.Contains

</div>

</div>

</div>

<div id="id1816" class="section">

<div class="titlepage">

<div>

<div>

###### CopyTo Method

</div>

</div>

</div>

Copies VirtuosoParameter objects from the VirtuosoParameterCollection to
the specified array.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`CopyTo`</span>`(`<span class="methodparam">` `<span class="type">`Array `</span>` `<span class="parameter">`array`</span>` `</span>`,`  
`                   `<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`index`</span>` `</span>`);`

<div id="id1814" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">array</span>  
The array into which to copy the VirtuosoParameter objects.

<span class="term">index</span>  
The starting index of the array.

</div>

</div>

<div id="id1815" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

ICollection.CopyTo

</div>

</div>

<div id="id1817" class="section">

<div class="titlepage">

<div>

<div>

###### GetEnumerator Method

</div>

</div>

</div>

This member supports the Microsoft® .NET Framework infrastructure and is
not intended to be used directly from your code.

<span class="modifier">`public `</span><span class="type">`IEnumerator `</span><span class="methodname">`GetEnumerator`</span>`();`

</div>

<div id="id1826" class="section">

<div class="titlepage">

<div>

<div>

###### IndexOf Method

</div>

</div>

</div>

<div id="id1821" class="section">

<div class="titlepage">

<div>

<div>

###### IndexOf Method (object)

</div>

</div>

</div>

Gets the location in the collection of a VirtuosoParameter object.

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`IndexOf`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1818" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
The VirtuosoParameter object to find.

</div>

</div>

<div id="id1819" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The zero-based location of the VirtuosoParameter in the collection.

</div>

<div id="id1820" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.IndexOf

</div>

</div>

<div id="id1825" class="section">

<div class="titlepage">

<div>

<div>

###### IndexOf Method (string)

</div>

</div>

</div>

Gets the location in the collection of the VirtuosoParameter object with
the specified parameter name.

<span class="modifier">`public `</span><span class="type">`int `</span><span class="methodname">`IndexOf`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`);`

<div id="id1822" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the VirtuosoParameter object to find.

</div>

</div>

<div id="id1823" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

The zero-based location of the VirtuosoParameter in the collection.

</div>

<div id="id1824" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameterCollection.IndexOf

</div>

</div>

</div>

<div id="id1829" class="section">

<div class="titlepage">

<div>

<div>

###### Insert Method

</div>

</div>

</div>

Inserts a VirtuosoParameter into the collection at the specified index.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Insert`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`index`</span>` `</span>`,`  
`                   `<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1827" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">index</span>  
The zero-based index where the parameter is to be inserted within the
collection.

<span class="term">value</span>  
The VirtuosoParameter to add to the collection.

</div>

</div>

<div id="id1828" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.Insert

</div>

</div>

<div id="id1832" class="section">

<div class="titlepage">

<div>

<div>

###### Remove Method

</div>

</div>

</div>

Removes the specified VirtuosoParameter from the collection.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Remove`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`value`</span>` `</span>`);`

<div id="id1830" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">value</span>  
The VirtuosoParameter object to remove from the collection.

</div>

</div>

<div id="id1831" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.Remove

</div>

</div>

<div id="id1839" class="section">

<div class="titlepage">

<div>

<div>

###### RemoveAt Method

</div>

</div>

</div>

<div id="id1835" class="section">

<div class="titlepage">

<div>

<div>

###### RemoveAt Method (int)

</div>

</div>

</div>

Removes the VirtuosoParameter at the specified index from the
collection.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`RemoveAt`</span>`(`<span class="methodparam">` `<span class="type">`int `</span>` `<span class="parameter">`index`</span>` `</span>`);`

<div id="id1833" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">index</span>  
The zero-based index of the parameter to remove.

</div>

</div>

<div id="id1834" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IList.RemoveAt

</div>

</div>

<div id="id1838" class="section">

<div class="titlepage">

<div>

<div>

###### RemoveAt Method (string)

</div>

</div>

</div>

Removes the VirtuosoParameter with the specified name from the
collection.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`RemoveAt`</span>`(`<span class="methodparam">` `<span class="type">`string `</span>` `<span class="parameter">`parameterName`</span>` `</span>`);`

<div id="id1836" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">parameterName</span>  
The name of the parameter to remove.

</div>

</div>

<div id="id1837" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDataParameterCollection.RemoveAt

</div>

</div>

</div>

</div>

</div>

<div id="vcrvirtpermclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoPermission Class

</div>

</div>

</div>

Provides the capability for the Virtuoso .NET Data Provider to ensure
that a user has a security level adequate to access a data source. This
class cannot be inherited.

|                                      |
|--------------------------------------|
| System.Object                        |
| System.Security.CodeAccessPermission |
| VirtuosoPermission                   |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoPermission
             extends, 
              CodeAccessPermission
            
    implements, 
              IUnrestrictedPermission
             {
}
```

<div id="id1841" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1845" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoPermission Constructor

</div>

</div>

</div>

<div id="id1842" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoPermission Constructor ()

</div>

</div>

</div>

Initializes a new instance of the VirtuosoPermission class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoPermission`</span>`();`

</div>

<div id="id1844" class="section">

<div class="titlepage">

<div>

<div>

###### VirtuosoPermission Constructor (PermissionState)

</div>

</div>

</div>

Initializes a new instance of the VirtuosoPermission class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoPermission`</span>`(`<span class="methodparam">` `<span class="type">`PermissionState `</span>` `<span class="parameter">`state`</span>` `</span>`);`

<div id="id1843" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">state</span>  
One of the System.Security.Permissions.PermissionState values.

</div>

</div>

</div>

</div>

<div id="id1873" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1849" class="section">

<div class="titlepage">

<div>

<div>

###### Copy Method

</div>

</div>

</div>

Creates and returns an identical copy of the current permission object.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`IPermission `</span><span class="methodname">`Copy`</span>`();`

<div id="id1846" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A copy of the current permission object.

</div>

<div id="id1847" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IPermission.Copy

</div>

<div id="id1848" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

A copy of a permission object represents the same access to resources as
the original permission object.

</div>

</div>

<div id="id1852" class="section">

<div class="titlepage">

<div>

<div>

###### FromXml Method

</div>

</div>

</div>

Reconstructs a security object with a specified state from an XML
encoding.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="void">`void `</span><span class="methodname">`FromXml`</span>`(`<span class="methodparam">` `<span class="type">`SecurityElement `</span>` `<span class="parameter">`securityElement`</span>` `</span>`);`

<div id="id1850" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">securityElement</span>  
The XML encoding to use to reconstruct the security object.

</div>

</div>

<div id="id1851" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

ISecurityEncodable.FromXml

</div>

</div>

<div id="id1857" class="section">

<div class="titlepage">

<div>

<div>

###### Intersect Method

</div>

</div>

</div>

Returns a new permission object representing the intersection of the
current permission object and the specified permission object.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`IPermission `</span><span class="methodname">`Intersect`</span>`(`<span class="methodparam">` `<span class="type">`IPermission `</span>` `<span class="parameter">`target`</span>` `</span>`);`

<div id="id1853" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">target</span>  
A permission object to intersect with the current permission object. It
must be of the same type as the current permission object.

</div>

</div>

<div id="id1854" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A new permission object that represents the intersection of the current
permission object and the specified permission object. This new
permission object is a null reference (Nothing in Visual Basic) if the
intersection is empty.

</div>

<div id="id1855" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IPermission.Intersect

</div>

<div id="id1856" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The intersection of two permissions is a permission that describes the
set of operations they both describe in common. Only a demand that
passes both original permissions will pass the intersection.

</div>

</div>

<div id="id1862" class="section">

<div class="titlepage">

<div>

<div>

###### IsSubsetOf Method

</div>

</div>

</div>

Returns a value indicating whether the current permission object is a
subset of the specified permission object.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`bool `</span><span class="methodname">`IsSubsetOf`</span>`(`<span class="methodparam">` `<span class="type">`IPermission `</span>` `<span class="parameter">`target`</span>` `</span>`);`

<div id="id1858" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">target</span>  
A permission object that is to be tested for the subset relationship.
This object must be of the same type as the current permission object.

</div>

</div>

<div id="id1859" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if the current permission object is a subset of the specified
permission object; otherwise `false` .

</div>

<div id="id1860" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IPermission.IsSubsetOf

</div>

<div id="id1861" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The current permission object is a subset of the specified permission
object if the current permission object specifies a set of operations
that is wholly contained by the specified permission object. For
example, a permission that represents access to C:\example.txt is a
subset of a permission that represents access to C:\\ If this method
returns true, the current permission object represents no more access to
the protected resource than does the specified permission object.

</div>

</div>

<div id="id1865" class="section">

<div class="titlepage">

<div>

<div>

###### IsUnrestricted Method

</div>

</div>

</div>

Returns a value indicating whether the permission can be represented as
unrestricted without any knowledge of the permission semantics.

<span class="modifier">`public `</span><span class="type">`bool `</span><span class="methodname">`IsUnrestricted`</span>`();`

<div id="id1863" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

`true` if the VirtuosoPermission instance was created with
PermissionState.Unrestricted; otherwise, `false` .

</div>

<div id="id1864" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IUnrestrictedPermission.IsUnrestricted

</div>

</div>

<div id="id1868" class="section">

<div class="titlepage">

<div>

<div>

###### ToXml Method

</div>

</div>

</div>

Creates an XML encoding of the security object and its current state.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`SecurityElement `</span><span class="methodname">`ToXml`</span>`();`

<div id="id1866" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

An XML encoding of the security object, including any state information.

</div>

<div id="id1867" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

ISecurityEncodable.ToXml

</div>

</div>

<div id="id1872" class="section">

<div class="titlepage">

<div>

<div>

###### Union Method

</div>

</div>

</div>

Creates a permission that is the union of the permission and the
specified permission.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`IPermission `</span><span class="methodname">`Union`</span>`(`<span class="methodparam">` `<span class="type">`IPermission `</span>` `<span class="parameter">`target`</span>` `</span>`);`

<div id="id1869" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">target</span>  
A permission to combine with the current permission. It must be of the
same type as the current permission.

</div>

</div>

<div id="id1870" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A new permission that represents the union of the current permission and
the specified permission.

</div>

<div id="id1871" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The result of a call to Union is a permission that represents all the
operations represented by both the current permission and the specified
permission. Any demand that passes either permission passes their union.

</div>

</div>

</div>

</div>

<div id="vcrvirtpermattr" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoPermissionAttribute

</div>

</div>

</div>

Allows security actions for VirtuosoPermission to be applied to code
using declarative security. This class cannot be inherited.

|                                                         |
|---------------------------------------------------------|
| System.Object                                           |
| System.Attribute                                        |
| System.Security.Permissions.SecurityAttribute           |
| System.Security.Permissions.CodeAccessSecurityAttribute |
| VirtuosoPermissionAttribute                             |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoPermissionAttribute
             extends, 
              CodeAccessSecurityAttribute
             {
}
```

<div id="id1874" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1876" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoPermissionAttribute Constructor

</div>

</div>

</div>

Initializes a new instance of the VirtuosoPermissionAttribute class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoPermissionAttribute`</span>`();`

<div id="id1875" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">action</span>  
One of the SecurityAction values representing an action that can be
performed using declarative security.

</div>

</div>

</div>

<div id="id1879" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1878" class="section">

<div class="titlepage">

<div>

<div>

###### CreatePermission Method

</div>

</div>

</div>

Returns a VirtuosoPermission object that is configured according to the
attribute properties.

<span class="modifier">`public `</span><span class="modifier">`override `</span><span class="type">`IPermission `</span><span class="methodname">`CreatePermission`</span>`();`

<div id="id1877" class="section">

<div class="titlepage">

<div>

<div>

###### Return Value

</div>

</div>

</div>

A VirtuosoPermission object.

</div>

</div>

</div>

</div>

<div id="vcrvirtrowupdevtargclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoRowUpdatedEventArgs Class

</div>

</div>

</div>

Provides data for the RowUpdated event. This class cannot be inherited.

|                                        |
|----------------------------------------|
| System.Object                          |
| System.EventArgs                       |
| System.Data.Common.RowUpdatedEventArgs |
| VirtuosoRowUpdatedEventArgs            |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoRowUpdatedEventArgs
             extends, 
              RowUpdatedEventArgs
             {
}
```

<div id="id1880" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1882" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoRowUpdatedEventArgs Constructor

</div>

</div>

</div>

Initializes a new instance of the VirtuosoRowUpdatedEventArgs class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoRowUpdatedEventArgs`</span>`(`<span class="methodparam">` `<span class="type">`DataRow `</span>` `<span class="parameter">`row`</span>` `</span>`,`  
`                                   `<span class="methodparam">` `<span class="type">`IDbCommand `</span>` `<span class="parameter">`command`</span>` `</span>`,`  
`                                   `<span class="methodparam">` `<span class="type">`StatementType `</span>` `<span class="parameter">`statementType`</span>` `</span>`,`  
`                                   `<span class="methodparam">` `<span class="type">`DataTableMapping `</span>` `<span class="parameter">`tableMapping`</span>` `</span>`);`

<div id="id1881" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">row</span>  
The DataRow sent through an Update.

<span class="term">command</span>  
The IDbCommand executed when Update is called.

<span class="term">statementType</span>  
One of the StatementType values that specifies the type of query
executed.

<span class="term">tableMapping</span>  
The DataTableMapping sent through an Update.

</div>

</div>

</div>

<div id="id1885" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1884" class="section">

<div class="titlepage">

<div>

<div>

###### Command Property

</div>

</div>

</div>

Gets the VirtuosoCommand executed when Update is called.

` `<span class="modifier">`public `</span>` `<span class="modifier">`new `</span>` `<span class="type">`VirtuosoCommand `</span>` `<span class="varname">`Command `</span>` ;`

<div id="id1883" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The VirtuosoCommand executed when Update is called.

</div>

</div>

</div>

</div>

<div id="vcrvirtrowupdevthndlrdel" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoRowUpdatedEventHandler Delegate

</div>

</div>

</div>

Represents the method that will handle the RowUpdated event of a
VirtuosoDataAdapter.

<span class="modifier">`public `</span><span class="modifier">`delegate `</span><span class="void">`void `</span><span class="methodname">`VirtuosoRowUpdatedEventHandler`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`sender`</span>` `</span>`,`  
`                                                    `<span class="methodparam">` `<span class="type">`VirtuosoRowUpdatedEventArgs `</span>` `<span class="parameter">`e`</span>` `</span>`);`

<div id="id1886" class="section">

<div class="titlepage">

<div>

<div>

##### Parameters

</div>

</div>

</div>

The declaration of your event handler must have the same parameters as
the VirtuosoRowUpdatedEventHandler delegate declaration.

<div class="variablelist">

<span class="term">sender</span>  
The source of the event.

<span class="term">e</span>  
A VirtuosoRowUpdatedEventArgs object that contains the event data.

</div>

</div>

<div id="id1887" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The handler is not required perform any action, and your code should
avoid generating exceptions or allowing exceptions to propagate to the
calling method. Any exceptions that do reach the caller are ignored.
When you create a VirtuosoRowUpdatedEventHandler delegate, you identify
the method that will handle the event. To associate the event with your
event handler, add an instance of the delegate to the event. The event
handler is called whenever the event occurs, unless you remove the
delegate. For more information about event handler delegates, see
"Events and Delegates" in the .NET Framework SDK documentation.

</div>

</div>

<div id="vcrvirtrowupsevtargsclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoRowUpdatingEventArgs Class

</div>

</div>

</div>

Provides data for the RowUpdating event. This class cannot be inherited.

|                                         |
|-----------------------------------------|
| System.Object                           |
| System.EventArgs                        |
| System.Data.Common.RowUpdatingEventArgs |
| VirtuosoRowUpdatingEventArgs            |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoRowUpdatingEventArgs
             extends, 
              RowUpdatingEventArgs
             {
}
```

<div id="id1888" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1890" class="section">

<div class="titlepage">

<div>

<div>

##### VirtuosoRowUpdatingEventArgs Constructor

</div>

</div>

</div>

Initializes a new instance of the VirtuosoRowUpdatingEventArgs class.

<span class="modifier">`public `</span><span class="methodname">`VirtuosoRowUpdatingEventArgs`</span>`(`<span class="methodparam">` `<span class="type">`DataRow `</span>` `<span class="parameter">`row`</span>` `</span>`,`  
`                                    `<span class="methodparam">` `<span class="type">`IDbCommand `</span>` `<span class="parameter">`command`</span>` `</span>`,`  
`                                    `<span class="methodparam">` `<span class="type">`StatementType `</span>` `<span class="parameter">`statementType`</span>` `</span>`,`  
`                                    `<span class="methodparam">` `<span class="type">`DataTableMapping `</span>` `<span class="parameter">`tableMapping`</span>` `</span>`);`

<div id="id1889" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="variablelist">

<span class="term">row</span>  
The DataRow sent through an Update.

<span class="term">command</span>  
The IDbCommand executed when Update is called.

<span class="term">statementType</span>  
One of the StatementType values that specifies the type of query
executed.

<span class="term">tableMapping</span>  
The DataTableMapping sent through an Update.

</div>

</div>

</div>

<div id="id1893" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1892" class="section">

<div class="titlepage">

<div>

<div>

###### Command Property

</div>

</div>

</div>

Gets or sets the VirtuosoCommand executed when Update is called.

` `<span class="modifier">`public `</span>` `<span class="modifier">`new `</span>` `<span class="type">`VirtuosoCommand `</span>` `<span class="varname">`Command `</span>` ;`

<div id="id1891" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The VirtuosoCommand executed when Update is called.

</div>

</div>

</div>

</div>

<div id="vcrvirtrowupdingevthndlrdel" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoRowUpdatingEventHandler Delegate

</div>

</div>

</div>

Represents the method that will handle the RowUpdating event of a
VirtuosoDataAdapter.

<span class="modifier">`public `</span><span class="modifier">`delegate `</span><span class="void">`void `</span><span class="methodname">`VirtuosoRowUpdatingEventHandler`</span>`(`<span class="methodparam">` `<span class="type">`object `</span>` `<span class="parameter">`sender`</span>` `</span>`,`  
`                                                     `<span class="methodparam">` `<span class="type">`VirtuosoRowUpdatingEventArgs `</span>` `<span class="parameter">`e`</span>` `</span>`);`

<div id="id1894" class="section">

<div class="titlepage">

<div>

<div>

##### Parameters

</div>

</div>

</div>

The declaration of your event handler must have the same parameters as
the VirtuosoRowUpdatingEventHandler delegate declaration.

<div class="variablelist">

<span class="term">sender</span>  
The source of the event.

<span class="term">e</span>  
A VirtuosoRowUpdatingEventArgs object that contains the event data.

</div>

</div>

<div id="id1895" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The handler is not required perform any action, and your code should
avoid generating exceptions or allowing exceptions to propagate to the
calling method. Any exceptions that do reach the caller are ignored.
When you create a VirtuosoRowUpdatingEventHandler delegate, you identify
the method that will handle the event. To associate the event with your
event handler, add an instance of the delegate to the event. The event
handler is called whenever the event occurs, unless you remove the
delegate. For more information about event handler delegates, see
"Events and Delegates" in the .NET Framework SDK documentation.

</div>

</div>

<div id="vcrvirttransclass" class="section">

<div class="titlepage">

<div>

<div>

#### VirtuosoTransaction Class

</div>

</div>

</div>

Represents a transaction to be made at a Virtuoso database. This class
cannot be inherited.

|                           |
|---------------------------|
| System.Object             |
| System.MarshalByRefObject |
| VirtuosoTransaction       |

``` classsynopsis
 
              public 
              sealed 
              class 
              VirtuosoTransaction
             extends, 
              MarshalByRefObject
            
    implements, 
              IDbTransaction
            , 
              IDisposable
             {
}
```

<div id="id1896" class="section">

<div class="titlepage">

<div>

<div>

##### Thread Safety

</div>

</div>

</div>

Any public static (Shared in Visual Basic) members of this type are safe
for multithreaded operations. Any instance members are not guaranteed to
be thread safe.

</div>

<div id="id1897" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The application creates a VirtuosoTransaction object by calling
BeginTransaction on the VirtuosoConnection object. All subsequent
operations associated with the transaction (for example, committing or
aborting the transaction), are performed on the VirtuosoTransaction
object.

</div>

<div id="id1905" class="section">

<div class="titlepage">

<div>

<div>

##### Properties

</div>

</div>

</div>

<div id="id1900" class="section">

<div class="titlepage">

<div>

<div>

###### Connection

</div>

</div>

</div>

Gets the VirtuosoConnection object associated with the transaction.

` `<span class="modifier">`public `</span>` `<span class="type">`VirtuosoConnection `</span>` `<span class="varname">`Connection `</span>` ;`

<div id="id1898" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The VirtuosoConnection object to associate with the transaction.

</div>

<div id="id1899" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

A single application may have multiple database connections, each with
zero or more transactions. This property enables you to determine the
connection object associated with a particular transaction.

</div>

</div>

<div id="id1904" class="section">

<div class="titlepage">

<div>

<div>

###### IsolationLevel

</div>

</div>

</div>

Specifies the IsolationLevel for this transaction

` `<span class="modifier">`public `</span>` `<span class="type">`IsolationLevel `</span>` `<span class="varname">`IsolationLevel `</span>` ;`

<div id="id1901" class="section">

<div class="titlepage">

<div>

<div>

###### Property Value

</div>

</div>

</div>

The IsolationLevel for this transaction.

</div>

<div id="id1902" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbTransaction.IsolationLevel

</div>

<div id="id1903" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

Parallel transactions are not supported. Therefore, the IsolationLevel
applies to the entire transaction.

</div>

</div>

</div>

<div id="id1912" class="section">

<div class="titlepage">

<div>

<div>

##### Methods

</div>

</div>

</div>

<div id="id1906" class="section">

<div class="titlepage">

<div>

<div>

###### Commit Method

</div>

</div>

</div>

Commits the database transaction.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Commit`</span>`();`

</div>

<div id="id1908" class="section">

<div class="titlepage">

<div>

<div>

###### Dispose Method

</div>

</div>

</div>

Releases the unmanaged resources used by the VirtuosoTransaction and
optionally releases the managed resources.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Dispose`</span>`();`

<div id="id1907" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDisposable.Dispose

</div>

</div>

<div id="id1911" class="section">

<div class="titlepage">

<div>

<div>

###### Rollback Method

</div>

</div>

</div>

Rolls back a transaction from a pending state.

<span class="modifier">`public `</span><span class="void">`void `</span><span class="methodname">`Rollback`</span>`();`

<div id="id1909" class="section">

<div class="titlepage">

<div>

<div>

###### Implements

</div>

</div>

</div>

IDbTransaction.Rollback

</div>

<div id="id1910" class="section">

<div class="titlepage">

<div>

<div>

###### Remarks

</div>

</div>

</div>

The transaction can be rolled back only from a pending state (after
BeginTransaction has been called, but before Commit is called).

</div>

</div>

</div>

</div>

</div>

</div>

</div>
