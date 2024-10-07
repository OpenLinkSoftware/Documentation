<div id="lite_dnetconnstr" class="section">

<div class="titlepage">

<div>

<div>

## 6.3. OpenLink .NET Data Providers Connect String Attributes

</div>

</div>

</div>

This section details the Connect string attributes an ADO.Net
application can pass to the OpenLink .Net Data Providers when attempting
a connection to a remote database.

<div id="lite_dnetmconnstr_opl" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.1. Managed Generic Multi-Tier .NET Data Provider (OpenLink.Data.GenericClient)

</div>

</div>

</div>

The tables below provides a list of the Connect String Attributes for
the Data Provider:

<div id="id45085" class="decimalstyle">

**Table 6.3. Connection String Keywords for the Generic .Net Provider**

<div class="decimalstyle-contents">

| Keyword                                     | Default Value   |     |
|:--------------------------------------------|-----------------|-----|
| Used ID or UID                              | \[""\]          |     |
| Password or PWD                             | \[""\]          |     |
| Initial Catalog or DATABASE                 | \[""\]          |     |
| Connect Timeout or Connection Timeout       | \[15\]          |     |
| Persist Security Info                       | \[False\]       |     |
| Connection Lifetime                         | \[0\]           |     |
| Min Pool Size                               | \[0\]           |     |
| Max Pool Size                               | \[100\]         |     |
| Persist Security Info                       | \[False\]       |     |
| Pooling                                     | \[True\]        |     |
| Charset                                     | \["\]           |     |
| Host                                        | \[localhost\]   |     |
| Port                                        | \[5000\]        |     |
| Read Only or ReadOnly                       | \[False\]       |     |
| Fetch Buffer Size or FBS or FetchBufferSize | \[100\]         |     |
| Server Type or ServerType or SVT            | \[""\]          |     |
| Defer Long Fetch or DLF or DeferLongFetch   | \[False\]       |     |
| Encrypted                                   | \[False\]       |     |
| Options                                     | \[""\]          |     |
| Defer Long Fetch or DLF or DeferLongFetch   | \[False\]       |     |
| UNICODE                                     | \[False\]       |     |
| APPLICATION                                 | \["opldotNET"\] |     |

</div>

</div>

  

Sample connect string :

``` programlisting
    For Oracle 9 :
        "Host=localhost;Port=5000;SVT=Oracle 9.x;DATABASE=ORCL;UID=scott;PWD=tiger;
    For SQLServer2000:
        "Host=localhost;Port=5000;SVT=SQLServer 2000;DATABASE=Northwind;UID=sa;PWD=;
    
```

</div>

<div id="lite_dnetmconnstr_sqlserver" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.2. Managed Microsoft SQLServer .NET Data Provider (OpenLink.Data.SQLServer)

</div>

</div>

</div>

The tables below provides a list of the Connect String Attributes for
the Data Provider:

<div id="id45165" class="decimalstyle">

**Table 6.4. Connection String Keywords for the Microsoft SQLServer .Net
Provider**

<div class="decimalstyle-contents">

| Keyword                               | Default Value                |     |
|:--------------------------------------|------------------------------|-----|
| Used ID or UID                        | \[""\]                       |     |
| Password or PWD                       | \[""\]                       |     |
| Initial Catalog or DATABASE           | \[""\]                       |     |
| Connect Timeout or Connection Timeout | \[15\]                       |     |
| Persist Security Info                 | \[False\]                    |     |
| Connection Lifetime                   | \[0\]                        |     |
| Min Pool Size                         | \[0\]                        |     |
| Max Pool Size                         | \[100\]                      |     |
| Persist Security Info                 | \[False\]                    |     |
| Pooling                               | \[True\]                     |     |
| Charset                               | \["\]                        |     |
| Host                                  | \[localhost\]                |     |
| Port                                  | \[1433\]                     |     |
| Packet Size or PktSize                | \[8192\] for SQLServer7/2000 |     |
| SrvName or Server or Server Na        | \[""\]                       |     |
| Server Type or ServerType or SVT      | \["SQLSERVER6"\]             |     |
| WorkstationId or Workstation Id       | \["localhost\]               |     |
| UNICODE                               | \[False\]                    |     |
| APPLICATION                           | \["opldotNET"\]              |     |
| UseBrowseMode                         | \["false"\]                  |     |

</div>

</div>

  

The following Keyword default values change for the SQLServer Provider :

``` programlisting
    UseBrowseMode=false - the SQLParser is used for parsing Select queries and getting the accurate information
    for following schema table columns (returned by IDataReader.GetSchemaTable).
    UseBrowseMode=true -  the "SET no_browsetable ON" comand is used with Select queries for getting the names
    and for accurate information for following schema table columns (returned by IDataReader.GetSchemaTable).
         Note that the MS SQLServer ADO.NET provider uses the "SET no_browsetable ON" mode.
    The property SVT or ServerType supports the following values:
    "SQLServer 7" or "SQLServer7" (TDS7 protocol is used)
    "SQLServer 2000" or "SQLServer2000" (TDS8 protocol is used)
    "SQLServer 6"  or "SQLServer 6.x"  or "SQLServer"  or "SQLServer6"(TDS4.2 protocol is used)
    Any another values (TDS4.2 protocol is used)
    Sample connection string:
        "SVT=SQLServer 2000;DATABASE=Northwind;Host=localhost;Port=1433UID=sa;PWD=;
    
```

</div>

<div id="lite_dnetmconnstr_sybase" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.3. Managed Sybase .NET Data Provider (OpenLink.Data.Sybase)

</div>

</div>

</div>

The tables below provides a list of the Connect String Attributes for
the Data Provider:

<div id="id45239" class="decimalstyle">

**Table 6.5. Connection String Keywords for the Sybase .Net Provider**

<div class="decimalstyle-contents">

| Keyword                               | Default Value   |     |
|:--------------------------------------|-----------------|-----|
| Used ID or UID                        | \[""\]          |     |
| Password or PWD                       | \[""\]          |     |
| Initial Catalog or DATABASE           | \[""\]          |     |
| Connect Timeout or Connection Timeout | \[15\]          |     |
| Persist Security Info                 | \[False\]       |     |
| Connection Lifetime                   | \[0\]           |     |
| Min Pool Size                         | \[0\]           |     |
| Max Pool Size                         | \[100\]         |     |
| Persist Security Info                 | \[False\]       |     |
| Pooling                               | \[True\]        |     |
| Charset                               | \["\]           |     |
| Host                                  | \[localhost\]   |     |
| Port                                  | \[4100\]        |     |
| Packet Size or PktSize                | \[512\]         |     |
| SrvName or Server or Server Na        | \[""\]          |     |
| Server Type or ServerType or SVT      | \["SYBASE4"\]   |     |
| WorkstationId or Workstation Id       | \["localhost\]  |     |
| UNICODE                               | \[False\]       |     |
| APPLICATION                           | \["opldotNET"\] |     |

</div>

</div>

  

The following Keyword default values change for the SQLServer Provider :

``` programlisting
    The property SVT or ServerType supports the following values:
        "Sybase 10"  or "Sybase10" (TDS5 protocol is used)
        "Sybase 11"  or "Sybase11" (TDS5 protocol is used)
        "Sybase 12"  or "Sybase12"  or "Sybase12.x" (TDS5 protocol is used)
    Any another values (TDS4.2 protocol is used)
    Sample connection string:
        "SVT=Sybase 12;DATABASE=pubs2;Host=localhost;Port=4100;UID=sa;PWD=;
    
```

</div>

<div id="lite_dnetuconnstr" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.4. Unmanaged .NET Data Provider (OpenLink.Data.OdbcClient)

</div>

</div>

</div>

The tables below provides a list of the Connect String Attributes for
the Unmanaged (ODBC based) Data Provider:

<div id="id45310" class="decimalstyle">

**Table 6.6. Connection String Keywords**

<div class="decimalstyle-contents">

| Keyword | Default Value |     |
|:--------|---------------|-----|
| DSN     | \[""\]        |     |
| UID     | \[""\]        |     |
| PWD     | \[""\]        |     |

</div>

</div>

  

``` programlisting
   Sample connect string:
    - Oracle ODBC DSN
       "DSN=Oracle;UID=scott;PWD=tiger"
    where 'Oracle' is the name of a valid ODBC DSN for connecting to an Oracle Database
   
```

</div>

</div>
