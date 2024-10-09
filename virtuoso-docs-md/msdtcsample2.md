<div>

<div>

<div>

<div>

### 4.2.5. MS DTC OLE DB Sample Application

</div>

</div>

</div>

The MS DTC OLE DB demo is located in the

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc\MSDTCdemo2
```

folder. This demo shows usage of distributed transactions driven by MS
DTC through OLE DB.

<div>

<div>

<div>

<div>

#### Setup

</div>

</div>

</div>

The sample works with two instances of Virtuoso server. Running MS DTC
service is needed. The servers must be started with MS DTC support (see
Virtuoso documentation).

The test needs two Virtuoso server instances running on ports 1111 and
1112

</div>

<div>

<div>

<div>

<div>

#### Run

</div>

</div>

</div>

Run the command in the demo's working directory:

``` programlisting
 
voledbtest.exe
             
```

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
voledbtest.cs
```

file in the

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc\MSDTCdemo
```

directory. Several highlights of the most significant parts of code are
presented below:

``` programlisting
[TransactionAttribute(TransactionOption.Required)]               
             
```

It is significant to set this attribute of class to enable automatic
transaction initialization.

Create connections to appropriate servers:

``` programlisting
string strConn = "Provider=VIRTOLEDB;Data Source=" + dsn1 
    + ";User Id=dba;Password=dba;Initial Catalog=Demo;Prompt=NoPrompt;";
string strConn2 = "Provider=VIRTOLEDB;Data Source=" + dsn2 + 
    ";User Id=dba;Password=dba;Initial Catalog=Demo;Prompt=NoPrompt;";
obj_conn = new OleDbConnection(strConn);
obj_conn2 = new OleDbConnection(strConn2);
             
```

And, finally, execute the SQL code in the context of distributed
transaction:

``` programlisting
OleDbCommand sqlc = new OleDbCommand ("ODBC_BENCHMARK(" + idx + ",1,1,12.00,\'noone\')");
sqlc.Connection = obj_conn;
sqlc.ExecuteNonQuery();
sqlc = new OleDbCommand ("ODBC_BENCHMARK(" + idx + ",1,1,-12.00,\'noone\')");
sqlc.Connection = obj_conn2;
sqlc.ExecuteNonQuery();
             
```

</div>

</div>
