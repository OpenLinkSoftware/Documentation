<div id="mt_rulebook" class="section">

<div class="titlepage">

<div>

<div>

## 17.1. Rulebook Settings

</div>

</div>

</div>

<div id="mt_requestbroker" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.1. \[Request Broker\]

</div>

</div>

</div>

<div id="id33401" class="decimalstyle">

**Table 17.1. **

<div class="decimalstyle-contents">

|    Parameter     | Default | Comment                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:----------------:|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| BinaryDirectory  |         | Absolute path to the bin directory which has the Broker program. Example: /home/openlink/openlink/bin                                                                                                                                                                                                                                                                                                                             |
|   CommandLine    |         | The command line parameters to use as a default. These parameters are also passed on to each program referenced in \[Persistent Services\]                                                                                                                                                                                                                                                                                        |
|    Protocols     | tcp     | Name of protocol to use tcp/spx/DECnet                                                                                                                                                                                                                                                                                                                                                                                            |
|    MaxAgents     | 0       | if \>0, maximum number of processes spawned by broker                                                                                                                                                                                                                                                                                                                                                                             |
|  MaxConnections  | 0       | if \>0, maximum number of connections from clients                                                                                                                                                                                                                                                                                                                                                                                |
| HostNameResolver | Yes     | Resolve IP addresses to hostnames Yes/No. Use Yes to give a more readable name in the logs. Set to No to avoid possible delays when frequently looking up unknown (new) IP numbers through a distant uncached DNS table. This parameter will have a direct affect on the type of match that is to be used for the StartupBy, ShutdownBy and ShutdownFrom parameters under the <a href="mt_rulebook.html#mt_security" class="link" 
                              title="17.1.7. [Security]">Security section</a>.                                                                                                                                                                                                                                                                                                                                                                                   |
|  LingerTimeout   | 0       | if \>0, time in seconds that a disconnected agent will linger ready for re-use before giving up, and terminating.                                                                                                                                                                                                                                                                                                                 |

</div>

</div>

  

</div>

<div id="mt_protocoltcp" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.2. \[Protocol TCP\]

</div>

</div>

</div>

<div id="id33442" class="decimalstyle">

**Table 17.2. **

<div class="decimalstyle-contents">

|  Parameter   | Default   | Comment                                                                                                     |
|:------------:|-----------|-------------------------------------------------------------------------------------------------------------|
| PingWatchdog | No        | Send check-alive packets Yes/No                                                                             |
| PingInterval | 600       | Number of seconds between each Ping                                                                         |
|  IPAddress   | 127.0.0.1 | Overrules found interface address                                                                           |
|   PortLow    | 5000      | Optional lower limit of port number to be used in allocation by the Broker for communication with an Agent. |
|   PortHigh   | 60000     | Optional upper limit of port range usage by Broker.                                                         |
|    Listen    | 5000      | Port that the client should contact the broker on.                                                          |

</div>

</div>

  

</div>

<div id="mt_protocolspx" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.3. \[Protocol SPX\]

</div>

</div>

</div>

This section is only relevant, and required when using the SPX protocol.

<div id="id33479" class="decimalstyle">

**Table 17.3. **

<div class="decimalstyle-contents">

|   Parameter    | Default   | Comment                                      |
|:--------------:|-----------|----------------------------------------------|
|  SAPBroadcast  | Yes       | Broadcast SAP registration packets           |
|  SAPInterval   | 100       | Number of seconds between each SAP broadcast |
| SAPServiceType | 0x321F    | Type of the SAP service                      |
| SAPServiceName | OPENLINK  | name of the SAP service                      |
|    HostFile    | HOSTS.IPX | For IPX/SPX name to address translation      |

</div>

</div>

  

</div>

<div id="mt_protocoldecnet" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.4. \[Protocol DECnet\]

</div>

</div>

</div>

This section is only relevant, and required when using the DECnet
protocol.

<div id="id33512" class="decimalstyle">

**Table 17.4. **

<div class="decimalstyle-contents">

| Parameter  | Default | Comment                          |
|:----------:|---------|----------------------------------|
| ObjectName | OPLRQB  | Name of the DECnet server object |

</div>

</div>

  

</div>

