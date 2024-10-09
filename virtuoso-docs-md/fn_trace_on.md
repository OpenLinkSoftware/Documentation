<div>

<div>

</div>

<div>

## Name

trace_on — Enable extra debug logging

</div>

<div>

## Synopsis

<div>

|                              |                              |
|------------------------------|------------------------------|
| `integer `**`trace_on`**` (` | in `parameter ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function enables logging specified server operations for debugging
purposes. The log entries will be shown at the server console (if
started with foreground option) and will be written into the server
message log file. The traceable events are divided into several groups:
user activity, transactions, compilation of the SQL statements, DDL
statements, statements execution and VDB actions.

</div>

<div>

## Parameters

The following options are available for logging:

|                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*user_names* </span> - include the full user name, otherwise user ID will be logged.                                                                           |
| <span class="emphasis">*user_log* </span> - log the connects/disconnects for users.                                                                                                   |
| <span class="emphasis">*failed_log* </span> - log incorrect logins.                                                                                                                   |
| <span class="emphasis">*compile* </span> - log the names of procedures / triggers name compiled.                                                                                      |
| <span class="emphasis">*ddl_log* </span> - log the DDL statements execution.                                                                                                          |
| <span class="emphasis">*client_sql* </span> - log the compilation of the client's SQL statements (first 500 chars).                                                                   |
| <span class="emphasis">*errors* </span> - log all server errors.                                                                                                                      |
| <span class="emphasis">*dsn* </span> - log the connection/disconnection to DSNs, registration and removal of the DSNs, compilation of the SQL statements executed thru the VDB.       |
| <span class="emphasis">*sql_send*</span> - log the compilation of SQL statements executed thru the VDB.                                                                               |
| <span class="emphasis">*transact* </span> - log the transactions.                                                                                                                     |
| <span class="emphasis">*remote_transact* </span> - log the remote transactions.                                                                                                       |
| <span class="emphasis">*exec* </span> - log SQL statement execution.                                                                                                                  |
| <span class="emphasis">*soap* </span> - log SOAP server requests and responses.                                                                                                       |
| <span class="emphasis">*thread* </span> - log THRD_1 %ld OS threads freed. This is when OS threads are freed due to inactivity (being idle for more than ThreadCleanupInterval time). |
| <span class="emphasis">*cursor* </span> - log CURS\_\[0-9\] - various VDB statements actions.                                                                                         |

</div>

<div>

## Return Types

Upon success zero will be returned, otherwise an error is signalled.

The message log file and/or server debug screen will list details for
activated log options. The formats are as follows:

``` screen
USER_0 (user) (IP) (peer) logout
USER_1 (user) (IP) (peer) login
```

``` screen
FAIL_0 (user) (IP) (peer)
```

``` screen
COMP_0 (user) (IP) (peer) trigger (name)
COMP_1 (user) (IP) (peer) procedure (name)
```

``` screen
DDLC_0 (user) (IP) (peer) Create table (name)
DDLC_1 (user) (IP) (peer) Drop table (name)
DDLC_2 (user) (IP) (peer) Create procedure (name)
DDLC_3 (user) Drop procedure (name)
DDLC_4 (user) Create view (name)
DDLC_5 (user) Create index (name) or (table name)
DDLC_6 (user) Drop index (name) or (table name)
DDLC_7 (user) Rename table (new name) or (old name)
DDLC_8 (user) Create trigger (name) or (table name)
DDLC_9 (user) drop trigger (name) or (table name)
```

``` screen
CSLQ_0 (user) (IP) (peer) (sql)
```

``` screen
ERRS_0 (code) (server code) (error text)
```

``` screen
DSNL_0 (dsn) (sql)
DSNL_1 Disconnecting DSN (name)
DSNL_2 (user) (IP) Registration remote data source (name)
DSNL_3 (user) Disconnect remote data source (name)
```

``` screen
DSNS_0 (dsn) (sql) (prepare)
DSNS_1 (dsn) (sql) (execute)
```

``` screen
LTRS_0 (user) (from) (peer) Begin transact tnx
LTRS_1 (user) (from) (peer) (Commit / Rollback) transact txn
LTRS_2 (user) (from) (peer) Restart transact txn
```

``` screen
RTRS_0 (user) (from) (peer) (dsn) Begin transact tnx autocommit: (on/off)
RTRS_1 (user) (from) (peer) (dsn) (Commit / Rollback) transact tnx autocommit: (on/off)
```

``` screen
EXEC_0 (user) (from) (peer) Exec cursor (stmt)
EXEC_1 (user) (from) (peer) (stmt) Exec (n) time(s)
```

``` screen
SOAP_0 (request)
SOAP_1 (response)
```

</div>

<div>

## Errors

<div>

**Table 24.83. Errors signalled by `trace_on `**

<div>

| SQLState                              | Error Code                            | Error Text                                                            |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------|
| <span class="errorcode">22005 </span> | <span class="errorcode">SR322 </span> | <span class="errortext">"option" is not valid trace_on option </span> |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.422. Simple example**

<div>

To show users logging in to the server and failed user logins

``` screen
SQL> trace_on ('user_log', 'failed_log');

Done. -- 0 msec.
SQL>

The server console  and log file may thus contain lines such as:
...
17:17:24 Server online at 1111 (pid 2173)
17:17:36 USER_0 0 xxx.xx.xx.xxx 1111:2 logout
17:17:40 USER_1 0 xxx.xx.xx.xxx 1111:3 login
17:17:45 USER_0 0 xxx.xx.xx.xxx 1111:3 logout
17:18:04 FAIL_0 dba xxx.xx.xx.xxx
...
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_trace_off.html" class="link" title="trace_off"><code
class="function">trace_off() </code></a>

<a href="fn_trace_status.html" class="link" title="trace_status"><code
class="function">trace_status() </code></a>

</div>

</div>
