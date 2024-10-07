<div id="mt_JDBCClientClasses" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 11. JDBC Components

</div>

<div>

<div class="abstract">

**Abstract**

Guide for successfully installing and running the OpenLink JDBC Client
Classes.

The OpenLink Drivers for JDBC enable the development, deployment, and
utilization of database independent Java Applications, Applets,
Servlets, and Bean Components (collectively called JDBC Clients) that
conform to the JDBC 1.1.x, or JDBC 2.0.x specifications from JavaSoft.

JDBC clients are built by importing the "java.sql.\*" collection of
classes known as the JDBC Driver Manager interface. The JDBC Driver
Manager uses JDBC URLs to link JDBC clients with JDBC Drivers. It is
important to note that JDBC URLs are JDBC Driver specific. Detailed
information regarding JDBC is available from:
<a href="http://java.sun.com/products/jdbc/index.html" class="ulink"
target="_top">java.sun.com</a>.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

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

</div>

</div>
