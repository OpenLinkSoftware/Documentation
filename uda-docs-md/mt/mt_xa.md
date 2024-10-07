<div id="mt_xa" class="section">

<div class="titlepage">

<div>

<div>

## 12.1. Distributed Transaction Processing (DTP)

</div>

</div>

</div>

<div id="mt_xadtpover" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.1. X/Open DTP Model

</div>

</div>

</div>

DTP can be broken down into 3 core components:

<div class="itemizedlist">

- An Application Program (AP) for defining transaction boundires and
  specifies actions that constitute a transaction.

- Resource Managers (RMs, such as databases or Data Access Drivers ie
  ODBC, JDBC, ADO.Net for accessing them)provide access to shared
  resources.

- A Transaction Manager (TM) that assigns identifiers to a transactions,
  monitors the progress, and takes responsibility for transaction
  completion and fault recovery.

</div>

<div id="id32195" class="figure">

**Figure 12.1. DTP-XA.gif**

<div class="figure-contents">

<div class="mediaobject">

![DTP-XA.gif](images/DTP-XA.gif)

</div>

</div>

</div>

  

The TX standard defines the API used for communication between an
application program and a transaction manager. The XA (eXtended
Architecture) standard defines the two-phase commit protocol and the API
used for communication between a transaction manager and a resource
manager. A resource manager is a system service that manages durable
data, e.g. a DBMS or file system. A transaction manager manages
distributed transactions, which may span multiple resource managers. It
manages two-phase commit, coordinating the decision to commit
distributed transactions or roll them back, and coordinates failure
recovery.

Whenever an application has a single function that needs to access or
update the data in multiple transactional resources, it should use a
distributed transaction. You can use a separate simple transaction on
each of the resources, but this approach is error-prone. If the
transaction in one resource commits successfully but another fails and
must roll back, the first transaction can no longer be rolled back, so
the state of the application becomes inconsistent. If one resource
commits successfully but the system crashes before the other resource
can commit successfully, the application again is inconsistent. An
application moving data from one database to another requires a
distributed transaction. Otherwise, the data may be duplicated (if the
insert completes and the delete fails) or lost (if the delete completes
and the insert fails).

<div id="mt_xadtpdtc" class="section">

<div class="titlepage">

<div>

<div>

#### Distributed Transaction Coordinator (DTC)

</div>

</div>

</div>

The Microsoft COM and MTS interfaces were unified into a single run-time
layer and renamed COM+ for Windows 2000. COM+ includes the transaction
support that was created for MTS. Both include a system service, DTC,
for coordinating distributed transactions and the two-phase commit
protocol. Every machine running COM+ has a DTC system service.

For distributed transactions, each computer has a local transaction
manager ie. the DTC on that machine. When a transaction does work at
multiple computers, the transaction managers interact with other
transaction managers via either a superior or subordinate relationship.
These relationships are relevant only for a particular transaction. The
root transaction manager, also referred to as the global commit
coordinator, is the transaction manager on the system that initiates a
transaction.

DTC introduces the notion of a resource dispenser which does two things.
It manages a pool of connections to a resource manager (i.e. a DBMS in
the context of Data Access) and it automatically enlists the resource
manager in a component's transaction. The ODBC Driver Manager is a
typical resource dispenser, as is an ADO .NET Data Provider.

</div>

<div id="mt_xadtptuxedo" class="section">

<div class="titlepage">

<div>

<div>

#### Tuxedo

</div>

</div>

</div>

BEA Tuxedo provides the framework, or middleware, for building scalable
multi-tier client/server applications in heterogeneous (dissimilar),
distributed environments that extend from the Web to the Enterprise.
Using BEA Tuxedo, users can develop, manage, and deploy distributed
applications independently of the underlying hardware, operating system,
network, and database environment.

In contrast to classic 2-tier client/server configuration of SQL
servers, the Tuxedo brings 3-tier paradigm (clients, services, resource
managers).

