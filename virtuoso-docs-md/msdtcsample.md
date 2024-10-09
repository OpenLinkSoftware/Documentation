<div>

<div>

<div>

<div>

### 4.2.4. MS DTC ODBC Sample Application

</div>

</div>

</div>

The MS DTC demo is located in the

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc\MSDTCdemo1
```

folder. This demo shows usage of distributed transactions driven by MS
DTC through the ODBC API.

<div>

<div>

<div>

<div>

#### Setup

</div>

</div>

</div>

The sample works with two instances of Virtuoso server. The running MS
DTC service is needed. The servers must be started with MS DTC support
(see Virtuoso documentation).

First of all, edit the virt.odbc file. By default this file contains two
connection strings of local Virtuoso servers running on port 1111 and
port 1112, Each line begins with connection string to appropriate
Virtuoso server. Initially this file contains the following lines:

``` programlisting
1111 dba dba 00.sql
1112 dba dba 01.sql 
                 
```

where 1111, 1112 are ports of two Virtuoso servers. "dba dba" - user and
password.

</div>

<div>

<div>

<div>

<div>

#### Initialization

</div>

</div>

</div>

Start

``` programlisting
 mtstest.exe +load 
```

in the

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc\MSDTCdemo1
```

folder. This must check whether all needed servers are running, create
and initialize tables, procedures, etc.

</div>

<div>

<div>

<div>

<div>

#### Test

</div>

</div>

</div>

Run the command in the demo's working directory:

``` programlisting
 
mtstest.exe   +exec N
mtstest.exe   +exec 0
             
```

where N - is a number of test iterations. The second command checks
logical consistency of the tables.

</div>

<div>

<div>

<div>

<div>

#### Description

</div>

</div>

</div>

The demo source is

``` programlisting
start.c
```

file in the

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc\MSDTCdemo1
```

directory. Several highlights of the most significant parts of code are
presented below:

``` programlisting
  ITransactionDispenser *disp;
  ITransaction *transaction;

  ...
  HRESULT hr =
      DtcGetTransactionManagerC (0, 0, &IID_ITransactionDispenser, 0, 0, 0,
      &, disp);
             
```

The code above creates Dispenser object which represents the local
instance of MS DTC. If MS DTC is not available

``` programlisting
DtcGetTransactionManagerC
```

fails. The Dispenser is needed to create distributed transaction objects
later.

Begin new distributed transaction:

``` programlisting
disp->lpVtbl->BeginTransaction (disp, 0, ISOLATIONLEVEL_ISOLATED,
      0, 0, &transaction);               
             
```

Enlist connection in the transaction:

``` programlisting
SQLSetConnectOption (hdbc, SQL_COPT_SS_ENLIST_IN_DTC,
      (DWORD) transaction);
             
```

And, finally, commit the transaction:

``` programlisting
transaction->lpVtbl->Commit (tran, 0, 0, 0);
             
```

</div>

</div>