<div id="mt_communications" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.5. \[Communications\]

</div>

</div>

</div>

<div id="id33528" class="decimalstyle">

**Table 17.5. **

<div class="decimalstyle-contents">

|   Parameter    | Default | Comment                                                                                                                                           |
|:--------------:|---------|---------------------------------------------------------------------------------------------------------------------------------------------------|
|    SendSize    | 16000   | Send buffer size                                                                                                                                  |
|  ReceiveSize   | 4096    | Receive buffer size                                                                                                                               |
| DataEncryption | No      | Crypting of outgoing packets                                                                                                                      |
| BrokerTimeout  | 30      | Timeout for utilities to contact the broker                                                                                                       |
| ReceiveTimeout | 120     | Maximum time allowed for OpenLink Service Agents (JDBC_SV, ODBC_MV, PROXY_SV) to instigate a session with database agents (ora7_sv, inf7_mv etc.) |
|  RetryTimeout  | 5       | Initial retry interval in seconds. Doubles on failure to a maximum of 30 seconds                                                                  |

</div>

</div>

  

</div>

<div id="mt_zeroconfig" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.6. \[ZeroConf\]

</div>

</div>

</div>

<div id="id33564" class="decimalstyle">

**Table 17.6. **

<div class="decimalstyle-contents">

|    Parameter    | Default                          | Comment                       |
|:---------------:|----------------------------------|-------------------------------|
| \<ServiceName\> | \<Connection String Attributes\> | User defined ZeroConfig entry |

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                    |
|:--------------------------:|:-------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                          |
|                            | The <a href="mt_zerosrvconf.html#mt_zeroconfini" class="link"      
                              title="10.2.1. Configuration by Rule Book Edit">Zero Configuration  
                              Chapter</a>                                                         |

</div>

</div>

<div id="mt_security" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.7. \[Security\]

</div>

</div>

</div>

<div id="id33584" class="decimalstyle">

**Table 17.7. **

<div class="decimalstyle-contents">

|    Parameter    | Default                   | Comment                                                                                                                                                                                                                                                                                                                                         |
|:---------------:|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    StartupBy    | .\*                       | Users who can startup oplrqb                                                                                                                                                                                                                                                                                                                    |
|   ShutdownBy    | .\*                       | Users who can shutdown oplrqb                                                                                                                                                                                                                                                                                                                   |
|  ShutdownFrom   | localhost.\*,127\\0\\0\\1 | Hostnames that can shutdown                                                                                                                                                                                                                                                                                                                     |
|  ValidUidRange  | 0, 50000                  | Valid range for OpSysLogin                                                                                                                                                                                                                                                                                                                      |
|  TraceRulebook  |                           | Write merged rulebook (debug) Example: /tmp/debug.book                                                                                                                                                                                                                                                                                          |
| IncludeRulebook |                           | Name of file in current directory holding additional rulebook sections. (Example: generic.book). There may be more than one occurance of IncludeRulebook so multiple books can be included. The sections specified in the included files cannot overrule the sections contained in the main broker rulebook. Only unique sections are included. |

</div>

</div>

  

The StartupBy, ShutdownBy and ShutdownFrom parameters use full Regular
Expressions. Separate multiple expressions with a comma.

<div id="id33619" class="decimalstyle">

**Table 17.8. Regular Expression Examples**

<div class="decimalstyle-contents">

|    Expression     | Interpretation                                | Comment                                                                                       |
|:-----------------:|-----------------------------------------------|-----------------------------------------------------------------------------------------------|
|        .\*        | Any character, any number of times            | Any user or location.                                                                         |
|   localhost.\*    | localhost followed by zero or more characters | Will match: localhost, localhost2, localhost.company.com                                      |
|   127\\0\\0\\1    | exact IP 127.0.0.1                            | Current machine when HostNameResolver=No                                                      |
| .\*\\company\\com | Any text before .company.com                  | Used to match any sub domain of company.com. For example: sales.company.com, john.company.com |

</div>

</div>

  

</div>

<div id="mt_genericagent" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.8. \[generic_agentname\]

</div>

</div>

</div>

Each Database Agent will have a section that is typically called
"generic\_" followed by a database label. For example: \[generic_virt\],
\[generic_odbc\], \[generic_db2\].