At the foundation of BEA Tuxedo ATMI is a proven, reliable transaction
processor, also known as a transaction processing (TP) monitor. A
transaction processor is an example of a 3-tier client/server
architecture, where the transaction processor supports the application
logic (represented by "services" between the GUI front-end and the
back-end resource managers. Examples of resource managers are SQL
databases, message queues, legacy applications, and other back-end
services.

Tuxedo's Application-to-Transaction Monitor Interface consists of the
Tuxedo transaction processor and infrastructure, and the ATMI API. The
ATMI API is used to create a Tuxedo client and server.

A Tuxedo ATMI client collects a user request and forwards it to a server
offering the requested service. The client "joins" a distributed Tuxedo
application by calling the ATMI client initialization routine. The
client can then exchange information with the server, sending and
receiving data in typed buffers, and define transaction boundaries The
client "leaves" the application by issuing an ATMI termination function.

A Tuxedo server process oversees a set of services, calling them
automatically for clients that request them. ATMI clients do not call
servers by name; they call services. The server is not written as a
complete program (i.e. with a standard main). Instead, the server's
services are coded as a set of functions that are compiled with Tuxedo
binaries to produce a server executable.

</div>

<div id="mt_xadtpjta" class="section">

<div class="titlepage">

<div>

<div>

#### Java Transaction API (JTA)

</div>

</div>

</div>

The JTA, or Java Transaction API, is a Java Enterprise API for managing
distributed transactions. It defines a Java binding for the standard XA
API for distributed transactions (XA is a standard defined by the Open
Group). Using the JTA, one can write a program that communicates with a
distributed transaction service and uses that service to coordinate a
distributed transaction that accesses and update data on two or more
networked computer resources, or databases in the case of JDBC.

The XA specification defines an interface between the transaction
manager (TM) and resource manager (RM) in a distributed transaction
system. This is a generic interface and it does not directly address the
use of distributed transactions from Java. The Java mapping of the XA
interface is defined in Sun Microsystems Java Transaction API (JTA) and
JDBC 2.0/3.0 specifications.

</div>

</div>

<div id="mt_xadtpormxaii" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.2. OpenLink Resource Manager XA Interface Implementation

</div>

</div>

</div>

The OpenLink DataAccess drivers (ODBC, JDBC, ADO.Net) form part of the
Resource Manager in the overal DTP model, implementing the XA (eXtended
Architecture) interface for the comminication between itself as the
upper layer of Resource Manager proess and the Transaction Manager (DTC,
Tuxedo, JTS), and also providing the binding to the Database Vendors XA
API implementation, which forms the lower layer of the Resoure Manager:

<div id="id32223" class="figure">

**Figure 12.2. UDA-XA.gif**

<div class="figure-contents">

<div class="mediaobject">

![UDA-XA.gif](images/UDA-XA.gif)

</div>

</div>

</div>

  

Distributed transactions are supported in the OpenLink Multi-Tier and
Single-Tier ODBC, JDBC and ADO.Net drivers/providers for Oracle,
SQLServer, Sybase, Informix and Ingres II.

<div id="mt_xadtpodbc" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC

</div>

</div>

</div>

The OpenLink Multi-Tier and Single-Tier ODBC drivers support distributed
transactions using the Microsoft Distributed Transaction Co-ordinator
(on Windows only) or Tuxedo as the Transaction Manager of the
distributed transaction process.

<div id="id1330" class="section">

<div class="titlepage">

<div>

<div>

##### Distributed Transaction Co-ordinator (DTC)

</div>

</div>

</div>

An OpenLink XA compliant ODBC driver acts as a proxy for an XA capable
database (RM) and as such can be thought of as a resource manager. The
OpenLink XA compliant ODBC drivers implement and export the function
GetXASwitch() which provide the entry points for the DBMS specific XA
functions which the DTC can use to communicate directly with the DBMS
should an for of distributed transaction recovery need to the performed.

<div id="id1329" class="section">

<div class="titlepage">

<div>

<div>

###### Transaction Enlistment

</div>

</div>

</div>

After initiating a transaction, an application enlists the resource
managers it wants to participate in the transaction. Enlistment is done
through the ODBC 3.0 connection attribute function call:

SQLSetConnectAttr(SQL_ATTR_ENLIST_IN_DTC)

</div>

</div>

<div id="id1333" class="section">

<div class="titlepage">

<div>

<div>

##### Tuxedo

</div>

</div>

</div>

An OpenLink XA compliant ODBC driver acts as a proxy for an XA capable
database (RM) and as such can be thought of as a resource manager. The
driver exports a function opl_xa_switch:

``` programlisting
xa_switch_t * opl_xa_switch (void)
```

which TP monitors can use to retrieve the xa_switch_t structure
containing pointers to the XA functions.

<div id="id1331" class="section">

<div class="titlepage">

<div>

<div>

###### Defining the OpenLink Resource Manager in Tuxedo

</div>

</div>

</div>

When integrating a new resource manager into Tuxedo, the file
%TUXDIR%/udataobj/RM must be updated to include information about the
resource manager. To integrate the OpenLink Lite Driver for Oracle into
Tuxedo on Windows, define an<span class="emphasis">*rm_alias*</span>
entry in the RM file by adding a line similar to:

OPL_ORA_XA;(\*opl_xa_switch());"c:\program
files\openlink\lite32\ntl5o9zz.lib

where, in this example, OPL_ORA_XA is
the<span class="emphasis">*rm_alias.*</span>. ntl5o9zz.lib is an import
library for the ODBC driver associated with the DSN identified by the
xa_info string; in this example the OpenLink Windows Lite Driver for
Oracle (ntl5o9zz.dll).

To create an<span class="emphasis">*rm_alias*</span>entry in the RM file
for the OpenLink Generic Client add a line similar to:

OPL_XA;(\*opl_xa_switch());"c:\program files\openlink\olod5032u.lib

On Unix the<span class="emphasis">*rm_alias*</span>is created in a
similar way. A line adding an alias for the OpenLink Generic Client is
added to \$TUXDIR/udataobj/RM as follows:

OPL_XA:(\*opl_xa_switch()):/home/openlink/lib/oplodbcu.so

Where /home/openlink is the openlink installation directory.

</div>

<div id="mt_xainfoconnstrfmt" class="section">

<div class="titlepage">

<div>

<div>

###### xa_info, OPENINFO and CLOSEINFO String Formats

</div>

</div>

</div>

The XA functions xa_open and xa_close open or close a connection to a
resource manager for the calling thread. Both functions accept
an<span class="emphasis">*xa_info*</span>argument.<span class="emphasis">*xa_info*</span>is
a string containing instance-specific information for the resource
manager. For OpenLink ODBC drivers, the
<span class="emphasis">*xa_info*</span>string takes the form of an ODBC
Data Source Name. The DSN must be defined in your ODBC.INI file or
registry hive using the ODBC Administrator.

In a Tuxedo environment, the xa_info strings required by xa_open and
xa_close for a particular RM instance are identified by the OPENINFO and
CLOSEINFO entries in the UBBCONFIG configuration file. (An example
UBBCONFIG file is given below.) OPENINFO and CLOSEINFO entries must be
defined for each server group. These entries must be quoted strings of
the form
"<span class="emphasis">*rm_alias*</span>:<span class="emphasis">*DSN*</span>".
(OPENINFO and CLOSEINFO should not contain the
usual<span class="emphasis">*xa_info*</span>string required by the
target database. This string is stored as part of the DSN definition
when the ODBC data source is configured. The OpenLink ODBC driver
retrieves the stored<span class="emphasis">*xa_info*</span>string using
the DSN it receives through xa_open or xa_close.)

</div>

<div id="id1332" class="section">

<div class="titlepage">

<div>

<div>

###### Using ODBC in an XA Global Transaction

</div>

</div>

</div>

In order for a service to use ODBC functions in the context of a global
transaction, the ODBC functions must use the XA connection created when
the service connects to the resource manager with which it is linked.
(In the sample application, each service connects to a database using
tpopen(), when the service is first initialized through tpsvrinit()).
OpenLink XA-enabled ODBC drivers provide two functions, SQLGetXaEnv()
and SQLGetXaConnect(), which make an XA connection available for use
with ODBC. If the XA connection is enlisted in a global transaction,
e.g. the client has called tpbegin() before calling the service, then
any 'work' done by ODBC functions in the service will be controlled by
that global transaction.

SQLGetXaEnv() returns the ODBC environment handle associated with the XA
connection. SQLGetXaConnect() returns the ODBC connection handle
associated with the XA connection. The prototypes for these functions
are:

``` programlisting
SQLRETURN SQLGetXaEnv(SQLHENV *phenv); 
    SQLRETURN SQLGetXaConnect(SQLHDBC *phdbc);
```

When using OpenLink ODBC drivers in a global transaction context, you
should not create an environment handle using SQLAllocHandle(), or use
SQLSetEnvAttr(). (The SQLHENV associated with the XA connection is
created with SQL_ATTR_ODBC_VERSION set to SQL_OV_ODBC3.) If you create
an ODBC connection using this SQLHENV, it will not be enlisted in the
global transaction.

</div>

</div>

</div>

<div id="mt_xadtpjdbc" class="section">

<div class="titlepage">

<div>

<div>

#### JDBC

</div>

</div>

</div>

The OpenLink Multi-Tier JDBC drivers support distributed transactions
using the Java Transaction API (JTA) as the Transaction Manager of the
distributed transaction process.

<div id="id1337" class="section">

<div class="titlepage">

<div>

<div>

##### Java Transaction API (JTA)

</div>

</div>

</div>

The OpenLink UDA Generic JDBC clients (opljdbc3.jar & opljdbc2.jar)
support the industry standard XA specification for distributed
transaction processing. The XA specification defines an interface
between the transaction manager (TM) and resource manager (RM) in a
distributed transaction system. This is a generic interface and it does
not directly address the use of distributed transactions from Java. The
Java mapping of the XA interface is defined in Sun Microsystems Java
Transaction API (JTA) and JDBC 2.0/3.0 specifications. The OpenLink UDA
Generic JDBC client drivers support the JTA architecture by providing
the implementation of JTA resource manager interfaces.

The OpenLink UDA JDBC 3.0 driver provides the openlink.javax.OPLXid,
openlink.javax.OPLXADataSource, and openlink.javax.OPLXAConnection
classes which implement the interfaces javax.transaction.xa.Xid,
javax.transaction.xa.XADataSource, javax.sql.XAConnection, and
javax.sql.XAResource respectively. The use if these interfaces is
usually transparent for applications and the application developer
shouldn't bother with them. They are used only by the JTS transaction
manager which normally runs as a part of the J2EE server.

<div id="id1334" class="section">

<div class="titlepage">

<div>

<div>

###### JDBC 3.0 (JDK 1.4 & 1.5)

</div>

</div>

</div>

JTA support is built into the JRE for JDK 1.4 and 1.5, thus the UDA
Generic JDBC client (opljdbc3.jar) simply needs to be added to the
CLASSPATH and the XA classes will be available for use.

</div>

<div id="id1335" class="section">

<div class="titlepage">

<div>

<div>

###### JDBC 2.0 (JDK 1.2 & 1.3)

</div>

</div>

</div>

JTA support was added by Sun Microsystems as an extension to the JDK 1.2
and 1.3 JRE's resulting in the following jar files having to be added to
you CLASSPATH in additon to the UDA Generic JDBC client (opljdbc2.jar) :

``` programlisting
jdbc2_0-stdext.jar
jta-spec1_0_1.jar
jndi.jar
```

</div>

<div id="id1336" class="section">

<div class="titlepage">

<div>

<div>

###### JDBC XA Documentaton

</div>

</div>

</div>

Reference documentation for the OpenLink JDBC XA implementation in the
UDA JDBC Client.

</div>

</div>

</div>

</div>

<div id="mt_xadtpdbconfig" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.3.  Configuring Databases for XA support

</div>

</div>

</div>

<div id="mt_xadtpdbconforacle" class="section">

<div class="titlepage">

<div>

<div>

#### Oracle

</div>

</div>

</div>

XA support has been tested against Oracle version 9i and 10g

<div id="id1338" class="section">

<div class="titlepage">

<div>

<div>

##### Granting SELECT Privilege on V\$XATRANS\$ & DBA_PENDING_TRANSACTIONS Views

</div>

</div>

</div>

In the event that the TM needs to perform recovery, xa_recover will fail
if you do not grant the SELECT privilege to the V\$XATRANS\$ view for
all Oracle accounts that XA applications will use. If the view does not
already exist in your Oracle installation then it can be manually loaded
using the following SQL script which should be included in your Oracle
installation:

``` programlisting
$ORACLE_HOME/rdbms/admin/xaview.sql
```

The example below shows an extract from an Oracle XA Library trace file
(for details of how to enable Oracle XA Library tracing in an OpenLink
driver see here). Oracle returns error <span class="emphasis">*ORA-00942
: table or view does not exist*</span> because user scott does not have
the necessary SELECT privilege on the V\$XATRANS\$ view.

``` programlisting
ORACLE XA: Version 10.1.0.0.0. RM name = 'Oracle_XA'.
113956.2352:536.536.1:
xaoopen: xa_info=ORACLE_XA+Threads=true+SesTm=60+Acc=P/scott/tiger+DB=DB01BA5BF8+SQLNET=ORCL+DbgFl=0x1+LogDir=c:/,rmid=1,flags=0x0
113956.2352:536.536.1:
xaolgn_help: version#: 168821248 banner: Personal Oracle Database 10g Release 10.1.0.2.0 - Production
With the Partitioning, OLAP and Data Mining options
113956.2352:536.536.1:
xaoopen: return 0
113959.2352:536.536.1:
xaorecover: xids=0xf8f8f8, count=10, rmid=1, flags=0x1000000
113959.2352:536.536.1:
ORA-00942: table or view does not exist
113959.2352:536.536.1:
xaorecover: xaofetch rtn -3.
113959.2352:536.536.1:
xaoclose: xa_info=DSN=au49-ora10-carlv;UID=scott;PWD=tiger;+DB=DB01BA5BF8, rmid=1769209857, flags=0x0
113959.2352:536.536.1:
xaoclose: rtn 0
```

The syntax for adding the grant privilege to the 'scott' user would thus
be:

``` programlisting
grant select on V$XATRANS$ to scott;
```

In addtion, the "ORA-00942: table or view does not exist" error also
occurs if select privileges are not granted on the
DBA_PENDING_TRANSACTIONS view as detailed in this <a
href="http://metalink.oracle.com/metalink/plsql/ml2_documents.showNOT?p_id=150021.1&amp;p_showHeader=1&amp;p_showHelp=1"
class="ulink" target="_top">Oracle MetaLink Article</a>, requiring the
following command to be executed as a DBA user:

``` programlisting
 
GRANT SELECT ON DBA_PENDING_TRANSACTIONS TO PUBLIC
          
```

<span class="emphasis">*Note that the V\$XATRANS\$ did not exist nor did
the DBA_PENDING_TRANSACTIONS view have appropriate select privileges in
Unix Oracle installations, although they are included in Windows
installations by default.*</span>

</div>

</div>

<div id="mt_xadtpinformix" class="section">

<div class="titlepage">

<div>

<div>

#### Informix

</div>

</div>

</div>

XA support has been tested against versions 9.x and 10.x

<div id="id1339" class="section">

<div class="titlepage">

<div>

<div>

##### Enable Database Logging

</div>

</div>

</div>

For XA to be supported with an Informix database, the database must be
capable of supporting transactions, which for Informix means the
database must have logging enabled.

</div>

<div id="id1340" class="section">

<div class="titlepage">

<div>

<div>

##### Useful Links

</div>

</div>

</div>

<div class="itemizedlist">

- Old IBM document (1996), but may contain some useful information: <a
  href="http://www.umiacs.umd.edu/~jhu/DOCS/TX4.2/html/erzhae/erzhae18.htm"
  class="ulink"
  target="_top">http://www.umiacs.umd.edu/~jhu/DOCS/TX4.2/html/erzhae/erzhae18.htm</a>

</div>

</div>

</div>

<div id="mt_xadtpsybase" class="section">

<div class="titlepage">

<div>

<div>

#### Sybase

</div>

</div>

</div>

XA support has been tested against Sybase version 12.5.1 and above.

The following instructions need to performed to set up a working XA
environment on your database server:

<div class="itemizedlist">

- Ensure your Syabse Server is licensed for Distributed Transaction
  Management. This can be checked by executing the following query
  against you Sybase Server:

</div>

``` programlisting
select license_enabled('ASE_DTM') 
```

The query will return "1", if you have the ASE_DTM license installed.

<div class="itemizedlist">

- Run "sp_configure 'enable DTM',1" , via isql to enable transactions.

- Run "sp_configure 'enable xact coordination',1" , via isql

- Run "grant role dtm_tm_role to USER_NAME" .

- To prevent deadlocks when running transactions, enable row level lock
  by default, by running "sp_configure 'lock scheme',0,datarows" via
  isql.

</div>

. Note, you must restart Adaptive Server for this changes to take
effect.

<div id="id1341" class="section">

<div class="titlepage">

<div>

<div>

##### Setting the Timeout for Detached Transactions

</div>

</div>

</div>

On the Sybase server, you can set the dtm detach timeout period, which
sets the amount of time (in minutes) that a distributed transaction
branch can remain in the detached state (without an associated execution
thread). After this period, the DBMS automatically rolls back the
transaction. The dtm detach timeout period applies to all transactions
on the database server. It cannot be set for each transaction. For
example, to automatically rollback transactions after being detached for
10 minutes, use the following command:

"sp_configure 'dtm detach timeout period', 10"

You should set the dtm detach timeout period higher than the transaction
timeout to prevent the database server from rolling back the transaction
before the transaction times out.

</div>

</div>

<div id="mt_xadtpsqlserver" class="section">

<div class="titlepage">

<div>

<div>

#### SQLServer

</div>

</div>

</div>

XA support was tested against the following Microsoft SQLServer
versions:

MSSQL 6.5 RTM (WinNt4 Sp3)

MSSQL 7.0EE SP4 (Win2k AdvSrv Sp3)

MSSQL 2000 SP3a (Win2k Sp3)

Before using the Microsoft SQLServer XA features you must install and
register the Microsoft SQLServer extented stored procedures, for this :

1\) copy xp_oplxa.dll ( xp_oplxa65.dll for MSSQL 6.5) to the
MSSQLServer_Root/binn directory

