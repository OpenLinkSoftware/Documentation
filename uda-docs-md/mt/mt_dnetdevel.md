<div id="mt_dnetdevel" class="section">

<div class="titlepage">

<div>

<div>

## 4.2. Developing .NET Data Provider Application

</div>

</div>

</div>

The namespaces for the OpenLink .Net Data Providers are:

``` programlisting
    OpenLink.Data.GenericClient ; Managed VDB Generic Multi-Tier
```

``` programlisting
    OpenLink.Data.SQLServer     ; Managed Microsoft SQLServer
```

``` programlisting
    OpenLink.Data.Sybase        ; Managed Sybase SQLServer
```

``` programlisting
    OpenLink.Data.OdbcClient    ; Unmanaged ODBC based
```

A .NET data provider provides functionality for connecting to a data
source, executing commands, and retrieving results. Those results can be
processed directly, or placed in an ADO.NET DataSet for further
processing while in a disconnected state. While in the DataSet, data can
be exposed to the user, combined with other data from multiple sources,
or passed remotely between tiers. Any processing performed on the data
while in the DataSet can then be reconciled to the data source.

All .NET data providers are designed to be lightweight. They consist of
a minimal layer between the data source and your code. This extends
functionality without sacrificing performance.

There are four core objects that make up a .NET data provider. The
following table describes those objects and their function.

<div id="id3229" class="decimalstyle">

**Table 4.1. Core Classes**

<div class="decimalstyle-contents">

| Object      | Description                                                                     |     |
|:------------|---------------------------------------------------------------------------------|-----|
| Connection  | Establishes a connection to a specific data source and can begin a Transaction. |     |
| Command     | Executes a command at a data source, and exposes Parameters.                    |     |
| DataReader  | Exposes and reads a forward-only stream of data from a data source.             |     |
| DataAdapter | Populates a DataSet and resolves updates with the data source.                  |     |

</div>

</div>

  

Along with the core classes listed in the preceding table, a .NET data
provider also contains the classes listed in the following table.

<div id="id3251" class="decimalstyle">

**Table 4.2. Additional Classes**

<div class="decimalstyle-contents">

| Object           | Description                                                                                                                                                                                                   |     |
|:-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----|
| ClientPermission | Provided for .NET data provider code access security attributes.                                                                                                                                              |     |
| CommandBuilder   | A helper object that will automatically generate command properties of a DataAdapter or will derive parameter information from a stored procedure and populate the Parameters collection of a Command object. |     |
| Error            | Exposes the information from a warning or error returned by a data source.                                                                                                                                    |     |
| Exception        | Returned when an error is encountered at the data source. For an error encountered at the client, .NET data providers throw a .NET Framework exception.                                                       |     |
| Parameter        | Defines input, output, and return value parameters for commands and stored procedures.                                                                                                                        |     |
| Transaction      | Enables you to enlist commands in transactions at the data source.                                                                                                                                            |     |

</div>

</div>

  

During the installation process the OpenLink .Net Data Provider is
registered in the system GAC(Global Assembly Cache) enabling it for use
by .Net applications. To use the OpenLink .NET Data Providers, the
application must add an imports or using statement for the .Net Data
Provider namespace, as the following code illustrates:

``` programlisting
[Visual Basic]
Imports OpenLink.Data.GenericClient // Managed VDB Generic Multi-Tier
or
Imports OpenLink.Data.SQLServer     // Managed Microsoft SQLServer
or
Imports OpenLink.Data.Sybase        // Managed Sybase SQLServer
or
Imports OpenLink.Data.OdbcClient    // Unmanaged ODBC based
[C#]
using OpenLink.Data.GenericClient;  // Managed VDB Generic Multi-Tier
or
using OpenLink.Data.SQLServer;      // Managed Microsoft SQLServer
or
using OpenLink.Data.Sybase;     // Managed Sybase SQLServer
or
using OpenLink.Data.OdbcClient;     // Unmanaged ODBC based
```

You must also include a reference to the .DLL when you compile your
code. For example, if you are compiling a Microsoft® Visual C#™ program,
your command line should include:

``` programlisting
csc /r:OpenLink.Data.GenericClient.dll  ; Managed VDB Generic Multi-Tier
or
csc /r:OpenLink.Data.SQLServer.dll  ; Managed Microsoft SQLServer
or
csc /r:OpenLink.Data.Sybase.dll ; Managed Sybase SQLServer
or
csc /r:OpenLink.Data.OdbcClient.dll ; Unmanaged ODBC based
```

</div>