<div id="id33648" class="decimalstyle">

**Table 17.9. **

<div class="decimalstyle-contents">

|   Parameter    | Default | Comment                                                                                                                             |
|:--------------:|---------|-------------------------------------------------------------------------------------------------------------------------------------|
|    Program     |         | name of the executable to run                                                                                                       |
|  Environment   |         | specify Environment section to use                                                                                                  |
|  CommandLine   |         | commandline options (optional)                                                                                                      |
| ServerOptions  |         | force dbms client specific options (optional)                                                                                       |
|   Directory    |         | where to chdir before starting the server                                                                                           |
|    Database    |         | force name of the database (optional)                                                                                               |
| ConnectOptions |         | force dbms specific connect options (optional)                                                                                      |
|     UserID     |         | force userid (optional)                                                                                                             |
|    Password    |         | force password (optional)                                                                                                           |
|    ReadOnly    | No      | force read-only mode (optional)                                                                                                     |
|   OpsysLogin   | No      | when set to Yes, the Request Broker will do an operating system login before spawning. This implies ReUse = ifsame user. (optional) |
|    NeedsCLI    |         | (VMS only) Use CLI to spawn the agent                                                                                               |
|     ReUse      | never   | Defines how an agent will be re-used. See below for details of the <a href="mt_rulebook.html#mt_reuse" class="link"                 
                            title="Agent ReUse parameter">ReUse Parameter</a>.                                                                                   |

</div>

</div>

  

For the CommandLine parameter, you can specify a selection of the
following options:

<div class="variablelist">

<span class="term">+noautocommit </span>  
This means that all connections routed (by the mapping rules) through
this agent section will have autocommit behaviour turned off. This is
useful if your client-side application relies on manual commits of its
transactions; you can define a mapping rule to match that application
and add +noautocommit while other applications use a different agent
section.

<span class="term">+maxrows </span>  
This defines the maximum number of rows to fetch from any query.

<span class="term">+initsql </span>  
Specifies a file with a set of SQL statements to execute immediately
each connection is established. For example, this might be useful to set
transaction isolation levels, if your application assumes them to be set
a specific way already.

<span class="term">+jetfix </span>  
This enables various workarounds for operation with the Microsoft Jet
Engine, e.g. through Access or MS Query. Particularly, the mapping of
datatypes may be changed for greater accuracy using these applications.

<span class="term">+norowsetlimit </span>  
This disables any rowset-size limit; it is useful in cursor operations
on large tables.

</div>

<div id="mt_reuse" class="section">

<div class="titlepage">

<div>

<div>

#### Agent ReUse parameter

</div>

</div>

</div>

<div id="id33735" class="decimalstyle">

**Table 17.10. **

<div class="decimalstyle-contents">

|    ReUse Value     | When is agent re-used                            |     |
|:------------------:|--------------------------------------------------|-----|
|       never        | never reuse this instance (default)              |     |
|       always       | always try to reuse this instance                |     |
|     upto \<n\>     | allow at most n connection to the same instance  |     |
|     ifreadonly     | allow only the read-only requests                |     |
|  ifsame database   | allow requests that alias to the same db.        |     |
|   ifsame process   | same calling process id (pid)                    |     |
|   ifsame options   | same connect options specified                   |     |
| ifsame application | if originated from same appl. alias              |     |
|    ifsame user     | if request for same username                     |     |
|   ifsame machine   | group connections from same machine              |     |
|    ifsame opsys    | group connections with compatible operating sys. |     |

</div>

</div>

  

</div>

</div>

<div id="mt_domainaliases" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.9. \[Domain Aliases\]

</div>

</div>

</div>

This section is used to change a domain name specified in the connect
string of a DNS with an internal alias. This alias is used in the first
colon delimited field of a mapping rule.

This example will map two different Progess domains to one agent. An
alternative is shown for mapping three different Oracle types to the one
Oracle agent.

``` screen
[Domain Aliases]
^Progress 90A$|^Progress 90B$ = pro90b
Oracle 9i                     = ora90
^Oracle 9.0$                  = ora90
^Oracle 9.0.x$                = ora90
```

</div>

<div id="mt_databasealiases" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.10. \[Database Aliases\]