2\) execute the command :

isql.exe -Usa -Psa_pwd -ig:xp_oplxa.sql

or

isql.exe -Usa -Psa_pwd -ig:xp_oplxa65.sql (for MSSQL 6.5)

</div>

<div id="mt_xadtpingresii" class="section">

<div class="titlepage">

<div>

<div>

#### Ingres II

</div>

</div>

</div>

XA is supported with IngresII version 2.0 and higher and Ingres II DBMS
does not require any additional configuration for XA support to be
enabled.

The Ingres II XA support was tested against the following versions:

IngresII v2.0

IngresII v2.6

IngresII v3.0 (Open release)

</div>

</div>

<div id="mt_xadtpconnstrfmt" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.4. OpenLink XA Connection String Formats

</div>

</div>

</div>

To connect to a database's XA interface or some other XA compliant RM, a
TM must connect using xa_open(). The xa_open() call accepts as one of
its arguments an xa_info string. When acting as an RM proxy, OpenLink
drivers automatically construct the database dependent xa_info string
from other connection information received through the driver's data
access API. The constructed string is sufficient to open an XA
connection, but may omit optional settings. These optional settings are
database dependent, details of which are given below. They can be
entered in the 'XA Info' text box in the driver's setup dialog.

<div id="mt_xadtpconnstrodbc" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC

