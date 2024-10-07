<div id="xaservexample" class="section">

<div class="titlepage">

<div>

<div>

## 22.5. Service example

</div>

</div>

</div>

``` programlisting
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
```

</div>
