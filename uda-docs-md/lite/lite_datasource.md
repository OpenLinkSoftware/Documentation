<div id="lite_datasource" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 5. OpenLink ODBC Driver (Single-Tier Edition) Configuration

</div>

<div>

<div class="abstract">

**Abstract**

How to configure ODBC Data sources (DSNs). How to configure DSNs for the
individual OpenLink Lite Drivers.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

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

</div>

</div>