</div>

</div>

</div>

<div id="id1342" class="section">

<div class="titlepage">

<div>

<div>

##### Oracle

</div>

</div>

</div>

For full details of the Oracle syntax for the xa_info string, refer to
the "Oracle Application Developer's Guide - Fundamentals : Chapter 20
Working With Transaction Monitors With Oracle XA : Developing and
Installing Applications That Use the XA Libraries : Defining the xa_open
String".

The OpenLink driver builds an xa_info string of the form:

``` programlisting
Oracle_XA+Threads=true+SesTm=60+SqlNet=serviceName+DB=dbName+Acc=P/username/password
```

Fields in the xa_info string automatically inserted by the OpenLink
driver should not be present in the 'XA Info' string. You should not
include clauses such as "DB=dbname" or "Acc=P/username/password" .

<span class="emphasis">*serviceName*</span>takes the value of the
'Connection String' textbox in the Single-Tier ODBC driver setup dialog
or the 'NET x Service Name' textbox in the Multi-Tier ODBC driver setup
dialog. If a value isn't specified in the respective setup dialog,
<span class="emphasis">*serviceName*</span>defaults to the value of the
ORACLE_SID environment variable.

In addition to the tracing facilities provided by the OpenLink driver,
Oracle's own XA interface also supports tracing. Ordinarily a trace file
is only created at this level when an error occurs, but it is possible
to trace all calls to the Oracle XA interface by setting the DbgFl entry
appropriately in the xa_info string. To enable tracing by the Oracle XA
Library, use an XaInfo string similar to: DbgFl=0x1+LogDir=c:/ For full
details of the Oracle XA Library trace facilities see the "Oracle
Application Developer's Guide - Fundamentals : Chapter 20 Working With
Transaction Monitors With Oracle XA : Troubleshooting XA Applications".

