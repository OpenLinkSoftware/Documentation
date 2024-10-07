<div id="ch-server" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 6. Administration

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">6.1. [Database Server
Administration](ch-server.html#databaseadmsrv)</span>

<span class="section">6.1.1. [Database](ch-server.html#dbadm)</span>

<span class="section">6.1.2. [Virtual
Database](ch-server.html#vdbconcepts)</span>

<span class="section">6.1.3. [Virtuoso User
Model](ch-server.html#usermodel)</span>

<span class="section">6.1.4. [VAD - Virtuoso Application
Distribution](ch-server.html#vaddistr)</span>

<span class="section">6.1.5. [Data Backup &
Recovery](ch-server.html#backup_recovery)</span>

<span class="section">6.1.6. [Performance
diagnostics](ch-server.html#perfdiag)</span>

<span class="section">6.1.7. [Performance
Tuning](ch-server.html#ptune)</span>

<span class="section">6.2. [HTML based Administration Console
(Conductor) Guide](htmlconductorbar.html)</span>

<span class="section">6.2.1. [Virtuoso Conductor
Administration](htmlconductorbar.html#conductorbar)</span>

<span class="section">6.2.2. [Runtime
Hosting](admui.runtimehosting.html)</span>

<span class="section">6.2.3. [Web
Services](admui.webservices.html)</span>

<span class="section">6.2.4. [WebDAV
Administration](webdavadmin.html)</span>

<span class="section">6.2.5. [Internet
Domains](admui.internetdomains.html)</span>

<span class="section">6.2.6. [XML
Services](admui.xmlservices.html)</span>

<span class="section">6.2.7. [Query Tools](querytools.html)</span>

<span class="section">6.2.8. [Replication &
Synchronization](replicationandsynchronization.html)</span>

<span class="section">6.2.9. [Database
Administration](dbadmin.html)</span>

<span class="section">6.2.10. [Conductor Linked Data
Administration](rdfadm.html)</span>

<span class="section">6.2.11. [Conductor News Server
Administration](newssrvadm.html)</span>

<span class="section">6.3. [Virtuoso Cluster
Operation](clusteroperation.html)</span>

<span class="section">6.3.1.
[General](clusteroperation.html#clusteroperationgeneral)</span>

<span class="section">6.3.2. [Setting up a
Cluster](clusteroperationsetcl.html)</span>

<span class="section">6.3.3. [Using Clustering with an Existing
Database](clusteroperationexdb.html)</span>

<span class="section">6.3.4.
[Partitioning](clusteroperationpart.html)</span>

<span class="section">6.3.5.
[Transactions](clusteroperationtransc.html)</span>

<span class="section">6.3.6.
[Administration](clusteroperationadmin.html)</span>

<span class="section">6.3.7. [Cluster Network Diagnostics and
Metrics](clusteroperationdiagnostics.html)</span>

<span class="section">6.3.8. [Elastic Cluster
Operations](elasticclusteroperation.html)</span>

<span class="section">6.3.9. [Setting CPU
Affinity](ch06s03s09.html)</span>

<span class="section">6.4. [Virtuoso Cluster Fault
Tolerance](fault.html)</span>

<span class="section">6.4.1.
[Introduction](fault.html#faultfaulttolerinto)</span>

<span class="section">6.4.2. [Sample
Configuration](faultfaulttolersampleconfig.html)</span>

<span class="section">6.4.3.
[Transactions](faultfaulttolertransactions.html)</span>

<span class="section">6.4.4. [Dividing Virtuoso Hosts Over Physical
Machines](faultfaulttolerdivid.html)</span>

<span class="section">6.4.5. [Managing
Availability](faultfaulttolermng.html)</span>

<span class="section">6.4.6. [Optimizing Schema for Fault
Tolerance](faultfaulttoleroptm.html)</span>

<span class="section">6.4.7. [Interpreting Status
Messages](faultfaulttolerinterprt.html)</span>

<span class="section">6.4.8. [Administration
API](faultfaulttoleradmapi.html)</span>

<span class="section">6.4.9. [RDF
Specifics](faultfaulttolerrdfspecf.html)</span>

<span class="section">6.4.10. [Fault Tolerance
Programming](faultfaulttolerpragram.html)</span>

</div>

<div id="databaseadmsrv" class="section">

<div class="titlepage">

<div>

<div>

## 6.1. Database Server Administration

</div>

<div>

<div class="abstract">

**Abstract**

This section explains the use of the server executables, configuration
files and general administration procedures. These include backup,
server tuning and profiling, installing extension packages etc. See the
Access Interfaces chapter for a discussion of the command line SQL
interface.

</div>

</div>

</div>

</div>

<div id="dbadm" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.1. Database

</div>

</div>

</div>

See details for
<a href="ch-installation.html#srvadminstallreqt" class="link"
title="2.1.1. Installation Requirements">Installation Requirements</a> ,
<a href="ch-installation.html#srvadmopreq" class="link"
title="2.1.2. Operational Requirements">Operational Requirements</a> ,
<a href="ch-installation.html#srvadmossupport" class="link"
title="2.1.3. Operating System Support">Operating System Support</a> and
<a href="ch-installation.html#limitsandparameters" class="link"
title="2.1.4. Limits">Limits</a> .

<div id="srvadmsrvinst" class="section">

<div class="titlepage">

<div>

<div>

#### Server Instance Creation

</div>

</div>

</div>

Multiple Virtuoso server instances may coexist on a single machine. Each
database will need to be assigned a unique TCP port number. On the
windows platforms (except 95,98,ME) the Virtuoso can be configured for
multiple services. For further details, see the
<a href="creatingdeletingservices.html" class="link"
title="2.2.6. Creating and Deleting Virtuoso Services">Creating and
Deleting Virtuoso Services</a> in the Installation chapter.

To run Virtuoso on a machine, only the Virtuoso server executable and a
valid virtuoso.ini file are needed. An empty database file will be
created automatically at first startup. None of the other files in the
installation are needed for basic operation. Client interfaces may
additionally need ODBC drivers or the like to be set up in system
configuration files or the Windows registry but the server itself does
not depend on these.

</div>

<div id="srvextinst" class="section">

<div class="titlepage">

<div>

<div>

#### Installing Application Packages

</div>

</div>

</div>

Virtuoso comes with optionally installable SQL application packages (VAD
packages) for web based admin, on-line documentation, programming
tutorials and a BPEL processor. The installer typically asks whether to
install these into the demo or the default empty database. Depending on
the OS and form of installer, also depending on whether the installation
is the commercial or open source one, the package files will be in
different locations. To locate them, look for \*.vad. The packages are
typically made in two variants, where one keeps the installed items in
the DAV repository and the other in the file system. They are
functionally equivalent in most cases, except for some tutorials that
will only work in the file system. Keeping installed resources in DAV
has advantages when moving the database or backing up, since the
installed items will not have to be treated separately. To install these
on a database, login as dba using the isql utility and issue the SQL
command:

``` programlisting
# at the OS command line prompt, assuming the dba password is dba and the server is at the default port 1111:

$ isql 1111 dba dba

--  At the SQL prompt:
SQL> vad_install ('conductor_dav.vad', 0);
-- The path is relative to the server's working directory.

        
```

Since the packages are read from and sometimes the extracted contents
are written to the file system, the server must have access to the
directories in question. Checjk OS permissions and set the DirsAllowed
parameter in the ini file to allow the needed access.

After the packages are installed, they can be used by pointing the web
browser to their start page. The start pages are listed on the root page
of the demo database and at the Getting Started section of the Open
Virtuoso web site. The start page for the Conductor web admin interface
is /conductor, the docs are at /doc/html, the tutorials at /tutorial,
the BPEL admin and demos at /BPELGUI. All these are directly under the
default Virtuoso web listener, the port is shown in the messages log and
read from the HTTP Server section of the virtuoso.ini file.

</div>

<div id="srvadmlicensing" class="section">

<div class="titlepage">

<div>

<div>

#### Server Licensing

</div>

</div>

</div>

The Virtuoso server requires a valid license file before it will
successfully start. The license file is a file always called
<span class="emphasis">*virtuoso.lic*</span> and must reside in the
working directory of the database instance - where the
\<database-name\>.db file resides for the instance.

Evaluations versions of Virtuoso come without a license file, however
the registration procedure takes your email address, which will be used
to email a new license file for you evaluation.

</div>

<div id="srvadmlogging" class="section">

<div class="titlepage">

<div>

<div>

#### Server Logging - Detecting Errors

</div>

</div>

</div>

Virtuoso provides extensive log information for resolving problems.
Should any problems arise Virtuoso logs should always be consulted.

The Virtuoso server by default will send log information to two places,
the appropriate system log for the operating system and the virtuoso.log
file. On Unix based operating systems, including Linux, this information
will appear in the system log files. On Windows the Virtuoso log
information will appear in the Application Event Log.

Virtuoso logs information in the system logs before the Virtuoso.log
file is open. This advantageously will log errors that cannot be placed
in the virtuoso.log file, such as when the virtuoso.ini file cannot be
located during Virtuoso startup.

The system log feature can be disabled using the "Syslog" parameter in
the \[Database\] section. This is described in more detail in the
following section.

</div>

<div id="configsrvstupfiles" class="section">

<div class="titlepage">

<div>

<div>

#### Configuring Server Startup Files

</div>

</div>

</div>

<div id="virtini" class="section">

<div class="titlepage">

<div>

<div>

##### Virtuoso Configuration File

</div>

</div>

</div>

The virtuoso.ini file is read from the directory that is current at
server startup. This file contains an entry for all user settable
options in the server. It is divided into the following sections:

<div class="itemizedlist">

- \[Database\] Location of database files

- \[Parameters\] Server tuning, options

- \[HTTPServer\] Settings in this section control the web server
  component of the Virtuoso Server.

- \[URIQA\] Settings in this optional section control URIQA semantic web
  enabler.

- \[Flags\] Settings for options that are generally used with
  <a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
  class="function">__dbf_set</code></a> as temporally valid ( such as
  enable_joins_only), to be set as permanent.

- \[SPARQL\] Settings in this optional section control SPARQL protocol
  endpoint default parameters and limits.

- \[I18N\] encoding settings

- \[Replication\] The replication section sets the transactional
  replication parameters for the server.

- \[Mono\] The Mono section contains settings for Virtuoso with Mono
  Runtime CLR support.

- \[Client\] Client default settings

- \[AutoRepair\] Corrupted database recovery

- \[Striping\] Multi-file / multi-disk databases

- \[VDB\] Virtual database functionality related options

- \[Ucms\] location of UCM files describing multi-byte encodings such as
  Far East languages

- \[Zero Config\] ZeroConfig related options

- \[Plugins\] VSEI plugin modules

</div>

Below are the descriptions for each parameter

<div id="ini_database" class="section">

<div class="titlepage">

<div>

<div>

###### \[Database\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_database_databasefile">

  **DatabaseFile=virtuoso.db. ** For a single file database, this is the
  relative path of the file in the format appropriate to the platform.
  The path is resolved relative to the directory that is current at
  server startup. All other paths are interpreted similarly.

  </div>

- <div id="ini_database_transactionfile">

  **TransactionFile=virtuoso.trx. ** This is the transaction log file.
  If this parameter is omitted, which should never be the case in
  practice, the database will run without log, meaning that it cannot
  recover transactions committed since last checkpoint if it should
  abnormally terminate. There is always a single log file for one
  server. The file grows as transactions get committed until a
  checkpoint is reached at which time the transactions are applied to
  the database file and the trx file is reclaimed, unless
  CheckpointAuditTrail is enabled.

  </div>

- <div id="ini_database_errorlogfile">

  **ErrorLogFile=virtuoso.log. ** This file logs database error
  messages, e.g. 'out of disk'. By viewing this the dba can trace
  problems and see at which times the server has started, checkpoints
  have been made, etc.

  </div>

- <div id="ini_database_errorloglevel">

  **ErrorLogLevel=7. ** This controls what events get logged into the
  database error log. This should always be 7.

  </div>

- <div id="ini_database_lockfile">

  **LockFile=virtuoso.lck. ** This optional parameter can be used to
  manually specify the location of the Virtuoso lock (.lck) file. This
  can be relative or the full path to the lock file. Virtuoso, by
  default, creates a file with the same name as the DatabaseFile but
  with the extension of .lck. This file exists when the Virtuoso server
  is running to prevent it starting multiple times using the same
  parameters, and should be automatically removed by the server upon
  exit. However, not all file systems support file locking, such as NFS,
  therefore this parameter can be set to keep the lock file on a more
  appropriate file system.

  </div>

- <div id="ini_database_fileextend">

  **FileExtend=100. ** This is the size that the database file
  automatically grows (in 8k pages) when the current file is not large
  enough. Default = minimum = 100. The parameter has no effect if
  striping is set.

  </div>

- <div id="ini_database_striping">

  **Striping=0. ** A non-zero value will enable the settings in
  \[Striping\] to take effect. If this is the case the DatabaseFile
  parameter is ignored and the files in \[striping\] are used.

  </div>

- <div id="ini_database_logsegments">

  **LogSegments. ** If this is non-zero log segmentation is enabled.
  This is only used for crash dumps where several files may be needed to
  accommodate the recovery logs. If non-zero, this will be followed by
  entries of the form Log1=...

  </div>

- <div id="ini_database_log">

  **Log1=/tmp/log1.trx 100M. ** The number in Log\<n\> is the ordinal
  number of the log, starting at 1. The entry consists of the file name
  and allocated size with an optional size modifier. Available modifiers
  are B for blocks of 4k (default if unspecified, K for kilobytes, M for
  megabytes, and G for gigabytes. The log is filled up to the first
  transaction that exceeds the size. The log therefore will be longer
  than the allocated size. If blobs are involved, this amount can be
  quite substantial. It is therefore advisable to have some extra space
  available on the storage device used for recovery logs.

  </div>

- <div id="ini_database_crashdump">

  **crashdump_start_dp, crashdump_end_dp. ** These options make it
  possible to produce a crash dump of a specified range of disk pages.
  In case the server runs out of disk space during a dump, the error
  message indicates the page at which the next dump should be started
  after the user has made more space available. In this case it is
  important to rename the already produced crash dump or change the
  Logx= -entries in virtuoso.ini to avoid overwriting said files. If
  none of these options are provided, the server will attempt a crash
  dump of the entire database storage.

  </div>

- <div id="ini_database_tempstorage">

  **TempStorage = \<TempDatabase_Name\>. ** The name of a section in the
  INI file containing temporary database details. If this parameter is
  omitted or the section does not exist the default values for temporary
  storage are used.

  </div>

- <div id="ini_database_syslog">

  **Syslog = 1/0 (default 0). ** Virtuoso can writes log worthy messages
  to the system log (Unix based operating systems including Linux) or
  the Windows Event Log (Windows operating systems). Messages are
  written in the system/event log before the virtuoso.log file is
  opened, therefore errors due to absence of virtuoso.ini log are
  loggable there. This system/event logging can be enabled using this
  option, by default it is set to 0 meaning off.

  On Unix/Linux messages are written as "Virtuoso" events.

  On Windows messages are written in the Application event log.

  </div>

</div>

</div>

<div id="ini_tempdatabase" class="section">

<div class="titlepage">

<div>

<div>

###### \[\<TempDatabase_Name\>\]

</div>

</div>

</div>

This section name must match the TempStorage parameter in the Database
section of the Virtuoso INI file to be of any use. Otherwise this
section will be ignored.

<div class="itemizedlist">

- <div id="ini_tempdatabase_databasefile">

  **DatabaseFile = \<database file name\>.tdb. ** Name of temporary
  database file.

  </div>

- <div id="ini_tempdatabase_transactionfile">

  **TransactionFile = \<transaction file name\>.ttr. ** Name of
  temporary transaction file.

  </div>

- <div id="ini_tempdatabase_fileextend">

  **FileExtend = NNN. ** Increment amount by which the database file
  will dynamically grow. This setting is identical in use and purpose to
  parameter in the Database section with the same name.

  </div>

</div>

</div>

<div id="ini_parameters" class="section">

<div class="titlepage">

<div>

<div>

###### \[Parameters\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_parameters_singlecpu">

  **SingleCPU=0. ** This is a Win32 specific option that forces Virtuoso
  to only run on one CPU in a multiprocessor environment.

  </div>

- <div id="ini_parameters_serverport">

  **ServerPort=\[\<IP Address\>\]:\<port\>. ** This is the IP Address
  and port number where the server will start listening. You do not need
  to specify the listening IP Address but can do in a situation that you
  want the server to bind to a specific address only.

  </div>

- <div id="ini_parameters_serverthreads">

  **ServerThreads=10. ** This is the maximum number of threads used in
  the server. This should be close to the number of concurrent
  connections if heavy usage is expected. Different systems have
  different limitations on threads per process but a value of 100 should
  work in most places.

  </div>

- <div id="ini_parameters_serverthreadsize">

  **ServerThreadSize=50000. ** Stack size of thread used for reading
  client messages and accepting connections.(default : 50 000 bytes)

  </div>

- <div id="ini_parameters_mainthreadsize">

  **MainThreadSize=100000. ** Stack size of the main thread (default :
  100 000 bytes)

  </div>

- <div id="ini_parameters_threadcleanupinterval">

  **ThreadCleanupInterval. ** The interval in minutes (default : 0)
  after which threads in the thread pool should be released.

  </div>

- <div id="ini_parameters_threadthreshold">

  **ThreadThreshold. ** The maximum number of threads (default : 10) to
  leave in the thread queue after thread clean-up interval has expired.

  </div>

- <div id="ini_parameters_schedulerinterval">

  **SchedulerInterval. ** Defines the scheduler wake-up interval ( in
  minutes). By default is 0 i.e. the scheduler is disabled.

  </div>

- <div id="ini_parameters_resourcecleanupinterval">

  **ResourcesCleanupInterval. ** The interval in minutes (default : 0)
  after which allocated resources will be flushed..

  </div>

- <div id="ini_parameters_futurethreadsize">

  **FutureThreadSize=100000. ** Stack size of worker threads. This is
  the stack size for serving any client SQL statements or HTTP requests.
  This can be increased if the application uses recursive stored
  procedures or links in external code needing a large stack. (default
  100 000 bytes)

  </div>

- <div id="ini_parameters_tempallocationpct">

  **TempAllocationPct. ** A Percentage that may be greater than 100%.
  This gives a percentage of the main .db file to which the temp db file
  may grow before starting to reclaim the oldest persistent hash index.
  Basically if a particular hash index is reusable (i.e. it references
  only table columns and the values in these columns have not changed)
  the engine keeps the hash index defined into the temp db for reuse.
  This parameter allows some control over the temp db file size.

  </div>

- <div id="ini_parameters_odirect">

  **O_DIRECT. ** If this is non-zero, the database file(s) will be
  opened with the O_DIRECT option on platforms where this is supported.
  This has the effect of doing file system I/O from application buffers
  directly, bypassing caching by the operating system. This may be
  useful if a large fraction of RAM is configured as database buffers.
  If this is on, the file system cache will not grow at the expense of
  the database process, for example it is less likely to swap out memory
  that Virtuoso uses for its own database buffers. Mileage will vary
  according to operating system and version. For large databases where
  most of system memory is used for database buffers it is advisable to
  try this.

  </div>

- <div id="ini_parameters_checkpointinterval">

  **CheckpointInterval=60. ** This is the interval in minutes at which
  Virtuoso will automatically make a database checkpoint. The automatic
  checkpoint will not be made if there is less than
  MinAutoCheckpointSize bytes in the current transaction log. A
  checkpoint interval of 0 means that no periodic automatic checkpoints
  are made.

  Setting the value to -1 disables also the checkpoints made after a
  roll forward upon database startup. This setting should be used when
  backing up the database file(s). This guarantees that even if the
  server dies and restarts during the copy, no checkpoints that would
  change these files will take place and thus the backup is clean.

  the checkpoint_interval SQL function may be used to change the
  checkpoint interval value while the database is running.

  </div>

- <div id="ini_parameters_checkpointsyncmode">

  **CheckpointSyncMode=2. ** This controls how the file system is
  synchronized after a checkpoint. Once the checkpoint has issued all
  write system calls it needs it can do one of the following depending
  on this setting:

  0\. - Continue, leave the OS to flush buffers when it will.

  1\. - Initiate the flush but do not wait for it to complete.

  2\. - Block until the OS has flushed all writes pertaining to any of
  the database files.

  </div>

- <div id="ini_parameters_pagemapcheck">

  **PageMapCheck=0. ** This controls the check of page maps:

  0\. - disables the check of page maps.

  1\. - enables the check of page maps.

  </div>

- <div id="ini_parameters_numberofbuffers">

  **NumberOfBuffers=2000. ** This controls the amount of RAM used by
  Virtuoso to cache database files. This has a critical performance
  impact and thus the value should be fairly high for large databases.
  Exceeding physical memory in this setting will have a significant
  negative impact. For a database-only server about 65% of available RAM
  could be configured for database buffers.

  Each buffer caches one 8K page of data and occupies approximately 8700
  bytes of memory.

  </div>

- <div id="ini_parameters_maxcheckpointremap">

  **MaxCheckpointRemap=2000. ** Specifies how many pages Virtuoso is
  allowed to remap. Remapping means that pages can consume the space of
  two actual pages until checkpoint. See the
  <a href="checkpoint.html#checkpointparams" class="link"
  title="9.21.1. Checkpoint &amp; Page Remapping">Checkpoint &amp; Page
  Remapping</a> section in the SQL Reference chapter for more
  information.

  </div>

- <div id="ini_parameters_prefixresultnames">

  **PrefixResultNames=0. ** This setting should always be 0.

  </div>

- <div id="ini_parameters_casemode">

  **CaseMode=1. ** This controls the case sensitivity of the Virtuoso
  SQL interpreter. The following values are supported:

  <div class="itemizedlist">

  - 0 - SQL is case sensitive and identifiers are stored in the case
    they are entered in. This is similar to the Progress or Informix
    default.

  - 1 - SQL is case sensitive and Unquoted identifiers are converted to
    upper case when read. To use non-upper case identifiers, the
    identifiers must be quoted with double quotes ("). This is similar
    to Oracle.

  - 2 - SQL is case-insensitive and identifiers are stored in the case
    where first seen. Unlike the situation in other modes, two
    identifiers differing only in case cannot exist. This is similar to
    the MS SQL Server 7 default behavior.

  </div>

  <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                              |                                                                                                                                                 |
  |:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                           |
  |                              | Once a database is created in one case mode the case mode should not be changed as that may change the interpretation of stored procedures etc. |

  </div>

  </div>

- <div id="ini_parameters_minautocheckpointsize">

  **MinAutoCheckpointSize=4000000. ** See CheckpointInterval.

  </div>

- <div id="ini_parameters_autocheckpointlogsize">

  **AutoCheckpointLogSize. ** This is the size of transaction log in
  bytes after which an automatic checkpoint is initiated. If this is
  non-zero, whenever the transaction log size exceeds this size an
  automatic checkpoint is started. This will result in approximately
  like sized logs to be generated. This is useful with the
  CheckpointAuditTrail option for generating a trail of equal sized
  consecutive logs.

  </div>

- <div id="ini_parameters_checkpointaudittrail">

  **CheckpointAuditTrail=1. ** If this is non-zero each checkpoint will
  start a new log and leave the old transaction log untouched. A 0 value
  indicates that the transaction log may be reused once the transactions
  in it have been written in a checkpoint.

  If it is important to keep an audit trail of all transactions in the
  database's life time then this option should be true. A new log file
  will be generated in the old log file's directory with a name ending
  with the date and time of the new log file's creation. Old log files
  can be manually copied into backup storage or deleted. Only one log
  file is active at one time. The newest log file may at any time be
  written to by the server, but that is the only log file Virtuoso has
  open at each time. Thus reading any logs is safe. Writing or deleting
  the active log file will result in loss of data, and possibly
  referential integrity, in the database. See the
  <a href="ch-functions.html#backup" class="link">Back and Recovery</a>
  chapter for more information on this and related parameters.

  </div>

- <div id="ini_parameters_allowoscalls">

  **AllowOSCalls=0. ** If non-zero the system SQL function is enabled.
  This will allow a dba group user to run shell commands through SQL.
  This poses a potential security risk and hence the setting should
  normally be 0.

  </div>

- <div id="ini_parameters_maxstaticcursorrows">

  **MaxStaticCursorRows=5000. ** This is the maximum number of rows
  returned by a static cursor. Default = 5000

  </div>

- <div id="ini_parameters_freetextbatchsize">

  **FreeTextBatchSize=10000000. ** This is the amount of text data
  processed in one batch of the free-text index when doing a batch
  update or non-incrementally reindexing the data. Default : 10,000,000

  </div>

- <div id="ini_parameters_mullunspecifiedparams">

  **NullUnspecifiedParams. ** When set to 1, if an application prepares
  a statement with insufficient number of input parameters, the
  unspecified ones are assumed to be NULL.

  </div>

- <div id="ini_parameters_collation">

  **Collation. ** Defines a sorting order according to SYS_COLLATIONS.
  The name supplied to this parameter must be in
  <a href="fn_charsets_list.html" class="link" title="charsets_list"><code
  class="function">charsets_list(1)</code></a> .

  </div>

- <div id="ini_parameters_dirsallowed">

  **DirsAllowed=\<path\> \[, \<path\>\]. ** \<path\> :=
  \<absolute_path\> or \<relative_path\> comma-delimited list of OS
  directories allowed for file operations such as `file_to_string()` .
  The server base directory (the directory containing this INI file)
  must appear in this list to enable File DSNs to work. On Windows, use
  "\\ as the path separator; on Unix-like OS including Linux and macOS
  10.x and later, use ":". The Virtuoso ISQL utility can be used to
  check the Server DirsAllowed params as described below. The following
  should show the server's working directory and INI file name in the
  result.

  ``` programlisting
  SQL> select server_root (), virtuoso_ini_path ();
  ```

  You can also check the relevant INI setting by running the following
  statement:

  ``` programlisting
  SQL> select cfg_item_value (virtuoso_ini_path (), 'Parameters',
  'DirsAllowed');
  ```

  </div>

- <div id="ini_parameters_dirsdenied">

  **DirsDenied=\<path\> \[, \<path\>\]. ** \<path\> := \<absolute_path\>
  or \<relative_path\> OS directories denied for file operations. See
  <a href="ch-server.html#acl" class="link"
  title="File System Access Control Lists">Virtuoso ACL's</a> for
  information on functions that are restricted.

  </div>

- <div id="ini_parameters_vadinstalldir">

  **VADInstallDir=\<path\>. ** \<path\> := \<absolute_path\> or
  \<relative_path\> OS directory containig VADs files. When set, enables
  automatic update of vads on server startup. On Windows use in the path
  "\\.

  </div>

- <div id="ini_parameters_sslserverport">

  **SSLServerPort. ** Specifies the port on which the server listens for
  incoming SSL CLI requests.

  </div>

- <div id="ini_parameters_sslcertificate">

  **SSLCertificate. ** The SSL certificate to use (same meaning as the
  SSLCertificate in HTTPServer section)

  </div>

- <div id="ini_parameters_sslprivatekey">

  **SSLPrivateKey. ** The server's private key (same meaning as the
  SSLCertificate in HTTPServer section)

  </div>

- <div id="ini_parameters_maxoptimizelayouts">

  **MaxOptimizeLayouts = 1000. ** This parameter governs the maximum
  number of partial or full join orders that the Virtuoso SQL Optimized
  compiler will calculate per select statement. When MaxOptimizeLayouts
  has been reached, the best execution plan reached thus far will be
  used. The default value is 1000, specifying 0 will try all possible
  orders and guarantee that the best plan is reached.

  </div>

- <div id="ini_parameters_stopcompilerwhenxoverruntime">

  **StopCompilerWhenXOverRunTime = 0. ** The default value is 0. If
  non-zero, this specifies that the SQL compiler should stop considering
  alternative execution plans after the elapsed compilation time exceeds
  the best run time estimate times the parameter. For example, if this
  is 2, then compilation stops after using twice the time of the best
  plan reached thus far. Enabling this option increases performance when
  processing short running queries that are each executed once. Using
  this with long running queries or prepared parametrized queries is not
  useful and may lead to non-optimal plans being selected.

  </div>

- <div id="ini_parameters_traceon">

  **TraceOn = option1 \[, option2 \[, ..\]\]. ** This parameter accepts
  a comma-delimited list of tracing options to activate by default.
  Enabled trace options will list there respective errors in the
  virtuoso.log file when encountered. Valid options are:

  |                 |
  |-----------------|
  | user_log        |
  | failed_log      |
  | compile         |
  | ddl_log         |
  | client_sql      |
  | errors          |
  | dsn             |
  | sql_send        |
  | transact        |
  | remote_transact |
  | exec            |
  | soap            |

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                                                                                     |
  |:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                                                                                           |
  |                            | The functions: <a href="fn_trace_on.html" class="link" title="trace_on"><code                                                       
                                class="function">trace_on()</code></a> and <a href="fn_trace_off.html" class="link" title="trace_off"><code                          
                                class="function">trace_off()</code></a> which use the same options and can turn logging options on/off while the server is running.  |

  </div>

  <div id="ex_traceoniniopt" class="example">

  **Example 6.1. Using the TraceOn ini file option**

  <div class="example-contents">

  ``` programlisting
  [Parameters]
  ....
  TraceOn = soap, errors
  ...
  ```

  This will enable logging of additional information regarding SOAP
  calls and SQL run-time errors into the virtuoso.log file.

  </div>

  </div>

    

  <div id="ex_threadcleanupinterval" class="example">

  **Example 6.2. Using the ThreadCleanupInterval and
  ResourcesCleanupInterval ini file option**

  <div class="example-contents">

  ``` programlisting
  [Parameters]
  ....
  ThreadCleanupInterval    = 1
  ResourcesCleanupInterval = 1
  ...
  ```

  Set both to 1 in order to clean up unused threads/resources and reduce
  memory consumption of the Virtuoso server, which can otherwise be
  construed as memory leaks.

  </div>

  </div>

    

  If an invalid option is set then this error will be listed in the
  virtuoso.log file upon server startup. Virtuoso will continue to log
  selected options unless the trace_off() function is called for that
  item.

  </div>

- <div id="ini_parameters_allowpasswordencryption">

  **AllowPasswordEncryption = 1/0. ** Determines whether Virtuoso
  encryption should be accepted from client connections. The default
  value is 1 - on. If set to 0 then only clear text and digest
  authentication will be accepted.

  </div>

- <div id="ini_parameters_javaclasspath">

  **JavaClasspath. ** This parameter is applied to the environment prior
  to the server's startup. It is valid only for binaries hosted in the
  Virtuoso Java VM. This has the same format as the Java CLASSPATH
  environment variable for the platform being used.

  Virtuoso searches for classes in the following order:

  |                                                              |
  |--------------------------------------------------------------|
  | The java_vm_create VSE parameter list                        |
  | This "JavaClasspath" in \[Parameters\] INI section           |
  | The CLASSPATH environment variable                           |
  | If none of the above the CLASSPATH is the current directory. |

  </div>

- <div id="ini_parameters_javavmoption">

  **JavaVMOption1..N = \<opts\>. ** These can be used for setting Java
  options for the Java runtime hosted in Virtuoso. These options work as
  if provided as command line options to the JRE's Java command line.

  More than one line of options can be specified by using consecutively
  numbered options:

  ``` programlisting
  JavaVMOption1  = -Ddt1=val1
  JavaVMOption2  = -Ddt2=val2
  ...
  JavaVMOption5  = -Ddt5=val5
  ```

  </div>

- <div id="ini_parameters_pldebug">

  **PLDebug = 0. ** The PLDebug switch controls the type of debugging
  enabled:

  |                                                                                                                                                                                |
  |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | <span class="emphasis">*PLDebug = 0*</span> - default debugging information and test coverage disabled.                                                                        |
  | <span class="emphasis">*PLDebug = 1*</span> - debugging information enabled.                                                                                                   |
  | <span class="emphasis">*PLDebug = 2*</span> - debugging information enabled, test coverage data will be written to file specified in TestCoverage Virtuoso ini file parameter. |

  </div>

- <div id="ini_parameters_testcoverage">

  **TestCoverage = cov.xml. **

  </div>

- <div id="ini_parameters_callstackonexception">

  **CallstackOnException = 0. ** Controls whether Virtuoso will report
  call stack on errors.

  This parameters takes the following values:

  |                                              |
  |----------------------------------------------|
  | 0 (default) - Call stack reporting disabled. |
  | 1 - Call stack reporting enabled.            |

  </div>

- <div id="ini_parameters_compileproceduresonstartup">

  **CompileProceduresOnStartup = 1. ** This controls whether Virtuoso
  will recompile all stored procedures listed in SYS_PROCEDURES and
  internal PL procedures defined during server startup. By default
  Virtuoso will recompile all procedures, with this setting set to 0
  Virtuoso will defer compilation until procedures' first call. The
  benefits of this are that Virtuoso may start up up to 2-3 times
  faster, also the initial memory consumption will be significantly
  reduced as it does not need to analyze all the long varchar data
  allocating memory for execution. This setting is a boolean, either 1
  or 0. This setting does not apply to attached VDB procedures or
  modules.

  </div>

- <div id="ini_parameters_fdsperfile">

  **FDsPerFile = 1. ** Controls the number of file descriptors per file
  to be obtained from the OS. The default and minimum value is 1. This
  parameter only effects databases that use striping. Having multiple
  FDs per file means that as many concurrent I/O operations may
  simultaneously be pending per file. This allows more flexibility for
  the OS to schedule the operations, potentially improving file I/O
  throughput

  </div>

- <div id="ini_parameters_recursivefreetextusage">

  **RecursiveFreeTextUsage = 1/0 default 1. ** This option controls the
  behavior of free-text triggers in super-tables. If this option is set
  to 1 then Virtuoso will scan the hierarchy of tables until a free-text
  index is used to use when compiling SQL statements involving contains,
  xcontains or xpath_contains.

  </div>

- <div id="ini_parameters_recursivetriggercalls">

  **RecursiveTriggerCalls = 1/0 default 1. ** This option controls the
  behavior of super-table triggers. When this option is set to 1 then
  triggers in the super-table will be called before its own (sub-table)
  triggers. This behavior is recursive and will continue up the branch
  of recursion, hence the triggers in the top most table in the chain
  will be called first.

  </div>

- <div id="ini_parameters_maxsortedtoprows">

  **MaxSortedTopRows = 10000. ** The TOP select statement clause caches
  in memory the rows pertinent to the result. The number of rows allowed
  to be cached within memory is limited by this parameter.

  <span class="emphasis">*Simple example using OFFSET and LIMIT:*</span>

  Virtuoso uses a zero index in the OFFSET. Thus in the example below,
  will be taken position at record 9000 in the result set, and will get
  the next 1000 rows starting from 9001 record. Note that the
  MaxSortedTopRows in parameters Virtuoso ini section needs to be
  increased (default is 10000).

  ``` programlisting
  select ?name
  ORDER BY ?name
  OFFSET 9000
  LIMIT 1000
  ```

  </div>

- <div id="ini_parameters_disableunixsocket">

  **DisableUnixSocket = 0/1 default 0. ** This parameter is only
  applicable to Unix servers. Virtuoso clients on the `localhost` of the
  server can benefit from using Unix Domain sockets to improve
  connection performance. By default (DisableUnixSocket = 0) Virtuoso
  will open a Unix Domain listen socket in addition to the TCP listen
  socket. The name of the UD socket is `/tmp/virt-<tcp-listen-port>` .
  When a client attempts to connect to the Virtuoso server using the
  specific address `localhost` it will first try connecting to the UD
  socket, failing that it will silently revert to the TCP socket. See
  the <a href="accintudsockets.html" class="link"
  title="7.7. Unix Domain Socket Connections">Unix Domain Socket
  Connections</a> section for more details.

  </div>

- <div id="ini_parameters_transactionafterimagelimit">

  **TransactionAfterImageLimit = N bytes default 50000000. ** When the
  roll-forward log entry of a transaction exceeds this size, the
  transaction is too large and is marked as uncommittable. This work as
  upper limit otherwise infinite (transactions). The default is 50Mb .
  Then also note that transaction roll-back data takes about 2x of
  roll-forward data. Hence when the transaction roll-forward data which
  is 50Mb the total transient consumption is closer to 150 Mb.

  </div>

- <div id="ini_parameters_tempsesdir">

  **TempSesDir. ** Directory for storing temporary data for large object
  handled in replication and HTTP server. Defaults to server home
  directory.

  </div>

- <div id="ini_parameters_dbevenable">

  **DbevEnable = 0/1 default 1. ** Enable or disable Database Event
  Hooks .

  </div>

- <div id="ini_parameters_runas">

  **RunAs. ** Specifies the OS user name to which the server will switch
  after opening the listen ports. Has an effect only on the operating
  systems that support it.

  </div>

- <div id="ini_parameters_maxmempoolsize">

  **MaxMemPoolSize = 200000000. ** This parameter specifies the limit of
  the memory to be used for compiling a SQL statement. If the query
  compilation requires more memory an error will be signalled. If this
  is a zero then no limit will be applied. The default is 200000000.
  i.e. when no parameter is specified, also if negative number or less
  than 5000000 is given then it would be set to 5000000 bytes.

  </div>

- <div id="ini_parameters_defaultisolation">

  **DefaultIsolation. ** This specifies the default transaction
  isolation. This isolation is used unless overridden by a client
  setting it using the SQL_TXN_ISOLATION or equivalent connection option
  or a stored procedure locally setting it with the SET statement. The
  values are as by the SQL_TXN\_ constants in ODBC, that is, 1 for read
  uncommitted, 2 for read committed, 4 for repeatable read and 8 for
  serializable. If nothing is specified, the default is repeatable read.

  </div>

- <div id="ini_parameters_useaio">

  **UseAIO. ** This specifies whether to use asynchronous file I/O on
  supporting Unix systems. A value of 0 means not using it. A value of 1
  means using lio_listio for any background write or read ahead if
  available. A value of 2 means to use the regular blocking read and
  write but to merge adjacent operations into a single system call when
  possible.

  </div>

- <div id="ini_tempdbsize">

  **TempDBSize. ** Controls the acceptable size of the temp database
  file. If on startup it's size (in MB) is greater than TempDBSize the
  file gets deleted and reset. This feature can be turned off by setting
  TempDBSize to 0. Note that the temp db file serves as an optimization
  storage only and doesn't have any client data that are not in either
  the main database files or the corresponding transaction log files.

  </div>

- <div id="ini_litemode">

  **LiteMode = 0/1 (default 0). ** Runs server in lite mode. When Lite
  mode is on:

  <div class="itemizedlist">

  - the web services are not initialized i.e. no web server, dav, soap,
    pop3 etc.

  - the replication is stopped

  - the pl debugging is disabled

  - plugins are disabled

  - rendezvous is disabled

  - the relevant tables to the above are not created

  - the index tree maps is set to 8 if no other setting is given

  - memory reserve is not allocated

  - affects DisableTcpSocket. So DisableTcpSocket setting is treated as
    1 when LiteMode=1, regardless of value in INI file

  </div>

  </div>

- <div id="ini_rdffreetextrulessize">

  **RdfFreeTextRulesSize = 10 or more. ** The size of hash to control
  rdf free text index

  </div>

- <div id="ini_indextreemaps">

  **IndexTreeMaps = 2 -1024 (power of 2). ** Size of index tree maps,
  larger is better for speed but consume memory, in lite is 2 in
  'normal' mode is 256 by default.

  </div>

- <div id="ini_disabletcpsocket">

  **DisableTcpSocket = 1/0. ** Default = 0. If set to 1, disables
  database listener on TCP port; unix socket must be used for data
  access connections (ODBC, JDBC, ADO.NET, OLE DB). When LiteMode=1,
  DisableTcpSocket setting in INI file is ignored and treated as if set
  to 1.

  </div>

- <div id="ini_extentreadthreshold">

  **ExtentReadThreshold. ** Controls speculative read of disk pages. If
  pages are read in close succession from an extent of 256 consecutive
  pages, the system may decide to speculatively read the entire extent.

  ExtentReadThreshold parameter gives how many consecutive reads are
  needed to trigger this.

  When is set to 0, this means that anytime a page is read, the whole
  extent is read along with it

  When is set to 1, this means that if the first read is at time
  <span class="emphasis">*t*</span> and the next one at time
  <span class="emphasis">*t1*</span> and
  <span class="emphasis">*t1-t*</span> \< ini_ExtentReadWindow msec,
  then 2nd read triggers the speculative read.

  Default is 2.

  Takes effect after the buffer pool is full.

  </div>

- <div id="ini_extentreadwindow">

  **ExtentReadWindow. ** Controls speculative read of disk pages. If
  pages are read in close succession from an extent of 256 consecutive
  pages, the system may decide to speculatively read the entire extent.

  ExtentReadWindow parameter gives the time within which the reads must
  fall.

  Default is 1000.

  Takes effect after the buffer pool is full.

  </div>

- <div id="ini_extentreadstartupthreshold">

  **ExtentReadStartupThreshold. ** Controls speculative read of disk
  pages. If pages are read in close succession from an extent of 256
  consecutive pages, the system may decide to speculatively read the
  entire extent.

  ExtentReadStartupThreshold parameter value applies while the server is
  freshly started and the buffer pool is not yet full. It can be set to
  preread more aggressively.

  Default is 0.

  </div>

- <div id="ini_extentreadstartupwindow">

  **ExtentReadStartupWindow. ** Controls speculative read of disk pages.
  If pages are read in close succession from an extent of 256
  consecutive pages, the system may decide to speculatively read the
  entire extent.

  ExtentReadStartupWindow parameter value applies while the server is
  freshly started and the buffer pool is not yet full. It can be set to
  preread more aggressively.

  Default is 40000.

  </div>

- <div id="ini_columnstore">

  **ColumnStore. ** If 1, all create table and create index statements
  will create column-store structures by default.

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_asyncqueuemaxthreads">

  **AsyncQueueMaxThreads. ** Sets the number of threads in a pool that
  is used for getting extra threads for running queries and for
  aq_request. Each running statement has at least one thread that is not
  allocated from this pool plus zero or more threads from this pool.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  Setting the pool size to the number of cores plus a few is a
  reasonable default. On platforms with core multithreading, one can
  count a core thread as a core for purposes of this parameter.

  If one expects to run many slow `aq_requests()` (see `async_queue()` ,
  `aq_request()` , etc.), then the number of threads should be increased
  by the number of slow threads one expects.

  Slow threads are typically I/O bound threads used for web crawling or
  similar long-latency, low-CPU activity.

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_threadsperquery">

  **ThreadsPerQuery. ** This is maximum number of threads that can be
  claimed from the thread pool by a single query. A value of one means
  that no query parallelization will take place, and all queries will
  run single threaded.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  The number of cores on the machine is a reasonable default if running
  large queries.

  Note that since every query is served by at least one thread, a single
  query taking all the extra threads will not prevent other queries from
  progressing.

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_vectorsize">

  **VectorSize. ** This the number of simultaneous sets of query
  variable bindings processed at one time. The default is 10,000, which
  is good for most cases.

  ``` programlisting
  SELECT COUNT (*)
  FROM t1 a,
       t1 b
  WHERE a.row_no + 1 = b.row_no
  OPTION (LOOP, ORDER)
  ```

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  If we are evaluating the query:

  with vector size of 10,000, then 10,000 rows of t1 a will be fetched
  first; 1 will be added to the 10,000 row_no values; and then the
  corresponding row of t1 b will be fetched for the 10,000 row_no of
  t1 a. This process will repeat until enough batches of t1 a have been
  fetched to come to its end.

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_adjustvectorsize">

  **AdjustVectorSize. ** Using a larger vector size when evaluating
  large queries with indexed random-access can yield up to a 3x speed-up
  relative to using the default vector size. However, always using a
  large vector size will prohibitively increase the overhead of running
  small queries. For this reason, there is the option to adaptively
  select the vector size. Set AdjustVectorSize = 1 to enable this
  feature. The SQL execution engine will increase the vector size when
  it sees an index lookup that does not get good locality, (e.g., after
  sorting the keys to look for, too few consecutive lookups fall on the
  same page). Having more keys to look up increases the chance that
  consecutive keys should be found on the same page, thus eliminating
  much of the index lookup cost.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_maxquerymem">

  **MaxQueryMem. ** This controls the maximum amount of memory that can
  be used across the server process for large vectors, i.e. if the
  memory in use is near this limit, a query will not switch to large
  vector size even if it finds it useful. The event counter
  tc_no_mem_for_longer_batch counts how many times this situation is
  detected. A size letter of G or M follows the value.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_hashjoinspace">

  **HashJoinSpace. ** This controls the maximum amount of memory that
  can be used across the server process for hash join hash tables. This
  is followed by a size letter M or G. A single hash join hash table
  will only claim a percentage of the remaining hash join space, by
  default 50. This is controlled by the chash_per_query_pct setting, see
  section on vectored execution tuning. If there is not enough memory, a
  partitioned hash join will be used, making as many passes over the
  data as needed so that the hash table will fit within the set limits.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_maxvectorsize">

  **MaxVectorSize. ** When AdjustVectorSize is on, this setting gives
  the maximum vector size. The default is 1,000,000 and the largest
  allowed value is about 3,500,000.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                             |
  |:--------------------------:|:------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                   |
  |                            | <a href="ch-server.html#confvectexec" class="link"          
                                title="Configuring Vectored Execution">Configuring Vectored  
                                Execution</a>                                                |

  </div>

  Note: Only effective with Virtuoso 7.0 and later.

  </div>

- <div id="ini_timezonelessdatetimes">

  **TimezonelessDatetimes. ** Enables Timezoneless Support. Different
  applications may require different behavior when input data contain
  timezoneless values. In some cases it is better to "cast" all of them
  to timezoned than to upgrade existing code. Virtuoso offers 5
  different modes of support -- 0, 1, 2, 3 and 4. This should be set
  before creating the database and the set value is stored in the
  database. After database is created, an attempt to change the mode by
  patching <a href="ch-server.html#virtini" class="link"
  title="Virtuoso Configuration File">virtuoso.ini</a> will have no
  effect and virtuoso.log will contain a warning about mismatch between
  virtuoso.ini and the database file.

  <div class="itemizedlist">

  - TimezonelessDatetimes=0 -- Never use timezoneless, as it was in old
    databases. Always set local timezone on parsing strings if no
    timezone specified. An attempt to set timezoneless by calling
    function <a href="fn_forget_timezone.html" class="link"
    title="forget_timezone"><code
    class="function">forget_timezone()</code></a> will signal error.
    Timezoneless values still may come from outside as dezerializations
    of timezoneless DATETIME values, serialized by other database
    instances, but not in any other way:

  - TimezonelessDatetimes=1 -- When parsing strings, set timezoneless if
    ISO format tells so:

  - TimezonelessDatetimes=2 -- Set timezoneless always, exception is
    when the parsed string contains explicit timezone or when RFC
    requires the use of GMT or when timezone is set by function
    <a href="fn_adjust_timezone.html" class="link"
    title="adjust_timezone"><code
    class="function">adjust_timezone()</code></a> . This is default for
    new databases if `TimezonelessDatetimes` parameter is missing in
    virtuoso.ini

  - TimezonelessDatetimes=3 -- Never use timezoneless. Always set local
    timezone on parsing strings if not timezone specified. An attempt to
    set timezoneless by calling function
    <a href="fn_forget_timezone.html" class="link"
    title="forget_timezone"><code
    class="function">forget_timezone()</code></a> will signal error.
    Timezoneless values still may come from outside as deserializations
    of timezoneless DATETIME values, serialized by other database
    instances, but not in any other way. The difference with
    `TimezonelessDatetimes=0` is that timezones are always printed on
    cast datetimes to strings etc. so timezoneless-aware clients will
    get unambiguous data.

  - TimezonelessDatetimes=4 -- On parsing string, set timezone to GMT if
    no timezone specified. However, timezoneless can be set by calling
    function <a href="fn_forget_timezone.html" class="link"
    title="forget_timezone"><code
    class="function">forget_timezone()</code></a> . This mode can be
    convenient for global web services when real "local" timezones of
    specific users are not known.

  </div>

  The possible variants are:

  For new applications, consider the use of `TimezonelessDatetimes=2` as
  primary variant, `TimezonelessDatetimes=1` as the second best.

  </div>

</div>

Note: The default for startup behavior is to always read full extents
and the default for the normal behavior is to trigger preread on the
third read inside one second.

</div>

<div id="ini_httpserver" class="section">

<div class="titlepage">

<div>

<div>

###### \[HTTPServer\]

</div>

</div>

</div>

Settings in this section control the web server component of the
Virtuoso Server.

<div class="itemizedlist">

- <div id="ini_httpserver_serverport">

  **ServerPort. ** This specifies the initial HTTP listen port for the
  HTTP server. Can be specified also as ipaddress:port. Once Virtuoso is
  started it is possible to create multiple listeners using virtual
  directories.

  </div>

- <div id="ini_httpserver_httpthreadsize">

  **HTTPThreadSize = 120000. ** The stack size of the HTTP thread used
  for reading/processing HTTP client requests and accepting connections.
  The default is 120,000 bytes. This parameter cannot have value less
  than the default; if a smaller value is specified the default will be
  used.

  </div>

- <div id="ini_httpserver_serverthreads">

  **ServerThreads. ** This specifies the number of concurrently serviced
  HTTP requests. Its alias is
  <span class="emphasis">*MaxClientConnections*</span> . If there are
  more concurrent requests, accepting the connections will be deferred
  until there is a thread ready to serve each. If an attempt to exceed
  the number of licensed connections is found. the latter will be used.
  When the number of threads is low some of the tutorials may perform
  poorly and appear not to work; this is due to the demonstration
  licensing. When testing Virtuoso with the demonstration license it can
  be quite easy to hit the limits unless remote connections and HTTP
  connections are conserved. You may wish to either wait for previous
  transactions to finish or restart the server to be sure.

  </div>

- <div id="ini_httpserver_httpthreadsize_01">

  **HTTPThreadSize = 120000. ** The stack size of HTTP thread used for
  reading/processing HTTP client requests and accepting connections. The
  default setting, if not supplied, is 120,000 bytes. The default value
  is the minimum; lesser values will be rounded up.

  </div>

- <div id="ini_httpserver_serverroot">

  **ServerRoot = ../vsp. ** This is the file system path of the root
  directory of files served by the Virtuoso web server. The index.html
  in that directory will be served for the / URI. If relative, the path
  is interpreted relative to the server's working directory.

  </div>

- <div id="ini_httpserver_serveridstring">

  **ServerIdString = Virtuoso. ** String passed as Server: header to
  HTTP client. This string is not required, in its absence the above
  default will be assumed. This string can be set to anything required.

  </div>

- <div id="ini_httpserver_clientidstring">

  **ClientIdString = Mozilla/4.0 (compatible; Virtuoso). ** String
  passed as User-Agent: header to server by HTTP client. This string is
  not required, in its absence the above default will be assumed. This
  string can be set to anything required.

  </div>

- <div id="ini_httpserver_charset">

  **Charset = \[CHARSET-NAME\]. ** Allows you to set the default server
  character set. If no default is specified then ISO-8859-1 will be used
  automatically by the server.

  </div>

- <div id="ini_httpserver_enabledgzipcontent">

  **EnabledGzipContent = 0. ** This sets the default behavior of HTTP
  transmission. If set to 1 The Virtuoso HTTP server will send GZipped
  content to user agents. Otherwise content will be sent as is. The
  function <a href="fn_http_enable_gz.html" class="link"
  title="http_enable_gz"><code
  class="function">http_enable_gz()</code></a> lets you change the
  server mode on the fly.

  </div>

- <div id="ini_httpserver_maxkeepalives">

  **MaxKeepAlives = 10. ** Connections by HTTP 1.1 clients can remain
  open after the initial response has been sent. This parameters sets a
  cap on how many socket descriptors will at most be taken by keep alive
  connections. Such connections will be dropped by the server ahead of
  timeout if this number would be exceeded. Thus the maximum number of
  open sockets for the Virtuoso HTTP server is this number plus the
  number of threads. A keep alive connection is by definition not
  associated to any pending processing on any thread.

  </div>

- <div id="ini_httpserver_keepalivetimeout">

  **KeepAliveTimeout = 10. ** This is a timeout in seconds before
  Virtuoso closes an idle HTTP 1.1 connection.

  </div>

- <div id="ini_httpserver_httpproxyenabled">

  **HTTPProxyEnabled = 0. ** Setting this to 1 activates Virtuoso proxy
  service capabilities. The default value of 0 deactivates the proxy
  service.

  <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                              |                                                                                                      |
  |:----------------------------:|:-----------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                |
  |                              | Ports on which proxying is enabled should not be presented to the outside world under any situation. |

  </div>

  </div>

- <div id="ini_httpserver_httpproxyserver">

  **HTTPProxyServer = proxylocal:3128. ** HTTP proxy server name and
  port

  </div>

- <div id="ini_httpserver_httpproxyexceptions">

  **HTTPProxyExceptions = localhost:8890, 127.0.0.1:8890. ** HTTP proxy
  exceptions name and port.

  </div>

- <div id="ini_httpserver_httplogfile">

  **HTTPLogFile = log.out. ** If specified, Virtuoso will produce an
  HTTP server log file with the date appended to the name given in the
  parameter and the files extension as ".out". The log file is rotated
  daily.

  It will contain the following information:

  `logDDMMYYYY.out` :-

  |                                   |
  |-----------------------------------|
  | Client IP address                 |
  | Date and time of request/response |
  | Timestamp (milliseconds)          |
  | Request/response line             |

  An example of which is:

  ``` programlisting
            127.0.0.1 - - [12/Sep/2006:12:31:17 +0300] "GET /ods/ HTTP/1.1" 200 19453 "" "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.6) Gecko.."
            127.0.0.1 - - [12/Sep/2006:12:31:18 +0300] "GET /ods/default.css HTTP/1.1" 200 41389 "http://example.com/ods/" "Mozilla/5.0 (Windows; U; ..."
            127.0.0.1 - - [12/Sep/2006:12:31:19 +0300] "GET /ods/common.js HTTP/1.1" 200 7481 "http://example.com/ods/" "Mozilla/5.0 (Windows; U; ..."
            
  ```

  </div>

- <div id="ini_httpserver_httplogformat">

  **HTTPLogFormat = format string like apache mod_log. **
  "HTTPLogFormat" INI file param works in conjunction with the
  "HTTPLogFile" INI file param. In http log we support format string
  like
  <a href="http://httpd.apache.org/docs/2.2/mod/mod_log_config.html"
  class="ulink" target="_top">Apache Module mod_log_config</a> . For
  example:

  ``` programlisting
  ...
  [HTTPServer]
  ...
  HTTPLogFormat = %h %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i" "%{NetId}e"
  ```

  In this example we have %{User-Agent}i which means to log the HTTP
  header for user-agent. In similar way can log other input headers, "e"
  modifier is for environment variable NetId in this case.

  Note that not all escapes from
  <a href="http://httpd.apache.org/docs/2.2/mod/mod_log_config.html"
  class="ulink" target="_top">Apache Module mod_log_config</a> are
  supported.

  </div>

- <div id="ini_httpserver_maccachedproxyconnections">

  **MaxCachedProxyConnections = 10. ** When Virtuoso is acting as a
  proxy or HTTP client, as is the case with the http_get or the SOAP
  client functions, it caches connections to HTTP 1.1 servers. This is
  the maximum population of said cache.

  </div>

- <div id="ini_httpserver_proxyconnectioncachetimeout">

  **ProxyConnectionCacheTimeout = 15. ** This is a timeout in seconds
  for dropping idle connections to other HTTP servers. These result from
  http_get, SOAP client functions and proxying.

  </div>

- <div id="ini_httpserver_davroot">

  **DavRoot = DAV. ** This specifies the root path of DAV resources. If
  DAV specific HTTP methods are used on Virtuoso, these should only
  reference resources with paths starting with this. This is the top
  level DAV collection. Other paths can be declared as managed in DAV
  using the virtual directory mechanism, but this applies to the default
  virtual directory.

  </div>

- <div id="ini_httpserver_davquotaenabled">

  **DAVQuotaEnabled = 1/0. ** The Virtuoso administrator can enforce a
  quota on all DAV accounts, apart from the "dav" administration user,
  that restricts that amount of space a DAV user can consume in their
  DAV home directory. When this parameter is set to one (1) quotas are
  enabled, when this parameter is set to zero (0), they are disabled.
  The default quota value is five Megabytes (5MB) but can be uniquely
  defined for each user. Every user has a quota except "dav", which is
  unlimited. Dav quotas are disabled if this parameter is not specified
  for backwards compatibility.

  </div>

- <div id="ini_httpserver_davchunkedquota">

  **DAVChunkedQuota = 1000000. ** Virtuoso send resources to from WebDAV
  to the requesting client in chunked encoding to save memory if the
  request is in HTTP/1.1 and the files size is greater then the
  `DAVChunkedQuota` number of bytes. The default chunked-quota value is
  approximately one-megabyte.

  </div>

- <div id="ini_httpserver_sslport">

  **SSLPort=4433. ** this is the port on which SSL HTTPS connections
  will be accepted. Can be specified also as ipaddress:port. If
  unspecified then the service will be disabled.

  </div>

- <div id="ini_httpserver_sslcertificate">

  **SSLCertificate=./virtuoso_cert.pem. ** the option must point to the
  file with the server certificate in PEM format.

  If the option begins with 'db:' e.g. 'db:id_server', then certificate
  and key will be loaded from DBA key space.

  </div>

- <div id="ini_httpserver_sslprivatekey">

  **SSLPrivateKey=./virtuoso_key.pem. ** points to the file containing
  the RSA private key in PEM format.

  the certificate/key pair must be valid (eq. certificate is generated
  on base of key)

  If the option begins with 'db:' e.g. 'db:id_server', then certificate
  and key will be loaded from DBA key space. Note: in the case of
  database stored key, both SSLCertificate and SSLPrivateKey settings
  MUST be same.

  </div>

- <div id="ini_httpserver_x509clientverify">

  **X509ClientVerify=0. ** Whether the server will require X509
  certificates from the browsers.

  |                                                                                                                                                         |
  |---------------------------------------------------------------------------------------------------------------------------------------------------------|
  | <span class="emphasis">*X509ClientVerify = 0*</span> - no certificate verification required                                                             |
  | <span class="emphasis">*X509ClientVerify = 1*</span> - ask for trusted certificates                                                                     |
  | <span class="emphasis">*X509ClientVerify = 2*</span> - optionally ask for trusted certificates, if trusted certificate is presented it will be verified |
  | <span class="emphasis">*X509ClientVerify = 3*</span> - optionally accept any certificate including self-signed certificates                             |

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                  |
  |:--------------------------:|:-----------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                        |
  |                            | <a href="secureodbcx509.html#secureodbcx509foafsll" class="link" 
                                title="WebID Protocol ODBC Login">WebID Protocol ODBC Login</a>   |

  </div>

  </div>

- <div id="ini_httpserver_x509clientverifydepth">

  **X509ClientVerifyDepth=1. ** Specifies how deep the client
  certificate verification process will traverse the Issuer chain before
  giving up. The default value of 0 means that only verification of the
  client certificate itself being in the server's CA list is performed.
  Setting this option to -1 will ignore the depth checks

  </div>

- <div id="ini_httpserver_x509clientverifycafile">

  **X509ClientVerifyCAFile=./calist.pem. ** a PEM file of all the X509
  certificates of the Certification Authorities (CA) which the server
  will use for verifying the client's client certificate. A list of
  these will be sent to the client as a part of the SSL handshake so the
  client will know which certificate to send.

  Note this option is in effect when X509ClientVerify is 1 or 2. If
  X509ClientVerify is 3 and X509ClientVerifyCAFile is given, server will
  send certificated during handshake, thus some clients may restrict
  user to send any certificate.

  </div>

- <div id="ini_httpserver_pop3port">

  **POP3Port=1234. ** Defines the TCP port number on which the Virtuoso
  POP3 server will listen. The POP3 server will be disabled if this
  value is 0 or undefined.

  </div>

- <div id="ini_httpserver_newsserverport">

  **NewsServerPort=1235. ** Defines the TCP port number on which the
  Virtuoso NNTP server will listen. The NNTP server will be disabled if
  this value is 0 or undefined.

  </div>

- <div id="ini_httpserver_ftpserverport">

  **FTPServerPort. ** The Virtuoso FTP server can be enabled by
  supplying this parameter with a value. This value will then be the
  listening port of the FTP server. The usual port for FTP is port 21.

  </div>

- <div id="ini_httpserver_ftpserverminfreeport">

  **FTPServerMinFreePort = 20000. ** The Virtuoso FTP client and server
  use FTPServerMinFreePort and FTPServerMaxFreePort parameters as lower
  and upper bounds for active and passive connections. This parameters
  sets the lower bound.

  </div>

- <div id="ini_httpserver_ftpservermaxfreeport">

  **FTPServerMaxFreePort = 30000. ** The Virtuoso FTP client and server
  use FTPServerMinFreePort and FTPServerMacFreePort parameters as lower
  and upper bounds for active and passive connections. This parameters
  sets the upper bound.

  </div>

- <div id="ini_httpserver_ftpserverlogfile">

  **FTPServerLogFile = ftpserver. ** If specified Virtuoso will produce
  an FTP server log file with the date appended to the name given in the
  parameter and the files extension as ".log". The log file is rotated
  daily.

  It will contain the following information:

  `ftpserverDDMMYYYY.log` :-

  |                      |
  |----------------------|
  | Client Host Name     |
  | Authorized User      |
  | Time                 |
  | User Command         |
  | Server Response Code |
  | Bytes Transferred    |

  An example of which is:

  ``` programlisting
  hostname anonymous [22/Oct/2003:15:21:43 +0300] "PASS user@domain.com" 230 0
  hostname anonymous [22/Oct/2003:15:23:11 +0300] "LIST" 226 162
  hostname dav [22/Oct/2003:15:25:00 +0300] "PASS <hidden>" 230 0
  ```

  </div>

- <div id="ini_httpserver_ftpserveranonymouslogin">

  **FTPServerAnonymousLogin = 0. ** Allows the FTP server to be
  accessible via the "anonymous" user login. The anonymous user is not a
  real user, it has no SQL or DAV login ability. The anonymous user can
  only access collections or resources that are set to public.

  </div>

- <div id="ini_httpserver_defaultmailserver">

  **DefaultMailServer=localhost:25. ** Default SMTP server name and
  port, this is used when the first parameter of the smtp_send function
  is omitted or NULL.

  </div>

- <div id="ini_httpserver_tempaspxdir">

  **TempASPXDir. ** Allows you to choose what file system directory to
  be used for temporary storage of ASPX files hosted in DAV.

  </div>

- <div id="ini_httpserver_persistenthostingmodules">

  **PersistentHostingModules = \[1/\]0. ** When set to "1" prevents
  Virtuoso from removing the plugin interpreters from the HTTP threads
  after each request. The default setting is "0".

  </div>

- <div id="ini_httpserver_httpsessionsize">

  **HttpSessionSize = size in bytes, default 10000000. ** The size
  threshold for large objects received by HTTP server. When this limit
  is exceeded by incoming or outgoing data, this will be stored in a
  temp file, see 'TempSesDir' parameter in 'Parameters' section.

  </div>

- <div id="ini_httpserver_maintenancepage">

  **MaintenancePage = file_name. ** The name of a HTML page or other
  static content to be returned to the user agents when server is
  running in atomic mode. Note that this page should be self-contained,
  i.e. no image or CSS not JavaScript references can be used.

  </div>

</div>

</div>

<div id="ini_flags" class="section">

<div class="titlepage">

<div>

<div>

###### \[Flags\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_uriqa_enablejoinsonly">

  **enable_joins_only = 0. ** Setting enable_joins_only will cause the
  optimizer to only consider next plan candidates that are connected by
  a join to the existing partial plan. In other words, no cartesian
  products will be considered. This may save some space and time.

  </div>

</div>

</div>

<div id="ini_uriqa" class="section">

<div class="titlepage">

<div>

<div>

###### \[URIQA\]

</div>

</div>

</div>

The URIQA section sets parameters of both URIQA HTTP extension and URIQA
web service. Section <a href="uriqa.html" class="link"
title="19.2. URIQA Semantic Web Enabler">URIQA Semantic Web Enabler</a>
contains detailed description of this functionality, including more
details about <a href="uriqainifile.html" class="link"
title="19.2.3. URIQA Section in Virtuoso Configuration File">URIQA
configuration parameters</a> . This section should stay commented out as
long as URIQA is not in use.

<div class="itemizedlist">

- <div id="ini_uriqa_defaulthost">

  **DefaultHost = canonical name of the server, used by default for
  metadata retrieval, no default value. ** The server name, including
  domain and port if needed, such as "www.example.com" or
  "www.example.com:8088".

  </div>

- <div id="ini_uriqa_localhostnames">

  **LocalHostNames = comma-delimited list of names of the server, that
  can be used for retrieval of metadata, no default value. ** List of
  various allowed spellings of the server name, such as
  "www.example.com, mail.example.com, mail, localhost,
  localhost.localdomain".

  </div>

- <div id="ini_uriqa_localhostmasks">

  **LocalHostMasks = comma-delimited list of name masks of the server,
  no default value. ** List of various allowed spellings of the server
  name in form of pattern strings for SQL "like" operator, not in form
  of exact strings.

  </div>

- <div id="ini_uriqa_fingerprint">

  **Fingerprint = unique fingerprint string of the server or group of
  identical servers, no default value. ** Do not use this without an
  explicit need, to let server configure itself. Please refer to
  <a href="uriqainifile.html" class="link"
  title="19.2.3. URIQA Section in Virtuoso Configuration File">detailed
  description</a> before use.

  </div>

- <div id="ini_uriqa_dynamiclocal">

  **DynamicLocal = 1/0 default 0, allow dynamic hostname translation in
  the IRIs. ** If DynamicLocal is on and the host part of the IRI
  matches the Host header of the HTTP request in context or the
  DefaultHost if outside of HTTP context, then this is replaced with
  local: before looking up the IRI ID.

  </div>

</div>

</div>

<div id="ini_sparql" class="section">

<div class="titlepage">

<div>

<div>

###### \[SPARQL\]

</div>

</div>

</div>

The SPARQL section sets parameters and limits for SPARQL query protocol
web service service. This section should stay commented out as long as
SPARQL is not in use. Section RDF Data Access and Data Management
contains detailed description of this functionality.

<div class="itemizedlist">

- <div id="ini_sparql_externalquerysource">

  **ExternalQuerySource = 1 or 0 . ** This controls processing of the
  "query-uri" parameter of the SPARQL query protocol webservice, means
  enable 1 or prohibited 0.

  </div>

- <div id="ini_minexpiration">

  **MinExpiration = 86400 . ** Sponger caching parameter in seconds. It
  will cause sponger to use this value as minimal expiration of the
  pages, which would help in cases where source document's server do not
  report expiration or it reports no caching at all.

  </div>

- <div id="ini_maxcacheexpiration">

  **MaxCacheExpiration = 1 . ** Cache Expiration time in seconds that
  overrides Sponger's default cache invalidation.

  </div>

- <div id="ini_maxdatasourcesize">

  **MaxDataSourceSize = 20971520 . ** Controls the max size that can be
  sponged. Default is 20 MB.

  </div>

- <div id="ini_sparql_externalxsltsource">

  **ExternalXsltSource = 1 or 0 . ** This controls processing of the
  "xslt-uri" parameter of the SPARQL query protocol webservice, means
  enable 1 or prohibited 0.

  </div>

- <div id="ini_sparql_resultsetmaxrows">

  **ResultSetMaxRows = number . ** This setting is used to limit the
  number of the rows in the result. The effective limit will be the
  lowest of this setting, SPARQL query 'LIMIT' clause value (if
  present), and SPARQL Endpoint request URI
  <a href="rdfsparqlprotocolendpoint.html#rdfrequestparamsofunctions"
  class="link" title="Request Parameters">&amp;maxrows</a> parameter
  value (if present).

  </div>

- <div id="ini_sparql_defaultgraph">

  **DefaultGraph = IRI . ** IRI of the default graph to be used if no
  "default-graph-uri" parameter is specified.

  </div>

- <div id="ini_sparql_maxquerycostestimationtime">

  **MaxQueryCostEstimationTime = seconds . ** This setting is used to
  limit the estimate time cost of the query to certain number of
  seconds, the default is no limit.

  </div>

- <div id="ini_sparql_maxqueryexecutiontime">

  **MaxQueryExecutionTime = seconds . ** This setting is used to set the
  transaction execution timeout to certain limit in number of seconds,
  the default is no limit.

  </div>

- <div id="ini_sparql_immutablegraphs">

  **ImmutableGraphs = URI . ** IRI of graphs over which the sponger not
  to be able able to write.

  </div>

- <div id="ini_sparql_pingservice">

  **PingService = URI . ** IRI of notification service to which the
  sponger results will be send.

  </div>

- <div id="ini_sparql_defaultquery">

  **DefaultQuery = SPARQL Query . ** Default SPARQL Query.

  </div>

- <div id="ini_sparql_deferinferencerulesinit">

  **DeferInferenceRulesInit = 1 . ** Defer Loading of inference rules at
  start up.

  </div>

- <div id="ini_sparql_shortenlonguris">

  **ShortenLongURIs = 1 . ** Shorten extremely long URIs in datasets
  when loading with the RDF Bulk Loader. Default is 0.

  <span class="emphasis">*Note* </span> : This parameter is only in the
  Virtuoso 06.03.3131+ commercial builds, at the time of writing it is
  not included in the open source 6.1.4 archives but will be in the next
  6.1.5 release. A patch to enable this feature is however available
  from the <a
  href="http://sourceforge.net/tracker/?func=detail&amp;aid=3496331&amp;group_id=161622&amp;atid=820576"
  class="ulink" target="_top">Virtuso patches page on source forge</a> ,
  which can be applied to a 6.1.4 archive from source forge and the
  Virtuoso server binary rebuilt.

  </div>

- <div id="ini_sparql_maxmeminuse">

  **MaxMemInUse = 0 . ** Maximum amount of memory that is allowed for
  temporary storing parts of a SPARQL query result. Default is zero for
  no limit. ResultSetMaxRows is maximum length of a SPARQL query result.
  Default is zero for no limit. These two options may be useful for
  protecting public web service endpoints against DOS attacks, but at
  the same time it may cause returning incomplete results without
  reporting errors. When used, it is strongly advised to set the value
  orders of magnitude larger than the expected size of longest reply. As
  a rule of thumb, timeout should happen before this limit has reached.
  Values less than 1000000 bytes are impractical in all cases.

  </div>

</div>

The SPARQL INI can be get as RDF via http://cname/sparql?ini service.

</div>

<div id="ini_i18n" class="section">

<div class="titlepage">

<div>

<div>

###### \[I18N\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_i18n_xanynormalization">

  **XAnyNormalization = 1/2/3/0. ** 0: default value. It means not to
  normalize anything, so, for example, "José" and "Jose" are two
  distinct words.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                                                        |
  |:--------------------------:|:-------------------------------------------------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                                                              |
  |                            | <a href="virtuosotipsandtrickscontrolunicode3.html" class="link"                                       
                                title="1.5.12. How Can I Control the normalization of UNICODE3 accented chars in free-text index?">How  
                                Can I Control the normalization of UNICODE3 accented chars in free-text                                 
                                index?</a>                                                                                              |

  </div>

  1: Any pair of base char and combining char (NSM, non-spacing
  modifier) is replaced with a single combined char, so if character "é"
  is written as a sequence of "base" character "e" and a unicode char
  U+0301 ("combining acute accent"), then the pair will be replaced with
  a single U+00E9 ("latin small letter e acute").

  2: Any combined char is converted to its (smallest known) base, so,
  "é" will lose its accent and become plain old ASCII "e".

  3: This is equal to 1+2, and when set, both conversions are performed.
  As a result, any pair of base char and combining char loses its second
  char, and any chars with accents will lose accents.

  If the parameter is required at all, the needed value is probably 3,
  so the fragment of virtuoso.ini should be:

  ``` programlisting
  [I18N]
  XAnyNormalization=3
  ```

  </div>

- <div id="ini_i18n_widefilenames">

  **WideFileNames = 1/0. ** Default is 0. When 1 then file access and
  directory listing functions may use wide strings as file names. If a
  file name contains non-ASCII characters then directory listing result
  set will contain a wide string instead of narrow string with question
  marks. Note, however, that most of existing applications do not
  support wide strings for that purposes, so the feature should be used
  with extreme care.

  </div>

- <div id="ini_i18n_volumeencoding">

  **VolumeEncoding. ** Encoding identifier. If set, file names are
  translated from wide strings and default server encoding to the
  specified encoding before using them in file manipulation BIFs. This
  is useful when server's filesystem is in some national encoding or in
  UTF-8. The translation is bi-directional: directory listing items are
  translated from volume encoding to the default server encoding or
  wide.

  </div>

- <div id="ini_i18n_volumeemergencyencoding">

  **VolumeEmergencyEncoding. ** Encoding identifier. If set, this
  encoding is used when the use of VolumeEncoding causes encoding
  errors. The most popular case is when an UNIX filesystem tree with
  UTF-8 contains some mounts of legacy storages with KOI or CP encoding.
  Less popular is UTF-8 volume encoding and UTF-8QR as emergency
  encoding to recover poorly encoded filenames.

  </div>

- <div id="ini_i18n_volumeemergencyencodingdirs">

  **VolumeEmergencyEncodingDirs. ** List of directories in same syntax
  as DirsAllowed, default is empty. If set, all file names in the listed
  directories are supposed to be in VolumeEmergencyEncoding and
  VolumeEncoding is even not tried. The most popular case is when an
  UNIX filesystem tree with UTF-8 contains some mounts of legacy
  storages with KOI or CP encoding.

  </div>

</div>

</div>

<div id="ini_replication" class="section">

<div class="titlepage">

<div>

<div>

###### \[Replication\]

</div>

</div>

</div>

The replication section sets the transactional replication parameters
for the server.

<div class="itemizedlist">

- <div id="ini_replication_serverenable">

  **ServerEnable=0/1. ** A boolean parameter controlling whether a
  Virtuoso can or cannot act as a transactional replication publisher.

  </div>

- <div id="ini_replication_servername">

  **ServerName = log1. ** This identifies the server instance. The
  entries in SYS_REPL_ACCOUNTS where SERVER equals this name are
  considered locally published accounts. This is the value returned by
  repl_this_server () SQL function.

  </div>

- <div id="ini_replication_queuemax">

  **QueueMax = 50000. ** This controls how much synchronized
  transactional subscribers may fall behind before being disconnected.
  This controls how much memory the server will use to buffer
  undelivered replication casts. If the queue exceeds this byte amount
  subscribers are disconnected and must request re-synchronization. The
  byte count refers to the total length of the replay records being
  buffered. The actual memory usage is somewhat greater.

  </div>

</div>

</div>

<div id="ini_mono" class="section">

<div class="titlepage">

<div>

<div>

###### \[Mono\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_mono_mono_root">

  **MONO_ROOT. ** A path to the directory where the Mono system
  assemblies are located. Usually it is a compile time setting, but the
  MONO_ROOT overrides it. This ini setting overrides the Mono
  environment variable of the same name.

  </div>

- <div id="ini_mono_mono_path">

  **MONO_PATH. ** A colon separated list of directories where the
  assemblies are located to be found by Assembly.Load (equivalent to
  MS.NET Global assembly cache). This ini setting overrides the Mono
  environment variable of the same name.

  </div>

- <div id="ini_mono_mono_cfg_dir">

  **MONO_CFG_DIR. ** A path where the 'machine.config' file is to be
  found while running the ASPX code in Mono. This ini setting overrides
  an environment variable of the same name. This is also usually a Mono
  compile time default.

  </div>

- <div id="ini_mono_virtclr.dll">

  **virtclr.dll. ** A fully qualified path and filename of the
  virtclr.dll virtuoso helper assembly.

  </div>

- <div id="ini_mono_mono_trace">

  **MONO_TRACE = Off. ** Mono debug tracing can be enabled by setting
  this parameter to On. When tracing is On, Mono debug output with be
  sent to the Virtuoso debug console.

  </div>

</div>

</div>

<div id="ini_client" class="section">

<div class="titlepage">

<div>

<div>

###### \[Client\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_client_sql_query_timeout">

  **SQL_QUERY_TIMEOUT=0. ** This sets the initial value of the
  SQL_QUERY_TIMEOUT statement option in connected clients. The ODBC
  standard value is 0, meaning indefinite, which is impractical in many
  applications. This allows overriding the default. The timeout is
  expressed in seconds. If the client application sets this option in a
  statement, this default is overridden for the statement in question.

  </div>

- <div id="ini_client_sql_txn_timeout">

  **SQL_TXN_TIMEOUT=0. ** This is an ODBC extension option allowing
  setting a maximum duration for a transaction. 0 means that there is no
  maximum.

  </div>

- <div id="ini_client_sql_prefetch_rows">

  **SQL_PREFETCH_ROWS=100. ** For a forward only cursor, this option
  sets the number of rows prefetched at the execute and on subsequent
  fetch requests. A high value will speed up long selects but will be a
  disadvantage if only the first few rows are fetched from a cursor that
  has a large result set.

  This should not be confused with the SQL_ROWSET_SIZE setting for
  scrollable cursors.

  </div>

- <div id="ini_client_sql_prefetch_bytes">

  **SQL_PREFETCH_BYTES=16000. ** This option specifies the maximum
  number of bytes the server will send as prefetched rows on a forward
  only cursor. If long rows are being prefetched this will cut off the
  prefetch after this many bytes even if the number of rows is less than
  SQL_ROWSET_SIZE.

  </div>

- <div id="ini_client_sql_no_char_c_escape">

  **SQL_NO_CHAR_C_ESCAPE=0. ** This options is 0 by default and can be
  either 1 or 0. This option controls Virtuoso's interpretation of the
  backslash in PL text which is normal interpreted as escaping rather
  than literal.

  </div>

- <div id="ini_client_sql_utf8_execs">

  **SQL_UTF8_EXECS = 0. ** Setting SQL_UTF8_EXECS = 1 enables UTF-8
  identifier storage and retrieval, whereas setting SQL_UTF8_EXECS = 0
  disables it. The default setting is 0: disabled for backwards
  compatible. See the <a href="wideidentifiers.html" class="link"
  title="9.5. Wide Character Identifiers">Wide Character Identifiers</a>
  section for more information

  </div>

- <div id="ini_client_sql_binary_timestamp">

  **SQL_BINARY_TIMESTAMP = 1. ** When SQL_BINARY_TIMESTAMP is set to 1
  Virtuoso will describe all TIMESTAMP columns as SQL_BINARY. If it is
  set to 0 then Virtuoso will report the TIMESTAMP columns as
  SQL_TIMESTAMP

  </div>

- <div id="ini_client_sql_no_system_tables">

  **SQL_NO_SYSTEM_TABLES = 0. ** This setting can be used to prevent
  SQLTables from returning system tables. The default value of this
  setting is 0, which is allow system tables to be returned in the
  normal way. Setting this to 1 will prevent system tables from being
  returned from SQLTables. The client can also issue a "set
  SQL_NO_SYSTEM_TABLE = 1/0" statement to set this in-connection.

  </div>

</div>

</div>

<div id="ini_autorepair" class="section">

<div class="titlepage">

<div>

<div>

###### \[AutoRepair\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_autorepair_badparentlinks">

  **BadParentLinks=0. ** As a result of an internal error in the
  database the physical integrity of references may be lost. Enabling
  this option causes the database to automatically repair such faults
  without having to go through a crash dump plus restore. A value of 0
  should be normally used.

  </div>

</div>

</div>

<div id="ini_vdb" class="section">

<div class="titlepage">

<div>

<div>

###### \[VDB\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_vdb_arrayoptimization">

  **ArrayOptimization=0/1. ** Boolean parameter which allows the
  Virtuoso VDB to use Array parameters if the remote data source
  supports these.

  </div>

- <div id="ini_vdb_usemts">

  **UseMTS = 0. ** This parameter turns on/off MTS support in Virtuoso.
  It is applicable to windows multithreaded version of the Virtuoso
  server only.

  </div>

- <div id="ini_vdb_numarrayparameters">

  **NumArrayParameters. ** Specifies a size of the parameter batch used
  by the VDB (default = 10)

  </div>

- <div id="ini_vdb_vdbdisconnecttimeout">

  **VDBDisconnectTimeout. ** The time (in seconds) after which a VDB
  connection is considered timed-out and closed. Default : 1000

  </div>

- <div id="ini_vdb_vdboraclecatalogfix">

  **VDBOracleCatalogFix=0/1. ** This setting can be enabled to improve
  compatibility with the MS Oracle Driver which has problems with mixed
  case table names in catalog calls.

  Boolean parameter : allows a special mode for the ORACLE ODBC drivers
  which do not return correct catalog data for mixed case tables. When
  this is on and the return from the catalog functions is empty, then a
  Catalog function is issued to take the same catalog data and the
  result is filtered on the client side.

  </div>

- <div id="ini_vdb_attachinautocommit">

  **AttachInAutoCommit. ** An boolean parameter controlling whether the
  VDB Catalog functions called while attaching a table will be called in
  AutoCommit mode (required by some Sybase drivers).

  </div>

- <div id="ini_vdb_numarrayparameters_01">

  **NumArrayParameters=10. **

  </div>

- <div id="ini_vdb_reconnectonfailure">

  **ReconnectOnFailure=0 \[1\|0\]. ** The default setting of 0 instructs
  the VDB layer to return underlying DB errors to the client rather than
  automatically reconnecting without reporting the error, which would be
  setting 1.

  </div>

- <div id="ini_vdb_keepconnectiononfixedthread">

  **KeepConnectionOnFixedThread=1 \[0\|1\|2\|4\|8\]. ** The default
  option is 1, this forces the VDB to map a single thread to each ODBC
  session in the VDB rather than multiple threads. Some ODBC drivers
  expect that calls concerning a particular connection all take place on
  one thread. For example, the Oracle 8.xx ODBC driver can produce flaky
  crashes if this option is not set.

  0 - If a second request comes while a thread is processing the
  epilogue or previous request for same connection the second request is
  scheduled for the same thread. This is called burst mode. Once this
  mode is active all requests on this connection will be processed in
  the same thread. until there is a break at delay more than
  'PrpcBurstTimeoutMsecs' elapses between ending the last and receiving
  the next in same connection. This break in activity return the thread
  to the thread pool. The burst mode optimization saves thread switching
  time and may improve performance by up to 30% in situations involving
  short requests immediately following each other.

  "ForcedFixedThread" mode (4). This is the same as VDBFixedThread mode,
  except that the thread enters this state immediately on connection (as
  opposed to doing that on the first VDB activity). Otherwise the
  scheduling stays the same as in VDB FixedThread.

  "Forced Burst" mode (8). When a connection is initially made it's
  added to the select thread for monitoring. When an RPC comes in it
  causes the select thread to take the connection out of the select
  thread and assign that connection to designated worker thread. That
  thread from now on will read the data coming in from that connection
  directly (not depending on the select thread to detect the incoming
  data and wake the worker thread up). That mode saves the thread switch
  done handling each RPC (from the select thread to the worker thread).
  When the connection terminates the thread is unbound from it and
  returned to it's default idle state. If an lengthy RPC is being
  processed the server will switch the thread from burst mode to default
  mode while running the RPC, so the asynchronous cancellation requests
  can be processed.

  To disable ever going to burst mode, this option can be set to 2

  </div>

- <div id="ini_vdb_prpcbursttimeoutmsecs">

  **PrpcBurstTimeoutMsecs=100 (milliseconds). ** RPC burst mode timeout
  in milliseconds. (see above)

  </div>

- <div id="ini_vdb_serializeconnect">

  **SerializeConnect=0 \[1\|0\]. ** When enabled causes Virtuoso to wrap
  SQLAllocConnect/SQLConnect calls sequence in a mutex, thus preventing
  abnormal program exits when there are a large number of connection
  requests to the VDB. Certain ODBC drivers have been noted to produce
  flaky errors when a large number of threads is concurrently inside one
  of the ODBC connect calls..

  </div>

- <div id="ini_vdb_skipdmlprimarykey">

  **SkipDMLPrimaryKey=0 \[1\|0\]. ** This setting controls SQL
  compilation (not execution) for conditions where rows in a local table
  are used to determine rows of a remote table to be deleted (e.g.
  delete from rmt1 where rmc1 = 12 and rmc2 in (select lc1 from lt1))
  where the remote table was linked without a Primary Key primary key
  specified. Normally the primary key is used, even when not in the
  original select select, to identify the rows to be deleted. When the
  primary key is false or not available and SkipDMLPrimaryKey = 1 then
  the original where clause will be used instead.

  </div>

- <div id="ini_vdb_remotepknotunique">

  **RemotePKNotUnique=0 \[1\|0\]. ** This option controls the SQL
  compiler ability to do some optimizations when it knows it will
  receive 1 row from a remote table (using the applicable WHERE clause).
  In some cases the remote is not providing any info about a primary key
  (or is providing wrong data for the primary keys and unique indices of
  a table) through ODBC API and the Virtuoso SQL optimizer may get
  fooled into thinking that a given SQL query over a remote table will
  return no more than 1 row. To avoid that turn on the above parameter
  to stop the compiler from doing that optimizations.

  </div>

- <div id="ini_vdb_useglobalpool">

  **UseGlobalPool=0 \[1\|0\]. ** This option controls the aggregation
  point of the VDB connection pools. When it is off (=0, the default)
  the VDB connections that are no longer needed after transaction end
  are collected server-side in a per-user connection cache. This
  (together with the `KeepConnectionOnFixedThread` INI option) ensures
  conformance even with older ODBC drivers that require that connections
  must be used only within the OS thread that initiated them. This
  however may result in somewhat low reuse rate for the pooled
  connections. That's why when this option is 1 (On) the connections are
  stored in a server-side per-DSN connection cache. Keep in mind that
  this may not work with all the ODBC drivers, but it may provide lower
  ratio between virtuoso client connections and VDB-to-remote DBMS
  connections, thus requiring smaller number of active connections on
  the remotes and faster execution of VDB operations.

  </div>

</div>

</div>

<div id="ini_ucms" class="section">

<div class="titlepage">

<div>

<div>

###### \[Ucms\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_ucms_ucmpath">

  **UcmPath. ** String parameter which specifies the path where UCM
  files are located. If this parameter is not specified, UCM files
  cannot be loaded.

  </div>

- <div id="ini_ucms_ucm">

  **Ucm1, Ucm2,... Ucm99. ** Every UcmN parameter specifies one UCM file
  to load. The value of UcmN is a pair of comma delimited strings. The
  first string is a name of the UCM file to load, (relative to the path
  specified in UcmPath), the second string is a name of the encoding as
  it was used by the server. E.g. Ucm1 = java-Cp933-1.3-P.ucm,Cp933 will
  load the encoding from the file java-Cp933-1.3-P.ucm and associate it
  with the identifier 'Cp933'. You can register one encoding with more
  than one name, if they are delimited by '\|' (with no white spaces in
  the string). e.g. Ucm2 = java-Cp949-1.3-P.ucm,Cp949\|Korean will load
  the encoding from the file java-Cp949-1.3-P.ucm and associate it with
  two identifiers, 'Cp949' and 'Korean'. See
  <a href="xmlencoding.html#ucmencodings" class="link"
  title="UCM Encodings">UCM Encodings</a> for more details.

  </div>

</div>

</div>

<div id="ini_zeroconfig" class="section">

<div class="titlepage">

<div>

<div>

###### \[Zero Config\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_zeroconfig_servername">

  **ServerName. ** Name used to advertise the Virtuoso ODBC service
  details in ZeroConfig. This is the name that will be shown to clients
  amongst other ZeroConfig datasources.

  </div>

- <div id="ini_zeroconfig_serverdsn">

  **ServerDSN. ** An ODBC style connect string to preset the values of
  the parameters when the ODBC service offered by this server is
  selected by the Virtuoso ZeroConfig enabled clients.

  </div>

- <div id="ini_zeroconfig_sslservername">

  **SSLServerName. ** Name used to advertise the Virtuoso ODBC SSL
  encrypted service details in ZeroConfig.

  </div>

- <div id="ini_zeroconfig_sslserverdsn">

  **SSLServerDSN. ** An ODBC style connect string to preset the values
  of the parameters when the ODBC SSL encrypted service offered by this
  server is selected by the Virtuoso ZeroConfig enabled clients.

  </div>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                  |
|:--------------------------:|:-----------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                        |
|                            | The <a href="ch-server.html#rendezvous" class="link"             
                              title="ZeroConfig (&quot;Zero Configuration&quot;) Support">Zero  
                              Config</a> section.                                               |

</div>

</div>

<div id="ini_plugins" class="section">

<div class="titlepage">

<div>

<div>

###### \[Plugins\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_plugins_loadpath">

  **LoadPath = /home/virtuoso/hosting. ** The directory containing
  shared objects/libraries for use as Virtuoso VSEI plugins.

  </div>

- <div id="ini_plugins_load">

  **Load\<number\> = \<module type\>, \<module name\>. ** `<number>` is
  the module load number, required and starting with 1. `<module type>`
  specifies the type of module that is to be loaded, and hence how
  Virtuoso is to use it. So far "Hosting" and "attach" types exist.
  `<module name>` is the file name of the modules shared library or
  object.

  Example:

  `Load6 = attach, libphp5.so` )

  `Load7 = Hosting, hosting_php.so` )

  "Attach" is used for now for the php library. It can be used to load
  other libraries in future too. The reason is to load PHP5
  functionality into virtuoso namespace, so when actually is loaded the
  hosting plugin, it can bind to the already available symbols for php5.

  </div>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |              |
|:--------------------------:|:-------------|
| ![\[Tip\]](images/tip.png) | See Also:    |
|                            | VSEI Plugins |

</div>

</div>

<div id="ini_striping" class="section">

<div class="titlepage">

<div>

<div>

###### \[Striping\]

</div>

</div>

</div>

<div class="itemizedlist">

- <div id="ini_striping_segment">

  **Segment\<number\> = \<size\>, \<stripe file name\> \[, \<stripe file
  name\> .. \]. ** \<number\> must be ordered from 1 upwards; The
  \<size\> is the size of the segment which is equally divided across
  all stripes comprising the segment.

  </div>

</div>

This section is only effective when `Striping = 1` is set in the
`[Database]` section. When striping is enabled the Virtuoso database
spans multiple segments where each segment can have multiple stripes.

Striping can be used to distribute the database across multiple
locations of a file system for performance. Segmentation can be used for
expansion or dealing with file size limitations. To allow for database
growth when a file system is near capacity or near the OS file size
limitation, new segments can be added on the same or other file systems.

Striping only has a potential performance benefit when striped across
multiple devices. Striping on the same file system is needless and
unlikely to alter performance, however, multiple segments do provide
convenience and flexibility as described above. Striping across
partitions on the same device is likely to reduce performance by causing
high unnecessary seek times on the physical disk.

Database segments are pre-allocated as defined. This can reduce the
potential for file fragmentation which could also provide some
performance benefit.

Virtuoso striping alone does not allow for any fault tolerance. This is
best handled at the I/O layer or by the operating system. File system
RAID with fault-tolerant striping defined should be used to host the
Virtuoso files if striping based protection is desired.

The segments are numbered, their segment \<number\> must be specified in
order starting with segment1.

The \<size\> is the total size of the segment which is that will be
divided equally across all stripes comprising the segment. Its
specification can be in gigabytes (g), megabytes (m), kilobytes (k) or
in database blocks (b) the default.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                       |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                 |
|                              | The segment size must be a multiple of the database page size which is currently 8k. Also, the segment size must be divisible by the number of stripe files contained in the segment. |

</div>

Segments can be added to a database, however once defined they should
never be altered. Databases that were created without striping cannot
automatically be restarted with striping. You can convert a non-striping
database to striping by dumping the contents of the database to a
transaction file and replaying it with striping enabled. An on-line
backup made with backup_online () can be restored on a database with a
different striping configuration as long as the total number of pages is
no less than the number of pages of the backed up database.

Striping can be useful for the temporary objects database if large hash
join temporary spaces or such are expected. This is enabled by the
Striping setting in the Temp Database section of the ini file. The
stripes will be declared in the TempStriping section.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                |
|:--------------------------:|:-------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                      |
|                            | <a href="ch-server.html#dbrebuild" class="link"                                
                              title="Rebuilding A Database">Rebuilding A Database</a> in the Backup section.  |

</div>

</div>

</div>

<div id="sampleinifile" class="section">

<div class="titlepage">

<div>

<div>

##### Sample Configuration File ("virtuoso.ini")

</div>

</div>

</div>

Following is the text of the sample virtuoso.ini file that comes with
the distribution.

``` programlisting
;
;  virtuoso.ini
;
;  Configuration file for the OpenLink Virtuoso VDBMS Server
;
;
;  Database setup
;
[Database]
DatabaseFile        = virtuoso.db
TransactionFile     = virtuoso.trx
ErrorLogFile        = virtuoso.log
ErrorLogLevel       = 7
FileExtend          = 200
Striping            = 0
; LogSegments       = 1
; crashdump_start_dp    = 0
; crashdump_end_dp  = 0
; Log1          = log1.trx
;
;  Server parameters
;
[Parameters]
ServerPort          = 1111
ServerThreads       = 10
CheckpointInterval  = 60
CheckpointSync      = 2
NumberOfBuffers     = 2000
MaxDirtyBuffers     = 1200
MaxCheckpointRemap  = 2000
PrefixResultNames   = 0
CaseMode            = 1
;MinAutoCheckpointSize  = 4000000
AutoCheckpointLogSize   = 40000000
CheckpointAuditTrail        = 1

[HTTPServer]
ServerPort = 1122
ServerRoot = ../vsp
ServerThreads = 2
MaxKeepAlives = 10
KeepAliveTimeout = 10
MaxCachedProxyConnections = 10
ProxyConnectionCacheTimeout = 15
DavRoot = DAV

[Replication]
ServerName = log1
Server = 1
QueueMax = 50000

[Client]
SQL_QUERY_TIMEOUT   = 0
SQL_TXN_TIMEOUT       = 0
SQL_PREFETCH_ROWS       = 100
SQL_PREFETCH_BYTES  = 16000

[AutoRepair]
BadParentLinks      = 0
BadDTP                  = 0

;[Ucms]
;UcmPath = /ucm
;Ucm1 = java-Cp933-1.3-P.ucm,Cp933
;Ucm2 = java-Cp949-1.3-P.ucm,Cp949|Korean
;Ucm3 = java-ISO2022KR-1.3-P.ucm,ISO2022KR|ISO2022-KR
;
;  Striping setup
;
;  These parameters have only effect when Striping is set to 1 in the
;  [Database] section, in which case the DatabaseFile parameter is ignored.
;
;  With striping, the database spans multiple segments
;  where each segment can have multiple stripes.
;
;  Format of the lines below:
;    Segment<number> = <size>, <stripe file name> [, <stripe file name> .. ]
;
;  <number> must be ordered from 1 up.
;
;  The <size> is the total size of the segment which is equally divided
;  across all stripes comprising  the segment. Its specification can be in
;  gigabytes (g), megabytes (m), kilobytes (k) or in database blocks
;  (b, the default)
;
;  Note that the segment size must be a multiple of the database page size
;  which is currently 8k. Also, the segment size must be divisible by the
;  number of stripe files constituting the segment.
;
;  The example below creates a 200 meg database striped on two segments
;  with two stripes of 50 meg and one of 100 meg.
;
;  You can always add more segments to the configuration, but once
;  added, do not change the setup.
;
[Striping]
Segment1    = 100M, db-seg1-1.db, db-seg1-2.db
Segment2    = 100M, db-seg2-1.db
```

</div>

<div id="confvectexec" class="section">

<div class="titlepage">

<div>

<div>

##### Configuring Vectored Execution

</div>

</div>

</div>

Note: Only effective with Virtuoso 7.0 and later.

A Virtuoso 7 executable executes all SQL statements in vectored mode,
except for positioned updates and deletes in stored procedures.
Procedures are executed without vectoring unless they are declared
vectored using the vectored keyword. A scalar (non-vectored) procedure
can have a vectored block introduced with the for vectored construct.
These are discussed in the SQL reference section on vectoring.

Vectored execution is controlled by the following virtuoso.ini settings:

<div class="itemizedlist">

- <span class="emphasis">*VectorSize = 10000*</span>

  : This is the default number of concurrent variable bindings that are
  generated for a column in a batch of bindings.

- <span class="emphasis">*MaxQueryMem = 1G*</span>

  : This controls the maximum amount of memory that can be used across
  the server process for large vectors, i.e. if the memory in use is
  near this limit, a query will not switch to large vector size even if
  it finds it useful. The event counter tc_no_mem_for_longer_batch
  counts how many times this situation is detected. A size letter of G
  or M follows the value.

- <span class="emphasis">*AdjustVectorSize = 1*</span>

  : If non-zero, this enables automatic increasing of vector size
  whenever the system notices a random access pattern that is not
  benefiting from vectoring due to too few consecutive hits falling on
  the same page. The vector size can be increased up to MaxVectorSize if
  the situation warrants. This is the case if there is enough
  unprocessed state in the query.

- <span class="emphasis">*MaxVectorSize = 1000000*</span>

  : This is the maximum vector size. This can reach up to 4000000 but
  values in excess of 1000000 have not been found useful in practice. If
  the server is running out of memory with multiuser workloads involving
  long queries, dropping the MaxVectorSize to a lower value is a means
  of curtailing per query memory consumption.

- <span class="emphasis">*ThreadsPerQuery = 8*</span>

  : This controls the maximum number of parallelizable work units a
  query will have outstanding at any one time. A value of 8 means that a
  scan or vector of lookups is maximally divided into 8 units, of which
  7 will be allocated to a pool of worker threads and one will be
  processed by the thread coordinating the query. Each query will always
  have one thread running, which is the thread allocated for serving the
  client-server or HTTP request initiating the query. Extra work units
  are serviced by threads from a parallel execution thread pool. If
  there are unstarted parallel work units that have not started at the
  time the coordinated thread finishes its own work unit, it will
  execute any of its own pending work units locally.

- <span class="emphasis">*AsyncQueueMaxThreads = 16*</span>

  : This is the maximum number of worker threads that can be started for
  running parallelized work units generated by queries or functions
  requested with the aq_request () PL function. Thus the number of
  threads running on a server at any time is the number of client server
  or HTTP threads that have a running request plus this number. These
  threads consider the totality of all async execution requests across
  all async queues and each thread picks a unit of work from the oldest
  queue that has unstarted work units. The age of the queue is the
  timestamp of its creation. A queue is created whenever a query
  operator decides to split its work. This scheduling favors thus old
  queries over new ones. However any request is guaranteed one thread,
  that on which its initiating request is served.

  For a query processing workload, one should set AsyncQueueMaxThreads
  to the number of cores minus the expected number of concurrent
  queries, this would in principle use all cores or core threads. In
  practice for machines with large numbers of cores, e.g. 32 cores, a
  lower value may serve in practice better, subject to experimentation.
  For a web crawling situation where threads are waiting for the network
  for most of the time, a larger number will do better.

</div>

These parameters can be set at run time by a dba group user using the
<a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
class="function">__dbf_set()</code></a> function.

</div>

<div id="indexdefragm" class="section">

<div class="titlepage">

<div>

<div>

##### Index Defragmentation

</div>

</div>

</div>

When data is inserted into tables, database pages are split and
typically pages end up not being fully utilized. If data is inserted in
ascending order of key value, which is often the case, space utilization
is more efficient. Still, gaps can be left by updates, deletions and
page splitting. Virtuoso has an autocompact feature which will take
groups of adjacent dirty pages and see if it can fit the same content on
a smaller number of pages. It will rewrite the pages to save space
before writing these to disk. This operates automatically. Statistics on
autocompaction are shown beside the Read ahead status line of the result
set of status ('');. The number of pages affected by autocompaction and
the number of resulting pages are shown. The numbers are cumulative
since the start of the instance.

Autocompact is non-locking and if pages are busy, they will not be
touched. Only relatively old dirty pages, about to be written to disk
are considered for compaction, not interfering with the hottest part of
the working set.

The automatic compaction is not however effective if pages are updated
singly, never making stretches of consecutive dirty pages. Therefore a
manual compaction function called DB.DBA.VACUUM () is also offered.

The vacuum stored procedure gets an optional table and index name and
will read the index from beginning to end. If neither argument is given,
all indices of all tables will be compacted. If only the table is given,
all indices of this table will be compacted.

If consecutive leaves can be fit on fewer pages than they now occupy,
this will rewrite them and free the pages left over. This does however
require transient space since the pages are not really replaced until
the next checkpoint, hence a vacuum operation can run out of disk. Using
the checkpoint statement to force a checkpoint will free the space.

The effects and need for explicitly vacuuming a database can be assessed
with the DB.DBA.SYS_INDEX_SPACE_STATS view.

Running:

``` programlisting
select * from DB..SYS_INDEX_SPACE_STATS order by ISS_PAGES desc;
```

produces a result set with the most space consuming index on top.
ISS_PAGES is the total count of pages. ISS_ROW_BYTES is the byte count
of the rows. If dividing the total count of bytes by the count of pages
is much below 8172, (8K - 20), chances are that vacuuming the index may
save space. Note that blobs are not affected by vacuuming. If the blobs
are small enough to fit on the row as normal strings they are already
there. Otherwise they occupy the needed number of pages and cannot be
made more compact.

Note that querying the SYS_INDEX_SPACE_STATS view will always read
through all the allocated pages of the database and may take a while.
The operation is not locking. Only the state as of the last checkpoint
will be shown, hence it is a good idea to run the checkpoint statement
before querying this view.

Examples:

``` programlisting
DB..VACUUM ();
-- Compact all tables and indices of the Virtuoso instance
```

``` programlisting
Db..VACUUM ('WS.%');
-- compact all tables of the WS. qualifier
```

``` programlisting
DB..VACUUM ('DB.DBA.RDF_QUAD', 'RDF_QUAD_PGOS');
-- compact the rdf_quad_pgos index of the rdf_quad table.
```

Virtuoso has an autocompact feature.

</div>

</div>

<div id="commandline" class="section">

<div class="titlepage">

<div>

<div>

#### Server Startup Command Line Options

</div>

</div>

</div>

<div id="ch-server_01" class="section">

<div class="titlepage">

<div>

<div>

##### Virtuoso Server

</div>

</div>

</div>

This section presents the command line switches of the Virtuoso server
executable. Depending on the model and virtual database middleware the
server will have different names, all starting with virtuoso-. All these
however have the same options for UNIX systems and slightly different
for Windows platform.

on Windows platform are available following server command line options:

``` programlisting
Usage:
  virtuoso-odbc-t.exe [-clnCbDARf---dSIMKmrd] [+configfile arg] [+licensefile arg]
                  [+no-checkpoint] [+checkpoint-only] [+backup-dump]
                  [+crash-dump] [+crash-dump-data-ini arg]
                  [+restore-crash-dump] [+foreground] [+pwdold arg]
                  [+pwddba arg] [+pwddav arg] [+debug] [+service arg]
                  [+instance arg] [+mode arg] [+dumpkeys arg] [+manual]
                  [+restore-backup arg] [+debug]
  +configfile            specify an alternate configuration file to use,
            or a directory where virtuoso.ini can be found
  +licensefile           specify an alternate license file to use,
            or a directory where virtuoso.ini can be found
  +no-checkpoint         do not checkpoint on startup
  +checkpoint-only       exit as soon as checkpoint on startup is complete
  +backup-dump           dump database into the transaction log, then exit
  +crash-dump            dump inconsistent database into the transaction log,
            then exit
  +crash-dump-data-ini   specify the DB ini to use for reading the data to dump
  +restore-crash-dump    restore from a crash-dump
  +foreground            run in the foreground
  +pwdold                Old DBA password
  +pwddba                New DBA password
  +pwddav                New DAV password
  +debug                 allocate a debugging console
  +service               specify a service action to perform
  +instance              specify a service instance to start/stop/create/delete
  +mode                  specify mode options for server startup (onbalr)
  +dumpkeys              specify key id(s) to dump on crash dump (default : all)
  +manual                specify when create a service to make it for manual startup
  +restore-backup        restore from online backup
  +debug                 Show additional debugging info

The argument to the +service option can be one of the following options
  start         start a service instance
  stop          stop a service instance
  create        create a service instance
  screate       create a service instance without deleting the existing one
  delete        delete a service instance
  list          list all service instances
```

The below are switches for server for UNIX platforms:

``` programlisting
Usage:
  virtuoso-iodbc-t [-fclnCbDARwMKr---d] [+foreground] [+configfile arg]
                   [+licensefile arg] [+no-checkpoint] [+checkpoint-only]
                   [+backup-dump] [+crash-dump] [+crash-dump-data-ini arg]
                   [+restore-crash-dump] [+wait] [+mode arg] [+dumpkeys arg]
                   [+restore-backup arg] [+pwdold arg] [+pwddba arg]
                   [+pwddav arg] [+debug]
  +foreground            run in the foreground
  +configfile            use alternate configuration file
  +licensefile           use alternate license file
  +no-checkpoint         do not checkpoint on startup
  +checkpoint-only       exit as soon as checkpoint on startup is complete
  +backup-dump           dump database into the transaction log, then exit
  +crash-dump            dump inconsistent database into the transaction log, then exit
  +log6                  If you're starting with a Virtuoso 5 server, and migrating to a Virtuoso 6 or
                         later server, append +log6 after +backup-dump or +crash-dump.
                         Note: The extra +log6 argument is not needed, and may have unexpected effect,
                         so please leave it off if starting with a Virtuoso 6 server and moving to
                         Virtuoso 6 or later.
  +crash-dump-data-ini   specify the DB ini to use for reading the data to dump
  +restore-crash-dump    restore from a crash-dump
  +wait                  wait for background initialization to complete
  +mode                  specify mode options for server startup (onbalr)
  +dumpkeys              specify key id(s) to dump on crash dump (default : all)
  +restore-backup        restore from online backup
  +pwdold                Old DBA password
  +pwddba                New DBA password
  +pwddav                New DAV password
  +debug                 Show additional debugging info
```

The <span class="emphasis">*+crash-dump*</span> option will make use of
the segmented log defined in virtuoso.ini for storing the recovery log.
See <a href="ch-server.html#vdbrecovery" class="link"
title="Database Recovery">Crash Recovery</a> and virtuoso.ini below for
more information. The other options will not use the segmented log.

The <span class="emphasis">*+restore-crash-dump*</span> option will
alter the server startup sequence so that the recovery log produced by
+crash-dump will be re-played correctly.

The <span class="emphasis">*+mode*</span> option can be a combination of
the following letters:

|                                                                                                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*o*</span> - only open the database and define the SYS_KEYS, SYS_COLS, SYS_KEY_PARTS, SYS_CHARSETS AND SYS_COLLATIONS system tables.                     |
| <span class="emphasis">*n*</span> - leaves out the initialization of the system tables.                                                                                         |
| <span class="emphasis">*b*</span> - do not process anything except the transaction log and system tables when restoring a crash dump (+restore-crash-dump).                     |
| <span class="emphasis">*a*</span> - leaves out the initialization of the replication, users, compilation or stored and system procedures, as well as the caching of the grants. |
| <span class="emphasis">*l*</span> - write only the schema tables in the backup or crash dump.                                                                                   |
| <span class="emphasis">*r*</span> - don't do the complete initialization (useful for performing a crash dump).                                                                  |

On Unix platforms the executable will detach itself from the console and
run in the background as a daemon unless the
<span class="emphasis">*+foreground*</span> switch is specified.

For Windows NT and Windows 2000, the Virtuoso server will normally be
installed as a Windows service and can be started from the Control Panel
or automatically at system startup.

Ordinarily the Windows service will be a system process that runs in the
background. If you want the Virtuoso service on Windows to allocate a
debugging console the you can use the
<span class="emphasis">*+debug*</span> (-d) switch. This switch is only
applicable to starting a service.

Virtuoso on Windows can be run directly from the command line using the
<span class="emphasis">*+foreground*</span> (-f) switch. The server will
then start in the foreground of the current "cmd" session. If this
switch is not used then the executable on Windows will assume that you
are attempting to start a Virtuoso service.

Windows services can be created and removed from the system as required.
The default installation under Windows will create a service by the
name: <span class="emphasis">*OpenLink Virtuoso VDBMS Server*</span> ,
and optionally another service with the name
<span class="emphasis">*OpenLink Virtuoso VDBMS Server \[demo\]*</span>
. The Demo service is a supplied demonstration database that can be
installed.

The following options are available to the
<span class="emphasis">*+service*</span> switch for configuring Virtuoso
services:

|                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------|
| The argument to the +service option can be one of the following options <span class="emphasis">*start*</span> start a service instance |
| <span class="emphasis">*stop*</span> stop a service instance                                                                           |
| <span class="emphasis">*create*</span> create a service instance                                                                       |
| <span class="emphasis">*screate*</span> create a service instance without deleting the existing one                                    |
| <span class="emphasis">*delete*</span> delete a service instance                                                                       |
| <span class="emphasis">*list*</span> list all service instances                                                                        |

They are used with the <span class="emphasis">*+instance
\<name\>*</span> where <span class="emphasis">*\<name\>*</span> is the
instance name to configure a particular instance. All instances are
listed in the services applet, with their name in square brackets.

<span class="emphasis">*+service list*</span> can be used to obtain the
list if services that are registered with Windows.

For each service listed you can start, stop, or delete the service.

<span class="emphasis">*+service create*</span> can be used to create a
new service. In this case you also need to specify other start up
options that would be associated with the new service entry. If you were
using an alternative configuration file this must be specified using
<span class="emphasis">*+configfile*</span> switch.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                          |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                    |
|                              | Make sure the Services Control Panel is closed, before attempting to modify services from the command line, otherwise locking may occur. |

</div>

</div>

</div>

<div id="rendezvous" class="section">

<div class="titlepage">

<div>

<div>

#### ZeroConfig ("Zero Configuration") Support

</div>

</div>

</div>

The "ZeroConfig" protocol, also known as "Zeroconf" or "Zero
Configuration" is a protocol that allows discovery of services on the
network that are advertised by their hosts. It also has provisions for
automatic discovery of computers and various devices. The main benefit
of ZeroConfig is that it does not require DHCP, DNS or directory
servers.

ZeroConfig is an open protocol that Apple submitted to the IETF for a
standard-creation process.

The Virtuoso server and ODBC driver use the capabilities of ZeroConfig
to facilitate DSN (Data Source Name) setup and usage. This is divided in
two parts: Server-side and Client-side.

The Virtuoso server (Server-side) is configured via the Virtuoso INI
file to advertise its availability on a network with a given name. This
allows applications, and in particular the Virtuoso ODBC driver, to
receive information about a server, such as its network address, default
login, etc, and use it for configuring a data source or directory making
a connection.

The Virtuoso ODBC driver (Client side) uses ZeroConfig to locate the
desired Virtuoso server during the set-up phase of a data source, and
determine available connection options such as:

|                                                     |
|-----------------------------------------------------|
| secure connection options                           |
| default database                                    |
| default user                                        |
| default password (if public/demo login is required) |
| default character set                               |

ZeroConfig provides the client with a service name, which must be bound
to the IP address/port of a host of the chosen service during DSN
configuration. This is used when existing DSN using a ZeroConfig name is
used to connect, it will map name with IP address and port before making
a connection.

<div id="rendezvousserverside" class="section">

<div class="titlepage">

<div>

<div>

##### Setting-up the Server for Service Advertising

</div>

</div>

</div>

The Virtuoso server is configured to advertise itself based on the
details specified in the `[Zero Config]` section of the Virtuoso INI
file. Below is an example of such:

``` programlisting
...
[Zero Config]
ServerName    = Virtuoso Server
ServerDSN     = UID=demo;PWD=
SSLServerName = Virtuoso Server (via SSL)
SSLServerDSN  = UID=dba;PWD=;ENCRYPT=1
...
```

The ServerName and SSLServerName are human readable strings chosen by
the administrator to provide clients with a suitable description of the
service being provided.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                        |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                  |
|                              | If the Virtuoso does not have the SSL listener enabled then the SSL service will not be advertised automatically. The SSL\* keys will simply be ignored and do not need to be removed. |

</div>

The ServerDSN and SSLServerDSN are default connection strings that can
be used by clients to make the advertised connection. You only need to
to specify default username and password in these strings. The default
database can be specified or left to the setting for the username. You
cannot specify the server hostname, IP address or port number, these are
supplied by Virtuoso automatically.

ZeroConfig service advertising is multicast, hence it is advertised on
all available network interfaces.

</div>

<div id="rendezvous_01" class="section">

<div class="titlepage">

<div>

<div>

##### Using the Windows ODBC Driver with ZeroConfig

</div>

</div>

</div>

Upon DSN set-up the ODBC driver listens for advertising servers, and
compiles a roster. This is displayed for the user to choose the desired
service to connect to.

If ZeroConfig is used to for data source set-up then the set-up dialog
will be initialized based on the details in the connection string
configured on the server.

When a DSN is configured based on a ZeroConfig service, the driver will
resolve the service name before making the connection to the server. The
driver does not store the network address or port number of the Virtuoso
server, only the ZeroConfig server name, so if the server's physical
address is changed the client DSNs associated with it do not all have to
reconfigured; they will resolve to the new address automatically on next
use.

</div>

</div>

<div id="dbstat" class="section">

<div class="titlepage">

<div>

<div>

#### Server Status Monitoring

</div>

</div>

</div>

The database status report is divided into 6 sections:

|             |
|-------------|
| Server      |
| Database    |
| Locks       |
| Clients     |
| Replication |
| Index Usage |

<div id="ch-server_02" class="section">

<div class="titlepage">

<div>

<div>

##### Server

</div>

</div>

</div>

This section shows how many connections are open and how many threads
the process has and how many are running at the present time. This also
displays the number of requests that have been received but are not yet
running on any thread.

</div>

<div id="database" class="section">

<div class="titlepage">

<div>

<div>

##### Database

</div>

</div>

</div>

``` screen

  File size 203161600, 24800 pages, 259 free.
  7000 buffers, 6987 used, 3884 dirty 8 wired down, repl age 8251 .
  Disk Usage: 14246 reads avg 6 msec, 74% read last  10 s, 14457 writes,
    4 read ahead, batch = 5.
Gate:  2729 2nd in reads, 0 gate write waits, 3372547 in while read 0 busy scrap.
Log = wi.log, 9851835 bytes
14950 pages have been changed since last backup (in checkpoint state)
Current backup timestamp: 0x0000-0x00-0x00
Last backup date: unknown
Clients: 18 connects, max 17 concurrent, 1024 licensed
RPC: 54441 calls, 17 pending, 17 max until now, 0 queued, 53988 burst reads (99%), 0 second
Checkpoint Remap 7646 pages, 0 mapped back. 0 s atomic time.
    DB master 24800 total 259 free 7646 remap 3415 mapped back
   temp  200 total 196 free
```

The status consists of the following items:

**File size: ** The database file size in bytes or 0 if the database
consists of statically allocated files. The total number of 8K database
pages follows, then the number of free pages. The number of buffers
shown the total count of 8K file cache buffers, followed by the number
of used buffers and the number of buffers that are dirty at the time.
The wired down count is normally zero but can be transiently other if
pages are wired down for processing by threads in the server.

**Disk Usage: ** Shows the cumulative total number of reads and writes
and the average length of time spent inside the read system call for the
database files.

The percentage is the percentage of the real time spent inside read
between this status report and the previous status report. This may
exceed 100% if several reads are taking place concurrently on different
stripes in a multi-file database.

**The Gate: ** Lists concurrent events. The <span class="emphasis">*2nd
in read*</span> is the count of concurrent requests for the same page,
the <span class="emphasis">*gate write waits*</span> is the count of
times a modify operation had to wait for exclusive access to a page
being read by another thread, the <span class="emphasis">*in while
read*</span> is the count of file cache hits that have taken place while
a read system call was in progress on another thread.

**Databases. ** Thus section shows the count of pages, free pages,
checkpoint remap and mapped back for the main database and the space for
temporary data such as sort results and hash indices. The page count is
the total size, the free count is the count of free pages, the
checkpoint remap is the count of pages that occupy two pages in
checkpoint space instead of one, the mapped back count is the number of
pages that will return to their original place in checkpoint space at
the next checkpoint. Understanding these is not necessary.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See:                                                                     |
|                            | The Disk Configuration section for a discussion of checkpoint remapping. |

</div>

</div>

<div id="locks" class="section">

<div class="titlepage">

<div>

<div>

##### Locks

</div>

</div>

</div>

The lock section shows various locking statistics accumulated since the
server was started. The deadlock count is divided into deadlocks caused
by a situation where several transactions read a page and one wants to
get write access and all other deadlock situations. The first is called
2r1w deadlock in the report.

The lock section also shows the total number of threads running, i.e.
engaged in performing some operation for a SQL or web client. The number
of threads waiting is the number of running threads that are presently
waiting for a lock. The number of threads in vdb is the number of
threads engaged in remote database operations or other 'slow' I/O, such
as access to outside HTTP or SOAP services.

All locks currently in effect are listed with the owners (a) and
possibly waiting transactions. The transactions are named after their
client. A log or replication replay transaction is here named
'INTERNAL'.

</div>

<div id="clients" class="section">

<div class="titlepage">

<div>

<div>

##### Clients

</div>

</div>

</div>

Each connected client is listed with the number of bytes sent and
received from the client. The transaction status is either PENDING for
OK or BLOWN OFF or DELTA ROLLED BACK for a transaction killed by
deadlock or timeout. The locks owned by the transaction are listed
following the status. IE means exclusive and IS shared lock.

</div>

<div id="replication" class="section">

<div class="titlepage">

<div>

<div>

##### Replication

</div>

</div>

</div>

This section shows the server in question and a list of replication
accounts either provided or received by this server. Accounts where the
server name (left column) is the same as the server name are those
provided by this.

The columns are server name, account name, last transaction number and
status. The status is OFF for a local account or a replicated account
where the remote is not available. It is SYNCING if a resync is in
progress, IN SYNC if the account is up to date or REMOTE DISCONNECTED if
there was a connection to a remote party which subsequently
disconnected.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                |
|:--------------------------:|:---------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                      |
|                            | <a href="rdfgraphreplication.html" class="link"                
                              title="16.19. RDF Graph Replication">RDF Graph Replication</a>  |

</div>

</div>

<div id="indexusage" class="section">

<div class="titlepage">

<div>

<div>

##### Index Usage

</div>

</div>

</div>

This part of the report summarizes the database's access statistics. The
output is a table with a row for each index in the database. Each row is
composed of the following columns:

``` screen
Table       The name of the table
Index       The name of the index. Same as the table for primary key.
Touches     The number of touches since startup. Each time the database
        engine looks at an entry of the index is counted as a touch.
        Not all touched entries are selected. For instance if the
        engine scans a table with non-indexed selection criteria it
        will touch each row but might select none.
Reads       The number of disk reads caused by reading this index.
%Miss       The percentage of touches that required a read. This can be
        over 100% since getting one entry may required more than one
        read if the top levels of the index are not in memory.
Locks       The number of times a lock is set on an entry of the index.
Waits       The number of times the engine has to wait for another
        transaction to finish in order to set a lock on this index.
%W      The percentage of waits of all locks set.
```

In interactive SQL

``` screen
SQL> status();
```

Will print out the report.

</div>

</div>

<div id="oemrelabeling" class="section">

<div class="titlepage">

<div>

<div>

#### Re-labeling Server Executable on Win32 Platforms

</div>

</div>

</div>

The Virtuoso Service name can be altered using the key
<span class="emphasis">*Win32ServiceName*</span> in the
<span class="emphasis">*Parameters*</span> section. The default name is
'OpenLink Virtuoso VDBMS Server'

To change the name of services:

|                                      |
|--------------------------------------|
| stop the service                     |
| delete the service                   |
| change the name in file virtuoso.ini |
| create the service                   |
| start the service                    |

Services with old names must be deleted before creating service with the
new name, i.e. with the Win32ServiceName setting set to the current name
of the service.

The name displayed in the ODBC Administrator, Setup and Configuration
dialogs is taken from the driver section in the ODBCINST. This can be
directly edited in the registry using the regedt32 Windows utility, or a
registry import file can be created which can be applied by simply
double-clicking the .reg file. Always exercise extreme caution when
making changes to the registry.

</div>

<div id="dbsrcsecurity" class="section">

<div class="titlepage">

<div>

<div>

#### Transport Level Security

</div>

</div>

</div>

<div id="srvadmencryption" class="section">

<div class="titlepage">

<div>

<div>

##### Encryption

</div>

</div>

</div>

Virtuoso has the ability to encrypt it's CLI network connections using
SSL. The server listens on a separate port for SSL CLI connections and
handles them just as the normal CLI connections, vut now providing
transport level security.

<div id="srvsidesupport" class="section">

<div class="titlepage">

<div>

<div>

###### Server-side Support

</div>

</div>

</div>

Server side secure connections utilizes three parameters in the
\[Parameters\] section of the virtuoso.ini:

|                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*SSLServerPort*</span> - Specifies the port on which the server listens for incoming SSL CLI requests.          |
| <span class="emphasis">*SSLCertificate*</span> - The SSL certificate to use (same meaning as the SSLCertificate in HTTPServer section) |
| <span class="emphasis">*SSLPrivateKey*</span> - The server's private key (same meaning as the SSLCertificate in HTTPServer section)    |

These parameters should be all set in order to enable the SSL CLI
server.

If SSLServerPort is not specified, then the Virtuoso server ignores the
other two and does not listen for SSL CLI connections.

If a non-SSL connection is attempted to the SSL server port, the server
rejects the connection. If an SSL connection is attempted against the
non-SSL port the server rejects the connection.

</div>

<div id="clisidesupport" class="section">

<div class="titlepage">

<div>

<div>

###### Client-side Support

</div>

</div>

</div>

The client does not require any SSL-specific files (like Certificates or
Private keys) in the SSL connection process.

**Native Clients (e.g. ISQL). ** There is an custom ODBC connect option
SQL_ENCRYPT_CONNECTION (=5004) supported by the Virtuoso CLI. It should
be set before issuing the SQLConnect call. Values are 'NULL' (no
encryption - default), '1' (encryption with no server X509 certificate
checking and no X509 certificate sent to the server) and a valid file
path to a PKCS#12 certificate file (protected with the same password as
the one used to log in. Note that with the iODBC/ODBC clients this
connect option is not applicable since the driver managers don't cache
or pass through the custom ConnectOptions set before connecting to the
data source. The ISQL has an additional option (-E) to do encrypted
connects using the encryption option '1') and -X \<file\> to set the
above option to the file supplied.

**ODBC & iODBC Driver. ** The drivers support an additional DSN
attribute:

``` programlisting
ENCRYPT=<string>
```

If this attribute is not specified then it defaults to "No".

It has the same meaning as the SQL_ENCRYPT_CONNECTION options (see
above). If this is not specified then it defaults to NULL.

The corresponding iODBC odbc.ini & ODBC Registry DSN attribute name is:

``` programlisting
"Encrypt"= <string>
```

The Windows Connect & Setup dialogs have an additional wizard page to
configure encryption.

</div>

<div id="x509certsupport" class="section">

<div class="titlepage">

<div>

<div>

###### X509 Certificate Support

</div>

</div>

</div>

Virtuoso supports X509 certificate validation: server side for both ODBC
and HTTPS connections, and client side for the ODBC connections.

**Server Side. ** To enable this option there are three new INI file
parameters added the HTTPServer section for the HTTPS, and the
Parameters section for ODBC):

|                                                                                                                                                                                                                                                                                                                                                                  |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*X509ClientVerify*</span> - Whether the server will require X509 certificates from the browsers. If set to 1 a client should send a X509 certificate which will be validated against the server CA list.                                                                                                                                  |
| <span class="emphasis">*X509ClientVerifyDepth*</span> - Specifies how deep the client certificate verification process will traverse the Issuer chain before giving up. The default value of 0 means that only verification of the client certificate itself being in the server's CA list is performed. Setting this option to -1 will ignore the depth checks. |
| <span class="emphasis">*X509ClientVerifyCAFile*</span> - a PEM (base64) file of all the X509 certificates of the Certification Authorities (CA) which the server will use for verifying the client's client certificate. A list of these will be sent to the client as a part of the SSL handshake so the client will know which certificate to send.            |

**ODBC Client Side. ** In order for verification of the server
certificate to take place a PKCS#12 file should be supplied to the ODBC
client. It will use the CA list in this PKCS#12 to verify the server
certificate. It will set the verification depth to -1 (unlimited) while
performing such a check.

If the server certificate is not verified correctly it will refuse to
connect to the server. When the ENCRYPT parameter is set to "1" (do SSL
without X509 validation) the client will return a SQL_SUCCESS_WITH_INFO
in SQLConnect/SQLDriverConnect with the Server's certificate subject and
the verification result as the server will always send it's X509
certificate to the client as a part of the SSL connect handshake.

If the PKCS#12 file is supplied the ODBC client will try to open it
using the login password. In order for the file to be successfully
opened it should be encrypted with the same password used for logging
in.

Normally when exporting a PKCS#12 file from other programs it will
contain only the CAs of the Certificate validation chain. This means
that client and server certificates should have common CA in their
certificate chains in order to be used for ODBC X509 validation. The
client certificate from the PKCS#12 file will not take place in the
server certificate validation process.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                     |
|:--------------------------:|:----------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                           |
|                            | <a href="fn_get_certificate_info.html" class="link" 
                              title="get_certificate_info"><code                   
                              class="function">get_certificate_info()</code></a>   |

</div>

</div>

</div>

<div id="acl" class="section">

<div class="titlepage">

<div>

<div>

##### File System Access Control Lists

</div>

</div>

</div>

Access Control Lists (ACL) are used to restrict file system access.

These lists are maintained in the Virtuoso INI file under the Parameters
section with entries such as:

``` programlisting
DirsAllowed = <path> [, <path>]
DirsDenied = <path> [, <path>]

<path> := <absolute_path> or <relative_path>
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                       |
|:----------------------------:|:----------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                 |
|                              | A relative path is relative to the servers current working directory. |

</div>

The Virtuoso ISQL utility can be used to check the Server DirsAllowed
params as follows:

``` programlisting
SQL> select server_root (), virtuoso_ini_path ();
```

The above should show in the result the server working directory and INI
file name.

Also you can check the relevant INI setting by running following
statement via ISQL command line utility:

``` programlisting
SQL> select cfg_item_value (virtuoso_ini_path (), 'Parameters',
'DirsAllowed');
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                         |
|:--------------------------:|:------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                               |
|                            | <a href="ch-server.html#virtini" class="link"                           
                              title="Virtuoso Configuration File">Virtuoso INI File Configuration</a>  |

</div>

ACL's work in the following way:

|                                                                                                               |
|---------------------------------------------------------------------------------------------------------------|
| All paths are converted from relative to absolute paths.                                                      |
| The path beginning with \<http_root\> is always allowed.                                                      |
| All DB files are always access denied (.db, db segments, .trx, log segments, .ini specified in INI file etc.) |
| If a path is not allowed or exists as denied then access to the file is rejected.                             |
| If a requested path is allowed and not in denied then access is allowed.                                      |
| ACL's are inherited. If a directory allows access so does its subdirectories.                                 |

The following functions are restricted by file Access Control Lists
(ACL) in the virtuoso.ini file:

|                                                         |
|---------------------------------------------------------|
| <a href="fn_file_to_string.html" class="link"           
 title="file_to_string">file_to_string</a>                |
| <a href="fn_file_to_string_output.html" class="link"    
 title="file_to_string_output">file_to_string_output</a>  |
| sys_mkdir                                               |
| sys_dirlist                                             |
| <a href="fn_string_to_file.html" class="link"           
 title="string_to_file">string_to_file</a>                |
| cfg_write                                               |

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                |
|:----------------------------:|:-----------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                          |
|                              | the cfg_write function has restrictions against changing file access control lists in ini file |

</div>

</div>

</div>

</div>

<div id="vdbconcepts" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.2. Virtual Database

</div>

</div>

</div>

<div id="linkrmttableauto" class="section">

<div class="titlepage">

<div>

<div>

#### Linking Remote Tables & Views

</div>

</div>

</div>

The Virtuoso Server supports linking in of tables, views, procedures and
other components from a remote ODBC data-source, enabling them to be
queried as native objects in Virtuoso; this process is called
"attaching" or "linking". The easiest way to link to an external table
is to use the <a href="dbadmin.html#remotetables" class="link"
title="External Linked Objects">Linking Remote Tables Wizard</a> , part
of the Visual Server Administration Interface. Alternatively you can
attach these objects programmatically, as this section explains; finally
you can attach tables manually - see
<a href="ch-server.html#mansetrds" class="link"
title="Manually Setting Up A Remote Data Source">Manually Setting Up A
Remote Data Source</a> which is useful for connections to less-capable
ODBC data-sources.

<div id="attach" class="section">

<div class="titlepage">

<div>

<div>

##### ATTACH TABLE Statement

</div>

</div>

</div>

``` programlisting
ATTACH TABLE <table> [PRIMARY KEY '(' <column> [, ...] ')']
  [AS <local_name>] FROM <dsn> [USER <uid> PASSWORD <pwd>]
  [ON SELECT] [REMOTE AS <literal_table_name>]
```

<div class="variablelist">

<span class="term">table</span>  
Adequately qualified table name of the form: identifier \|
identifier.identifier \| identifier.identifier.identifier \|
identifier..identifier

<span class="term">column</span>  
column to assume primary key

<span class="term">local_name</span>  
fully qualified table name specifying local reference.

<span class="term">dsn</span>  
scalar_exp

<span class="term">user</span>  
scalar_exp

<span class="term">password</span>  
scalar_exp

<span class="term">literal_table_name</span>  
scalar_exp

</div>

This SQL statement defines a remote data source, copies the schema
information of a given table to the local database and defines the table
as a remote table residing on the data source in question.

The table is a designation of the table's name on the remote data source
dsn. It may consist of an optional qualifier, optional owner and table
names, separated by dots. This must identify exactly one table on the
remote dsn. The optional local_name is an optionally qualified table
name which will identify the table on the local database. If qualifier
or owner are omitted, these default to the current qualifier 'dbname()'
and the logged in user, as with CREATE TABLE. If the local_name is not
given it defaults to the \<current qualifier\>.\<dsn\>.\<table name on
dsn\>. The \<dsn\> will be the dsn with all alphabetic characters in
upper case and all non-alphanumeric characters replaced by underscores.
The \<table name on dsn\> will be the exact name as it is on the remote
dsn, case unmodified.

The PRIMARY KEY option is only required for attaching views or tables
where the primary key on the remote table cannot be ascertained directly
from the remote data source.

If a dsn is not previously defined with vd_remote_data_source or ATTACH
TABLE, the USER and PASSWORD clauses have to be given.

The <span class="emphasis">*REMOTE AS*</span> option allows you to
provide a string literal for referencing the remote table. This is
useful when linking tables from sources that do not support three-part
qualification correctly.

</div>

<div id="attachview" class="section">

<div class="titlepage">

<div>

<div>

##### Attaching views

</div>

</div>

</div>

A view can be attached as a table if a set of uniquely identifying
columns is supplied.

This is done with the PRIMARY KEY option to ATTACH TABLE as follows:

``` programlisting
attach table T1_VIEW primary key (ROW_NO) from 'somedsn';
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                  |
|:----------------------------:|:-----------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                            |
|                              | Views cannot be attached unless the PRIMARY KEY options is used. |

</div>

</div>

<div id="linkrmttableautoexamples" class="section">

<div class="titlepage">

<div>

<div>

##### Examples for Linking Remote Tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="vdbenginemclink.html" class="link"
  title="8.2.3. Linking Oracle tables into OpenLink Virtuoso">Oracle</a>

- <a href="vdbengineprlnk.html" class="link"
  title="8.3.3. Linking Progress tables into Virtuoso">Progress</a>

- <a href="vdbengineinglink.html" class="link"
  title="8.4.3. Linking Ingres tables into OpenLink Virtuoso">Ingres</a>

- <a href="vdbengineinflink.html" class="link"
  title="8.5.3. Linking Informix tables into OpenLink Virtuoso">IBM
  Informix</a>

- <a href="vdbenginedb2link.html" class="link"
  title="8.6.3. Linking DB2 tables into OpenLink Virtuoso">IBM DB2</a>

- <a href="vdbenginesyblink.html" class="link"
  title="8.7.3. Linking Sybase tables into OpenLink Virtuoso">Sybase</a>

- <a href="vdbenginemsqllink.html" class="link"
  title="8.8.3. Linking MySQL tables into OpenLink Virtuoso">MySQL</a>

- <a href="vdbenginepsqllink.html" class="link"
  title="8.9.3. Linking PostgreSQL tables into OpenLink Virtuoso">PostgreSQL</a>

- <a href="vdbengineodtjdlink.html" class="link"
  title="8.10.3. Linking ODBC to JDBC Bridge tables into OpenLink Virtuoso">JDBC</a>

- <a href="vdbengineodbcodlink.html" class="link"
  title="8.11.2. Linking ODBC to ODBC Bridge tables into OpenLink Virtuoso">ODBC
  to ODBC</a>

- <a href="vdbenginefirebdlink.html" class="link"
  title="8.12.3. Linking Firebird tables into OpenLink Virtuoso">Firebird</a>

- <a href="vdbenginemsqlslink.html" class="link"
  title="8.13.3. Linking Microsoft SQL Server tables into OpenLink Virtuoso">Microsoft
  SQL Server</a>

</div>

</div>

</div>

<div id="linkrmtprocauto" class="section">

<div class="titlepage">

<div>

<div>

#### Linking Remote Procedures

</div>

</div>

</div>

<div id="attachproc" class="section">

<div class="titlepage">

<div>

<div>

##### ATTACH PROCEDURE Statement

</div>

</div>

</div>

``` programlisting
ATTACH (PROCEDURE|FUNCTION) <proc_name> ([<parameter1>[,<parameter2>[...]]])
  [ RETURNS <rettype> ] [AS <local_name>] FROM <dsn>
    
```

<div class="variablelist">

<span class="term">dsn</span>  
scalar_exp

<span class="term">proc_name</span>  
identifier \| identifier.identifier \| identifier.identifier.identifier
\| identifier..identifier

<span class="term">parameter1..parameterN</span>  
parameters declaration (as in CREATE PROCEDURE)

<span class="term">local_name</span>  
table

</div>

The ATTACH PROCEDURE statement allows you to associate stored procedures
from remote datasources with Virtuoso so they can be used as if they
were defined directly within Virtuoso. Much like the ATTACH TABLE
statement, this SQL statement creates a local alias for a procedure on a
given remote data source so it can be considered locally defined. When
this alias is called called the procedure at the remote data source will
actually be called.

Procedure generated result sets are not supported by the ATTACH
PROCEDURE statement. The only portable way to return values from a
remote procedure is to use INOUT or OUT parameters. Remote procedure
result sets can be used by combination of `rexecute()` and Virtuoso PL,
but this is left for the user to implement as required.

The ATTACH PROCEDURE statement is not able to define new connections to
remote data sources, the connection should be defined prior using either
vd_remote_data_source or by attaching a table or view using the ATTACH
TABLE statement with USER/PASSWORD supplied.

Note that when generating pass-through statements to a given remote, any
procedure call for an attached procedure is passed through if the
current DSN is the same as the remote procedure's DSN.

The <span class="emphasis">*proc_name*</span> is the designation of the
procedure's name on the remote data source, DSN. The remote procedure
name supplied should always be fully qualified to avoid ambiguity, it
may consist of an optional qualifier/catalog, optional owner and finally
procedure name, separated by dots. This must identify exactly one
procedure on the remote data source.

The optional <span class="emphasis">*local_name*</span> is an optionally
qualified procedure name which will identify the procedure on the local
Virtuoso database. If the local_name is not given it defaults to the
\<current qualifier\>.\<dsn\>.\<proc name on dsn\>. The \<dsn\> will be
the data source name in upper case and with all non-alphanumeric
characters replaced by underscores. The \<proc name on dsn\> will be the
exact name as it is on the remote dsn, case unmodified.

If a dsn is not previously defined with vd_remote_data_source or ATTACH
TABLE, the ATTACH PROCEDURE will fail.

<div id="vdocs-trans-01" class="example">

**Example 6.3. Example:**

<div class="example-contents">

On remote Virtuoso (DSN name : remote_virt):

``` programlisting
   CREATE PROCEDURE RPROC (IN PARAM VARCHAR) returns VARCHAR
   {
     return (ucase (PARAM));
   }
```

On the local virtuoso (DSN name : local_virt) :

``` programlisting
vd_remote_data_source ('remote_virt', '', 'demo', 'demopwd');
ATTACH PROCEDURE RPROC (IN PARAM VARCHAR) RETURNS VARCHAR from 'remote_virt';
```

will result in creation of an procedure alias for RPROC in local_virt
named DB.REMOTE_VIRT.RPROC

Calling it from the local_virt (using ISQL)

``` programlisting
select REMOTE_VIRT.RPROC ('MiXeD CaSe') as rproc_result;

rproc_result
---------------
MIXED CASE
1 rows
```

</div>

</div>

  

</div>

<div id="id1321" class="section">

<div class="titlepage">

<div>

<div>

##### See Also:

</div>

</div>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                                  |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | Tip                                                                                                                                              |
|                            | The Virtuoso Visual Server Administration Interface provides a graphical user interface for <a href="dbadmin.html#remoteprocedures" class="link" 
                              title="Remote Procedures">linking remote stored procedures</a> .                                                                                  |

</div>

</div>

</div>

<div id="typemapping" class="section">

<div class="titlepage">

<div>

<div>

#### Data Type Mappings

</div>

</div>

</div>

If a statement is passed through to a remote data source, the types
returned by SQLDescribeCol are taken directly from the remote prepare
and converted to the closest Virtuoso supported type.

If a statement involves both local and remote resources all types are
taken from the Virtuoso copy of the data dictionary.

In executing remote selects Virtuoso binds output columns according to
the type and precision given by SQLDescribeCol after preparing the
remote statement.

When a table is attached from a remote data source the catalog is read
and the equivalent entries are created in Virtuoso. Since the types
present on different DBMS's vary, the following logic is used to map
ODBC types to Virtuoso types.

<div id="id12054" class="decimalstyle">

**Table 6.1. Attach Table Type Mappings**

<div class="decimalstyle-contents">

<table data-summary="Attach Table Type Mappings" data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;" data-char="." data-charoff="50">SQL
Type</th>
<th data-char="." data-charoff="50">Mapped Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_CHAR</td>
<td data-char="." data-charoff="50">varchar (precision)</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_VARCHAR</td>
<td data-char="." data-charoff="50">varchar (precision)</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_BIT</td>
<td data-char="." data-charoff="50">smallint</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_TINYINT</td>
<td data-char="." data-charoff="50">smallint</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_SMALLINT</td>
<td data-char="." data-charoff="50">smallint</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_INTEGER</td>
<td data-char="." data-charoff="50">integer</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_BIGINT</td>
<td data-char="." data-charoff="50">decimal (20)</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_NUMERIC</td>
<td data-char="." data-charoff="50"><p>smallint if precision &lt; 5 and
scale = 0</p>
<p>integer if precision &lt; 10 and scale = 0</p>
<p>double precision if precision &lt; 16</p>
<p>decimal (precision, scale) otherwise</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_REAL</td>
<td data-char="." data-charoff="50">real</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_FLOAT</td>
<td data-char="." data-charoff="50">double precision</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">double precision</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_BINARY</td>
<td data-char="." data-charoff="50">varbinary (precision)</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_VARBINARY</td>
<td data-char="." data-charoff="50">varbinary (precision)</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_LONGVARCHAR</td>
<td data-char="." data-charoff="50">long varchar</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_LONGVARBINARY</td>
<td data-char="." data-charoff="50">long varbinary</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_DATE</td>
<td data-char="." data-charoff="50">date</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_TIME</td>
<td data-char="." data-charoff="50">time</td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50">SQL_TIMESTAMP</td>
<td data-char="." data-charoff="50">datetime</td>
</tr>
</tbody>
</table>

</div>

</div>

  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                         |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                   |
|                              | The general case of decimal and numeric both revert to the Virtuoso decimal type, which is a variable precision decimal floating point. |

</div>

</div>

<div id="transmodel" class="section">

<div class="titlepage">

<div>

<div>

#### Transaction Model

</div>

</div>

</div>

One transaction on the Virtuoso VDBMS server may contain operations on
multiple remote data sources. As a general rule remote connections are
in manual commit mode and Virtuoso either commits or rolls back the
transaction on each of the remote connections as the main transaction
terminates.

ODBC does not support two phase commit. Therefore a transaction that
succeeds on one remote party may fail on another.

A transaction involving local tables and tables on one remote data
source will always complete correctly since the remote is committed
before the local and the local is rolled back if the remote commit
fails.

Note that even though the client to Virtuoso connection may be in
autocommit mode the continuing connections will typically not be
autocommitting.

A remote connection is in autocommit mode if the Virtuoso connection is
and the statement is passed through unmodified. In all other cases
remote connections are in manual commit mode.

Virtuoso supports 2PC - Two Phase Commit. See the
<a href="twopcimplementation.html" class="link"
title="11.15. Distributed Transaction &amp; Two Phase Commit">Distributed
Transaction &amp; Two Phase Commit</a> section for more information.

</div>

<div id="vdb_sqlfunctions" class="section">

<div class="titlepage">

<div>

<div>

#### Virtual Database and SQL Functions

</div>

</div>

</div>

Different DBMS's support slightly different sets of SQL built-in
functions with slightly differing names. For example, what is called
substring on Virtuoso is called substr on Informix. Virtuoso allows
declaring equivalences between local user-defined or built-in functions
and user defined or built-in functions on remote servers. Knowing that a
function exists on a remote database allows passing processing closer to
the data, resulting in evident gains in performance.

To declare that substring is called substr on DSN inf10, you can
execute:

``` programlisting
db..vd_pass_through_function ('inf10', 'substring', 'substr');
```

The first argument is the name of the remote database, as used with
attach table and related statements. If user defined functions with
qualified names are involved, the names should be qualified in the
vd_pass_through_function call also. If many qualified or unqualified
forms of the name are in use, one should declare the mapping for them
all.

To verify whether this declaration takes effect, one can use explain to
see the query execution plan, for example:

``` programlisting
explain ('select substring (str, 1, 2) from inf10.sample_table');
```

The declarations are persistent and can be dropped by using a last
argument of NULL for a given function. The declarations are kept at the
level of a DSN and not at the level of the type of DBMS because
different instances can have different user defined functions defined.

</div>

<div id="vdb_sqloptstatistics" class="section">

<div class="titlepage">

<div>

<div>

#### Virtual Database and SQL Optimizer Statistics

</div>

</div>

</div>

If a query can be executed in its entirety on a single remote database,
then optimizing this query is exclusively the business of the remote
database, as it gets the whole query text. Virtuoso rewrites some things
and suggests a join order but these are not binding on the remote
database.

If a query involves tables from multiple remote databases or a a mix of
local and remote tables, knowing basic SQL statistics on the tables is
essential for producing a meaningful query plan. Virtuoso has
information on indices existing on remote tables and if the remote table
is attached from a known type of DBMS, Virtuoso may read the DBMS
specific statistics at attach time.

Note that the statistics of the remote database should be up to date
before attaching.

The function sys_db_stat can be used for forcing a refresh of Virtuoso's
statistics on remote tables.

``` programlisting
sys_db_stat (5, 0)
```

will go through all tables, local and remote. For local tables, it will
update statistics with a 5 percent sampling rate and for remote tables
it will refresh the statistics if the type of the host DBMS is among the
supported ones. If the remote DBMS is of an unknown type, Virtuoso will
take the count of the remote table and select the 1000 first rows to get
a sample of data lengths and column cardinalities. This is not very
precise but will be better than nothing.

In order to force a full read of a remote table for statistics
gathering, one can use

``` programlisting
db..sys_stat_analyze ('fully qualified table name', 0, 0);
```

The table name is case sensitive, with all qualifiers, as it appears in
SYS_KEYS and other system tables. This will read the whole table.

Statistics on local as well as remote tables are kept in SYS_COL_STAT.
One may look at this table to see the effects of remote statistics
collection. In special cases, if a special effect is desired or the
information is not otherwise available, as in the case of a very large
table on an unsupported type of server, it is possible to manually
update the contents of the table. Shutting down and restarting Virtuoso
will force a reload of the statistics information.

Presently Oracle, Informix and Virtuoso are supported for direct access
to the remote database's statistics system tables. It is possible to
define hook functions for accessing this same information from any other
type of DBMS. Please contact support for instructions on this.

</div>

<div id="vdb_distrqueryoptm" class="section">

<div class="titlepage">

<div>

<div>

#### Distributed Query Optimization

</div>

</div>

</div>

When a query contains mixes of tables from different sources, the
compiler must decide on an efficient execution plan that minimizes the
number of round trips to remote servers and evaluates query conditions
close to the data when possible. Additionally, any normal query
optimization considerations such as choice of join order and join type
apply. See the section on SQL optimization and optimizer hints for more
on this. Additionally, the SQL optimizer uses round trip time statistics
for the servers involved in the query.

In the following examples, we use the tables r1..t1, r2..t1 and t1, of
which r1..t1 is on a server close by, r2..t1 on a server farther away
and t1 on the local server. The column row_no is a unique key and the
string1 column is in indexed with 300 distinct values, the column fs1
has 3 distinct values. The tables all have 100000 rows. A round trip to
r1 takes 10 ms and a round trip to r2 takes 100 ms.

Consider

``` programlisting
select * from r1..t1 a, t1 b where a.row_no = b.row_no and a.fs1 = 'value1';
```

The compiler notices that 33333 rows will be selected from r1..t1 based
on fs1. It will decide to read these into a hash table, causing one
linear scan of r1..t1 with relatively few round trips. Then it will read
t1 locally and select the rows for which there is a matching entry in
the hash. This is slightly faster than doing 33333 random lookups of t1.
If fewer rows were selected from r1..t1, the compiler would do a loop
join with the local t1 as the inner loop.

The absolute worst plan would be a loop join with t1 as the outer loop,
with 100000 round trips to r1.

Now, if many tables are accessed from the same data source, the compiler
tries to bundle these together into one statement. Thus, for:

``` programlisting
select * from r1..t1 a, r1..t1 b, t1 c where c.string1 = '111' and b.row_no = c.row_no and a.row_no = b.row_no + 1;
```

The compiler will probably do the outer loop for t1, which is expected
to select 100000/300 rows. Then it will do a round trip to r1 with the
statement.

``` programlisting
select * from t1 a, t1 b where a.row_no = b.row_no + 1 and a.row_no = ?.
```

This is likely better than doing the remote part as an outer loop,
bringing all the approx 100000 results in. 333 round trips selecting 1
row is better than 100000 rows transferred. If the data source were
further away, this could be otherwise, hence the importance of the round
trip time statistic.

In distributed queries, the compiler will honor the option (order) and
the join types e.hg. table option \*(hash) insofar the tables are local.

Thus, if we wrote

``` programlisting
select * from r1..t1 a, t1 b, r1..t1 c where c.string1 = '111' and b.row_no = c.row_no and a.row_no = b.row_no + 1 option (order);
```

the compiler could not merge the two tablesfrom r1 into a single query
because the order were given and there is an intervening table not
located on r1.

</div>

<div id="vdb_arrayparameters" class="section">

<div class="titlepage">

<div>

<div>

#### Use of Array Parameters

</div>

</div>

</div>

ODBC and other data access API's usually offer a mechanism for executing
a single parametrized statement multiple times with a single
client-server round trip. This is usually called support of array
parameters.

Virtuoso can make use of array parameter support in ODBC drivers when
available. Consider the statement:

``` programlisting
insert into r1..t1 select * from t1;
```

Without array parameters, this would make a round trip to r1 for each
row inn t1. With array parameters enabled, with a batch size of 100,
this would make only 1000 round trips for 100000 rows, resulting in
dramatic increase in performance. Typically, if the remote server is on
the same machine, array parameters make such batch operations about 3x
faster. If the remote is farther away, the gain is greater.

Array parameters are used if the remote database and its ODBC driver
support them. The feature is globally disabled in the default
configuration because some ODBC drivers falsely claim to support array
parameters. To enable this feature, the the ArrayOptimization entry in
the \[VDB\] section of the ini file to 1. To set the batch size, use the
NumArrayParameters setting. 100 is a reasonable value.

Some ODBC drivers also support array parameters for select statements.
To enable using this, you can set the ArrayOptimization setting to 2.
This may however not work with some drivers even if DML
(insert/update/delete) statements do work with array parameters.

</div>

<div id="timestamp_autoincrement" class="section">

<div class="titlepage">

<div>

<div>

#### Timestamps & Autoincrement

</div>

</div>

</div>

A transaction timestamp is not the same across the transaction if the
transaction has branches in different databases.

The data type and precision of a time stamp will also vary between
different types of databases.

Hence timestamp columns coming from tables on different servers are not
comparable for equality.

In inserts and updates of remote tables timestamps are assigned by the
database where the table in question is physically located.

Identity or autoincrement columns are likewise handled by the database
holding the remote table.

Note that MS SQL Server and Virtuoso describe a timestamp column as a
binary column in ODBC catalog and meta data calls. Thus remote SQL
Server or Virtuoso timestamps will not appear as timestamps at all.

In the case of a Virtuoso remote database the binary timestamp can be
cast into a DATETIME data type and it will appear as a meaningful
datetime.

</div>

<div id="vdbstoredprocs" class="section">

<div class="titlepage">

<div>

<div>

#### VDB Stored Procedures & Functions

</div>

</div>

</div>

These procedures allow you to manually manage remote data sources and
their tables.

<div class="itemizedlist">

- <a href="fn_vd_remote_data_source.html" class="link"
  title="vd_remote_data_source">vd_remote_data_source()</a>

- <a href="fn_vd_remote_table.html" class="link"
  title="vd_remote_table">vd_remote_table()</a>

- <a href="fn_rexecute.html" class="link" title="rexecute">rexecute()</a>

- <a href="fn_rnext.html" class="link" title="rnext">rnext()</a>

- <a href="fn_rmoreresults.html" class="link"
  title="rmoreresults">rmoreresults()</a>

- <a href="fn_rclose.html" class="link" title="rclose">rclose()</a>

- <a href="fn_rstmtexec.html" class="link"
  title="rstmtexec">rstmtexec()</a>

</div>

Functions capable of returning a result-set make use of the
*`results_set`* parameter. To prevent them from returning a result-set,
the *`results_set`* parameter should be set to 'null'. If Virtuoso finds
an awaiting parameter to contain *`results_set`* it will fetch the
result set regardless of *`cursor_handle`* parameter.

Unless explicitly granted, only the DBA group is permitted to use the
`rexecute()` to maintain security. Caution is required here since any
user granted use of `rexecute()` has full control of the remote data
source set-up by the DBA, however limited to the overall abilities of
the remote user on the remote data source. Users can be granted and
denied access to this function using the following commands:

``` programlisting
GRANT REXECUTE ON '<attached_dsn_name>' TO <user_name>
REVOKE REXECUTE ON '<attached_dsn_name>' FROM <user_name>
```

The following remote catalogue functions help you to obtain information
about the remote datasources that you are using. These could be
especially useful in Virtuoso PL later on if you are not able to know
everything about the remote tables ahead of time for the ATTACH TABLE
statement

<div class="itemizedlist">

- <a href="fn_sql_data_sources.html" class="link"
  title="sql_data_sources">sql_data_sources()</a>

- <a href="fn_sql_tables.html" class="link"
  title="sql_tables">sql_tables()</a>

- <a href="fn_sql_columns.html" class="link"
  title="sql_columns">sql_columns()</a>

- <a href="fn_sql_statistics.html" class="link"
  title="sql_statistics">sql_statistics()</a>

- <a href="fn_sql_primary_keys.html" class="link"
  title="sql_primary_keys">sql_primary_keys()</a>

</div>

</div>

<div id="mansetrds" class="section">

<div class="titlepage">

<div>

<div>

#### Manually Setting Up A Remote Data Source

</div>

</div>

</div>

Defining a remote table involves declaring the table as a local table
and then defining the data source if not already defined and associating
the new table with the remote data source.

The data source on which a table resides is declared at the table level.
This has no connection to the table's qualifier.

Assume a remote ODBC data source named test containing a table xyz
declared as follows:

<div id="vdocs-trans-01_01" class="example">

**Example 6.4. Example:**

<div class="example-contents">

``` programlisting
   CREATE TABLE XYZ (
   A INTEGER,
    B INTEGER,
    C INTEGER,
    PRIMARY KEY (A));
```

</div>

</div>

  

To defined this as a remote table on the data source Virtuoso, first
define the table locally, using the above CREATE TABLE statement above.

Then define the data source:

``` programlisting
DB..vd_remote_data_source ('test', '', 'sa','');
```

And the table:

``` programlisting
DB..vd_remote_table ('test', 'DB.DBA.XYZ', 'master.dbo.XYZ');
```

This assumes that the remote data source has a login 'sa' with an empty
password and no special connection string options. The table names in
vd_remote_table have to be fully qualified. We here assume that the
Virtuoso table was created by DBA in under the default qualifier DB and
the remote XYZ was created by dbo in master.

The vd_remote_table declaration does not affect statements or procedures
compiled prior to the declaration.

Additional indices of remote tables may optionally be defined. They do
not affect the operation of the SQL compiler. The remote data source
makes the choice of index based on the order by clause in the statement
passed through.

</div>

<div id="bugslimits" class="section">

<div class="titlepage">

<div>

<div>

#### Caveats

</div>

</div>

</div>

<div class="itemizedlist">

- Never attempt to attach a local table as a remote. The server will
  hang if it tries to make a remote commit on itself.

- If the schema of the remote table is changed it will need to be
  re-attached to Virtuoso.

- The Virtuoso server treats dots (.) in the double-quotes escaped names
  as name element separators. For example : the table name "a.b.c" is
  treated as "a"."b"."c" . Because of this remote tables with dots in
  their table name (like tables from MS Text driver) require the dot
  inside the table name to be replaced with the VDB "non-delimiting-dot"
  (\x0A) and the vd_attach_table (in dsn varchar, in remote_name
  varchar, in local_name varchar, in uid varchar, in pwd varchar) to be
  used instead of ATTACH TABLE statement.

  The statement ATTACH TABLE "datafile.txt" as 'test' from 'text' user
  'a' password 'b' should become :

  ``` programlisting
  vd_attach_table ('text', 'datafile\x0Atxt', 'test', 'a', 'b');
  ```

</div>

When Virtuoso interacts with a table or view attached from a remote data
source, it must be able to uniquely identify each row of the query. At
the attach time Virtuoso will query remote data source for the tables
primary keys and indices. These will be used to construct a copy of the
table definition in Virtuoso which is then used in reference to the
remote data source. At query time this information is used as much as
possible. This information may need to be supplemented by calls to
SQLStatistics() for further indicies or primary key information, as a
last resort Virtuoso will use SQLColAttribute() to determine which
columns are SQL_DESC_SEARCHABLE.

</div>

</div>

<div id="usermodel" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.3. Virtuoso User Model

</div>

</div>

</div>

The Virtuoso User Model is designed to support:

|                                                                                                                                                                                                                                                                                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Use of an external server for password and user account base maintenance for example an LDAP server, another database server etc. This allows user accounts to be verified against security information stored in some centralized repository, allowing integration into existing security infrastructure . |
| Single namespace for users and groups for SQL and web service access. In this way the local security info is stored in one place and allows enabling SQL account to work as a web account or a web account as an SQL account. This enforces unique names for users and roles in the database.               |
| Extensibility of user information retrieval and checking.                                                                                                                                                                                                                                                   |
| Extensibility of user account and group attributes.                                                                                                                                                                                                                                                         |

There is a set of functions for administering the users and groups
(roles) of a Virtuoso database. All the user administration functions
are restricted to members of the dba group only.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                          |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                    |
|                              | The terms 'role' and 'group' are identical in their usage in this document. The terms security object or grantee refer collectively to users and groups. |

</div>

User manipulation functions do not generally return values. In case of
error an error condition will be signaled.

Users and roles are in the same namespace and are identified by name.
One name will not both designate a user and a group. A user or group may
be SQL enabled. A name that identifies a role (group) does not have a
password and is not a valid login name.

A user may belong to multiple roles. A role may inherit multiple other
roles. One role may be inherited or directly granted to a security
object multiple times. The order of granting is not relevant. The
effective privileges of a user are those granted to public, those
granted to the user plus those granted to a direct or indirect role of
the user. The relationship between users and roles is many to many. A
role can be granted multiple other roles as well as direct permissions.
Cycles in granting roles are not allowed, an error will be signaled if
an operation would result in a cycle in the role inheritance graph.

When SQL procedures or queries are executing, the effective privileges
are those granted to the owner of the procedure or view. A top level
dynamic SQL statement executes with the effective privileges of the
logged in user. If a SQL statement executes as a result of an HTTP
request, the applicable virtual directory specifies on behalf of which
SQL account the SQL is executed. A role cannot be the owner of
procedures, views or other executable SQL entities.

<div id="vumsecobjects" class="section">

<div class="titlepage">

<div>

<div>

#### Security Objects Management

</div>

</div>

</div>

The following functions allow for creation and deletion of security
objects and roles, and for assigning or removing roles from security
objects:

|                                                                      |
|----------------------------------------------------------------------|
| <a href="fn_user_create.html" class="link" title="USER_CREATE"><code 
 class="function">USER_CREATE()</code></a>                             |
| <a href="fn_user_role_create.html" class="link"                      
 title="USER_ROLE_CREATE"><code                                        
 class="function">USER_ROLE_CREATE()</code></a>                        |
| <a href="fn_user_drop.html" class="link" title="USER_DROP"><code     
 class="function">USER_DROP()</code></a>                               |
| <a href="fn_user_role_drop.html" class="link"                        
 title="USER_ROLE_DROP"><code                                          
 class="function">USER_ROLE_DROP()</code></a>                          |
| <a href="fn_user_change_password.html" class="link"                  
 title="USER_CHANGE_PASSWORD"><code                                    
 class="function">USER_CHANGE_PASSWORD()</code></a>                    |
| <a href="fn_user_set_qualifier.html" class="link"                    
 title="USER_SET_QUALIFIER"><code                                      
 class="function">USER_SET_QUALIFIER()</code></a>                      |
| <a href="fn_user_grant_role.html" class="link"                       
 title="USER_GRANT_ROLE"><code                                         
 class="function">USER_GRANT_ROLE()</code></a>                         |
| <a href="fn_user_revoke_role.html" class="link"                      
 title="USER_REVOKE_ROLE"><code                                        
 class="function">USER_REVOKE_ROLE()</code></a>                        |
| <a href="fn_user_set_option.html" class="link"                       
 title="USER_SET_OPTION"><code                                         
 class="function">USER_SET_OPTIONS()</code></a>                        |
| <a href="fn_user_get_option.html" class="link"                       
 title="USER_GET_OPTION"><code                                         
 class="function">USER_GET_OPTIONS()</code></a>                        |

The security objects and roles data are contained in the system tables
described in the <a href="usersystables.html" class="link"
title="23.6.2. System Tables">User System Tables</a> Section of the
Appendix

</div>

<div id="vumuseroptions" class="section">

<div class="titlepage">

<div>

<div>

#### User Options

</div>

</div>

</div>

<div class="itemizedlist">

- **PASSWORD_MODE. ** Function for checking a given password on SQL or
  DAV login. See below.

- **PASSWORD_MODE_DATA. ** Application specific data for the Password
  Mode hook.

- **LOGIN_QUALIFIER. ** Default qualifier for SQL session.

- **SQL_ENABLE. ** If set SQL login is granted.

- **DAV_ENABLE. ** If set the user account can be user for web
  authentication.

- **DISABLED. ** If set the user account is locked and cannot be used to
  login as SQL or Web user (depends of SQL_ENABLE and DAV_ENABLE flags).
  If the account in question is SQL enabled the DBA group can switch the
  execution identity to it (see set_user_id () function). This is useful
  when we need an account to execute Web pages (VSP/VSPX) with some
  execution permissions but we do not want to allow it to login via
  SQL/ODBC.

- **PRIMARY_GROUP. ** This is the primary group of the user. This is no
  different from other group memberships.

- **GET_PASSWORD. ** Function that will retrieve the password. If not
  defined the password is assumed to be in the SYS_USERS table. This
  allows for custom encrypted storage of passwords etc. This is simpler
  to use than the check hook. Note that for security configurations
  where the server never does know the passwords of user accounts, no
  digest based authentication schemes can be used, including the HTTP
  digest authentication, since the digests cannot be computed and
  checked without knowing the password. Possible users of this feature
  are DBEV_LOGIN or HTTP login hooks.

- **E-MAIL. ** informative: e-mail of that user.

- **FULL_NAME. ** informative: full name of the user.

- **HOME. ** WebDAV home directory of the account, it is meaningful only
  if the account is web enabled.

- **PERMISSIONS. ** WebDAV default permissions for new WebDAV objects
  created by the user. This is only meaningful when web access is
  enabled.

</div>

The functions for setting/getting these options will accept any other
named values, the above list only being those reserved for Virtuoso so
far.

</div>

<div id="vumloginexthook" class="section">

<div class="titlepage">

<div>

<div>

#### Login Extension PL Hook

</div>

</div>

</div>

`DB.DBA.USER_FIND (in name varchar, ) `

This is a user-defined PL function hook which, if it exists, will be
executed before doing the SQL/ODBC login. In this hook the user can find
a user account from some other server and register it in the local
database. Or, this can be used to perform some pre-login actions. It is
similar to the DBEV_LOGIN, but it does not change any account validation
rule, it is purely for pre-processing.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                   |
|:--------------------------:|:----------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                         |
|                            | The Database Event Hooks chapter. |

</div>

<div id="vumplhooksxmpls" class="section">

<div class="titlepage">

<div>

<div>

##### PL Hooks Examples

</div>

</div>

</div>

<div id="vumqryldap" class="example">

**Example 6.5. Querying an LDAP Server**

<div class="example-contents">

``` programlisting
create procedure DB.DBA.LDAP_SEARCH (inout user_name varchar, in digest varchar)
{
  whenever sqlstate '28000' goto ldap_validation_failure;
  if (lcase(user_name) <> 'dba'))
    {
      ldap_search('foo.bar.com', 0, 'o=organization', '(cn=a*)',
        sprintf('uid=%s,ou=users,o=organization', user_name), pwd_magic_calc(user_name,digest,1));
      user_name := 'dba';
      return 1; -- force validation as dba
    }
  else
    {
      -- bypassing ldap authentication for dba, let validation occur normally
      return -1;
    }

ldap_validation_failure:
  return -1; -- try to validate normally
}
```

``` programlisting
create procedure DB.DBA.DBEV_LOGIN (inout user_name varchar, in digest varchar, in session_random varchar)
{
  declare get_pwd varchar;
  get_pwd := user_get_option (user_name, 'PASSWORD_MODE');
  if (get_pwd is not null)
    {
      declare rc integer;
      rc := call (get_pwd) (user_name, digest);
      return rc;
    }
  return -1;
};
```

``` programlisting
user_create ('test_ldap', 'secret', vector ('PASSWORD_MODE', 'DB.DBA.LDAP_SEARCH'));
```

</div>

</div>

  

<div id="vumuserfindhook" class="example">

**Example 6.6. USER_FIND PL Hook Example**

<div class="example-contents">

``` programlisting
create table
MY_DBA_USERS (M_NAME varchar primary key, M_PASSWORD varchar);
```

``` programlisting
create procedure
DB.DBA.USER_FIND (in name varchar)
{
  -- do nothing for existing users
  if (exists (select 1 from SYS_USERS where U_NAME = name))
    return;
  -- if there is in custom table
  if (exists (select 1 from MY_DBA_USERS where M_NAME = name))
    {
      declare pwd varchar;
      -- get password
      select M_PASSWORD into pwd from from MY_DBA_USERS where M_NAME = name;
      -- create a new SQL user based on external data
      USER_CREATE (name, pwd, NULL);
    }
};
```

</div>

</div>

  

</div>

</div>

<div id="vumrolesemantics" class="section">

<div class="titlepage">

<div>

<div>

#### SQL Role Semantics

</div>

</div>

</div>

The terms user group and role are used interchangeably. Roles can be
nested. There is a many to many relationship between users and roles.
There is likewise a similar, acyclic many to many relationship between
roles. Each role has a component role list of its granted (parent)
roles, recursively, no cycles allowed.

All role grants are listed in the roles system table whether they be
explicitly granted or only as a result of granting a group with groups
granted to it. The role grant graph has an explicit edge for each role
membership, direct or otherwise. The GI_DIRECT flag is true if the grant
is direct. Only direct role grants can be revoked.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                      |
|                            | The role system table description can be found in the appendix under <a href="usersystables.html" class="link" 
                              title="23.6.2. System Tables">System Tables</a> .                                                               |

</div>

The following SQL statements deal with roles. To create a new role
(group) object the following statement can be used:

``` programlisting
CREATE ROLE <NAME>
```

The \<NAME\> is a name of role to be created. It must be unique in space
of all security objects.

<div id="vumcreaterole" class="example">

**Example 6.7. Creating a security role**

<div class="example-contents">

``` programlisting
SQL> create role admins;
```

</div>

</div>

  

Use the following statement to remove an existing role from the security
schema.

``` programlisting
DROP ROLE <NAME>
```

<div id="vumrmrole" class="example">

**Example 6.8. Removing a security role**

<div class="example-contents">

``` programlisting
SQL> drop role admins;
```

</div>

</div>

  

The GRANT and REVOKE statements are used for controlling role membership
as follows: To assign a new group, or list of groups (\<ROLE\>,...) to
user \<USER\> use:

``` programlisting
GRANT <ROLE> [, <ROLE>] TO <USER> [WITH ADMIN OPTION];
```

If the admin option is specified, the grantee can grant this same
privilege further to other grantees.

Roles can be revoked using:

``` programlisting
REVOKE <ROLE> [, <ROLE>] FROM <USER>;
```

<div id="vumgranting" class="example">

**Example 6.9. Granting & revoking security roles**

<div class="example-contents">

``` programlisting
SQL> grant admins, users to demo;
```

``` programlisting
SQL> revoke admins from demo;
```

</div>

</div>

  

Only the dba group accounts may administer roles.

The dba group is not physically a role. When an empty database is
created, it will have the dba account with full privileges. To grant
these same full privileges to another user, the dba uses the grant all
privileges to \<grantee\>. statement. This will give the grantee full
dba privileges, or in other words, add to the dba group. This may be
reversed with the revoke all privileges from \<grantee\> statement.

The GRANT statement accepts any valid SQL security object in the TO
clause. One cannot log in or perform any operations as a role. Roles are
exclusively shorthand for specific sets of permissions which are changed
together and are needed for multiple users.

</div>

</div>

<div id="vaddistr" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.4. VAD - Virtuoso Application Distribution

</div>

</div>

</div>

VAD provides a package distribution framework for installation,
management, dependency checking and un-installation of Virtuoso
applications. A VAD package contains all required Virtuoso components,
which would constitute an application or hosted solution, within a
single distributable file. A VAD package cannot contain any system parts
independent of Virtuoso thus excluding operating system executables,
shared objects, installers or settings.

Virtuoso and VAD provide the following abilities:

|                                                                                                                                         |
|-----------------------------------------------------------------------------------------------------------------------------------------|
| List all installed VAD packages.                                                                                                        |
| List all completed operations over VAD packages.                                                                                        |
| Dependency checking - Check preconditions for installation of a package.                                                                |
| Install a VAD package.                                                                                                                  |
| Verification of installed package, compare to distribution state with ability to build of list of locally changed parts of the package. |
| Check preconditions for un-installation of a package.                                                                                   |
| Uninstall a VAD package.                                                                                                                |

<div id="vadsummary" class="section">

<div class="titlepage">

<div>

<div>

#### Summary of VAD Operations

</div>

</div>

</div>

The following is what the dba needs to know about VAD packages.

A VAD package is installed from a file with the db..vad_install SQL
function. The first argument is the file path, which must be in a
location that the server process can open, i.e. it is in the DirsAllowed
list in the virtuoso.ini file. The second argument is 0, meaning that we
are installing from a file.

``` programlisting
SQL> vad_install ('conductor_dav.vad', 0);
```

is an example. If the package installation fails, the server exits and
will have to be restarted. No effects of a failed installation will
remain in the database after restart. Contact the supplier of the VAD
package for further instructions.

To know what is installed, do:

``` programlisting
SQL> vad_list_packages ();
```

VAD package installations are not recorded in the transaction log. Thus,
if there is a backup followed by archived transaction logs produced if
CheckpointAuditTrail is on in virtuoso.ini, the VAD install must be
performed before replaying any logs that were made after the VAD
installation. The package installation must be just in the right place
in the replay sequence. In practice it is simplest to make an
incremental backup after installing and packages, see backup_online ()
or the section on backing up.

For any further information, including how to make VAD packages, see the
rest of this chapter.

</div>

<div id="vadpackcomposition" class="section">

<div class="titlepage">

<div>

<div>

#### VAD Package Composition

</div>

</div>

</div>

A VAD package has no developer tie-ins; it is built in a development
environment from source code that can be managed and versioned in the
developers system of preference.

The VAD package is described by an XML structure called the 'VAD
Sticker'. The VAD sticker describes items to deploy, procedures to
execute at install and uninstall time and all conditions to be checked
to ensure correct installation. The VAD Sticker consists of the
following:

<div class="itemizedlist">

- VAD package meta data

  <div class="itemizedlist">

  - Names of package, developer, copyright holder etc.

  - Version number of package, build date, build number, build type
    (e.g. sort of optimization performed).

  - Dependency information: minimal/maximal allowed version numbers of
    Virtuoso server and depending VAD packages. Every required package
    may include hint-text that may help the administrator determine (a)
    why the dependent package is required, and (b) how to obtain the
    required package.

  - Information regarding known conflicts between packages; conflicting
    package names and version number, with optional troubleshooting
    hints.

  - Ability to uninstall, a flag and list of reasons why it may be
    impossible to uninstall the package.

  - Custom configuration data to be placed in the VAD Registry

  </div>

- Locations of SQL files containing main and installation code:

  <div class="itemizedlist">

  - Pre-install code, used to check application-specific installation
    preconditions.

  - Application specific table and view definitions.

  - Application specific stored procedure and trigger definitions.

  - Post-install (initialization) code, such as initial contents of
    tables.

  - Pre-uninstall code, used to check that it is safe to uninstall a
    package.

  - Post-uninstall code, used for removal of cached resources unusable
    or meaningless without the package.

  </div>

- Locations of Resources:

  <div class="itemizedlist">

  - Documentation files.

  - Samples data for demonstration or package sanity check.

  - VSP/VSPX pages, related graphics, Java scripts, stylesheets, other
    web content.

  - XML docs, XSLT sheets, DTDs and Schemas.

  </div>

</div>

</div>

<div id="vadpackversion" class="section">

<div class="titlepage">

<div>

<div>

#### Package Versioning

</div>

</div>

</div>

All required packages should be listed in the VAD sticker. Known
conflict may be listed in either of the conflicting VAD packages
stickers, hence VAD stickers of all installed packages should be
checked.

Later versions of a package may be installed replacing earlier versions
of the same package. This however can be prohibited by listing either
version (or limit) as a known conflict in either VAD package sticker in
the usual way. Furthermore, it is possible to prevent re-installation of
a package by stating that it conflicts with itself. This provides some
security against exploits involving attempts to upgrade, downgrade or
re-install a package, in the hope that the administrator may corrupt the
existing installation by installing new packages and working through
installing their dependencies.

Packages may differ in language and encoding of documentation and
resource files, even though the version number remains the same. If a
package is sensitive to internationalization issues, the developer
should either assign different names to various localizations of the
package, or divide it into kernel package for any language-independent
parts and set of language-specific packages, with some dependency
between them.

</div>

<div id="vadprocessres" class="section">

<div class="titlepage">

<div>

<div>

#### Processing of Resources

</div>

</div>

</div>

During creation of a VAD package, the "location" mentioned above may be
name of a file in file system or URI or DAV path. Upon package-time,
URIs will be resolved and resources under them will be copied into the
package. The resulting sticker will thus contain the location of
resource within the package, the resource itself, and the target
location.

All SQL files have a specific order of loading. Tables, views etc. must
be defined before being referenced.

</div>

<div id="vadunsupportfeat" class="section">

<div class="titlepage">

<div>

<div>

#### Unsupported Features of VAD

</div>

</div>

</div>

The VAD specification explicitly does not define the following:

**Method of development or environment. ** There are no specific
restrictions for the schema or Virtuoso/PL code of the package. The VAD
system does not make assumptions on the method of software development.

**Method of source code control or versioning. ** Version numbers used
in the sticker have nothing common with tag labels in a developers
versioning system. Procedures edited directly within the database using
a web interface or CASE tools should be exported to a file for inclusion
in a VAD package. If the application developer uses some script to
export such code, this script is not usually part of sticker or the
resulting package.

**Shipping/Deployment the VAD package from vendor to user. ** VAD
provides no methods for downloading dependent packages, or check for
package updates etc.

**Concurrent running of multiple versions of the same VAD package on a
single server. ** There can be no guarantee that pre- or
post-installation checks will provide valid results if more than one VAD
is being processed at the same time. VAD does however guarantee that a
package installation will be either entirely successful or entirely
rolled back.

**Installation or maintenance of non-Virtuoso hosted components. **
Unlike Virtuoso-based packages, these components are usually operating
system specific, they may require some complex tuning, and their usage
from within Virtuoso applications may even require changes in
virtuoso.ini configuration file. VAD packages may contain test calls in
pre-installation SQL procedures to check that required external
executables are available and provide the functionality required.

**Data migration. ** Some installations may require several days to
complete migration/conversion of stored data. Whilst it may be possible
to provide a restricted service during such time, VAD contains no tools
to simplify such a process, this is left to the administrator or
developer. VAD completes its work right after the execution of the
post-installation code.

**Synchronous installation of a package on all hosts of a distributed
system or cluster. ** VAD has no standardized metadata regarding
replication issues, hence package-specific code may be required.
Similarly, if a cluster uses "round-robin" or a "director" loading
management system and the server should be stopped for VAD installation,
the administrator should explicitly inform the cluster manager about
this event.

</div>

<div id="vadsecurity" class="section">

<div class="titlepage">

<div>

<div>

#### Security

</div>

</div>

</div>

Since VAD packages are run by an administrator as the database DBA user,
care must be taken to ensure the package comes from a safe source. Any
new package installed may violate the security regulations of the target
database and may even inflict damage to files under the web-root of the
Virtuoso Server or in directories specified in the "DirsAllowed"
parameter of the virtuoso.ini. If the virtuoso.ini parameter
"AllowOsCalls" is enabled then the installation procedures of the
package may call operating executables. It is the responsibility of the
database administrator to control this via the "AllowOsCalls",
"SafeExecutables" and "DbaExecutables" parameters of the virtuoso.ini.

VAD packages do not offer any automatic protection against unauthorized
modifications. Although ever VAD package contains a checksum, its
purpose is to guard against data transfer errors, it may not be
sufficient to detect unwanted modification.

</div>

<div id="vadbuildingvadpacks" class="section">

<div class="titlepage">

<div>

<div>

#### Building VAD Packages

</div>

</div>

</div>

Initially, the VAD sticker and resources may reside in the file system,
DAV directory and or other locations available through the
`DB.DBA.HTTP_URI_GET()` function.

The VAD creation operation parses the VAD sticker's XML description and
constructs the VAD file by calling
<a href="fn_vad_pack.html" class="link" title="VAD_PACK"><code
class="function">DB.DBA.VAD_PACK</code></a> .

This function reads the VAD sticker identified by the *`sticker_uri`*
which contains the `vad:package` root element. Then the resources
identified in the sticker are retrieved. All resource URIs are
interpreted in the context of the *`base_uri_of_resources`* and are
parsed and checked to be syntactically correct. Resources are appended
to generated package that will be stored at the *`package_uri`* .
<a href="fn_vad_pack.html" class="link" title="VAD_PACK"><code
class="function">DB.DBA.VAD_PACK</code></a> returns a human readable log
of error and warning messages, it will signal errors if any resource or
database objects are unavailable at build time.

By convention, VAD package files have the extension '.vad'.

</div>

<div id="vadutils" class="section">

<div class="titlepage">

<div>

<div>

#### VAD Utilities

</div>

</div>

</div>

An optional VAD package named VADutils provides various tools for
capturing changes made in the database after some point in time. The
result of a capture consists of:

<div class="itemizedlist">

- Database object additions whose names match given patterns (e.g. all
  tables and procedures within a particular catalog/qualifier).

- Resource additions under particular locations.

- Post-install local customizations of selected packages.

</div>

The capture results may be useful for the following purposes:

<div class="itemizedlist">

- Archival of changes for replaying later.

- Creating a special package of the changes for applying against a fresh
  installation of the package.

- Creating a new complete package containing both the original and
  changes that will be included in the package sticker.

</div>

These mechanisms provide good support for centralized development and
custom deployment methodology. If a site is localized to contain local
links, graphics, custom layout and such, then VAD capabilities offer
help to the developer to define the specific overlay of customizations
over another VAD package. When the underlying VAD package is updated the
local customizations will be overwritten. Being saved in a VAD package,
customizations can be reapplied over the updated base package.

</div>

<div id="vadadminrspnslts" class="section">

<div class="titlepage">

<div>

<div>

#### VAD Administrator Responsibilities

</div>

</div>

</div>

VAD package installation, upgrade and uninstallation requires a
temporary break of service. The package checks may be performed on the
fly if it can be guaranteed that the resources being inspected will not
be altered by any users. The package check is a read-only process and
operates solely within the VAD Registry using read-only functions.

All VAD operations are logged in the server event log. All completed
operations are reflected in the `DB.DBA.VAD_HISTORY` system table.

The optional VADutils package provides some additional administrative
tools, mostly for troubleshooting. These include special installation
and de-installation functions that can ignore error signals, and provide
an interactive editor for the VAD Registry etc.

All operations described below require DBA access to the database.

Check if a VAD package may be installed by calling
<a href="fn_vad_check_installability.html" class="link"
title="VAD_CHECK_INSTALLABILITY"><code
class="function">DB.DBA.VAD_CHECK_INSTALLABILITY</code></a> .

Checks the presence and correct versions of required packages and of the
Virtuoso platform. It does not executes any pre-install Virtuoso/PL code
from the package, so there's no guarantee that installation will be
successful if the check found no error. If *`package_uri`* is DAV path,
*`is_dav=1`* , else *`is_dav=0`* .

Perform VAD Package Installation by calling
<a href="fn_vad_install.html" class="link" title="VAD_INSTALL"><code
class="function">DB.DBA.VAD_INSTALL</code></a> .

If *`package_uri`* is DAV path, *`is_dav=1`* , else *`is_dav=0`* .

The administrator performs the following operations when installing:

<div class="itemizedlist">

- Invoke the install procedure from the web user interface or
  interactive SQL. This will perform the following:

  <div class="itemizedlist">

  - Install documentation files.

  - Check for version and prerequisite package compatibility.

  - Disconnect SQL users and terminate web processing.

  - Make a database checkpoint.

  - Run the pre-install SQL script.

  - Load SQL code in the VAD package, in the order specified by the
    developer.

  - Copy web resources (VSP, VSPX, XSLT, etc.) into their designated
    places in WebDAV or file system Web root.

  - Run any post-install SQL code.

  </div>

- If the installation was successful, the server will come back on-line.

- If the installation was unsuccessful, e.g., mid-install failure due to
  running out of disk space, or some other serious unrecoverable
  database error, the Virtuoso server will exit. The administrator
  should consult the Virtuoso log file to see what caused the failure.
  The installation can be completely undone manually by halting the
  server (if not already stopped), and removing the transaction log file
  (.trx). Upon Virtuoso restart, the server will continue from the last
  checkpoint, made prior to install, as if the installation never took
  place.

</div>

The return value of the
<a href="fn_vad_install.html" class="link" title="VAD_INSTALL"><code
class="function">DB.DBA.VAD_INSTALL()</code></a> function is usually a
sum of messages from pre- and post-installation procedures of the
package. It should normally contain at least the following:

<div class="itemizedlist">

- any errors and/or warnings encountered.

- created users and catalogs/qualifiers

- root VSP page for accessing the application, if applicable.

- path to installed documentation files.

- performance optimization hints.

</div>

The VAD packages should be tested to install on an empty Virtuoso
database, after any required VAD packages. Installing a package on an
empty server is useful for determining that no other procedures or
components were missed. Since the application would normally run on the
development machine where the VAD package was built, it can be easy to
overlook some components. The completeness of the source archive of the
application and its independence from any ad hoc SQL objects is
important, this is the only way the package can be reliably versioned,
tracked or uninstalled.

Check if a VAD package may be uninstalled by calling
<a href="fn_vad_check_uninstallability.html" class="link"
title="VAD_CHECK_UNINSTALLABILITY"><code
class="function">DB.DBA.VAD_CHECK_UNINSTALLABILITY</code></a>

Performs a preliminary read-only checks to see whether the package given
can be uninstalled. This does not execute any pre-uninstall Virtuoso/PL
code from within the package at this stage. Hence, the success of this
function does not guarantee that uninstallation will be successful.

Perform VAD Package Uninstallation by calling
<a href="fn_vad_uninstall.html" class="link" title="VAD_UNINSTALL"><code
class="function">DB.DBA.VAD_UNINSTALL</code></a> .

The administrator will perform the following operations for the
uninstallation process:

<div class="itemizedlist">

- Invoke the uninstall procedure from the web user interface or
  interactive SQL. This will initiate the following:

  <div class="itemizedlist">

  - Check that no other packages are using the package to be
    uninstalled.

  - disconnect SQL users and terminate web processing.

  - Make a database checkpoint.

  - Run the pre-uninstall SQL script.

  - Remove web resources installed by the package (all VSP , VSPX, XSLT,
    etc files) in WebDAV or the filesystem under the web root.

  - Drop all SQL procedures and data. This is performed in reverse order
    to the install.

  - Run any post-uninstall SQL code.

  - Remove documentation files explicitly marked as removable. Usually
    documentation would not be deleted as part of package uninstallation
    in case it is needed e.g. if a set of documents is distributed as
    VAD package)

  </div>

- If uninstallation was successful the server will come back on-line.

- If uninstallation was unsuccessful, the server will exit.
  Uninstallation could fail due to lack of disk space or some other
  serious unrecoverable database error. The failed uninstallation
  attempt can be manually reversed by halting the server (if not
  already) and deleting the transaction log file (.trx). Upon server
  restart Virtuoso will continue from the last checkpoint, made prior to
  uninstallation, as if the uninstallation was never attempted. The
  administrator should consult the log file for clues to the failure.

</div>

Check the state of VAD package installation by calling
<a href="fn_vad_check.html" class="link" title="VAD_CHECK"><code
class="function">DB.DBA.VAD_CHECK</code></a> .

This checks to see if the elements of the package are as they are
defined in the original distribution. A list of differing elements is
returned. Differences revealed may not indicate a corruption, such
changes could have been made intentionally by another package, possibly
a later version or upgrade that added some columns to tables, and some
resources may be customized by the user post-installation.

This will check for the prior existence of tables, views etc owned by
other applications that are not compatible with this application. Any
such schema objects found are listed, the installation will not
continue. These may be dropped by the DBA to help the installation to
succeed. Some such elements may not be part of some other package, hence
no package uninstall would be available leading the DBA to drop them
with the appropriate SQL commands.

To enable automatic vads updates on server startup, set the
VADInstallDir parameter in the
<a href="ch-server.html#ini_parameters" class="link"
title="[Parameters]">[Parameters] ini section</a> with path the folder
containg the vads files.

</div>

<div id="vadpackageoverlap" class="section">

<div class="titlepage">

<div>

<div>

#### Package Overlap

</div>

</div>

</div>

Each package contains full definitions of all tables and indices. Upon
installing the following outcomes can occur:

<div class="itemizedlist">

- If a table already exists with the same primary key as the new
  definition, additional columns are added to the table. If the primary
  keys differ, the installation automatically fails. Note that a
  pre-install SQL script can be defined to explicitly alter tables if
  consecutive versions of an application use different primary keys.

- Existing indexes are left untouched. New indices are added as
  specified in the package. If indices should be modified or dropped,
  the pre-install script is a reasonable place for dropping these.

</div>

Thus the same SQL schema can be loaded twice without ill effect.

The post install script should be used to populate tables and such.
Inserts should be executed using the insert soft statement so that
attempts to insert duplicate are silently ignored without causing the
installation to fail. The post install script can perform any
application level data format changes.

Packages should define their own distinct catalog or qualifier. They
should not overwrite another package unless upgrading a prior version.
Sometimes a package will require the use of another package's tables.
This should be achieved via grants issued in a pre-install script. A
schema element such as a table, view or procedure will always have at
most one owner package even though it may be referenced or even modified
with additional columns by another package installed later. These
elements will only be dropped when the owner package is dropped. Tables
created ad-hoc from interactive SQL do not have any owner package.

</div>

<div id="vadsticker" class="section">

<div class="titlepage">

<div>

<div>

#### VAD Sticker

</div>

</div>

</div>

The VAD Sticker contains meta-data and descriptions of resources
contained, or to be contained, within a VAD package. Like any XML
documents, the target VAD package sticker can be sourced from more than
one source file, which can aid maintenance and development.

<div id="vadstickerdtd" class="section">

<div class="titlepage">

<div>

<div>

##### VAD Sticker DTD

</div>

</div>

</div>

The namespace vad, used below, represents the URI
`http://example.com/urn/vad` .

The top level element of a VAD Sticker is \<sticker\>. It must contain a
\<caption\> element and may contain \<dependencies\>, \<procedures\>,
\<ddls\> and \<resources\> elements.

``` programlisting

<!--<<top>>-->

<!ENTITY % vad.source_sticker "INCLUDE">
<!ENTITY % vad.package_sticker "IGNORE">
<!ENTITY % vad.ecm.group_content "(dependencies | procedures | ddls | resources | registry)" >
<![%vad.source_sticker;[
  <!ENTITY % vad.ecm.sticker "(caption, (group | %vad.ecm.group_content;)*)">
  <!ELEMENT group ((group | %vad.ecm.group_content;)*) >
  ]]>
<![%vad.package_sticker;[
  <!ENTITY % vad.ecm.sticker "(caption, %vad.ecm.group_content;)">
  ]]>
<!ELEMENT sticker %vad.ecm.sticker; >
<!ATTLIST sticker
  version     NMTOKEN #REQUIRED
  xml:lang    CDATA   #REQUIRED
  >
    <!--<</top>>-->

    <!--<<caption>>-->

<!ELEMENT caption (name, version)>
<!ELEMENT name ((prop)*)>
<!ATTLIST name
  package NMTOKEN #REQUIRED
  >
<!ELEMENT version ((prop)*)>
<!ATTLIST version
  package NMTOKEN #REQUIRED
  >
<!ELEMENT prop EMPTY>
<!ATTLIST prop
  name NMTOKEN #REQUIRED
  value CDATA #REQUIRED
  >
    <!--<</caption>>-->
```

The caption contains one name and one version element. These elements
have a package attribute for keeping requisites used by VAD procedures.
Other prop-s are for keeping admin-readable info, but they will not
affect the installer's behavior. Typical names of properties here are
Vendor, Copyright, Release+Date, Build, Language, Encoding, but any
(even non-unique) names are acceptable.

Sticker's elements for dependencies

``` programlisting

<!--<<dependencies>>-->

<!ELEMENT dependencies ((require | allow | conflict)*) >
<!ATTLIST dependencies>
<!ENTITY % vad.ecm.version_list "((version | versions_earlier | versions_later)*)">
<!ELEMENT require (name, %vad.ecm.version_list;) >
<!ELEMENT allow (name, %vad.ecm.version_list;) >
<!ELEMENT conflict (name, %vad.ecm.version_list;) >
<!ATTLIST require
  group NMTOKEN #IMPLIED
  >
<!ELEMENT versions_earlier ((prop)*)>
<!ATTLIST versions_earlier
  package NMTOKEN #REQUIRED
  >
<!ELEMENT versions_later ((prop)*)>
<!ATTLIST versions_later
  package NMTOKEN #REQUIRED
  >
    <!--<</dependencies>>-->
```

Element dependencies contains an list of packages related to given one.
For every version or range of versions of every package, developer may
specify whether the given version is required for the package, or
allowed but not required, or will cause some sort of troubles.

More precisely, to find information about some particular version of a
package, the list of children of dependencies element will be scanned
from top to bottom. If the first matching record is in conflict group,
not in require or allow, then installation is impossible. From other
side, there must be at least one installed package for every require
section.

Element require may be labeled with optional group attribute. As an
exception from common rule, there must be at least one installed package
for every group of require sections with identical name. E.g. If an
installation of package B requires either of two interchangeable
packages A1 and A2, sticker should contain a pair of nodes in the same
group:

``` programlisting
<require group="G">
  <name package="A1">...</name>
</require>
```

...

``` programlisting
<require group="G">
  <name package="A2">...</name>
</require>
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                   |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                             |
|                              | There are no methods to specify that exactly one package, either A1 or A2, should be installed. It must be done by placing proper conflict descriptions in stickers of A1 and/or A2, but not in the sticker of B. |

</div>

Sticker's elements for procedures

``` programlisting

<!--<<procedures>>-->

<!ELEMENT procedures ((sql)*)>
<!ATTLIST procedures
  uninstallation (supported | prohibited) #REQUIRED
  >
<![%vad.source_sticker;[
  <!ENTITY % vad.sql.include "include CDATA #IMPLIED">
  ]]>
<![%vad.package_sticker;[
  <!ENTITY % vad.sql.include "">
  ]]>
<!ELEMENT sql (#PCDATA)>
<!ATTLIST sql
  purpose (install-check | pre-install | post-install | uninstall-check | pre-uninstall | post-uninstall) #REQUIRED
  %vad.sql.include;
  >
    <!--<</procedures>>-->
```

Element procedures contains an list of Virtuoso/PL fragments, and every
fragment is tagged by one of four values of the purpose attribute. At
every stage of install or uninstall VAD procedure, a whole list of
procedures will be scanned from the beginning to the end, and all
procedures of appropriate sort will be executed in the same order as
they are listed. In source sticker files, include attribute may be used
to insert text of some external file instead of having SQL code written
inside the element.

Sticker's elements for ddls

``` programlisting

<!--<<ddls>>-->

<!ELEMENT ddls ((sql)*)>
<!ATTLIST ddls
  >
    <!--<</ddls>>-->
```

Element ddls is very similar to procedures and contains an list of
Virtuoso/PL fragments to create schemas etc.

Sticker's elements for resources

``` programlisting

<!--<<resources>>-->

<!ELEMENT resources ((file | location)*)>
<!ATTLIST resources >
<![%vad.source_sticker;[
  <!ENTITY % vad.file.source_uri "source_uri CDATA #IMPLIED">
  ]]>
<![%vad.package_sticker;[
  <!ENTITY % vad.file.source_uri "">
  ]]>
<!ELEMENT file EMPTY>
<!ATTLIST file
  type (doc | http | dav | code | special) #REQUIRED
  source (http) "http"
  target_uri CDATA #REQUIRED
  makepath (yes | no | abort) "abort"
  overwrite (yes | no | abort | equal | expected) "equal"
  package_id CDATA #IMPLIED
  location IDREF #IMPLIED
  dav_owner CDATA #IMPLIED
  dav_grp CDATA #IMPLIED
  dav_perm CDATA #IMPLIED
  %vad.file.source_uri;
  >
<!ELEMENT location ((prop)*) >
<!ATTLIST location
  id ID #REQUIRED
  default_target_uri CDATA #REQUIRED
  >
    <!--<</resources>>-->
```

Element resources lists all files to be copied onto target box. For
every file, source and target URIs should be specified, and suggested
behavior for cases when a directory should be created or file should be
overwritten. Target URI may be relative to one of roots: for
documentation, web-resources, DAV, SQL code (it's where virtuoso.ini is
located) and one of special locations, additionally specified by
location elements. (Installer may query administrator to allow changing
of locations' roots; in such case, information from location's
properties will be shown to the administrator.) By default, the value of
*`package_id`* is a space delimited list of type, location ID (if any)
and target URI.

|                                                                                    |
|------------------------------------------------------------------------------------|
| dav_owner - DAV owner for file (used if type="dav", ignored if "filesystem");      |
| dav_grp - DAV group for file (used if type="dav", ignored if "filesystem");        |
| dav_perm - DAV permissions for file (used if type="dav", ignored if "filesystem"). |

<div id="ex_vadstickfile" class="example">

**Example 6.10. VAD installable file descriptions**

<div class="example-contents">

To install files into DAV:

``` programlisting
<file type="dav" source="http" target_uri="yacutia/yacutia_style.css" dav_owner='dav' dav_grp='administrators' dav_perm='111101101N' makepath="yes"/>
<file type="dav" source="http" target_uri="yacutia/yacutia_vdir_style.css"  dav_owner='dav' dav_grp='administrators' dav_perm='111101101N' makepath="yes"/>
```

To install files into file system:

``` programlisting
<file type="http" source="http" target_uri="yacutia/yacutia_style.css" makepath="yes"/>
<file type="http" source="http" target_uri="yacutia/yacutia_vdir_style.css" makepath="yes"/>
```

</div>

</div>

  

Sticker's elements for registry

``` programlisting

<!--<<registry>>-->

      <!ELEMENT registry ((record)*)>
      <!ATTLIST registry >
      <!ELEMENT record ANY>
      <!ATTLIST record
        key CDATA #REQUIRED
        type (STRING | INTEGER | KEY | URL | XML) #REQUIRED
        overwrite (yes | no | abort | equal | expected) "equal"
        >
    <!--<</registry>>-->
```

Element registry lists all branches to be defined in the VAD Registry.
Every record element contain data of one record. The first children of
record element (either a text or an element) will be serialized and
stored as a value of *`DB.DBA.VAD_REGISTRY.R_VALUE`* cell. To prevent
errors, it is recommended to keep comments to the data outside the
record element: being in the wrong place inside, they may be stored in
the registry instead of actually needed data.

<div id="ex_vadstickers" class="example">

**Example 6.11. Sample Stickers**

<div class="example-contents">

A package that contains only some commonly useful ("exported")
functions, one table for internal purposes, a small sample VSP
application, and small set of documentation files.

``` programlisting
<?xml version="1.0" encoding="ASCII" ?>
<!DOCTYPE sticker SYSTEM "vad_sticker.dtd">
<sticker version="1.0.010505A" xml:lang="en-UK">
 <!-- Name and version; common data about the package -->

 <caption>
  <name package="rdf_lib">
   <prop name="Title" value="RDF Support Library" />
   <prop name="Developer" value="OpenLink Software" />
   <prop name="Copyright" value="(C) 2024 OpenLink Software" />
   <prop name="Download" value="http://example.com/virtuoso/rdf_lib/download" />
  </name>
  <version package="3.14">
   <prop name="Release+Date" value="2003-05-05" />
   <prop name="Build" value="Release, optimized" />
  </version>
 </caption>
 <!-- This package requires no other packages,
but it conflicts with package virtodp of versions
from 1.00 to 2.17, inclusive -->

 <dependencies>
  <allow>
   <name package="virtodp"></name>
   <versions_earlier package="1.00"></versions_earlier>
  </allow>
  <conflict>
   <name package="virtodp">
    <prop name="Title" value="Virtuoso ODP Sample" />
   </name>
   <versions_earlier package="2.17">
    <prop name="Date" value="2001-01-26" />
    <prop name="Comment"
      value="An incompatible version of RDF library is included in some old versions of virtodp " />
   </versions_earlier>
  </conflict>
 </dependencies>
 <!-- There are no installation procedures, other than DDLs -->

 <procedures uninstallation="supported"></procedures>
 <!-- There are some procedures, which may be re-applying and (maybe) reverted automatically -->

 <ddls>
  <sql purpose="pre-install">
   "DB"."DBA"."VAD_CREATE_TABLE" ('DB', 'DBA', 'RDF_SCHEDULED_IMPORTS',
      'ID integer,
       URI varchar,
       CALLBACK varchar,
       VERSION varchar,
       REPORT long varchar,
       primary key (ID)');
  </sql>
  <sql purpose="post-install">
   "DB"."DBA"."VAD_LOAD_RESOURCE" ('rdf_functions');
  </sql>
 </ddls>
 <!-- Resources include... -->

 <resources>
  <!-- ...documentation, ... -->

  <file type="doc" target_uri="rdf_lib/1.1/intro.dxt" />
  <file type="doc" target_uri="rdf_lib/1.1/interface.dxt" />
  <file type="doc" target_uri="rdf_lib/1.1/implementation.dxt" />
  <file type="doc" target_uri="rdf_lib/1.1/sample_app.dxt" />
  <!-- ...the file of commonly-useful functions, ... -->

  <file package_id="rdf_functions"
    type="code" target_uri="rdf_lib/1.1/rdf_lib.sql" />
  <!-- ...pages of the sample application, named rdf_edit, ... -->

  <file type="http" target_uri="rdf_lib/rdf_edit/default.htm" />
  <file type="http" target_uri="rdf_lib/rdf_edit/browse.vsp" />
  <file type="http" target_uri="rdf_lib/rdf_edit/edit.vsp" />
  <!-- ...a DAV resource with sample RDF data, ... -->

  <file type="dav" target_uri="rdf_lib/sample_odp_structure.rdf" />
  <!-- ...two files of sample application's functions. -->

  <file type="code" target_uri="rdf_lib/1.1/rdf_edit/content_level.sql" />
  <file type="code" target_uri="rdf_lib/1.1/rdf_edit/view_level.sql" />
 </resources>
 <!-- There are no application-specific registry items in this package -->

</sticker>
```

</div>

</div>

  

</div>

</div>

</div>

<div id="backup_recovery" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.5. Data Backup & Recovery

</div>

</div>

</div>

Administering a database involves taking backups and having a readiness
to recover from backups and subsequent transaction logs.

Backups can be taken in two principal ways:

|                                                |
|------------------------------------------------|
| Using the Virtuoso backup function/procedures. |
| Copying the database files.                    |

The Virtuoso backup functions can be used from any client directly, such
as ISQL. It is possible, and perhaps preferable, to create stored
procedures for performing the backup functions and scheduling these with
the Virtuoso scheduler.

The actual database file(s) can be copied while the database is running
so long as no checkpoint is made during the copy process. Checkpointing
can be disabled for this, but make sure it is re-enabled after the
backup has been made.

Making a full backup of a large database can take several hours if not
days just due to the speed of tapes or local area networks. Full backups
must in all cases be done without an intervening checkpoint. This is why
frequent full backups are not desirable. To ensure the possibility of
full recovery one must have the complete set of transaction logs (audit
trail log) since the last backup.

Restarting the database after restoring backed up files will show the
state in effect since the last checkpoint preceding the backup. Any
transaction log files made after the point of backup can be replayed to
bring the state up to the last recorded transaction.

<div id="backup_audit" class="section">

<div class="titlepage">

<div>

<div>

#### Log Audit Trail

</div>

</div>

</div>

Virtuoso can maintain a transaction audit trail. This is enabled using
the CheckpointAuditTrail setting in the virtuoso.ini file. When this
setting is non-zero, Virtuoso will begin a new transaction log after
each checkpoint. Thus one automatically gets a full, unbroken sequence
of transaction logs for the entire age of the database. These logs are
named as specified in virtuoso.ini and are suffixed with their creation
time.

Transaction logs older than the log that was current at the time of the
last backup are superfluous for recovery, since their transactions were
checkpointed before the backup started. Transactions of the log current
at the time of the backup are NOT in the backed up state since they were
not checkpointed, i.e. written into the read-only section of the
database containing the data being backed up.

We strongly advise having the CheckpointAuditTrail enabled in any
production environment.

It is good practice to have at least two generations of full backup,
since the last backup may contain errors that were not known at the time
of its making. If such precaution is taken then only transactions logs
older than the oldest backup are safe to remove. If we needed to recover
from the oldest backup for any reason we would require all audit
transaction logs created during and after that backup.

A Virtuoso database can be restored from the last full backup and all
Audit Trail transaction files created during and after the backup. You
would need to start the database as normal with the backup version of
the database file. Once the database has been started, connect using
iSQL. You can then use the
<a href="fn_replay.html" class="link" title="replay">replay()</a>
function to replay the transaction files up to the required point. It is
vital that these files are replayed in the correct order.

</div>

<div id="onlinebackups" class="section">

<div class="titlepage">

<div>

<div>

#### On-Line Backups

</div>

</div>

</div>

<div id="usingbackuponline" class="section">

<div class="titlepage">

<div>

<div>

##### Backup Using Backup_Online()

</div>

</div>

</div>

Virtuoso is capable of performing online backups so that normal database
operation does not have to be disrupted in order to take backups. The
<a href="fn_backup_online.html" class="link" title="backup_online"><code
class="function">backup_online()</code></a> can be used to backup the
database in the state effective at the last checkpoint to a series of
backup files.

The database storage is divided into a checkpoint space that is a read
only image from the time of the last checkpoint and thus can be safely
backed up anytime between checkpoints and the commit space where updates
subsequent to the last checkpoint data are stored. Additionally, the
database records what pages have changed since the last checkpoint every
time new checkpoint is made. This change tracking makes it possible to
make incremental backups. The first time the backup_online function is
called, it saves a compressed copy of the then current checkpoint state
into one or more files. The next time it is called, it will write the
changes that have come into the checkpoint space since the last time
backup_online was called. It is possible to erase the change tracking
data with the backup_context_clear function. The next call to
backup_online will then make a full backup. Files generated by one or
more calls to backup_online without intervening backup_context_clear
form a series with distinct serial numbers and will be restored
together. In order to restore such files, the administrator must delete
the previous database files and start the server with a special flag and
indicate the location of the backup files. This will bring the database
to the state corresponding to the state as of the checkpoint immediately
preceding the last call to backup_online, i.e. the one that wrote the
newest of the backup files being restored. To restore onwards from this
state, the administrator must replay transaction logs, starting with the
log that was current when the last call to backup_online was made. In
order to preserve all such logs, one must run with the
CheckpointAuditTrail ini parameter set to 1.

A database checkpoint cannot be performed while an online backup is in
progress.

<div id="ex_anonlinebackup" class="example">

**Example 6.12. Performing an Online Backup**

<div class="example-contents">

``` programlisting
SQL> backup_context_clear ();
SQL> checkpoint;
SQL> backup_online ('virt-inc_dump_#', 150);
```

</div>

</div>

  

The `backup_online()` procedure differs from the the
CheckPointAuditTrail mainly because it can be started from any point in
the database. Unless CheckPointAuditTrail was enabled when the database
was created, the database file at a particular state and all transaction
logs created by the AuditTrail since that state would be required to
restore the database. Only the backup set files would be required to
restore from `backup_online()` . The `backup_online()` also makes a
compressed backup, making it far more suitable for large databases.

The last optional parameter allows to point the directory(ies) where the
backup files must be stored. See `backup_online()` description for
details.

</div>

<div id="rstrfrmbckuponline" class="section">

<div class="titlepage">

<div>

<div>

##### Restoring From an Online Backup Series

</div>

</div>

</div>

To restore from a backup series the administrator must first shutdown
the Virtuoso database server and move all database files (e.g.
virtuoso.db and virtuoso.trx) out of the database directory. It is
recommended that copies by taken rather than deleting them entirely.
Then the command:

``` programlisting
<virtuoso exe> +restore-backup <FILE_PREFIX>
```

``` programlisting
-- for example:
virtuoso-iodbc-t +restore-backup dump-20011010_#
```

must be issued in the directory where the "\*.bp" were stored. The
database will then be restored. The expression \<virtuoso exe\> above
must be replaced with the path and filename to the Virtuoso server
executable used on your system (e.g. ..\virtuoso-odbc-t.exe).

Each file in the series has a header containing a unique identifier, for
the backup set and the sequence number of the file in the backup set .
If an identifier in any file in the backup sequence differs from the
identifier contained in the first file, the restoration process will
stop and report an error, which is written to the Virtuoso log file.

At times the backup or restoration commands may return errors. Use the
following list to help diagnose and resolve them:

<div class="itemizedlist">

- **Timestamp \[%lx\] is wrong in file %s. ** The unique identifier in
  header of the file differs from the identifier of the first file. It
  is possible that the file was renamed or corrupt or belongs to another
  backup set.

- **Number of file %s differs from internal number \[%ld\]. ** The
  sequence number of the file does not correspond to the internal
  sequence number of file. This could be caused by the file being
  renamed or corrupt.

- **Prefix is wrong in file %s. ** The prefix of the file does not
  correspond to internal information. Possible reason: file was renamed
  or corrupt or belongs to another backup set.

- **Could not begin online-backup. ** Read error. Possible reason:
  Virtuoso database file was corrupt.

- **Seek/Read failure on stripe %s/database. ** Read error. Possible
  reason: Virtuoso database file was truncated or hardware error.

- **Read of page %ld failed. ** Read error. Possible reason: Virtuoso
  database file was truncated or hardware error.

- **Backup file writing error. ** Write error. Possible reason: disk is
  malfunctioning or full.

</div>

<div id="ex_anonlinebackuprestore" class="example">

**Example 6.13. Restoring an Online Backup**

<div class="example-contents">

Following the online backup example above:

``` programlisting
SQL> backup_context_clear ();
SQL> checkpoint;
SQL> backup_online ('virt-inc_dump_#', 150);
```

The following command could be used to restore the database from the
backup files created:

``` programlisting
virtuoso-iodbc-t -c <db-ini-file> +restore-backup virt-inc_dump_#
```

or:

``` programlisting
virtuoso-odbc-t.exe -c <db-ini-file> +restore-backup virt-inc_dump_#
```

</div>

</div>

  

</div>

</div>

<div id="otherbackupmethods" class="section">

<div class="titlepage">

<div>

<div>

#### Other Backup Methods

</div>

</div>

</div>

A possible way of making a full backup of a large databases is first to
turn off any automatic checkpoints and make a compressed copy of the
files. After the back up is complete, checkpointing should be
re-enabled. The files should be compressed to make efficient use of
space, and should be copied to a disk separate from the location of the
database, and preferably to an external backup medium such as tape.

<div id="manualbackup" class="section">

<div class="titlepage">

<div>

<div>

##### Manual Backup

</div>

</div>

</div>

For a large database it is best to turn off any automatic checkpoints
and copy the database files to external storage. Checkpoints should be
turned off by issuing the command:

``` programlisting
checkpoint_interval (-1);
```

at the SQL prompt. Checkpoints can be re-enabled in a post-backup script
by:

``` programlisting
checkpoint_interval (<n>);
```

which sets the automatic checkpoint interval to \<n\> minutes. The
backup will be unusable if there are checkpoints made while it is in
progress. Thus it is important to guarantee that checkpoints do not
occur. The only safe way of doing this is the above, since it is in
principle possible to have a server crash during the backup and a roll
forward following restart, all while the backup is in progress. If this
happens the backup will be readable and consistent with the state of the
last checkpoint if and only if there are no checkpoints between its
start and completion. Setting the interval to -1 will guarantee that the
server, when starting after recovery will not make a checkpoint.

The dba must make sure that clients do not issue checkpoint or shutdown
statements while a backup is in progress.

The presence or absence of checkpoints at a given point in time can be
ascertained from the virtuoso.log event log file.

</div>

<div id="offlinebackups" class="section">

<div class="titlepage">

<div>

<div>

##### Off-Line Backups

</div>

</div>

</div>

When Virtuoso is not running a complete and clean backup can be taken by
making a copy of the database file and transaction file(s) created after
the last checkpoint.

To get an up to the minute copy of a running database one can copy the
database file and the associated log, i.e. the file specified in
TransactionFile in the database's configuration file. When started, the
log will roll forward and restore the database to the state following
the last logged transaction.

</div>

</div>

<div id="vdbrecovery" class="section">

<div class="titlepage">

<div>

<div>

#### Database Recovery

</div>

</div>

</div>

<div id="dbrebuild" class="section">

<div class="titlepage">

<div>

<div>

##### Rebuilding A Database

</div>

</div>

</div>

The process of rebuilding a database consists of dumping its contents
into a large log file, or log files, and doing a roll forward from an
empty database with that log.

The general steps to rebuild a database are as follows:

<div class="important" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                        |                                                                                                           |
|:--------------------------------------:|:----------------------------------------------------------------------------------------------------------|
| ![\[Important\]](images/important.png) | Important                                                                                                 |
|                                        | It is recommended that you take a backup copy of the database file(s) prior to performing this procedure. |

</div>

<div class="itemizedlist">

- Shut down the running server, making a checkpoint. This is done with
  the SHUTDOWN command from interactive SQL.

- Make sure there is a log file specified in virtuoso.ini.

- Start the server process virtuoso with the -b command line option:
  e.g. % ./virtuoso -b (+backup-dump)

  This will write the contents of the database into the log file
  specified in virtuoso.ini and exit when complete.

- Take a backup of the old database file.

- Change the DatabaseFile setting in virtuoso.ini to a non-existing
  database file or delete the old database file.

- Start the server with the +restore-crash-dump option. The option is
  essential.

  Important: When restore on v6 you also must give it +log6 flag i.e.:
  +restore-crash-dump +log6 .

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                     |
  |:--------------------------:|:--------------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                           |
  |                            | <a href="" class="ulink" target="_top">How can I move a Virtuoso    
                                database from one hardware and/or software platform to another?</a>  |

  </div>

- The server will build a new database file from the log and once
  completed it will, by default, perform a checkpoint of the
  transactions to the database file and start listening at the specified
  port. Virtuoso can be started without a checkpoint using the -n
  (+no-checkpoint) option.

- You may then connect to the database with interactive SQL and if
  necessary make a checkpoint. The checkpoint will write freeze the
  state following roll forward and delete the log used for the rebuild.

- The database is now ready for normal use.

</div>

It may sometimes be useful to rebuild a database as above to save space.
Virtuoso does not relinquish space in the DB file back to the file
system as records are removed, however, Virtuoso does reuse pages that
are made available from a deletion of records. The steps above will
build a new compact database file. You would ordinarily not have to
worry about this.

</div>

<div id="diagnosingrepairing" class="section">

<div class="titlepage">

<div>

<div>

##### Diagnosing and Recovering a Damaged Database File

</div>

</div>

</div>

It is possible to recover data from a damaged Virtuoso database by a
procedure similar to rebuilding a database as described above. A
database file may be corrupt if the database repeatedly crashes during a
specific operation.

To determine whether a database is corrupt, you may use the backup to a
null file command in isql, for Unix platforms:

``` programlisting
SQL> backup '/dev/null';
```

For windows platforms you can use:

``` programlisting
SQL> backup 'NUL';
```

This command will read through the database checking its integrity. If
the server crashes before completing the backup process, then the
database is indeed corrupt and needs to be recovered. No other activity
should take place while the command is executing.

To recover the database, follow the procedure for rebuilding it, except
use the -D 'capital D' or +crash-dump switch instead of -b. This will
construct a log file which you can replay to make a new database. The
database will contain the transactions that were committed as of the
last successful checkpoint. If the database altogether fails to open it
may be the case that the schema is damaged.

It is possible that the database to be recovered is too large to fit in
a single log file. The crash dump feature therefore allows segmenting
the recovery log into a number of files. See the virtuoso.ini
configuration file documentation for details. It is possible to make a
crash dump in several pieces if there is not enough total disk space to
hold the dump on the system where the database is running.

If the recovery log is split over several files it is necessary to set
the transaction file in the ini to point to the first of these files,
delete the database file(s) and start the server with the
+restore-crash-dump option. When the server comes online, one can
connect to it with isql and use the replay () function for replaying the
remaining logs, one by one, in their original order.

For example,assuming the virtuoso.ini fragment:

``` programlisting
Log1    = rec-1.log 100M
Log2  = rec-2.log 100M
```

we would make the dump with

``` programlisting
virtuoso +crash-dump
```

and once the server has been started with +restore-crash-dump, with the
ini setting TransactionFile set to rec1.log, replay the remaining log
with the isql commands:

``` programlisting

SQL> replay ('rec-2.log');
Done.
SQL> checkpoint;
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                  |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                            |
|                              | If the recovery is interrupted it can be restarted at the last checkpoint made during the recovery. Note that a mid recovery checkpoint may take a very long time, e.g. 1 hour for a 10GB database, since it is possible that the delta since the previous recovery checkpoint comprise almost all the database. |

</div>

</div>

<div id="xcrashrecovery" class="section">

<div class="titlepage">

<div>

<div>

##### Crash Recovery When The Normal Crash Recovery Fails

</div>

</div>

</div>

When the schema tables (e.g. DB.DBA.SYS_COLS, DB.DBA.SYS_KEYS) have
corrupt rows the normal crash dump/crash restore procedure will not be
possible because the server relies on the schema tables to know the key
layouts for reading the data rows of other tables upon crash dump.

In such situations there is a special procedure to be followed to save
as much data as possible from the corrupt database. The general steps
are:

|                                                                        |
|------------------------------------------------------------------------|
| dump the intact schema table rows, and read them into a fresh database |
| read the schema from the fresh database in the normal way              |
| proceed with dumping the rest of the tables from the corrupt database  |

Thus the transaction log produced from the corrupt database, when
replayed on the new database file (the one holding the schema tables
data) makes the closest approximation to the corrupt database's data.
However, this will not produce a workable database by itself - it may
possibly deny inserting of data into tables with IDENTITY columns and
will lose all the data within the Virtuoso registry (accessible from
`registry_get()` /`registry_set()` functions).

Because of the very nature of the crash-restore process described here
and because of the fact that data is lost in the database schema, the
server will not attempt to dump tables whose schema description is lost.
So care should be taken when reading the data from the database.

This restoration procedure in no way replaces the regular database
backup procedures, it merely tries to save whatever reasonable data
there may be left from the database file.

The recovery sequence is as follows:

<div class="orderedlist">

1.  Do a crash dump of the schema tables (using the
    '`+crash-dump +mode oa +dumpkeys schema` ' virtuoso command line
    options).

2.  Create a new INI file to describe the layout of the new database
    you'll use to temporarily fill up the restored data.

3.  Move the transaction log file(s) produced in step 1 to the location
    required by the new INI file.

4.  Replay the transaction log from step 1 on an empty database using
    the new INI file. You will now have the schema tables readable in
    the new database (and nothing else):

    ``` programlisting
    Virtuoso options : -c <your new ini file> +restore-crash-dump -f
    ```

5.  Make a crashdump of the data in the non-schema tables of the old
    database while having read the schema tables from the new database:

    ``` programlisting
    +crash-dump -c <your new ini file> +crash-dump-data-ini <your old ini file> +mode o -f
    ```

6.  Move the transaction log file(s) produced in step 1 to the location
    required by the new INI file.

7.  Replay the transaction log from the previous step into the new db
    file using:

    ``` programlisting
    -c <your new ini file> +restore-crash-dump
    ```

8.  Do a normal crash dump of the new database:

    ``` programlisting
    -c <your new ini file> +crash-dump
    ```

9.  Move away (backup) the original (old) database files and put the
    transaction log produced by the above step into the location
    specified in the original INI file. You can also delete the rest of
    the DB files of the new database at that point.

10. Replay the transaction log to make the old database afresh.

</div>

To automate the above procedure, a sample Unix script follows that
automates it somewhat. This script expects the crashed database
virtuoso.db.save and an appropriate INI file (no striping, no log
segmentation, transaction log file name virtuoso.trx) in the current
directory and creates the restored database. It also expects the
virtuoso-iodbc-t executable to be in the operating system path. Also,
make sure that you have a suitable `virtuoso.lic` license file in the
current directory.

``` programlisting
#!/bin/sh

rm -rf xmemdump.txt virtuoso.trx virtuoso.tdb virtuoso.log virtuoso.db virtuoso.lck core.* new.lck new.log new.trx new.tdb new.db new.ini
cp -f virtuoso.db.save virtuoso.db
cat virtuoso.ini | sed 's/virtuoso\./new./g' > new.ini

virtuoso-iodbc-t -f +crash-dump +mode oa +dumpkeys schema

ls -la *.trx
mv virtuoso.trx new.trx

virtuoso-iodbc-t -c new -f -R
virtuoso-iodbc-t -c new +crash-dump +crash-dump-data-ini virtuoso.ini +mode o -f

ls -la *.trx
mv virtuoso.trx new.trx

virtuoso-iodbc-t -c new -R -f

virtuoso-iodbc-t -c new +crash-dump -f

rm -f virtuoso.trx virtuoso.tdb virtuoso.log virtuoso.db virtuoso.lck
ls -la *.trx
mv new.trx virtuoso.trx

virtuoso-iodbc-t -R -f
```

</div>

<div id="xversionrecovery" class="section">

<div class="titlepage">

<div>

<div>

##### Crash Recovery Across Virtuoso VDBMS Server Versions

</div>

</div>

</div>

If the database was created with a version prior to the one being used
for rebuilding, the system tables may be different. The creation here
refers to the first time the database was made, a crash recovery does
not count as a fresh start here.

If this is or may be the case, the first log must be rolled forward into
the empty database BEFORE the new and possibly incompatible system
tables are created. This is done by setting the TransactionFile
parameter to the first of the recovery logs and starting the server with
the -R or +restore-crash-dump switch. For good practice one should also
specify the no checkpoint switch, so that the log will in no case be
damaged after the initial step of the roll forward. After this initial
step the system tables will be compatible and the dba can proceed to
replay the remaining recovery logs with the replay function.

</div>

<div id="procindexrecov" class="section">

<div class="titlepage">

<div>

<div>

##### Backup and Restore individual table(s) and individual index(s) on a new fresh db

</div>

</div>

</div>

This section describes how to get a part of db tables and restore on a
new db.

Additionally, part of the steps from below can be used to backup
separate table and recover on same db.

Note: Only effective with Virtuoso 6.0 and later.

Basic steps:

<div class="orderedlist">

1.  Create a function for dumping the key:

    ``` programlisting
    create procedure bkp_key (in f any, in tb_name varchar, in key_name varchar)
    {
      backup_prepare (f);
      backup_index (tb_name, key_name);
      backup_flush ();
      backup_close ();
    }
    ;
    ```

2.  On the source db execute:

    ``` programlisting
    bkp_key ('mylog.txn', 'DB.DBA.T1', 'T1');
    ```

    This will dump in a "mylog.txn" file the T1 table's primary key.

3.  On source db stop server and do:

    ``` programlisting
    virtuoso +backup-dump +foreground +mode l   ## ( lower case L )
    ```

    This will dump the schema tables only into the trx file.

4.  On the target db make sure there is no db file and place the trx
    file produced by previous step. Execute:

    ``` programlisting
    virtuoso +restore-crash-dump +foreground ;
    ```

    This will create a new db with same db schema as on the source db.

5.  Start the target and do:

    ``` programlisting
    replay ('mylog.txn') ;
    ```

    This will insert the PK data into the table from the source db dump.

6.  If the table in question has other indexes must drop them and
    re-create them, since they are empty as in previous step we have
    been restoring only the PK.

</div>

<span class="emphasis">*Note*</span> : following the steps from above
can be dumped each index and then replay. Also the steps may be combined
for multiple tables and keys in the backup procedure - just needs to be
added the corresponding calls to the backup_index() function.

</div>

</div>

</div>

<div id="perfdiag" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.6. Performance diagnostics

</div>

</div>

</div>

This section provides a checklist for improving performance of a
Virtuoso server.

If something does not work fast, this is mostly for the following
reasons:

<div class="itemizedlist">

- Not enough memory

- Not the right indices, missing statistics

- Too much locking or too many threads on the same data

- Bad disk layout, for example not striped or not enough file
  descriptors.

</div>

Determining which is the case is simple. The result set returned by
status ('') has most of the information. Do this twice with some 10
seconds between the samples and see the second result set.

<div id="perfdiagmemory" class="section">

<div class="titlepage">

<div>

<div>

#### Memory

</div>

</div>

</div>

If there is not enough memory, there will be frequent disk access. This
is seen from the buffers and disk usage lines.

The very simplest test for this is looking at the CPU % of the process
in top. If there is constant load and the percent is low then the server
is IO bound.

If all memory is not in use, then memory cannot be the problem. This is
seen from the buffers line. If the used number is under 80% of the total
or if the replace age is several times larger than the count of buffers,
then things are OK. If the replace age is 0 then no buffers have ever
been replaced and all that ever was read is still in memory.

If the replace age is less than or close to the buffer count times 4,
then cache replacement is frequent and adding buffers is advised.

Adding more than 60-70% of system ram as buffers is not useful. The
setting is NumberOfBuffers in the ini file, count 9K per buffer.

The disk access is summarized on the disk usage line. First is the
number of reads since start then the average latency in N ms. If %r is
high, then a lot of the time between the previous status and this is
taken by disk. This can be over 100. One thread that is waiting for disk
all the time counts for 100. If the percent is high then adding more
disks and striping over them will be useful. Even with a single database
file, adding file descriptors (FDsPerFile setting in the ini) may be
useful. If the average read latency is 0 or close, then the data is
cached by the OS. If it is high, then adding disks and striping may
reduce it.

The read ahead line will tell if there are sequential reads. These are
faster than random ones and can efficiently use striped disks.

If the workload is random access, then a high number of read ahead means
that one might not have the required indices, thereby causing full table
scans. More on this in the query plans section below.

</div>

<div id="perfdiagswapping" class="section">

<div class="titlepage">

<div>

<div>

#### Swapping

</div>

</div>

</div>

Swapping is always bad. If swapping occurs, then one has too many
buffers and should decrease the number of buffers. Use an OS tool like
top to see the size of the database process and its virtual memory use.
Having a resident size smaller than logical size is not always bad since
some code or data in the process may simply be unused but having, after
running in a steady state, i.e. all buffers used, a resident size less
than the amount of memory allocated for buffers is always bad. Before
steady state, i.e. during cache warm-up, the resident size is normally
less than the buffer pool's size.

To see the count of major page faults. i.e. ones that read the disk, do:

``` programlisting
getrusage ()[]4];
```

through interactive SQL. The result is the count of major faults since
starting the process. The count should not vary between samples, at
least not more than a few units per minute.

This function is not available under Windows. Use the task manager
instead for tracking this.

There can be an actual memory leak, specially with plugins or hosting.
See the growth of the virtual size throughout the run, reaching full
buffer utilization and doing a couple of checkpoints. Past this, the
process should not grow. You may also see if the ThreadCleanupInterval
or ResourcesCleanupInterval ini parameters have an effect. If in spite
of all the process grows there can be a genuine leak. It is normal for
the size to fluctuate somewhat due to varying amounts of uncommitted
data, threads, connections and the like.

</div>

<div id="perfdiaglocking" class="section">

<div class="titlepage">

<div>

<div>

#### Locking

</div>

</div>

</div>

The lock status section indicates the count of deadlocks and waits. If
the 2r1w number is high then it means that the application should read
for update. It gets shared locks and cannot change them to exclusive.
Adding the for update option to selects in the right place will fix
this, also setting DefaultIsolation in the ini to 2 for read committed
will be good. If the lock wait count increases fast, then locking may
downgrade performance. The threads line below shows how many threads
have some task to do. The waiting is the number of these threads that
are waiting for a lock at the time of the status. The vdb number is the
number of threads waiting for network io, either from virtual database
or any web protocol.

Take a few samples and if these show few threads waiting and the waits
or deadlocks counts do not climb much locking will not be a problem. If
these numbers are high, see the sys_l_stat view for details.

``` programlisting
select sum (waits), sum (wait_msecs) from sys_l_stat;
```

for the totals. The first number is the count of times a thread waited
for a lock, the second is the sum of the real times spent waiting.

``` programlisting
select top 10 * from sys_l_stat order by waits desc;
```

shows the keys on which most waits take place. See also the deadlocks
and the wait_msecs columns. Numbers are cumulative.

For details on disk, see:

``` programlisting
select top 10 * from sys_d_stat order by reads desc;
```

These views are explained in more detail in the performance meters
section.

If there is a multi-user application doing random access for read or
write, it is an idea to partition the data so that they do not hit the
same page all the time. For example, to allow for parallel insert of
orders without contention, the TPC C schema prefixes the order number
with a warehouse and district number, so that simultaneous inserts will
most often not hit the same page.

Even when there is no locking, there is still some serialization for
database page access. This is shown in the various wait columns of
SYS_L_STAT. If the sum of the waits for a key is over 1% of the touches
for the key, as given in SYS_D_STAT, there is contention and a
performance penalty of maybe 10%.

Such things can be improved by altering the schema design and
configuration parameters do not usually help. If there is disk access,
having more memory always helps because then locks will be in effect for
less time.

</div>

<div id="perfdiagqueryplans" class="section">

<div class="titlepage">

<div>

<div>

#### Query Plans

</div>

</div>

</div>

To know if there is a bad query plan, see the explain output of the
query.

Unless a full table scan is intended, a full table scan is pretty much
always bad.

In the explain () result set, a table access is marked by a From table
name. Below is mentioned the driving index, the conditions on the index
and the conditions that are not indexable.

Joins are listed one after the other, the outermost first. The join
order can be read from the explain output going from top to bottom.

If a table is read on a non primary key and columns not covered by the
driving index are accessed, there is a second key mentioned with a full
match of the primary key columns as condition.

A full table scan looks like this:

``` programlisting
explain (select count (*) from t1');

...
from DB.DBA.T1 by STR2 8.4e+04 rows
Key STR2 ASC ()

 Local Code
  0: $30 "count" := artm $30 "count" + <constant (1)>
...
```

There are no conditions mentioned.

A lookup with index looks like this.

``` programlisting
explain ('select fi2 from t1 where row_no = 11');
...
from DB.DBA.T1 by T1 Unique
Key T1 ASC ($26 ".FI2")
 inlined <col=1694 ROW_NO = <constant (11)>>
...
```

The condition is shown on the line below the key.

A lookup with full scan testing every row looks like this:

``` programlisting
...
from DB.DBA.T1 by T1 2.5e+04 rows
Key T1 ASC ($26 ".FI2")

row specs: <col=1699 FI2 > <constant (11)>>
...
```

The condition is shown after the heading row specs. The whole key
mentioned in the key will be read and the entries tested. if both
indexed and row tests exist, the indexed are done first as one would
think.

If your query has full table scans, consider adding an index.

If the index choice is not the right one, consider the following
possibilities:

<div class="itemizedlist">

- Run statistics. This is not always necessary because the database
  takes dynamic samples but it can help in cases.

- specify the desired index explicitly with table option.

- Use literal constants instead of parameters, specially if the query is
  long running and values of the columns being compared are not evenly
  distributed.

- To exclude index usage for a column, write col + 0 =xx.

</div>

Hash joins can make full table scans. This is OK if the table scanned is
small.

A hash join looks like this:

``` programlisting
explain ('select count (*) from t1 a, t1 b where a.row_no = b.row_no + 1');
...

{
Fork
{
Fork
{
from DB.DBA.T1 by STR2 8.4e+04 rows
Key STR2 ASC ($26 "B.ROW_NO")

 Local Code
  0: $30 "temp" := artm $26 "B.ROW_NO" + <constant (1)>
  4: BReturn 0

Current of: <$28 "<DB.DBA.T1 B>" spec 5>
Sort (HASH) ($30 "temp") -> ($26 "B.ROW_NO")

}
from DB.DBA.T1 by STR2 8.4e+04 rows
Key STR2 ASC ($37 "A.ROW_NO")

Current of: <$39 "<DB.DBA.T1 A>" spec 5>
Hash source ($37 "A.ROW_NO") -> ($26 "B.ROW_NO")

After code:
  0: $44 "count" := artm $44 "count" + <constant (1)>
  4: BReturn 0
}
Select ($44 "count", <$39 "<DB.DBA.T1 A>" spec 5>, <$28 "<DB.DBA.T1 B>" spec 5>)
}
```

First t1 is read from start to end and a hash is filled with row_no + 1.
Then t1 is read from start to end a second time. The hash source is the
hash lookup. A hash join, if there is no index or if the whole table or
a large part thereof is traversed is better than a loop join because it
replaces random access with sequential. The complexity is close to O(n +
n) instead of O (n \* log n). Plus sequential read makes better use of
read ahead.

The corresponding loop join looks like this:

``` programlisting
explain ('select count (*) from t1 a, t1 b where a.row_no = b.row_no + 1 option (loop)');

{
Fork
{
from DB.DBA.T1 by STR2 8.4e+04 rows
Key STR2 ASC ($26 "B.ROW_NO")

Current of: <$28 "<DB.DBA.T1 B>" spec 5>

Precode:
  0: $29 "temp" := artm $26 "B.ROW_NO" + <constant (1)>
  4: BReturn 0
from DB.DBA.T1 by T1 Unique
Key T1 ASC ()
 inlined <col=1694 ROW_NO = $29 "temp">
 Local Code
  0: $35 "count" := artm $35 "count" + <constant (1)>
  4: BReturn 0

Current of: <$31 "<DB.DBA.T1 A>" spec 4>
}
Select ($35 "count", <$31 "<DB.DBA.T1 A>" spec 4>, <$28 "<DB.DBA.T1 B>" spec 5>)
}
```

To prevent hash joins, use table option or option at the end of the
select as seen above. A hash join is very bad if a whole table is read
for filling a hash and then only a small number of entries are fetched
from the hash. However, if there is no index, then even this is better
than a loop join.

</div>

<div id="perfdiagcheckpointduration" class="section">

<div class="titlepage">

<div>

<div>

#### Checkpoint Duration

</div>

</div>

</div>

A checkpoint can take a very long time in certain special conditions.
Normally a log checkpoint is about a minute if flushing several G worth
of buffers to disk. The flushing is mostly done online, after which
there is an atomic time of a few seconds. After this operation resumes.
Applications do not notice the checkpoint except as a temporary increase
in response delays.

If spikes in response time are to be avoided, then making frequent
checkpoints is better than making infrequent ones.

If there are long running transactions with many locks or uncommitted
changes, then the checkpoint interval should anyhow be longer than
several times the expected duration of such a transaction. If this is
not so, the checkpoint can fall in the middle of the transaction and
will internally have to rollback and again reestablish the uncommitted
state so as to write a clean image on the new checkpoint. Doing this
many times in the life of a transaction is very inefficient. In
generally do not make long transactions with locking. Preferentially use
read committed for anything long.

A checkpoint's atomic time can be prohibitively long under the following
circumstances:

<div class="itemizedlist">

- There are transactions with a lot of locks and uncommitted state at
  the time of the checkpoint. Specially a transaction which has updated
  pages paged out to disk is bad. In general one should not do
  transactions that update a large part of the disk cache, let alone
  exceed its size. Use the row autocommit mode (log_enable (2)) for
  doing batch updates. Batch updates most often do not require isolation
  anyway. If they do, then break the job into smaller transactions.

- The MaxCheckpointRemap parameter in the ini is too small and the
  database exceeds the size of disk cache either in the Virtuoso process
  or the OS. This may increase the count of used pages by the value of
  this parameter but will make for faster checkpoints. Set this to up to
  25% of the database page count.

</div>

</div>

</div>

<div id="ptune" class="section">

<div class="titlepage">

<div>

<div>

### 6.1.7. Performance Tuning

</div>

</div>

</div>

<div id="io" class="section">

<div class="titlepage">

<div>

<div>

#### I/O

</div>

</div>

</div>

<div id="diskio" class="section">

<div class="titlepage">

<div>

<div>

##### Optimizing Disk I/O

</div>

</div>

</div>

Virtuoso allows splitting a database over several files that may be on
different devices. By allocating database fragments onto independent
disks I/O performance in both random and sequential database operations
can be greatly enhanced.

The basic unit of a database is the segment. A segment consists of an
integer number of 8K pages. A segment may consist of one or more files
called stripes. If a segment has multiple stripes these will be of
identical length and the segment size will be an integer multiple of the
stripe size.

The size limit on individual database files is platform dependent, but
64 bit file offsets are used where available. For large databases use of
multiple disks and segments is recommended for reasons of parallelism
even though a single database file can get very large. A database can in
principle grow up to 32TB (32-bit page number with 8KB per page).

When a segment is striped each logically consecutive page resides in a
different file, thus for a segment of 2 stripes the first stripe will
contain all even numbered pages and the second all the odd numbered
pages. The stripes of a segment should always be located on independent
disks.

In serving multiple clients that do random access to tables the server
can perform multiple disk operations in parallel, taking advantage of
the independent devices. Striping guarantees a statistically uniform
access frequency to all devices holding stripes of a segment.

The random access advantages of striping are available without any
specific configuring besides that of the stripes themselves.

</div>

<div id="ioqs" class="section">

<div class="titlepage">

<div>

<div>

##### Configuring I/O queues

</div>

</div>

</div>

Striping is also useful for a single client doing long sequential read
operations. The server can detect the serial nature of an operation, for
example a count of all rows in a table and can intelligently prefetch
rows.

If the table is located in a striped segment then the server will read
all relevant disks in parallel if these disks are allocated to different
I/O queues.

All stripes of different segments on one device should form an I/O
queue. The idea is that the database stripes that benefit from being
sequentially read form a separate queue. All queues are then read and
written independently, each on a different thread. This means that a
thread will be allocated per queue. If no queues are declared all
database files, even if located on different disks share one queue.

A queue is declared in the striping section by specifying a stripe id
after the path of the file, separated by an equal sign.

``` programlisting
[Striping]
Segment1 = 200M, disk1/db-seg1-1.db = iq1, disk2/db-seg1-2.db = iq2
Segment2 = 200M, disk1/db-seg2-1.db = iq1, (disk2/db-seg2-2.db = iq2
```

In the above example the first stripes of the segments form one queue
and the second stripes form another. This makes sense because now all
database files on /disk1 are in iq1 and all on /disk2 are on iq2.

This configuration could have resulted from originally planning a 200 MB
database split on 2 disks and subsequently expanding that by another 200
MB.

The I/O queue identifier can be an arbitrary string. As many background
I/O threads will be made as there are distinct I/O queues.

Striping and using I/O queues can multiply sequential read rates by a
factor almost equal to the number of independent disks. On the other
hand assigning stripes on one disk to different queues can have a very
detrimental effect. The rule is that all that is physically accessed
sequentially will be on the same queue.

</div>

</div>

<div id="schemas" class="section">

<div class="titlepage">

<div>

<div>

#### Schema Design Considerations

</div>

</div>

</div>

<div id="dataorg" class="section">

<div class="titlepage">

<div>

<div>

##### Data Organization

</div>

</div>

</div>

One should keep the following in mind when designing a schema for
maximum efficiency.

</div>

<div id="indexusage_01" class="section">

<div class="titlepage">

<div>

<div>

##### Index Usage

</div>

</div>

</div>

A select from a table using a non-primary key will need to retrieve the
main row if there are search criteria on columns appearing on the main
row or output columns that have to be fetched from the main row.
Operations are noticeably faster if they can be completed without
fetching the main row if the driving key is a non-primary key. This is
the case when search criteria and output columns are on the secondary
key parts or primary key parts. Note that all secondary keys contain a
copy of the primary key. For this purpose it may be useful to add
trailing key parts to a secondary key. Indeed, a secondary key can hold
all the columns of a row as trailing key parts. This slows insert and
update but makes reference to the main row unnecessary when selecting
using the secondary key.

A sequential read on the primary key is always fastest. A sequential
search with few hits can be faster on a secondary key if the criterion
can be evaluated without reference to the main row. This is because a
short key can have more entries per page.

</div>

<div id="spaceconsump" class="section">

<div class="titlepage">

<div>

<div>

##### Space Consumption

</div>

</div>

</div>

Each column takes the space 'naturally' required by its value. No field
lengths are preallocated. Space consumption for columns is the
following:

<div id="id13080" class="decimalstyle">

**Table 6.2. Data type Space Consumption**

<div class="decimalstyle-contents">

| Data              | Bytes                                                                                 |
|:------------------|---------------------------------------------------------------------------------------|
| Integer below 128 | 1                                                                                     |
| Smallint          | 2                                                                                     |
| long              | 4                                                                                     |
| float             | 4                                                                                     |
| timestamp         | 10                                                                                    |
| double            | 8                                                                                     |
| string            | 2 + characters                                                                        |
| NULL              | data length for fixed length column, as value of 0 length for variable length column. |
| BLOB              | 88 on row + n x 8K (see note below)                                                   |

</div>

</div>

  

If a BLOB fits in the remaining free bytes on a row after non-LOBs are
stored, it is stored inline and consumes only 3 bytes + BLOB length.

Each index entry has an overhead of 4 bytes. This applies to the primary
key as well as any other keys. The length of the concatenation of the
key parts is added to this. For the primary key the length of all
columns are summed. For any other key the lengths of the key parts plus
any primary key parts not on the secondary key are summed. The maximum
length of a row is 4076 bytes.

In light of these points primary keys should generally be short.

</div>

<div id="pagealloc" class="section">

<div class="titlepage">

<div>

<div>

##### Page Allocation

</div>

</div>

</div>

For data inserted in random order pages tend to be 3/4 full. For data
inserted in ascending order pages will be about 90% full due to a
different splitting point for a history of rising inserts.

</div>

</div>

<div id="efficientsql" class="section">

<div class="titlepage">

<div>

<div>

#### Efficient Use of SQL - SQL Execution profiling

</div>

</div>

</div>

Virtuoso offers an execution profiling mechanism that keeps track of the
relative time consumption and response times of different SQL
statements.

Profiling can be turned on or off with the prof_enable function. When
profiling is on, the real time between the start and end of each SQL
statement execute call is logged on the server. When prof_enable is
called for the second time the statistics gathered between the last call
to prof_enable and this call are dumped to the virtprof.out file in the
server's working directory.

Profiling is off by default. Profiling can be turned on with the
statement:

``` programlisting
prof_enable (1);
```

The virtprof.out file will be generated when prof_enable is called for
the second time, e.g.

``` programlisting
prof_enable (0);
```

will write the file and turn profiling back off.

Below is a sample profile output file:

``` screen
Query Profile (msec)
Real 183685, client wait 2099294, avg conc 11.428772 n_execs 26148 avg exec  80

99 % under 1 s
99 % under 2 s
99 % under 5 s
100 % under 10 s
100 % under 30 s

23 stmts compiled 26 msec, 99 % prepared reused.

 %  total n-times n-errors
49 % 1041791  7952     53     new_order
28 % 602789   8374     490   delivery_1
12 % 259833   8203     296   payment
5  % 123162   821      35    slevel
2  % 54182    785      0     ostat (?, ?, ?, ?)
0  % 11614    4        0     checkpoint
0  % 2790     2        1     select no_d_id, count (*) from new_orde
0  % 2457     3        1     select count (*) from new_order
0  % 662      2        0     status ()
0  % 11       1        1     set autocommit on
0  % 3        1        0     select * from district
```

This file was produced by profiling the TPC C sample application for 3
minutes. The numbers have the following meanings:

The real time is the real time interval of the measurement, that is the
space in time between the prof_enable call that started the profiling
and the call that wrote the report. The client wait time is the time
cumulatively spent inside the execute call server side, only calls
completely processed between profiling start and end are counted. The
average concurrency is the exec time divided by real time and indicates
how many requests were on the average concurrently pending during the
measurement interval. The count of executes and their average duration
is also shown.

The next section shows the percentage of executes that finished under 1,
2, 5, 10 and 30 seconds of real time.

The compilation section indicates how many statements were compiled
during the interval. These will be SQLPrepare calls or SQLExecDirect
calls where the text of the statement was not previously known to the
server. The real time spent compiling the statements is added up. The
percentage of prepared statement reuses, that is, executes not involving
compiling over all executes is shown. This is an important performance
metric, considering that it is always better to use prepared statements
with parameters than statements with parameters as literals.

The next section shows individual statements executed during the
measurement interval sorted by descending cumulative real time between
start and completion of the execute call.

The table shows the percentage of real time spent during the calls to
the statement as a percentage of the total real time spent in all
execute calls. Note that these real times can be higher than the
measurement interval since real times on all threads are added up.

The second column shows the total execute real time, the third column
shows the count of executes of the statement during the measurement
interval. The fourth column is the count of executes that resulted in an
error. The error count can be used for instance to spot statements that
often produce deadlocks.

Statements are distinguished for profiling purposes using the 40 first
characters of their text. Two distinct statements that do not differ in
their first 40 characters will be considered the same for profiling. If
a statement is a procedure call then only the name of the procedure will
be considered, not possibly differing literal parameters.

The profiler will automatically write the report after having 10000
distinct statements in the measurement interval. This is done so as to
have a maximum on the profiling memory consumption for applications that
always compile a new statement with different literals, resulting in a
potentially infinitely long list of statements each executed once. It is
obvious that such a profile will not be very useful.

It cannot be overemphasized that if an application does any sort of
repetitive processing then this should be done with prepared statements
and parameters, for both reasons of performance and profilability.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                                               |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                                                         |
|                              | Note that measurements are made with a one millisecond precision. Percentages are rounded to 2 digits. Timing of fast operations, under a few milliseconds, will be imprecise as a result of the 1 ms resolution. Also the cumulative compilation time may be substantially off, since the compilation may often take less than 1 ms at a time. Also note that the precision may also vary between platforms. |

</div>

</div>

<div id="readingqueryprofile" class="section">

<div class="titlepage">

<div>

<div>

#### Reading a Query profile

</div>

</div>

</div>

A query plan is essentially a pipeline of operations that can be read
from top to bottom. The operator above produces the input for the
operator below. Nesting is indicated by braces. Operators enclosed in
braces must completely process their input before continuing with
operators after the section in braces. A case in point is aggregation
which is demoted by for { ... } ... . The section in braces generates
the rows to be aggregated and one it is fully evaluated the execution
proceeds with the operators after the fork. These will typically read
the temporary table filled by the operators inside the fork.

Query variables are demoted with \<\$v...\>. A reference to a query
variable set by an operator that is not immediately the preceding one is
demoted by \<r \$...\> via ...\>. The position of the variable in the
query state follows the \$ sign.

After this is given the symbolic name of the variable, e.g. a column
name or the name of the function of which this is the return value.

If this is a reference to a query variable assigned earlier in the plan
with one or more operators between the reference and the assignment, the
reference contains a via .... section which lists the operators that are
between the reference and the assignment.

The operators are identified by a unique number. Internally this is the
location in the query state where the operator keeps the mapping between
its rows of input and output.

With vectored execution, an operator may receive any number of rows of
input which it may reorder at its convenience. For this it must record
for each row of output which row of input this corresponds to. Thus when
referencing a query variable set earlier in the plan one must take into
account the reordering and addition/dropping of rows in affected by the
operators between the reference and the initial assignment. This is the
meaning of the via section in the \<r \$xx \> notation.

The last part of the query variable reference is a two letter indication
of the type. If the first letter is followed by n this means that the
variable is non-null. The type letters are a for any, r for IRI, i for
integer, d for double, f for float, t for datetime, N for wide string, s
for string.

If the plan is a profile, i.e. it is annotated with actual times and
cardinalities from running the query, each operator is preceded by a
passage that indicates its percentage of total CPU time of the plan, its
fanout and the number of rows of input. The fanout is the number of rows
of Output divided by the number of rows of input.

The principal operators in a plan are:

<div class="itemizedlist">

- <span class="emphasis">*Cluster outer seq start*</span>

  -- Queries and subqueries begin with this operator. It assigns numbers
  to the sets of parameter bindings the query gets as input. An optional
  section also begins with this. An optional section is the table or
  derived table on the right hand side of a left outer join.

- <span class="emphasis">*From*</span>

  -- Accessing an index

- <span class="emphasis">*Sort*</span>

  -- Group by, order by, distinct or hash join build side

- <span class="emphasis">*group by read*</span>

  -- Accessing the results of a group by filled in by a previous sort
  operator.

- <span class="emphasis">*Top oby*</span>

  -- Accessing a previously filled top k order by temporary space

- <span class="emphasis">*Select*</span>

  -- At the end of a plan, send the rows of input to the client. If Subq
  select return the rows of input as rows of output of the enclosing
  subquery.

- <span class="emphasis">*Subquery*</span>

  -- Indicates a SQL derived table, i.e. select in a from clause. The
  input is the output of the previous node.

- <span class="emphasis">*Cluster ocation fragment*</span>

  -- A set of operators partitioned and shipped to a partition in a
  cluster. There are single part fragments and distributed fragments
  (DFG). A DFG is a query fragment which begins with a stage operator.
  The stage is a partitioning exchange operator which routes its rows of
  input to the next operator in the appropriate partition based on the
  partitioningh columns of the row of input.

- <span class="emphasis">*Outer seq end*</span>

  -- This demotes the end of an optional section, i.e. the table/derived
  table on the right side of left outer join. This has the effect of
  making aligned vectors of all the vector query variables assigned in
  the optional section. When producing rows for which there was no match
  in the optional section, these will be set to null. References to
  these variables downstream in the plan will be to the shadowing
  variables, listed in the shadow clause following this.

</div>

Some operators such as index access (From) have a section called vector
param casts. This is used when the vector that serves as parameter is
not aligned or not of the type required by the operator. For example, a
vector of column values in an index lookup might not be of the type of
the column but might be of a type castable to this. In any case, the
para,key values for index lookup are made into solid aligned,
materialized vectors. After this there is a sort step that orders the
input according to key order, so that matches are generated from left to
right.

In the event of a cluster partitioned operation, i.e. stage node or
non-DFG location fragment (QF), the first table source (From) after the
stage or fragment serves to both align and cast all inputs needed
downstream in the DFG or QF. The operator first partitions the rows of
input. Each partition then gets solid, aligned vectors of input values
which are directly suitable for input to the first index lookup (From).

We consider an example: The setup is a cluster of 4 server processes
with each 8 slices of data. There is one table, ct_c, which is joined to
itself:

``` programlisting
profile ('SELECT COUNT (*) from ct_c a, ct_c b WHERE a.k2 = b.k1 option (loop, order)');
```

This returns a result set in which is found the below. This is also in
the ql_plan column of the sys_query_log view:

``` programlisting
{
-- In the below excerpt some lines are omitted. Comments are inline.

time   1.3e-06% fanout         1          1 rows in

s# 98 cluster outer seq start, set no <V $40 set_ctr in>
save ctx:()

-- the section inside the fork is executed to the end
-- before the section after the fork is started.
s# 161 Fork 42
{
wait time   0.00012% of exec real time, fanout         0

-- The below introduces the 2 stage DFG which does most of the work.
s# 108   { Cluster location fragment 51 0 unordered
   Params: ()
Output: ()

-- First partitioning step. Each of the 32 slices gets the
-- identical plan to execute, this is a flood for all is this
-- first step does not specify a partitioning key value.

time     8e-05% fanout         0          0 rows in
s# 115 Stage 1: Params: (<V $112 set_ctr in>)

-- This is the initial table scan. The operator is executed
-- 32 times, once for each slice of data.

time      0.33% fanout   3.1e+06         32 rows in
s# 121 from DB.DBA.ct_c by ct_c    1.7e+08 rows
Key ct_c  ASC  (<V $28 a.k2 in>)
 [copies params]
vector param casts: <V $40 set_ctr in>-> <V $112 set_ctr in>

-- This is the second partitioning step, each of the rows of
-- output of the previous is sent to the slice corresponding to K2.

time        31% fanout       0.9      2e+08 rows in
s# 131 Stage 2: Params: (<v $134 q_a.k2 S136 in>, <V $138 set_ctr in>)

-- This is the 2nd index lookup, by a.k2 = b.k1 There are two
-- parameters given in the vector param cast section, the first
-- is a.k2 and the second is the set number. This is constant
-- since the query is run on a single row of input but if the
-- query were run on multiple rows of input this would specify
-- which row of input the a.k2 comes from so that this would be
-- aggregated in the right place. Many aggregates can be produced
-- in a single invocation with multiple rows of input.

time        68% fanout         0      2e+08 rows in
s# 144 from DB.DBA.ct_c by ct_c  unq         1 rows
Key ct_c  ASC  ()
 inlined  k1 = <v $134 q_a.k2 S136 in>
vector param casts: <V $28 a.k2 in>-> <v $134 q_a.k2 S136 in>, <r $112 set_ctr via  S121>-> <V $138 set_ctr in>

-- This is the aggregation.

After code:
      0:  sum <V $43 count i> 1 set no <r $138 set_ctr via  S144>
      5: BReturn 0

}
}

-- The below returns the aggregate to the client. The combining of
-- aggregates from different slices is implicit in the for operator
-- whenever this ends with a cluster location fragment.

time   5.4e-07% fanout         0          1 rows in
s# 164 Select (<V $43 count i>)
  set no: <V $40 set_ctr in>
}
```

</div>

<div id="tunvectoredexecandhashjoins" class="section">

<div class="titlepage">

<div>

<div>

#### Tuning Vectored Execution and Hash Joins

</div>

</div>

</div>

<span class="emphasis">*Note*</span> : This section applies only to
versions 7.00 and up.

Query evaluation performance is significantly affected by
parallelization, the vector size and the use of hash joins and fast
in-memory hash tables for group by and distinct.

This section explains the configuration parameters and event counters
that allow optimizing these factors.

The SQL function <span class="emphasis">*cl_sys_stat*</span> (in name
varchar, in clr int := 0) allows reading and optionally resetting these
counters. In the case of a cluster, the value returned is the sum of the
values of the metric gathered from all server processes, for a single
server this is the local value. In a cluster, to get individual counter
values, use sys_stat instead when connected to the process of interest.

To do TPC H at scale 100G on a 32 thread machine, the virtuoso.ini
should have the following settings. Only settings at non-default values
are mentioned:

``` programlisting
[Parameters]
ServerThreads              = 100
NumberOfBuffers            = 5000000

;  The working set of the 100G database when stored column-wise is 38G,
;  so configure this much for database buffers:
; 5000000 / 128            = 39G

;  Read committed
DefaultIsolation           = 2

;  SQL optimizer work space
MaxMemPoolSize             = 100000000

;  Use large vectors when appropriate
AdjustVectorSize           = 1

;  Split queries in up to 32 independently evaluable fragments,
;  so up to 32 threads per query.
ThreadsPerQuery            = 32

;  Thread pool has 32 worker threads divided across all queries
;  in addition to the client thread taken by each query.
AsyncQueueMaxThreads       = 32

;  All queries can collectively take up to 30G without space
;  saving measures being applied. Space saving measures are
;  running on small vector size when a large size would be
;  faster and the use of partitioned (multiple pass) hash join.
MaxQueryMem                = 30G

;  Of the MaxQueryMem, hash join hash tables can take up to 30G,
;  i.e. all of it. A single hash table will only take half of the
;  remaining space, though. So if 2 queries that both need a 30G
;  hash table run at the same time, the first will do 2 passes,
;  taking a hash table of 15G at a time, This leaves 20G space.
;  The second will have 15G left, of which it will take half,
;  7.5G. This will require 4 passes over the data.
HashJoinSpace              = 30G
```

To analyze the performance of a query workload:

<div class="orderedlist">

1.  Turn on query logging in sys_query_log. This view contains most
    metrics and the full text of the query plan with the per operator
    timings and cardinalities:

    ``` programlisting
    SQL> prof_enable (1);
    ```

2.  Print long result columns without truncating:

    ``` programlisting
    SQL> set blobs on;
    ```

3.  Run the query.

4.  Use the profile function for a convenient overview of query
    execution. For example:

    ``` programlisting
    SQL> profile ('SELECT COUNT (*) FROM orders, lineitem WHERE l_orderkey = o_orderkey');
    ```

    <a href="ch-server.html#efficientsql" class="link"
    title="Efficient Use of SQL - SQL Execution profiling">See summary of
    execution time, CPU%, compilation time and IO</a>

5.  Read the relevant event counters, resetting the count for the next
    query. For example:

    ``` programlisting
    SQL> select cl_sys_stat ('tc_qp_thread', clr => 1);
    ```

    The relevant counters are:

    <div class="itemizedlist">

    - <span class="emphasis">*tc_qp_thread*</span> -- How many threads
      were started for query parallelization. This is not the number of
      parallel threads as not all of these threads needed to be running
      at the same time.

    - <span class="emphasis">*tc_part_hash_join*</span> -- If a hash
      join is partitioned, i.e. needs to make multiple passes on over
      the data, this is the count of passes. This is incremented by 2 if
      the hash join does 2 passes and not incremented if the hash join
      goes in a single pass. Normally this should stay at 0 or the hash
      join space (HashJoinSpace in init, see above) should be increased.

    - <span class="emphasis">*tc_no_mem_for_longer_batch*</span> -- This
      is the count of times the execution engine did not switch to large
      vectors because there was not enough space. This should normally
      be 0, if this is not so, increase MaxQueryMem in the ini file.

    - <span class="emphasis">*tc_slow_temp_insert*</span> -- If a
      distinct or group by temporary space grows over the available
      query memory, a another data structure will be used so that the
      hash table can be paged out to disk. This is tens of times less
      efficient than the memory only structure. This counter is the
      count of rows inserted into a page-able group by or distinct hash
      table. This should be 0, if not, increase MaxQueryMem.

    - <span class="emphasis">*mp_max_large_in_use*</span> -- This is the
      maximum amount of query memory that has been allocated to date.
      Reset this before the query of interest, run and read the counter.
      This is the peak simultaneous memory use by the query.

    - <span class="emphasis">*mp_large_in_use*</span> -- This is the
      current amount of query memory in use. Do not reset this.

    - <span class="emphasis">*c_max_large_vec*</span> -- This is the
      MaxQueryMem init setting in bytes. This can be altered at run time
      with
      <a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
      class="function">__dbf_set</code></a> .

    </div>

</div>

</div>

<div id="ptunehighcardin" class="section">

<div class="titlepage">

<div>

<div>

#### High Cardinality Group By And Distinct

</div>

</div>

</div>

There are multiple implementations of group by and distinct used in
different circumstances by different versions of Virtuoso. Versions of
Virtuoso 7 prior to 7.5 have a memory based cuckoo hash based group by
and hash join. 7.5 and onwards have a linear hash based implementation
of same. Additionally, all version 7's have a pageable, i.e. potentially
disk based implementation of group by that may get used if there is no
space in memory.

</div>

<div id="ptuneprtgroupby" class="section">

<div class="titlepage">

<div>

<div>

#### Partitioned Group By

</div>

</div>

</div>

Versions 7.5 and onwards have a choice of a partitioned or re-aggregated
parallel group by. The group by with re-aggregation produces an
intermediate result on each thread and then adds these up after the
completion of each thread into a final result. This is efficient for
low-cardinality cases (few distinct values of grouping columns) but
inefficient for high cardinality. In the high cardinality case, it is
better to use a partitioned group by operator. In the partitioned case,
a hash is computed from the grouping columns and this decides which
thread gets to do the aggregation. There is information exchange between
threads (or processes in a scale-out setting) but there is no need for
re-aggregation. This is significantly more performant with many groups.
The peak memory utilization is the same.

The `c_setp_partition_threshold` setting in the
<span class="emphasis">*Flags*</span> section of virtuoso.ini defines
when to use a partitioned group by. The default threshold is 100000. If
the cost model estimates more distinct values than this threshold, a
partitioned group by will be produced. In a query plan with explain of
profile, a partitioned group by is present when there is a stage \<n\>
operator in front of the sort operator for the group by. In a cluster
plan, the partitioned group by may be colocated with the table right
before it, so the stage operator will be before this.

</div>

<div id="ptuneorderedgroupby" class="section">

<div class="titlepage">

<div>

<div>

#### Ordered Group By

</div>

</div>

</div>

For version 7.5 onwards, a special case for ordered group by is
recognized. In an ordered group by, the system takes advantage of
physical data ordering to limit the memory footprint of the group by: If
it is known that grouping keys will not reoccur past a certain window,
then all grouping keys that are processed can be emitted as results in a
continuous stream so that only a window of groups need be kept at a
time.

This is recognized in a query plan by the word "streaming" occurring on
the line of the sort operator for the group by.

Ordered group by is rare to non-existent with RDF, where data orderings
with an application meaning do not occur, due to having no multipart
keys. With a SQL schema grouping on a set of columns including the
primary ordering column of the outermost scan in a plan, an ordered
group by will typically be generated. An ordered group by is usually
better than a partitioned or re-aggregated group by. The exception may
be cases where the outermost ordering column has low cardinality, or a
very biased value distribution e.g. the P in the RDF PSOG.

</div>

<div id="ptunememorygroupby" class="section">

<div class="titlepage">

<div>

<div>

#### Memory for Group By

</div>

</div>

</div>

In Virtuoso 7 prior to 7.5, the memory for a group by is
` (3 + n_keys + n_aggregates) * 8 ` bytes per group plus the natural
length of any dates or strings in the keys or aggregates. In 7.5
onwards, the memory is 8 bytes less per entry.

</div>

<div id="ptuneslowgroupby" class="section">

<div class="titlepage">

<div>

<div>

#### Slow Group By

</div>

</div>

</div>

The use of the disk-based group by is easily 100x less efficient than
the vectored memory based hash tables. Falling back to this can be
considered an error in configuration and can be detected with the
`tc_slow_temp_insert` counter readable with `sys_stat` . If this
increases then there is not enough memory for group by/distinct as used
by the application. The monitor may print a message about this in the
server messages log.

The maximum size of a memory based group by hash table is by default
1/10 of the MaxQueryMem setting in Parameters in the virtuoso.ini file.
If a single hash table exceeds this or if the hash table plus the amount
of large query memory blocks (e.g. vectors) allocated across the process
exceeds MaxQueryMem, then the switch to the slow pageable hash table
takes place. This can be avoided by explicitly setting a larger
MaxQueryMem or by changing the `cha_max_gby_bytes` setting in the Flags
section of the ini file. We note that for parallel query plans the first
condition to trigger is the condition on `mp_large_in_use` + the hash
table memory exceeding MaxQueryMem. A query will have more than 10
threads and the hash tables for memory based hashes are included in
`mp_large_in_use` .

To track the general memory consumption in large blocks, use the
`mp_large_in_use` and `mp_max_large_in_use meters` accessible with
`sys_stat` and `__dbf_set` . Large blocks are for example vectors, group
by's and hash join build sides.

To interactively try different memory settings, one can modify
`c_max_large_vec` with `__dbf_set` . This is the number of bytes of
outstanding large blocks after which pageable group by's will be used
and vector sizes will no longer be adjusted upward.

</div>

<div id="tunparamsmworkload" class="section">

<div class="titlepage">

<div>

<div>

#### Tuning Parameters for Multiuser Workloads

</div>

</div>

</div>

This section describes parameters and event counters that affect memory
and parallelism and are specially relevant for high concurrency
situations. Different switches and event counters are described. Setting
these requires dba privileges. The event counters are accessed with
<span class="emphasis">*sys_stat*</span> and set with
<a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
class="function">__dbf_set</code></a> . For example:

``` programlisting
select sys_stat ('tc_qp_thread');

or

__dbf_set ('dc_batch_sz', 10000);
```

Some of the parameters have corresponding INI file settings. All of
these can be set in an INI file in the \[Flags\] section with a stanza
like:

``` programlisting
dc_batch_sz = 10000
```

First, make sure that the <span class="emphasis">*ServerThreads*</span>
in either <a href="ch-server.html#ini_parameters" class="link"
title="[Parameters]">[Parameters] ini section</a> (if application with
connected clients) or in
<a href="ch-server.html#ini_httpserver" class="link"
title="[HTTPServer]">[HTTPServer] ini section</a> (if over web
protocols), is larger than the number of actual connections.

Next, the workload should be profiled to see its memory utilization and
intrinsic use of parallelism. Splitting a query into independently
executable parallel fragments increases its memory utilization,
Switching to larger vector sizes also increases a query's memory
utilization while providing increased locality of data access. Together
these techniques can result in a 100+ fold difference in the transient
memory consumption of a query. Use of hash joins may also increase the
transient memory consumption since in a hash join one half of the join
must be materialized.

With relatively small numbers of concurrent queries, e.g. 10, these
techniques are nearly always beneficial. With hundreds of queries the
memory overhead may become a limiting factor.

The <span class="emphasis">*MaxQueryMem*</span> INI file setting
controls how much memory is kept for query execution. This amount of
space is maintained allocated. Transient memory use may exceed this but
then the memory above this amount is unmapped when no longer needed.
Mapping and unmapping memory takes time. Concurrent mmap and munmap
calls on different threads will serialize and bring down the CPU
utilization of a process even when there is enough parallelism for full
platform utiliization.

The <span class="emphasis">*mp_mmap_clocks*</span> counter is the
cumulative amount of real time in CPU clocks spent in mmap or munmap
systtem calls. This can increase faster than real time if multiple
threads are involved.

If this value grows fast, e.g. at over 10% of real time, the monitor
prints a message in the server event log. This is an indication that
memory utilization may have to be tuned.

For analyzing the behavior of a workload as concerns memory, do the
following:

<div class="itemizedlist">

- Run the workload once for warmup.

- Clear the following counters:

  <div class="itemizedlist">

  - `mp_max_large_in_use ` -- Highest to date amount of concurrently
    used memory

  - `tc_qp_thread ` -- count of times a query made a parallel executive
    fragment. Not increased if running single threaded.

  - `tc_adjust_batch_sz ` -- count of times vector size was switched to
    larger

  - `mp_mmap_clocks ` -- cumulative time inside mmap or munmap.

  </div>

  For example:

  ``` programlisting
  __dbf_set ('mp_max_large_in_use', 0);
  ```

- Run the workload on a single thread with default settings.

- Observe the values.

</div>

<div id="tunparamsmworkloadex" class="section">

<div class="titlepage">

<div>

<div>

##### Example Scenario

</div>

</div>

</div>

<div class="orderedlist">

1.  Clear the counters.

2.  Set `enable_dyn_batch_sz` to 0, causing queries to only use the
    initial vector size, `dc_batch_sz` or `VectorSize` in the INI file.

3.  Set `enable_qp` to 1, causing queries to run single threaded.

4.  Run the workload on a single thread. The difference in elapsed real
    time will show how much benefit the workload has from intra-query
    parallelization and long vector sizes. If the workload used any of
    the memory consuming techniques the peak memory in the second case
    will be lower. How much lower is entirely workload dependent.

    <div class="itemizedlist">

    - <span class="emphasis">*Note*</span> : One may additionally try
      the workload on a single thread with `hash_join_enable` set to 0
      and 2, respectively. 0 means no hash join plans are made, 2 means
      that hash join is used when appropriate for either SQL or SPARQL
      queries. The peak memory utilization and run times may be
      significantly affected.

    </div>

5.  Having completed these metrics, one may move to the multi-user case.
    Note that `MaxQueryMem` , ( `c_max_large_vec` setting with
    <a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
    class="function">__dbf_set</code></a> ) should be set to a
    reasonable value, e.g. the peak consumption with the chosen settings
    times the number of parallel sessions.

6.  Expected Results -- Experience demonstrates for example that with a
    128 concurrent users `setting enable_qp` to 1 and
    `enable_dyn_batch_sz` to 0 increased the throughput of the sample
    workload by a factor of 2.5. The workload derived, even in single
    user mode, little benefit from dynamic vector size or
    multithreading, under 30%. In the case at hand, the difference in
    performance was mostly accounted for by `mmap` , see the
    `mp_mmap_clocks` counter.

    <div class="itemizedlist">

    - If more concurrent queries are than CPU cores are expected, there
      is little point in intra-query parallelism, controlled by
      `ThreadsPerQuery` in the INI file or `enable_qp` in
      <a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
      class="function">__dbf_set</code></a> .

    - If `mp_mmap_clocks` continues to grow fast during the execution
      one may increase `c_max_large_vec` . This will cause more `mmap`
      's to be kept in reserve, thus in principle decreasing the
      frequency of `mmap` and `munmap` system calls.

    - If running with hash join enabled, there is a possibility of
      partitioned hash joins where the query executes in multiple passes
      in order to build smaller hash tables. This is given by
      `tc_part_hash_join` , which is increased by 1 for each non-first
      pass over a hash join. If the counter increases the
      `HashJoinSpace` setting in the INI file should be increased. With
      <a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
      class="function">__dbf_set</code></a> this is `chash_space_avail`
      .

    </div>

7.  Notes:

    <div class="itemizedlist">

    - The results from above may not happen with a single user but
      happen all the time with multiple users. The monitor will print a
      warning message about this in the message log.

    - One may also try a different default vector size, specially if
      very pressed on memory. The default of 10000 values is generally a
      good small value but smaller may be possible, however not under
      1000.

    </div>

</div>

</div>

</div>

<div id="querylogging" class="section">

<div class="titlepage">

<div>

<div>

#### Query Logging

</div>

</div>

</div>

As of version 7.00 Virtuoso offers optional server side query logging.
This records a large number of execution statistics as well as the full
query text and execution plan with per-operator timing and cardinality
information.

This feature is enabled in the Parameters section of virtuoso.ini:

``` programlisting
; virtuoso.ini
...
[Parameters]
QueryLog = filename
```

At run time, this may be enabled or disabled with prof_enable (),
overriding the specification of the ini file. The default file name for
the query log is virtuoso.qrl in the server's working directory, if not
otherwise specified in the ini file.

The file is in binary format and is not conveniently readable as such.
It is most easily accessed via the DB.DBA.SYS_QUERY_LOG system view.
This view has parameters for specifying a non-default file path for the
query log file as well as a datetime range for selecting the entries of
interest.

For example:

``` programlisting
SELECT *
  FROM sys_query_log
 WHERE qrl_file = 'other.qrl'
   AND qrl_start_dt = cast ('2011-10-1' as datetime)
   AND qrl_end_dt = cast ('2011-10-2' as datetime)
```

This will select entries from the file other.qrl that are between the
given dates. Note that the qrl\* columns are not actual result column of
the view but are considered as parameters, hence the use of = instead of
a range condition.

All statements executed over a SQL client connection (ODBC/JDBC etc) are
logged, as well as any statements executed on an SPARQL end point. DAV
and web services requests are not logged unless they perform an exec
function call. CPU usage for committing transactions or for background
data organization such as autocompact or automatic checkpoints are not
logged.

A select statement is logged at the time it produces its last row of
output, not at the time this row of output is fetched by a client.

Some of the columns are in units of clocks, whose meaning varies from
system to system. On Intel this corresponds to the value returned by the
RDTSC instruction. All values are intervals. The relation of this to
real time may vary in function of automatic variation of clock
frequency.

The columns of SYS_QUERY_LOG are as follows:

<div class="itemizedlist">

- <span class="emphasis">*ql_id*</span>

  -- Serial number of the log entry. If the server was started many
  times with the same file these will not be unique. Combine with

  <span class="emphasis">*ql_start_dt*</span>

  for unique identification.

- <span class="emphasis">*ql_start_dt*</span>

  -- datetime of the start of the query

- <span class="emphasis">*ql_rt_msec*</span>

  -- real time elapsed in milliseconds between the start and the logging
  of the query

- <span class="emphasis">*ql_rt_clocks*</span>

  -- Clock cycles of real time spent running the query, not including
  time between consecutive fetches from a client if the query was a
  cursor fetched in multiple chunks by a client. This is the number of
  clocks during which there was at least one thread running on behalf of
  the query. The average CPU% of the query is given by:

  ``` programlisting
  100 * ql_thread_clocks / ql_rt_clocks
  ```

- <span class="emphasis">*ql_client_ip*</span>

  -- Requesting client IP as dotted decimal.

- <span class="emphasis">*ql_user*</span>

  -- User account on behalf of which the query was executed.

- <span class="emphasis">*ql_sqlstate*</span>

  -- SQL state if query terminated with error, NULL otherwise.

- <span class="emphasis">*ql_error*</span>

  -- Error message if query terminated with error, NULL otherwise.

- <span class="emphasis">*ql_swap*</span>

  -- Cumulative count of major page faults since startup of this
  Virtuoso process.

- <span class="emphasis">*ql_user_cpu*</span>

  -- Cumulative user CPU in milliseconds for this server process.

- <span class="emphasis">*ql_sys_cpu*</span>

  -- Cumulative system CPU in milliseconds for this server process.

- <span class="emphasis">*ql_text*</span>

  -- Source text of the query

- <span class="emphasis">*ql_params*</span>

  -- NULL.

- <span class="emphasis">*ql_plan_hash*</span>

  -- Hash number calculated from the execution plan, ignoring literals.
  Can be used for grouping executions of the same query with differing
  literals together. If difference of literals causes a different plan,
  this number will be different.

- <span class="emphasis">*ql_c_clocks*</span>

  -- CPU clocks of real time used for query compilation. This will be 0
  if the query is separately prepared of if the query compilation comes
  from a cache of recently compiled queries. This is likely if the query
  is parametrized and executed multiple times.

- <span class="emphasis">*ql_c_msec*</span>

  -- Real time used for query compilation in milliseconds.

- <span class="emphasis">*ql_c_disk*</span>

  -- Count of disk reads done on behalf of the query compilation, this
  stands for index sampling initiated by the compilation and does not
  include any speculative read possibly triggered by the sampling.

- <span class="emphasis">*ql_c_disk_wait*</span>

  -- Count of clocks the compilation was blocked waiting for disk.

- <span class="emphasis">*ql_c_cl_wait*</span>

  -- Count of clocks the compilation was waiting for information from
  cluster peers. Such waiting indicates sampling done on remote
  partitions. If the run time of the query is small, this may be a
  significant factor in query execution real time.

- <span class="emphasis">*ql_cl_messages*</span>

  -- Count of distinct cluster messages sent on behalf of the
  compilation. These are all related to sampling. Many samples can be
  combined into one message in some situations. Samples are also cached
  on the requesting server so repeatedly compiling the same statement
  will send the messages only the first time in unless the cache has
  timed out in the meantime.

- <span class="emphasis">*ql_c_rnd_rows*</span>

  -- Count of rows retrieved as part of compile time sampling.

</div>

The below columns correspond directly to the fields returned by
db_activity (). These are summed over all the threads in all the hosts
that have done something on behalf of the logged query.

<div class="itemizedlist">

- <span class="emphasis">*ql_rnd_rows*</span>

  -- Count of random row lookups. Each sequential lookup begins with one
  random one for each partition concerned.

- <span class="emphasis">*ql_seq_rows*</span>

  -- Sequential rows fetched, each non-first row which is selected
  counts as one. A row that is looked at but does not satisfy applicable
  query criteria does not count.

- <span class="emphasis">*ql_same_seg*</span>

  -- Count of times the next random lookup in a vectored lookup falls on
  the same column-wise segment as the previous.

- <span class="emphasis">*ql_same_page*</span>

  -- Ibid, for the next lookup falling on the same row-wise leaf page.

- <span class="emphasis">*ql_same_parent*</span>

  -- Ibid, for the case of the next lookup falling on a sibling page of
  the row-wise leaf page of the previous lookup.

</div>

For column-wise indices, all the three above counters can be non-zero
since these consist of multi-row segments each under a row on a row-wise
leaf page. For a row-wise index the same seg counter is always 0.

<div class="itemizedlist">

- <span class="emphasis">*ql_thread_clocks*</span>

  -- Sum of clocks spent on any thread for the logged query. Time spent
  waiting for other threads, for disk or for replies from cluster peers
  is not counted, thus only running cycles count. These are added up
  across all hosts in a cluster.

- <span class="emphasis">*ql_disk_wait_clocks*</span>

  -- Total clocks any thread spends waiting for disk on behalf of the
  query. If two threads wait for the same page which is fetched once the
  wait is counted double. This is not the same as the total read time of
  the pages since read ahead can fetch pages before they are needed,
  thus involving no wait.

- <span class="emphasis">*ql_cl_wait_clocks*</span>

  -- Total clocks a thread running on behalf of the query spends waiting
  for a cluster reply. This may be zero if the coordinating thread has
  work until any cluster replies arrive, in which case there will be no
  wait. If this is high then the workload is bound by interconnect or is
  unevenly distributed across a cluster.

- <span class="emphasis">*ql_pg_wait_clocks*</span>

  -- Count get page wait.

- <span class="emphasis">*ql_disk_reads*</span>

  -- Count disc reads.

- <span class="emphasis">*ql_spec_disk_reads*</span>

  -- Count of speculative disk reads triggered on behalf of the query.
  Any read ahead or any upgrading of a single page read into a read of a
  whole extent counts towards this, only allocated pages that are read
  are counted but merging near-adjacent reads may cause actually more
  disk IO to take place.

- <span class="emphasis">*ql_messages*</span>

  -- Count of distinct cluster messages sent on behalf of the query. Any
  message is counted once. Client-server messages are not counted.

- <span class="emphasis">*ql_message_bytes*</span>

  -- Total bytes sent in all cluster messages sent on behalf of the
  query.

- <span class="emphasis">*ql_qp_threads*</span>

  -- Count of times an extra thread is created for parallelizing work on
  the query in question. The count may be high since consecutively
  launched threads are counted, this is not a maximum degree of
  concurrency.

- <span class="emphasis">*ql_vec_bytes*</span>

  -- reserved

- <span class="emphasis">*ql_vec_bytes_max*</span>

  -- reserved

- <span class="emphasis">*ql_lock_waits*</span>

  -- Count of times a thread has waited for a lock on behalf of the
  query.

- <span class="emphasis">*ql_lock_wait_msec*</span>

  -- Total milliseconds any thread has spent waiting for a lock on
  behalf of the query. This may be longer than real time since many
  threads may wait at the same time.

- <span class="emphasis">*ql_plan*</span>

  -- Text representation of the execution plan, annotated with CPU time
  percentages and fanouts for the different operators. Fanout is the
  count of output rows divided by the count of input rows.

- <span class="emphasis">*ql_node_stat*</span>

  -- reserved

- <span class="emphasis">*ql_c_memory*</span>

  -- Count of bytes allocated for compiling the query. This is the peak
  size of the memory pool for query compilation.

- <span class="emphasis">*ql_rows_affected*</span>

  -- Count of inserted/updated/deleted rows. If the query was a select
  with a top and an order by, this is is the count of produced rows
  before the top restriction was applied.

</div>

</div>

<div id="meters_sysviews" class="section">

<div class="titlepage">

<div>

<div>

#### Meters & System Views

</div>

</div>

</div>

<div id="kdlstat" class="section">

<div class="titlepage">

<div>

<div>

##### DB.DBA.SYS_K_STAT, DB.DBA.SYS_D_STAT, DB.DBA.SYS_L_STAT view

</div>

</div>

</div>

These views provide statistics on the database engine

``` programlisting
create view SYS_K_STAT as
  select KEY_TABLE, name_part (KEY_NAME, 2) as index_name,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'n_landings') as landed,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'total_last_page_hits') as consec,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'page_end_inserts') as right_edge,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'page_end_inserts') as lock_esc
    from SYS_KEYS;
```

``` programlisting
create view SYS_L_STAT as
  select KEY_TABLE, name_part (KEY_NAME, 2) as index_name,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'lock_set') as locks,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'lock_waits') as waits,
    (key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'lock_waits') * 100)
      / (key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'lock_set') + 1) as wait_pct,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'deadlocks') as deadlocks,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'lock_escalations') as lock_esc
    from SYS_KEYS;
```

``` programlisting
create view sys_d_stat as
  select KEY_TABLE, name_part (KEY_NAME, 2) as index_name,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'touches') as touches,
    key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'reads') as reads,
    (key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'reads') * 100)

 > / (key_stat (KEY_TABLE, name_part (KEY_NAME, 2), 'touches') + 1) as read_pct
    from SYS_KEYS;
```

These views offer detailed statistics on index access locality, lock
contention and disk usage.

'reset' specified as the stat name will reset all counts for the key in
question.

</div>

<div id="keystats" class="section">

<div class="titlepage">

<div>

<div>

##### SYS_K_STAT - Key statistics

</div>

</div>

</div>

<div class="itemizedlist">

- KEY_TABLE The fully qualified table name, e.g. DB.DBA.SYS_PROCEDURES

- INDEX_NAME The name of the index. This will be equal to the table name
  for the table's primary key.

- LANDED The count of random accesses, including inserts. Any insert or
  select, whether empty, single line or multi- line counts as one.
  Updates and deletes do not count, as they imply a select in the same
  or previous statement.

- CONSEC The number of times a random access falls on the same page as
  the previous random access. This is always less than LANDED. For
  repetitive access to the same place or an ascending insert, this will
  be near LANDED. For a totally random access pattern this will be near
  0.

- RIGHT_EDGE The number of times an insert has added a row to the right
  edge of the page where the insert was made.

- LOCK_ESC The count of lock escalations, see SYS_L_STAT.

</div>

</div>

<div id="lstats" class="section">

<div class="titlepage">

<div>

<div>

##### SYS_L_STAT

</div>

</div>

</div>

<div class="itemizedlist">

- KEY_TABLE The fully qualified table name, e.g. DB.DBA.SYS_PROCEDURES

- INDEX_NAME The name of the index. This will be equal to the table name
  for the table's primary key.

- LOCKS The number of times a lock has been set on the index. Making a
  new row or page lock counts as one. Entering a row or page lock either
  after a wait or without wait (for a shared lock) counts as one.

- WAITS The number of times a cursor reading this index waited for a
  lock. Note that this can be higher than the number of locks set, e.g.
  a 'read committed' cursor may wait for a lock but will never make one.

- WAIT_PCT The percentage of lock set events that involved a wait.

- DEADLOCKS The number of times a deadlock was detected when trying to
  wait for a lock on this index. Note that one deadlock event may
  involve locks on several indices. Each deadlock detection counts as
  one.

- LOCK_ESC The number of times the set of row locks on a page of this
  index where escalated into one page lock or a page lock was set
  initially. This is always less than LOCKS. This value will be near
  LOCKS when there are many sequential selects which switch to page lock
  mode. This happens when a cursor has performed over 2 lock escalations
  and the page being entered has no locks, i.e. the lock can be set over
  the entire page.

</div>

</div>

<div id="dstats" class="section">

<div class="titlepage">

<div>

<div>

##### SYS_D_STAT

</div>

</div>

</div>

<div class="itemizedlist">

- KEY_TABLE The fully qualified table name, e.g. DB.DBA.SYS_PROCEDURES

- INDEX_NAME The name of the index. This will be equal to the table name
  for the table's primary key.

- TOUCHES The number of times a row is located on the index. Every row
  retrieved by a select or inserted counts as one. All rows scanned by
  an select count or other aggregate counts as one.

- READS The number of times a disk read was caused by a read operation
  on this index. This may theoretically be higher than TOUCHES, since
  several levels of the index tree may have to be read to get to a leaf.

- READ_PCT The percentage of READS in TOUCHES.

</div>

<div id="id13643" class="example">

**Example 6.14. Examples:**

<div class="example-contents">

``` programlisting
select index_name, locks, waits, wait_pct, deadlocks
    from sys_l_stat order by 2 desc;

Get lock data, indices in descending order of lock count.

select index_name, touches, reads, read_pct
    from sys_d_stat order by 3 desc;

Get disk read counts, index with most reads first.

select index_name, (consec * 100) / (landed + 1)
    from sys_k_stat where landed > 1000  order by 2;
```

</div>

</div>

  

Get the percentage of consecutive page access on indices with over 1000
accesses so far, most randomly accessed first.

</div>

<div id="statusfunc" class="section">

<div class="titlepage">

<div>

<div>

##### status SQL function - status ();

</div>

</div>

</div>

This function returns a summary of the database status as a result set.
The result set has one varchar column, which has consecutive lines of
text. The lines can be up to several hundred characters.

The contents of the status summary are described in the
<a href="ch-server.html#dbstat" class="link"
title="Server Status Monitoring">Administrator's Guide</a> .

</div>

<div id="statusfunc_01" class="section">

<div class="titlepage">

<div>

<div>

##### Virtuoso db file usage detailed info

</div>

</div>

</div>

All data in a virtuoso database are logically stored as database key
rows. Thus the primary key for a table holds the entire row (including
the dependent part) and the secondary keys just hold their respective
key parts. So the space that the table occupies is the sum of the space
occupied by it's primary key and all the secondary keys.

The main physical unit of allocation in a virtuoso db file is the
database page (about 8k in virtuoso 3.x). So the server needs to map the
key rows and outline blobs to database pages.

Virtuoso will store as many rows in a db page as it can, so usually one
DB page will contain more than 1 row of a given key. No page contains
rows from more than one key. However blobs (when not inlined on the row)
will be placed in consecutive DB pages (up to their size). In addition
to the blob and key pages the Virtuoso DB will hold a number of pages
containing internal data. So the sum of the pages occupied by the key
rows and the blobs is leas then the amount of occupied pages (as
reported by the
<a href="fn_status.html" class="link" title="status"><code
class="function">status()</code></a> BIF).

To provide detailed information about the space consumption of each key
there's a system view:

``` programlisting
DB.DBA.SYS_INDEX_SPACE_STATS
    ISS_KEY_TABLE       varchar -- name of the table
    ISS_KEY_NAME        varchar -- name of the key
    ISS_KEY_ID          integer -- id of the key (corresponding to KEY_ID from DB.DBA.SYS_KEYS)
    ISS_NROWS           integer -- number of rows in the table
    ISS_ROW_BYTES       integer -- sum of the byte lengths of all the rows in the table
    ISS_BLOB_PAGES      integer -- sum of the blob pages occupied by the outline blobs on all the rows of the table
    ISS_ROW_PAGES       integer -- sum of all the db pages containing rows of this key
    ISS_PAGES           integer -- = ISS_BLOB_PAGES + ISS_ROW_PAGES (for convenience).
```

Each select on that view causes the server to go over all the db pages
in the db file (similarly to how the crash dump operates) and collect
the statistics above. The pages are traversed 1 time per select, but
still on large database files that may take some time.

</div>

</div>

<div id="transaction_isolation_levels" class="section">

<div class="titlepage">

<div>

<div>

#### Transaction Metrics, Diagnostics and Optimization

</div>

</div>

</div>

Bad design and implementation of transactions affects applications in
the following ways:

<div class="itemizedlist">

- Performance is lost by having to needlessly retry transactions that
  are aborted by deadlock.

- Concurrency is lost by having rows stay locked for too long.

- Memory is transiently consumed, adversely affecting working set, by
  keeping data structures for too many simultaneous locks, rollback
  records and uncommitted roll forward logs.

</div>

The following rules should be observed when writing transactions:

<div class="itemizedlist">

- Do not lock needlessly. For example, any report transaction that reads
  the data once can always be done as read committed instead of
  repeatable read without affecting semantics. Even if some data is read
  multiple times, the repeatable read semantic is typically not relevant
  for reports.

- Lock for what is needed. If you mean to update later, do the initial
  read with exclusive locks. See the for update clause in select, for
  example.

- Lock in constant order. If you must lock different resources in one
  transaction, lock them always in the same order. When updating stock
  for an order, update the quantity on hand in increasing order of item
  number, for instance.

- Lock the item with the least contention first. For example, update the
  detail before updating the summary. Update the quantity in stock for
  the ordered items before updating the orders count of the whole
  warehouse.

- Keep transactions short. Use stored procedures. Use the explicit
  commit work statement.

- For each transaction in a stored procedure, make sure that if it is
  deadlocked, the deadlocked transaction gets retried. For example, have
  a "declare exit handler for sqlstate 40001" for every transaction
  context. Make sure that a deadlocking transaction is never retried
  endlessly. Two mutually deadlocking transactions can keep retrying and
  again deadlocking each other endlessly. To avoid this, have a maximum
  count of retries and a random delay before restarting. The restart
  delay should be between 0 and the expected duration of the
  transaction.

- Always break batch updates into multiple transactions. Update a few
  thousand or tens of thousands of rows per transaction, never more than
  that. Failing to do this makes for prohibitive cost of retry with
  deadlocks and can cause swapping by keeping tens or hundreds of
  megabytes in rollback state, locks and other transaction temporary
  structures. This happens if one inserts, updates, deletes several
  million rows in a single transaction. If this is really needed and
  concurrency is no issue, use the atomic mode, effectively making the
  server single user for the transaction, thus having no locking or
  rollback. See the use of the

  <span class="emphasis">*\_\_atomic()*</span>

  function in the <a href="faultfaulttoleradmapi.html" class="link"
  title="6.4.8. Administration API">Cluster Administration API</a> .

</div>

<div id="ptuneprogvirtpl" class="section">

<div class="titlepage">

<div>

<div>

##### Programming Virtuoso/PL

</div>

</div>

</div>

The isolation level is set in Virtuoso/PL with the

``` programlisting
set isolation := level;
```

statement, where level is one of 'serializable', 'repeatable',
'committed', 'uncommitted'. Example :

``` programlisting
set isolation = 'serializable';
```

The standard SQL syntax is also supported :

``` programlisting
SET TRANSACTION ISOLATION LEVEL <isolation_level>
isolation level : READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE
```

Example :

``` programlisting
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
```

The effect is for the rest of the procedure and any procedure called
from this procedure. The effect stops when the procedure having executed
the set isolation statement returns.

</div>

<div id="ptunetransparallel" class="section">

<div class="titlepage">

<div>

<div>

##### Transaction Parallelism

</div>

</div>

</div>

From Virtuoso 7.1 onwards, data manipulation statements can be
multithreaded. The virtuoso.ini `[Flags]` settings `enable_mt_txn` and
`enable_mt_transact` control transaction parallelism. These are 1 for
enable and 0 for disable. Defaults are version dependent, off in 7.1 and
7.2 and on in subsequent. The
<a href="fn_sys_stat.html" class="link" title="sys_stat"><code
class="function">sys_stat()</code></a> and
<a href="fn_dbf_set.html" class="link" title="__dbf_set"><code
class="function">__dbf_set()</code></a> functions can be used for
querying and altering these.

DML statements, e.g. insert, delete, update, are automatically
multithreaded according to `enable_qp` (`ThreadsPerQuery` in ini
\[Parameters\] when `enable_mt_txn` is on).

RDF load (<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.ttlp()</code></a> and related functions) when in
transactional mode (log_enable 0 or 1) are also multithreaded when
`enable_mt_txn` is on. Otherwise these are multithreaded when in
non-transactional mode (`log_enable` 2 or 3) and single threaded in
transactional mode.

The `enable_mt_transact` setting controls the parallelism of a commit or
rollback. Specially for column store deletes, the commit may take a long
time, as this is the point where the physical deletion takes place. To
accelerate this, `enable_mt_transact` should be on. This is however not
worthwhile for short row store transactions, as the overhead of making
threads is greater than the time it takes to finalize a transaction om a
page. Again, large, scattered row store deletes may justify use of
`enable_mt_transact` .

</div>

<div id="ptunesampledeadlockhandler" class="section">

<div class="titlepage">

<div>

<div>

##### Sample Deadlock Handler

</div>

</div>

</div>

The text for a deadlock handler is

``` programlisting
  declare retry_count int;
  retry_count := 0;
retry:
  {
    declare exit handler for sqlstate '40001'
      {
        rollback work;
        ...
        delay (rnd (2.5));  --- if 2.5 seconds is the expected duration of
the transaction.
        ...

        retry_count := retry_count + 1;
        if (retry_count > 5)
          signal ("xxxxx", "Too many deadlock retries in xxxxx.");
        goto retry;
      }
   -- do the operations. The actual working code here.

    commit work;
  }
```

An exclusive read is done with

``` programlisting
select s_quantity from stock where s_i_id = 111 for update;
```

</div>

<div id="ptuneodbciso" class="section">

<div class="titlepage">

<div>

<div>

##### ODBC

</div>

</div>

</div>

For the Virtuoso ODBC driver the isolation is set by :

<div class="itemizedlist">

- connection option (in either <a
  href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/odbc/htm/odbcsqlsetconnectattr.asp"
  class="ulink" target="_top">SQLSetConnectAttr ()</a> or <a
  href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/odbc/htm/odbcsqlsetconnectoption.asp"
  class="ulink" target="_top">SQLSetConnectOption ()</a> )

  ``` programlisting
     rc = SQLSetConnectOption (hdbc, SQL_TXN_ISOLATION, SQL_TXN_READ_COMMITTED);
  ```

  or

  ``` programlisting
    rc = SQLSetConnectAttr (hdbc, SQL_TXN_ISOLATION, SQL_TXN_READ_COMMITTED, NULL);
  ```

  Constants are : SQL_TXN_READ_UNCOMMITTED, SQL_TXN_READ_COMMITTED,
  SQL_TXN_REPEATABLE_READ, SQL_TXN_SERIALIZABLE

- ODBC setup dialog option : In Windows there is a drop-down combo box
  to set the default transaction isolation level for a connection.

- connection string element : You may specify the default transaction
  isolation level for a given connection in it's connect string (passed
  to the <a
  href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/odbc/htm/odbcsqldriverconnect.asp"
  class="ulink" target="_top">SQLDriverConnect ()</a> ODBC API). Example
  :

  ``` programlisting
     SQLDriverConnect (hdbc, hwnd,
         "DSN=MyDSN;IsolationLevel=Repeatable Read;UID=dba;PWD=dbapwd", SQL_NTS,
         NULL, 0,
         NULL,
         SQL_DRIVER_NOPROMPT).
  ```

  The possible options for the connection string are : "Read
  Uncommitted", "Read Committed", "Repeatable Read" and "Serializable"

</div>

</div>

<div id="ptunejdbciso" class="section">

<div class="titlepage">

<div>

<div>

##### JDBC

</div>

</div>

</div>

In the Virtuoso JDBC driver the isolation is set by the <a
href="http://java.sun.com/j2se/1.5.0/docs/api/java/sql/Connection.html#setTransactionIsolation(int)"
class="ulink"
target="_top">java.sql.Connection.setTransactionIsolation()</a> JDBC
API.

``` programlisting
  conn.setTransactionIsolation (java.sql.Connection.TRANSACTION_SERIALIZABLE)
```

The constants are described in the <a
href="http://java.sun.com/j2se/1.5.0/docs/api/java/sql/Connection.html#field_summary"
class="ulink" target="_top">Java Docs</a>

</div>

<div id="ptunedotnetiso" class="section">

<div class="titlepage">

<div>

<div>

##### .Net

</div>

</div>

</div>

In the VirtuosoClient.NET provider the isolation is set by the <a
href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemdataidbconnectionclassbegintransactiontopic2.asp"
class="ulink" target="_top">System.Data.IDbConnection.BeginTransaction
Method (IsolationLevel)</a> function.

``` programlisting
  System.Data.IDBTransaction trx = conn.BeginTransaction (System.Data.IsolationLevel.ReadCommitted)
```

The constants are described <a
href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemdataisolationlevelclasstopic.asp"
class="ulink" target="_top">here</a>

</div>

</div>

<div id="ptunemetricsdiag" class="section">

<div class="titlepage">

<div>

<div>

#### Metrics and Diagnostics

</div>

</div>

</div>

Metrics are presented at the server and the table level.

The first metric to check is the output of status ('');

The paragraph titled transaction status contains the following:

<div class="itemizedlist">

- Count of deadlocks since server startup. There is a total number of
  deadlocks and the number of 2r1w deadlocks. The latter is a special
  case where two transactions both hold a shared lock on a resource and
  one tries to convert the lock to exclusive. This situation can kill
  the transaction attempting to write. Such deadlocks are essentially
  always needless. These are avoided by reading for update when first
  reading the resource.

- Count of waits since server startup. This is incremented every time
  some operation waits for a lock, except if this wait leads into a
  deadlock. If the number of deadlocks is high, let's say over 5% of the
  number of waits, transactions are likely badly designed and deadlock
  too often, either because of not locking for write at the get go
  (2r1w) or because of locking resources in varying order.

- Count of threads running. This is the count of all threads that are
  somehow occupied, whether running or waiting. This count minus the
  count of waiting minus the count of threads in vdb is the count of
  threads that in principle could be on CPU.

- Count of threads waiting. This is the count of threads that are
  waiting for a lock. If this is a high percentage of the count of
  threads running, say over 30%, resources are likely locked
  inefficiently, keeping too many locked.

- Count of threads in vdb. This is the count of threads that are at the
  time waiting for I/O either from a remote database or any sort of
  network operation, including access to web services on other serbers,
  access to web pages on other hosts etc.

</div>

The system view db.dba.sys_l_stat is used for locating bottlenecks.

The columns are:

<div class="itemizedlist">

- index - The index being locked. Note that when reading on non-primary
  key, the lock is set on the index first, only then on the pk, that is
  if the pk is accessed at all. For all updates however, the pk will
  always be accessed. \*locks - The count of times a lock was set on
  this index.

- waits - The number of times there was a wait on this index. There can
  be more waits than locks because a read committed cursor can wait but
  will not lock, thus all waits do not result in locks.

- wait_pct - The percentage of times setting a lock waited. (100 \*
  waits) / locks

- deadlocks - The number of times a deadlock was signalled when
  attempting to wait for a lock on this index.

- lock_esc - The number of times a set of row locks was converted into a
  page lock on this index.

- wait_msecs - The total amount of real time spent by some thread
  waiting for a lock on this index. This may be greater than elapsed
  time because many threads can wait at the same time.

</div>

All counts and times are cumulative from server startup.

The interpretation is as follows:

If deadlocks is high in relation to waits or locks, i.e. over 5%, there
are many deadlocks and the transaction profiles may have to be adjusted.
The table where deadlocks is incremented is the table where the deadlock
was detected but the deadlock may involve any number of tables. So, if A
and B are locked in the order A, B half of the time and B, a the rest of
the time, then the deadlocks of the tables of A and B will be about the
same, half of the deadlocks being detected when locking A, the other
half when locking B.

If waits is high in relation to locks, for example 20%, then there is
probably needless contention. Things are kept locked needlessly. Use
read committed or make shorter transactions or lock items with the less
contention first.

Because transaction duration varies, the place with the highest count of
waits is not necessarily the place with the heaviest contention if the
waits are short. Use wait_msecs in addition to waits for determining
where the waiting takes place.

To get a general picture, use the Conductor's Statistics page or simply
do:

``` programlisting
select top 5 *
  from sys_l_statt
 order by wait_msecs desc;
```

to get a quick view of where time is spent. You can also sort by waits
desc or locks desc.

<div id="ptunemetricdiagsqlissues" class="section">

<div class="titlepage">

<div>

<div>

##### SQL Issues

</div>

</div>

</div>

It is possible to get bad locking behavior if the SQL compiler decides
to make linear scans of tables or indices and the isolation is greater
than read committed. The presence of a linear scan on an index with
locking is often indicated by having a large number of lock escalations.
If lock_esc is near locks then a large part of the activity is likely
sequential reads.

The general remedy is to do any long report type transactions as read
committed unless there are necessary reasons to do otherwise.

To see how a specific query is compiled, one can use the explain ()
function. To change how a query is compiled, one can use the table
option or option SQL clauses.

</div>

<div id="ptunemetricdiagdynmicsobs" class="section">

<div class="titlepage">

<div>

<div>

##### Observation of Dynamics

</div>

</div>

</div>

Deadlocks and contention do not occur uniformly across time. The
occurrences will sharply increase after a certain application dependent
load threshold is exceeded.

Also, deadlocks will occur in batches. Several transactions will first
wait for each other and then retry maybe several times, maybe only one
succeeding at every round. In such worst cases, there will be many more
deadlocks than successfully completed transactions. Optimize locking
order and make the transactions smaller.

Looking at how counts change, specially if they change in bursts is
useful.

</div>

<div id="ptunemetricdiagsqdebug" class="section">

<div class="titlepage">

<div>

<div>

##### Tracing and Debugging

</div>

</div>

</div>

The most detailed picture of a system's behavior, including deadlocks nd
other exceptions cn be obtained with profiling. If the application is in
C, Java or some other compiled language, one can use the language's test
coverage facility to see execution counts for various branches of the
code.

For client applications, using the Virtuoso `trace()` function can be
useful for seeing which statements signal errors. Also the profiling
report produced by
<a href="fn_prof_enable.html" class="link" title="prof_enable"><code
class="function">prof_enable ()</code></a> can give useful hints on
execution times and error frequencies. See Profiling and
<a href="fn_prof_enable.html" class="link" title="prof_enable"><code
class="function">prof_enable ()</code></a> .

For PL applications, Virtuoso provides a profiler and test coverage
facility. This is activated by setting PLDebug = 2 in the Parameters
section of the ini file and starting the server. The functions cov_store
() and cov_report are used for obtaining a report of the code execution
profile thus far. See the documentation on "Branch Coverage" for this.
The execution counts of the lines for exception handler code will show
the frequency of exceptions. If in a linear block of code a specific
line has an execution count lower than that of the line above it, then
this means that the line with the higher count has signalled as many
exceptions as the difference of the higher and lower count indicates.

The times indicated in the flat and call graph profile reports for PL
procedures are totals across all threads and include time spent waiting
for locks. Thus a procedure that consumes almost no CPU can appear high
on the list if it waits for locks, specially if this is so on multiple
threads concurrently. The times are real times measured on threads
separately and can thus exceed any elapsed real tiime.

Single stepping is not generally useful for debugging locking since
locking issues are timing sensitive.

</div>

</div>

<div id="clientlevelresourceaccounting" class="section">

<div class="titlepage">

<div>

<div>

#### Client Level Resource Accounting

</div>

</div>

</div>

Starting with version 6, Virtuoso keeps track of the count of basic
database operations performed on behalf of each connected client. The
resource use statistics are incremented as work on the connection
proceeds. The db_activity () function can be called to return the
accumulated operation counts and to optionally reset these.

The db_activity built-in function has one optional argument. The
possible values are:

<div class="itemizedlist">

- 0 - (default) - Return human readable string and reset the counts.

- 1 - return an array of numbers and reset the counts.

- 2 - return a human readable string and leave the counts.

- 3 - return an array of numbers and leave the counts.

</div>

The human readable string is of the form:

``` programlisting
   22.56MR rnd  1.102GR seq     10P disk  1.341GB /  102.7K messages
  
```

The postfixes K, M, G, T mean 10^3 to 10^15, except when applied to
bytes, where these mean consecutive powers of 1024.

The numbers, left to right are the count of random row lookups,
sequential row lookups, disk page reads, cluster inter-node traffic in
bytes and cluster inter-node message count as an integer number of
messages. If the configuration is a single server, the two last are 0.

The random and sequential lookup counts are incremented regardless of
whether the row was found or not or whether it matched search
conditions.

If the information is retrieved as an array, the array contains integer
numbers representing these plus some more metrics.

Index - Meaning

<div class="itemizedlist">

- 0 - Random lookups

- 1 - sequential lookups

- 3 - lock waits

- 4 - total msec spent in lock wait on some thread. In a cluster
  situation, this may be more than elapsed real time.

- 5 - Disk reads

- 6 - Speculative disk reads. These are also counted in disk reads. A
  speculative read is a prefetch made on the basis of a read history of
  a disk extent.

- 7 - Cluster inter node message count

- 8 - Total bytes sent in cluster inter node traffic. A message is
  counted once, when sent.

</div>

If the thread calling db_activity is a web server thread, the totals are
automatically reset when beginning the processing of the current web
request.

</div>

</div>

</div>

</div>
