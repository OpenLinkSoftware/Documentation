<div id="mt_oraconpoolmtspecific" class="section">

<div class="titlepage">

<div>

<div>

## 3.7. Multi-Tier-specific Connection-Pooling

</div>

</div>

</div>

<div id="mt_oraconcpoolmt" class="section">

<div class="titlepage">

<div>

<div>

### 3.7.1. Multi-Tier-specific configuration

</div>

</div>

</div>

The required parameters are configured through environment-variables -
either use the web-based Administrative Assistant (normally located at
\<http://server:8000/\>) navigating through \`Server Components
Administration', \`Database Agent Administration', \`Database Agent
Settings by Form', select the name of the agent section used, and scroll
to the section \`OpenLink Agent Startup Parameters', or edit the
rulebook file (oplrqb.ini) directly, to assert settings for the
OCI_CONNPOOL\_\* settings below:

``` programlisting
[Environment ORACLE90]
ORACLE_HOME        = /dbs/oracle90
ORACLE_SID         = ORCL
;ORACLE_SERVER      = T
;TWO_TASK           = P:
;ODBC_CATALOGS      = Y         ; Uncomment after loading odbccat9.sql
;MULTIPLEX_LDA      = 5         ; Allow 5 OpenLink clients on a single lda
;OPL_USR_TBLS_FIRST = Y         ; Sort SQLTables starting with user tables
SHOW_REMARKS       = N  ; Retrieve SQLColumns REMARKS field
CURSOR_SENSITIVITY = LOW        ; Set to HIGH after loading odbccat9.sql
;OCI_PREFETCH_ROWS  = 100       ; Number of rows to prefetch
;OCI_PREFETCH_MEMORY = 65535    ; Amount of memory to use for prefetching
;LD_LIBRARY_PATH = /dbs/oracle81/lib    ; Find shared libraries
;SHLIB_PATH      = /dbs/oracle81/lib    ; Find HP/UX shared libraries
;LIBPATH         = /dbs/oracle81/lib    ; Find AIX shared libraries
;NLS_LANG        = AMERICAN_AMERICA.UTF8 ; Uncomment for Unicode connections
OCI_CONNPOOL_MIN = 0         ; minimum initial connections in pool
OCI_CONNPOOL_INCR = 1        ; number of new connections when others busy
OCI_CONNPOOL_MAX = 1         ; sum of MIN+INCR
OCI_CONPOOL_WAIT = TRUE      ; whether new query waits or errors when all busy
OCI_CONNPOOL_LINGER = 0      ; seconds to linger after last connection cleared
```

OCI connection pooling is disabled by setting a minimum connection pool
size of 0.

</div>

</div>