</div>

<div id="id1343" class="section">

<div class="titlepage">

<div>

<div>

##### Informix

</div>

</div>

</div>

The OpenLink driver builds an xa_info string of the form:

``` programlisting
    DB=dbname@dbserver;USER=username;PASSWD=password;CON=sessionid;
   
```

No optional xa_info elements are supported.

</div>

<div id="id1344" class="section">

<div class="titlepage">

<div>

<div>

##### Sybase

</div>

</div>

</div>

No optional xa_info elements are supported.

</div>

<div id="id1345" class="section">

<div class="titlepage">

<div>

<div>

##### SQL Server

</div>

</div>

</div>

No optional xa_info elements are supported.

</div>

<div id="id1346" class="section">

<div class="titlepage">

<div>

<div>

##### Ingres

</div>

</div>

</div>

No optional xa_info elements are supported.

</div>

</div>

</div>

<div id="mt_xadtpodbctrace" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.5.  Tracing XA calls in OpenLink ODBC Drivers

</div>

</div>

</div>

When logging is enabled in an XA-enabled OpenLink ODBC driver, an XA log
file is opened in addition to the usual ODBC log file. For instance,
when using a Windows Lite driver, if you specify a log file name of
c:\ntl6o10zu.log in the Lite setup dialog, an XA log file named
c:\ntl6o10zu.log-xa will also be created. Because all DSNs which use the
same OpenLink driver share the same log file name, if two applications
use the same driver simultaneously, the log output from one application
will be lost. The last application to connect takes ownership of the log
file. This problem can be overcome by including meta-characters in the
log file name. This is an OpenLink v6 feature which allows applications
to have their own log file. The meta-characters substitute additional
information into the log file name. They can also be used when
configuring logging for a OpenLink ODBC Lite driver or an OpenLink ODBC
generic multi-tier client, on both Windows or Unix.)

