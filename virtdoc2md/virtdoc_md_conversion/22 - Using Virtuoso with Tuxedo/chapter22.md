# Using Virtuoso with Tuxedo

<!--- TOC: Start --->

#### Contents

  * [Building the Transaction Manager Server](#id1-building-the-transaction-manager-server)
  * [Configuration](#id2-configuration)
  * [Services](#id3-services)
    * [Introduction](#id4-introduction)
    * [VQL functions](#id5-vql-functions)
    * [Services concept](#id6-services-concept)
    * [OPENINFO](#id7-openinfo)
  * [Clients](#id8-clients)
  * [Service example](#id9-service-example)

<!--- TOC: End --->
<a id="id1-building-the-transaction-manager-server"></a>
# Building the Transaction Manager Server

First of all, the administrator needs to build Virtuoso Transaction
Manager Server application in order to use Virtuoso server as Resource
Manager of global transactions operated by Tuxedo.

Then, the following line needs to be put in the $TUXDIR/udataobj/RM
file:

``` 
            Virtuoso:virt_xa_switch: libvirtxa.a -L${HOME}/lib  -lwic -ldk1t -lthrp -lutil2 -L${SSLDIR}/lib -lssl -lcrypto
        
```

The libvirtxa.a library could be found in tuxedo/lib directory.

This allows to build TP monitor with Virtuoso support (VirtTMS) and
services which could use Virtuoso as resource manager. libvirtxa.a and
other libraries must be accessible by the compiler. The following
command builds the VirtTMS:

``` 
            buildtms -o ${TUXDIR}/bin/VirtTMS -r Virtuoso
        
```

<a id="id2-configuration"></a>
# Configuration

In order to use Virtuoso as resource manager the UBB config file (Tuxedo
main configuration file) must contain reference to VirtTMS. The
following example of UBB config file configures two services and two
virtuoso servers (resource managers) behind them.

    *RESOURCES
    IPCKEY          52617
    DOMAINID        qsample
    MASTER          NODE
    MODEL           SHM
    #
    *MACHINES
    #
    NODE
            LMID = NODE
            TUXDIR = "TUXEDODIR"
            TUXCONFIG = "SERVDIR/tuxconfig"
            TLOGDEVICE ="SERVDIR/tuxconfig"
            TLOGSIZE=10
            APPDIR = "SERVDIR"
            ULOGPFX = "SERVDIR/ULOG"
    *GROUPS
    
    DEFAULT:        TMSNAME=VirtTMS TMSCOUNT=2 LMID=NODE
    GROUP1  GRPNO=1 OPENINFO = "Virtuoso:dba:dba@NODE:1111"
    GROUP2  GRPNO=2 OPENINFO = "Virtuoso:dba@NODE:1112"
    
    *SERVERS
    #
    DEFAULT:        CLOPT="-A"
    VirtRMtest      SRVGRP=GROUP1 SRVID=1
    # VirtRMtest    SRVGRP=GROUP2 SRVID=1
    
    # VirtRMtest2   SRVGRP=GROUP1 SRVID=2
    VirtRMtest2     SRVGRP=GROUP2 SRVID=2
    
    #server         SRVGRP=GROUP1 SRVID=1
    *SERVICES
    DEFAULT:        LOAD=50
    VRMTEST         PRIO=50
    VRMTEST2        PRIO=50

<a id="id3-services"></a>
# Services

<a id="id4-introduction"></a>
## Introduction

The services (in the Tuxedo's term) are special programs which implement
business logic. The services could be in the context of a global XA
transaction, in this case 2PC control will be set in motion. Each
service which uses Virtuoso as resource manager has hdbc connection to
the Virtuoso server. This connection is automatically opened when
service activated. The connection string (OPENINFO) to the Virtuoso
server is the connection string of the group of the service (see GROUPS
section in the sample config file). The OPENINFO has the following
format: "Virtuoso:user:password@NODENAME:port". The user,password and
port are optional.

<a id="id5-vql-functions"></a>
## VQL functions

VQL functions are used to receive access to hdbc for further work with
the Virtuoso server. Only HDBCs received by the VQL functions are
operated in the context of the distributed transactions.

``` 
                int vql_get_connection (HDBC * hdbc, int type);
            
```

returns result of setting hdbc to current hdbc connection. "type"
argument indicates which hdbc is to select, currently only
VQL\_CTX\_TYPE is supported, other values are reserved.

``` 
            int vql_get_env (HENV * env);
            
```

returns result of setting current ODBC environment.

Header: vql\_client.h

Library: libvirtxa.a

<a id="id6-services-concept"></a>
## Services concept

Each service has an entry point (some function), which is supposed to
perform the application task. The result of whole transaction depends on
result of the service's entry function. The scenario of typical workflow
is as follows:

  - client begins global transaction by ATMI tpbegin() call,

  - client calls the service N1 to update some tables on the first
    Virtuoso server (resource manager),

  - client calls the service N2 to update some tables on the second
    Virtuoso server (resource manager),

  - client finishes global transaction by either tpcommit() or tpabort()
    call of ATMI.

The tx\_\* functions also could be used, See TUXEDO TxRPC related or
ORACLE XA documentation.

  - tx\_begin()

  - tx\_commit()

  - tx\_open()

Services can be built with the following command:

    buildserver -v -f virt_service1.o -o VirtService1 -r Virtuoso -s VService1

where "virt\_service1.o" is the service object file which contains
VService1 entry function. "-r Virtuoso" indicates that service must be
assembled with Virtuoso XA support library.

<a id="id7-openinfo"></a>
## OPENINFO

OPENINFO is necessary for services to connect to the certain Virtuoso
server. OPENINFO for the services (see GROUPS section in the example)
consists of 2 parts: "Virtuoso" term and connection string. Connection
string provides the service name, password, server and port of Virtuoso
server. Common format of connection string is
\[USER\[:PASSWORD\]\]@SERVER\[:PORT\]. Only the SERVER name is required,
the others are optional.

<a id="id8-clients"></a>
# Clients

There are no special requirements for the clients of services which use
Virtuoso as resource manager. See Tuxedo 8.x documentation

<a id="id9-service-example"></a>
# Service example

    #include <stdio.h>
    #include <time.h>
    
    #include <xa.h>
    #include <atmi.h>
    #include <userlog.h>
    
    #include "vql_client.h"
    
    #include <libudbc.h>
    #ifndef SQL_SUCCEEDED
    #define SQL_SUCCEEDED(rc) (((rc)&(~1))==0)
    #endif
    
    #define MAXNAME SQL_MAX_DSN_LENGTH
    
    int sql_exec (HDBC hdbc, char* text);
    
    /* VirtRM test service */
    int
    tpsvrinit(int argc, char *argv[])
    {
      if (tpopen () == -1)
        {
          userlog ("tpsrvinit: could not open RM, %s\n", tpstrerror (tperrno));
          return -1;
        }
      /* userlog writes to the central TUXEDO message log */
      userlog("Welcome to the VirtRMtest server");
      return 0;
    }
    
    int
    tpsrvdone()
    {
      if (tpclose () == -1)
        {
          userlog ("tpsrvinit: could not close RM, %s\n", tpstrerror (tperrno));
          return -1;
        }
      /* userlog writes to the central TUXEDO message log */
      userlog("By!! the VirtRMtest server");
      return 0;
    }
    
    static void
    DoSQLError (HDBC hdbc, HSTMT hstmt);
    
    #define CHECK_RC(rc) \
        if (!SQL_SUCCEEDED (rc)) { DoSQLError (hdbc, stmt); return -1; };
    
    int sql_exec (HDBC hdbc, char* text)
    {
      RETCODE rc;
      HSTMT stmt;
    
      rc = SQLAllocStmt (hdbc, &stmt);
      CHECK_RC(rc);
    
      rc = SQLExecDirect (stmt, text, SQL_NTS);
      CHECK_RC(rc);
    
      SQLFreeStmt (stmt, SQL_DROP);
      return 0;
    }
    
    void
    VRMTEST(TPSVCINFO *rqst)
    {
      HDBC hdbc;
      int rc;
    
      rc = vql_get_connection (&hdbc, VQL_CTX_TYPE);
      if (rc != VQL_SUCCESS)
        {
    #ifdef TMS_TRACE
          userlog ("AP[%d]: vql_get_connection error %d\n", getpid(), rc);
    #endif
          goto _fail;
        }
      rc = sql_exec (hdbc, "UPDATE sal set amount = amount + 10 where name = 'jfk'");
      if (rc == -1)
        {
    #ifdef TMS_TRACE
          userlog ("AP[%d]: vql_get_connection error %d\n", getpid(), rc);
    #endif
          goto _fail;
        }
    
      userlog ("AP[%d]: exec sql succ.\n", getpid());
    
      tpreturn(TPSUCCESS, 0, rqst->data, 0L, 0);
      return;
    
     _fail:
      userlog ("FAILED: exec sql.\n");
      tpreturn(TPFAIL, 0, rqst->data, 0L, 0);
      return;
    }
    
    void
    VRMTEST2(TPSVCINFO *rqst)
    {
      HDBC hdbc;
      int rc;
    
      rc = vql_get_connection (&hdbc, VQL_CTX_TYPE);
      if (rc != VQL_SUCCESS)
        goto _fail;
    
      rc = sql_exec (hdbc, "UPDATE sal set amount = amount - 10 where name = 'jfk'");
      if (rc == -1)
        goto _fail;
    
      userlog ("AP[%d]: exec sql succ.\n", getpid());
    
      tpreturn(TPSUCCESS, 0, rqst->data, 0L, 0);
      return;
    
     _fail:
      userlog ("AP[%d]: service #2 error %d\n", getpid(), rc);
      tpreturn(TPFAIL, 0, rqst->data, 0L, 0);
      return;
    
      tpreturn(TPSUCCESS, 0, rqst->data, 0L, 0);
    }
    
    #define MSG_BUF_SIZE 300
    
    static void
    DoSQLError (HDBC hdbc, HSTMT hstmt)
    {
      UCHAR szSqlState[MSG_BUF_SIZE];
      UCHAR szErrorMsg[MSG_BUF_SIZE];
    
      SQLINTEGER fNativeError = 0;
      SWORD cbErrorMsg = MSG_BUF_SIZE;
      RETCODE rc;
      HENV env;
    
    #ifndef TMS_TRACE
      return;
    #else
      vql_get_env (&env);
    
      rc = SQLError (env,
          hdbc,
          hstmt,
          szSqlState, &fNativeError, szErrorMsg, MSG_BUF_SIZE, &cbErrorMsg);
    
      if (rc != SQL_NO_DATA_FOUND || rc != SQL_ERROR)
        {
          if (fNativeError != 0x1645)   // ignore change database to master context message
        {
          userlog ("SqlState: %s, fNativeError: %x m=%s\n", szSqlState,
               fNativeError, szErrorMsg);
        }
        }
      else
        {
          userlog ("SQLError() failed: %x, NO_DATA_FOUND OR SQL_ERROR\n", rc);
        }
      return;
    #endif
    }
