<div>

<div>

<div>

<div>

### 11.15.2. Responding to Distributed Transactions

</div>

</div>

</div>

In this situation a distributed transaction is initiated by an ODBC
client of Virtuoso. The application enlists one or more Virtuoso hdbcs
in an OLE/DB distributed transaction, and then works with that hdbcs and
commits or rolls back the distributed transaction.

c++ example:

``` programlisting
/* begin of example */
  ITransaction* transaction;
  ITransactionDispenser* disp;
  HRESULT hr =
      DtcGetTransactionManager (0, 0, &IID_ITransactionDispenser, 0, 0, 0,
      &disp);
  hr = disp->BeginTransaction (0, ISOLATIONLEVEL_ISOLATED,
      0, 0, &transaction); /* initialize transaction */
  SQLSetConnectOption (hdbc1, SQL_COPT_SS_ENLIST_IN_DTC,
      (DWORD) transaction); /* enlist 1st hdbc in transaction */
  SQLSetConnectOption (hdbc2, SQL_COPT_SS_ENLIST_IN_DTC,
      (DWORD) transaction); /* enlist 2nd hdbc in transaction */

  ..... /* some work with ODBC connections */

  transaction->Commit (0, 0, 0); /* commit the transaction */
/* end of example */
```

If a Virtuoso connection is enlisted into a distributed transaction
managed by MS DTC, and a Virtuoso statement executed in this transaction
accesses attached tables, or otherwise uses other databases, then
Virtuoso automatically enlists these remote databases into the original
distributed transaction. If the remote database does not support MS DTC,
then it signals the special error (see error list below).

For more information, see Microsoft's documentation for MTS and OLE DB.

If you want Virtuoso to start connected to MTS, add the following string
in the \[VDB\] section of virtuoso.ini file:

``` programlisting
UseMTS = 1
```

<div>

|                            |                                                                                              |
|:--------------------------:|:---------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See also:                                                                                    |
|                            | <a href="fn_mts_connect.html" class="link"                                                   
                              title="mts_connect">mts_connect</a> , <a href="fn_mts_status.html" class="link"               
                              title="mts_status">mts_status</a> , <a href="fn_mts_set_timeout.html" class="link"            
                              title="mts_set_timeout">mts_set_timeout</a> , <a href="fn_mts_get_timeout.html" class="link"  
                              title="mts_get_timeout">mts_get_timeout</a> .                                                 |

</div>

</div>