Supported meta-characters are:

<div class="itemizedlist">

- \$\$ - inserts \$ (Windows & Unix)

- \$P - current process id (Windows & Unix)

- \$U - inserts user name (Windows & Unix)

- \$H - inserts C:\\ (Windows) or user's home directory (Unix)

- \$T - timestamp (yyyymmdd-hhmmss) (Windows & Unix)

</div>

For instance, when tracing XA, it is useful to include \$P, e.g.
c:\ntl6i10zu\_\$P.log, so that each process using the driver gets its
own XA log file. This is important when using the MS DTC as the
transaction monitor, as the DTC loads the ODBC driver at the same time
as the application when connecting to an RM through ODBC.

</div>

<div id="mt_xadtptransenablewin" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.6.  Enabling XA Transactions on Windows XP SP2 and Windows Server 2003

</div>

</div>

</div>

In Windows 2000, the MSDTC runs as LocalSystem, a special account that
is granted all possible privileges to the local computer on which it
resides. However, if someone compromises the DTC or any other service
running under LocalSystem, that person then has full Administrator
access to the computer. To avoid this potential security problem,
starting with Windows XP SP2 and Windows Server 2003, Microsoft changed
the account under which MSDTC service runs to be "NT
AUTHORITY\NetworkService". A service running as NetworkService has the
same network access as a service running as System (i.e. the operating
system), but has significantly reduced local access. (NetworkService
services access local resources as members of the local Users group.)
Microsoft also introduced other MSDTC security enhancements. As a
result, to enable XA transactions for these environment, some additional
steps are needed after installing OpenLink XA/MSDTC enabled drivers.

