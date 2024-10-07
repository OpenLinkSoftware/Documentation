<div id="ee" class="book">

<div class="titlepage">

<div>

<div>

# OpenLink ODBC Driver (Express Edition) User Guide

</div>

<div>

<div class="authorgroup">

<div class="author">

### <span class="orgname">OpenLink Software Documentation Team </span> `<`<a href="mailto:docs@openlinksw.com%0A" class="email"><code
class="sourceCode email">docs@openlinksw.com</code></a>` >`

`<`<a href="mailto:docs@openlinksw.com%0A" class="email"><code
class="sourceCode email">docs@openlinksw.com</code></a>` >`

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

<span class="chapter">1. [OpenLink ODBC Driver (Express Edition)
Documentation](ee_EEIntro.html)</span>

<span class="sect1">1.1. [Overview](eeoverview.html)</span>

<span class="sect2">1.1.1. [Driver
Architecture](eeoverview.html#eearch)</span>

<span class="sect2">1.1.2. [System
Requirements](eeoverview.html#eesysreq)</span>

<span class="sect2">1.1.3. [Installation and Configuration
Guide](eeoverview.html#eeinstallconf)</span>

<span class="sect2">1.1.4. [OpenLink Express Edition Drivers
Installation and Configuration on Mac OS
X](eeoverview.html#eeinstallconfmacosx)</span>

<span class="chapter">2. [Product Licensing](ee_licensing.html)</span>

<span class="sect1">2.1. [OpenLink License Manager Usage
Notes](ee_oplmgr.html) </span>

<span class="sect2">2.1.1. [Background](ee_oplmgr.html#ee_oplmgrbckgrnd)
</span>

<span class="sect2">2.1.2. [Single-Tier](ee_oplmgr.html#ee_oplmgrst)
</span>

<span class="sect2">2.1.3. [Multi-Tier](ee_oplmgr.html#ee_oplmgrmt)
</span>

<span class="sect2">2.1.4. [How to stop/start the OpenLink License
Manager](ee_oplmgr.html#ee_oplmgrhowto) </span>

<span class="sect2">2.1.5. [Environment
Variables](ee_oplmgr.html#ee_oplmgrenvvar) </span>

<span class="sect2">2.1.6. [OpenLink License Manager Networking
Considerations](ee_oplmgr.html#ee_oplmgrnetwork) </span>

<span class="chapter">3. [OpenLink ODBC Driver for DB2 (Express
Edition)](ee_EEDB2.html) </span>

<span class="sect1">3.1. [OpenLink ODBC Driver for DB2 (Express Edition)
for Mac OS X](eedb2mac.html)</span>

<span class="sect2">3.1.1. [Installation
Guide](eedb2mac.html#eedb2macinstall)</span>

<span class="sect2">3.1.2.
[Configuration](eedb2mac.html#eedb2macconf)</span>

<span class="sect1">3.2. [OpenLink ODBC Driver for DB2 (Express Edition)
for Windows](eedb2win.html)</span>

<span class="sect2">3.2.1.
[Installation](eedb2win.html#eedb2wininst)</span>

<span class="sect2">3.2.2.
[Configuration](eedb2win.html#eedb2winconf)</span>

<span class="chapter">4. [OpenLink ODBC Driver for Firebird (Express
Edition)](ee_EEFireBird.html) </span>

<span class="sect1">4.1. [OpenLink ODBC Driver for Firebird (Express
Edition) for Mac OS X](eefirebirdrwin.html)</span>

<span class="sect2">4.1.1. [Installation
Guide](eefirebirdrwin.html#eefirebirdmacinst)</span>

<span class="sect2">4.1.2.
[Configuration](eefirebirdrwin.html#eefirebirdmacconf)</span>

<span class="sect1">4.2. [OpenLink ODBC Driver for Firebird (Express
Edition) for Windows](eefirebirdwin.html)</span>

<span class="sect2">4.2.1.
[Installation](eefirebirdwin.html#eefirebirdwininst)</span>

<span class="sect2">4.2.2.
[Configuration](eefirebirdwin.html#eefirebirdwinconf)</span>

<span class="chapter">5. [OpenLink ODBC Driver for Informix (Express
Edition)](ee_EEInformix.html) </span>

<span class="sect1">5.1. [OpenLink ODBC Driver for Informix (Express
Edition) for Mac OS X](eeinformixmac.html)</span>

<span class="sect2">5.1.1. [Installation
Guide](eeinformixmac.html#eeinfmacinstall)</span>

<span class="sect2">5.1.2.
[Configuration](eeinformixmac.html#eeinfmacconf)</span>

<span class="sect1">5.2. [OpenLink ODBC Driver for Informix (Express
Edition) for Windows](eeinformixwin.html)</span>

<span class="sect2">5.2.1.
[Installation](eeinformixwin.html#eeinformixwininst)</span>

<span class="sect2">5.2.2.
[Configuration](eeinformixwin.html#eeinformixwinconf)</span>

<span class="chapter">6. [OpenLink ODBC Driver for Ingres (Express
Edition)](ee_EEIngres.html) </span>

<span class="sect1">6.1. [OpenLink ODBC Driver for Ingres (Express
Edition) for Mac OS X](eeingresmac.html)</span>

<span class="sect2">6.1.1. [Installation
Guide](eeingresmac.html#eeingresmacinstall)</span>

<span class="sect2">6.1.2.
[Configuration](eeingresmac.html#eeingresmacconf)</span>

<span class="sect1">6.2. [OpenLink ODBC Driver for Ingres (Express
Edition) for Windows](eeingreswin.html)</span>

<span class="sect2">6.2.1.
[Installation](eeingreswin.html#eeingreswininst)</span>

<span class="sect2">6.2.2.
[Configuration](eeingreswin.html#eeingreswinconf)</span>

<span class="chapter">7. [OpenLink ODBC Driver for MySQL (Express
Edition)](ee_EEMySQL.html) </span>

<span class="sect1">7.1. [OpenLink ODBC Driver for MySQL (Express
Edition) for Mac OS X](eemysqlmac.html)</span>

<span class="sect2">7.1.1. [Installation
Guide](eemysqlmac.html#eemysqlmacinst)</span>

<span class="sect2">7.1.2.
[Configuration](eemysqlmac.html#eemysqlmacconf)</span>

<span class="sect1">7.2. [OpenLink ODBC Driver for MySQL (Express
Edition) for Windows](eemysqlwin.html)</span>

<span class="sect2">7.2.1.
[Installation](eemysqlwin.html#eemysqlwininst)</span>

<span class="sect2">7.2.2.
[Configuration](eemysqlwin.html#eemysqlwinconf)</span>

<span class="chapter">8. [OpenLink ODBC Driver for Oracle (Express
Editon)](ee_EEOracle.html) </span>

<span class="sect1">8.1. [OpenLink ODBC Driver for Oracle (Express
Editon) for Mac OS X](eeoraclemac.html)</span>

<span class="sect2">8.1.1. [Installation
Guide](eeoraclemac.html#eeoraclemacinst)</span>

<span class="sect2">8.1.2.
[Configuration](eeoraclemac.html#eeoraclemacconf)</span>

<span class="sect1">8.2. [OpenLink ODBC Driver for Oracle (Express
Editon) for Windows](eeoraclewin.html)</span>

<span class="sect2">8.2.1.
[Installation](eeoraclewin.html#eeoraclewininst)</span>

<span class="sect2">8.2.2.
[Configuration](eeoraclewin.html#eeoraclewinconf)</span>

<span class="chapter">9. [OpenLink ODBC Driver for PostgreSQL (Express
Edition)](ee_EEPostgres.html) </span>

<span class="sect1">9.1. [OpenLink ODBC Driver for PostgreSQL (Express
Edition) for Mac OS X](eepostgresqlmac.html)</span>

<span class="sect2">9.1.1. [Installation
Guide](eepostgresqlmac.html#eepostgresqlmacinst)</span>

<span class="sect2">9.1.2.
[Configuration](eepostgresqlmac.html#eepostgresqlmacconf) </span>

<span class="sect1">9.2. [OpenLink ODBC Driver for PostgreSQL (Express
Edition) for Windows](eepostgresqlwin.html)</span>

<span class="sect2">9.2.1.
[Installation](eepostgresqlwin.html#eepostgresqlwininst)</span>

<span class="sect2">9.2.2.
[Configuration](eepostgresqlwin.html#eepostgresqlwinconf)</span>

<span class="chapter">10. [OpenLink ODBC Driver for SQL Server (Express
Editon)](ee_EESQLServer.html) </span>

<span class="sect1">10.1. [OpenLink ODBC Driver for SQL Server (Express
Editon) for Mac OS X](eesqlmac.html)</span>

<span class="sect2">10.1.1. [Installation
Guide](eesqlmac.html#eesqlmacinst)</span>

<span class="sect2">10.1.2. [Configuration](eesqlmac.html#eesqlmacconf)
</span>

<span class="sect1">10.2. [OpenLink ODBC Driver for SQL Server (Express
Editon) for Windows](eesqlwin.html)</span>

<span class="sect2">10.2.1.
[Installation](eesqlwin.html#eesqlwininst)</span>

<span class="sect2">10.2.2.
[Configuration](eesqlwin.html#eesqlwinconf)</span>

<span class="chapter">11. [OpenLink ODBC Driver for Sybase (Express
Editon)](ee_EESybase.html) </span>

<span class="sect1">11.1. [OpenLink ODBC Driver for Sybase (Express
Editon) for Mac OS X](eesybasemac.html)</span>

<span class="sect2">11.1.1. [Installation
Guide](eesybasemac.html#eesybasemacinst) </span>

<span class="sect2">11.1.2.
[Configuration](eesybasemac.html#eesybasemacconf) </span>

<span class="sect1">11.2. [OpenLink ODBC Driver for Sybase (Express
Editon) for Windows](eesysbasewin.html)</span>

<span class="sect2">11.2.1.
[Installation](eesysbasewin.html#eesybasewininst)</span>

<span class="sect2">11.2.2.
[Configuration](eesysbasewin.html#eesybasewinconf)</span>

</div>

</div>