</div>

</div>

</div>

This section will replace a database name specified in the connect
string of a DNS with an internal alias. This alias is used in the second
colon delimited field of a mapping rule.

This example looks for a substring 'demo' and will replace with an alias
of 'demo'. Thus anydemo, demo, demo123 are all matched, and converted to
demo.

``` screen
[Database Aliases]
demo = demo
```

</div>

<div id="mt_useraliases" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.11. \[User Aliases\]

</div>

</div>

</div>

This section will replace a user name specified in the connect string of
a DNS with an internal alias. This alias is used in the third colon
delimited field of a mapping rule.

The example below shows how certain users or an empty user are handled.
In this case they are rejected.

``` screen
[User Aliases]
scott|system = insecure
^$           = blank
[Mapping Rules]
*:*:blank:*:*:*:rw     = reject You should specify a username
*:*:insecure:*:*:*:rw  = reject The user is not allowed
```

</div>

<div id="mt_opsysaliases" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.12. \[Opsys Aliases\]

</div>

</div>

</div>

This section will replace an operating system indentifier with an
internal alias. This alias is used in the fourth colon delimited field
of a mapping rule.

This example will map anything containing the substring 'java' to an
alias of 'java'. Two variations of windows are given an alias of
'msdos'. Everything else will be matched to .\* so it is mapped to the
alias 'other'.

``` screen
[Opsys Aliases]
java        = java
win32|msdos = msdos
.*          = other
```

</div>

<div id="mt_rbmachinealiases" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.13. \[Machine Aliases\]

</div>

</div>

</div>

This section will replace a machine name with an internal alias. This
alias is used in the fifth colon delimited field of a mapping rule.

This example will map two different machine names to one of 'adminpc'.
Also anything containing the word 'sales' such as mysales, sales, sales2
is then mapped to 'sales' alias.

``` screen
[Machine Aliases]
fredspc|johnspc    = adminpc
sales              = sales
```

</div>

<div id="mt_applicationaliases" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.14. \[Application Aliases\]

</div>

</div>

</div>

This section will replace the application name with an internal alias.
This alias is used in the sixth colon delimited field of a mapping rule.

This example would match MSACCESS (a program requiring the Jet option),
and map it to an alias of jet. The second alias mapping would match
various Office applications and convert them to a single alias.

``` screen
[Application Aliases]
MSACCESS           = jet
MSQRY.*|EXCEL|WORD = msoffice
```

</div>

<div id="mt_mappingrules" class="section">

<div class="titlepage">

<div>

<div>

### 17.1.15. \[Mapping Rules\]

</div>

</div>

</div>

This section is used to determine which agent shall handle the incoming
request. The mapping rules are checked once all the alias mappings have
been performed. Each mapping rule is tried from top to bottom until a
match with the current parameters has been found. There is no regular
expression or glob handling in the mapping rules. The 7 colon delimited
mapping parameters must each match up exactly. There is a special
mapping rule of '\*' that denotes a dont care parameter. Do not confuse
this special '\*' with the regular expression '\*', or glob '\*'.It is
not possible to use the '\*' with any other text such as 'demo\*'.

On the right side of the '=' is either an accept, or reject statement.
The accept statment has the word 'accept' followed by the section name
that identifies the agent. A reject statement has the word 'reject'
followed by a text string that is the error message reported to the
client.

This is an example mapping section.

``` screen
[Mapping Rules]
;*:*:blank:*:*:*:rw     = reject You should specify a username and password
*:*:Admin:msdos:*:jet:* = reject Admin user account is not registered
sql2000:*:*:*:*:*:*     = accept generic_sql2000
ora81:*:*:*:*:jet:*     = reject The Oracle 8 Database Agent is not configured for jet
*:*:*:java:*:*:*        = accept jodbc_client
```

Here is a snippet of the debug output showing how a request is shown to
be matched.

``` screen
request: domain=Oracle 8.1 database=db serveropts=
connectopts= user=scott opsys=win32 readonly=0
application=ODBCAD32 processid=520
solve mapping: ora8sv:db:scott:win32:MASTERSRVR:ODBCAD32:rw
using mapping: ora8sv:*:*:*:*:*:*
```

</div>

</div>