(If you are using the distributed transactions support in
COM+/Enterprise Services components with OpenLink drivers, you must
enable XA transactions.)

<span class="emphasis">*1) Enable XA transactions*</span>

To turn on support for XA transactions, follow these steps:

<div class="orderedlist">

1.  Open Component Services.

2.  Expand the tree view to locate the computer where you want to turn
    on support for XA transactions (for example, My Computer).

3.  Right-click the computer name, and then click Properties.

4.  Click the MSDTC tab, and then click Security Configuration.

5.  Under Security Settings, click to select the check box for XA
    Transactions to turn on this support.

</div>

<span class="emphasis">*2) Identify in the registry the XA DLLs you plan
to use*</span>

Windows Server 2003 and XP SP2 provide a registry entry for specifying
the XA DLLs that the MSDTC can use. For each XA enabled OpenLink ODBC
driver you plan to use, you must create a registry named-value under the
registry key HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDTC\XADLL. In your
registry named-value, Name is the file name of the XA DLL (in the format
dllname.dll), Type is String (REG_SZ), and the value is the full path
name (including the file name) of the DLL file.

e.g.

``` programlisting
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDTC\XADLL]
Key name: ntl6o10zu.dll
Data: C:\program files\openlink\bin\ntl6o10zu.dll
```

<span class="emphasis">*3) Allow the NetworkService account access to
the folder containing the XA DLL*</span>

Since NetworkService a very restricted account, you need to provide this
account with access to the folder where the XA DLL is located; for
instance by modifying the access control list (ACL) for the folder. The
ACL for an object is generally found on the Security tab of the object's
property sheet.

<span class="emphasis">*4) Ensure the system PATH includes the folders
of any DLLs loaded by the XA DLL*</span>

The MSDTC must be able to locate any DLLs on which the XA DLL depends.
The folders containing these DLLs must be included in the global PATH
environment variable. (The required DLLs and their paths can be
identified easily
with<a href="http://www.dependencywalker.com" class="ulink"
target="_top">DependencyWalker</a>after enabling the 'Full Paths' option
on the 'View' menu.) Correct the path using Control panel, System
Properties, Environment Variables, System Variables, Path. A reboot may
be necessary for the change to take effect.

In Windows versions supporting the XADLL registry entry, it is not
necessary to include the location of the XA DLL itself in the system
PATH, as the registry entry includes the DLL's full path. In all earlier
versions of Windows, the system PATH must include the XA DLL's location.

<div id="mt_xadtprelatedlinks" class="section">

<div class="titlepage">

<div>

<div>

#### Useful Links

</div>

</div>

</div>

<a href="http://blogs.msdn.com/florinlazar/category/2125.aspx"
class="ulink" target="_top">Florin Lazar's Weblog - MSDTC Posts</a>

<a
href="http://www.microsoft.com/resources/documentation/Windows/XP/all/reskit/en-us/Default.asp"
class="ulink" target="_top">Microsoft Windows XP Professional Resource
Kit Documentation</a>(See Part III Security, Chapter 16 Authorization
and Access Control)

</div>

</div>

<div id="mt_xaenabletuxedounix" class="section">

<div class="titlepage">

<div>

<div>

### 12.1.7. Using OpenLink Drivers with Tuxedo on Unix

</div>

</div>

</div>

See also "Using the OpenLink Oracle Lite Driver with Tuxedo on Windows"
for additional information on configuring Tuxedo.

<div id="id1352" class="section">

<div class="titlepage">

<div>

<div>

#### Defining an OpenLink Resource Manager in Tuxedo

</div>

</div>

</div>

When integrating an OpenLink Unix driver into Tuxedo, the file
%TUXDIR%/udataobj/RM must be updated to include information about the
driver. Add a line similar to one of the examples below:

<div id="id1347" class="section">

<div class="titlepage">

<div>

<div>

##### OpenLink ODBC Generic Client for Unix (Multithreaded):

</div>

</div>

</div>

``` programlisting
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/oplodbcu.so ;; Unicode Driver
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/oplodbc.so ;; Ansi Driver
```

</div>

<div id="id1348" class="section">

<div class="titlepage">

<div>

<div>

##### OpenLink Unix ODBC Lite Driver for SQLServer or Sybase (Multithreaded):

</div>

</div>

</div>

``` programlisting
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/sql_mt_lu.so ;; Unicode Driver
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/sql_mt_lt.so ;; Ansi Driver
```

</div>

<div id="id1349" class="section">

<div class="titlepage">

<div>

<div>

##### OpenLink Unix ODBC Lite Driver for Informix 9 (Multithreaded):

</div>

</div>

</div>

``` programlisting
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/inf9_mt_lu.so -lthxa -lthsql -lthasf -lthgen -lthos -lifgls -lifglx ;; Unicode Driver
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/inf9_mt_lt.so -lthxa -lthsql -lthasf -lthgen -lthos -lifgls -lifglx ;; Ansi Driver
```

</div>

<div id="id1350" class="section">

<div class="titlepage">

<div>

<div>

##### OpenLink Unix ODBC Lite Driver for Oracle 10g (Multithreaded):

</div>

</div>

</div>

``` programlisting
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/ora100_mt_lu.so -lclntsh -lnnz10 ;; Unicode Driver
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/ora100_mt_lt.so -lclntsh -lnnz10 ;; Ansi Driver
```

</div>

<div id="id1351" class="section">

<div class="titlepage">

<div>

<div>

##### OpenLink Unix ODBC Lite Driver for Ingres II (Multithreaded):

</div>

</div>

</div>

``` programlisting
OPL_XA:(*opl_xa_switch()):/home/openlink/lib/ingii_mt_lt.so ;; Ansi Driver
```

Note that due a limitation in the current Ingres II OpenAPI? XA
implementation our Ingres II Lite driver cannot be used with Tuxedo as
detailed in the OpenLink Ingres II XA Implementation Wiki document, in
which case the MT Ingres II agent is the only available solution
currently

where /home/openlink is the openlink installation directory and OPL_XA
is the rm_alias. Any additional database libraries on which the driver
depends (as shown by ldd) must be included after the driver shared
library name. The example above for the Oracle Lite driver is for a
driver linked against the Oracle 10g Instant Client.

</div>

</div>

</div>

</div>
