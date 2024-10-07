<div id="mt_dnetarch" class="section">

<div class="titlepage">

<div>

<div>

## 4.1. Architecture

</div>

</div>

</div>

From the outset one of the main design goals of the .Net Data Provider
was to implement a generic client layer enabling the re-use of our
existing data access components for connecting to remote data sources.
This has been achieved with both our Managed and Unmanaged .Net Data
Providers, each of which have a common namespace that eliminates the
need to recompile applications should the need arise to change the
remote data source.

<div id="mt_dnetmanage" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.1. Managed Data Provider

</div>

</div>

</div>

The UDA managed .NET Data Provider delivers robust and secure data
connectivity across all Databases support in the Universal Data Access
suite, including all major databases - Microsoft SQL Server, Oracle,
DB2, Sybase, Ingres II, Informix and Progress. The .NET Data Provider is
built with managed code, enabling it to running completely within the
.NET Framework runtime delivering better security and performance. This
Generic managed .Net Data Provider connects to the remote data source
via one of two forms currently:

<div class="itemizedlist">

- <span class="emphasis">*Multi-Tier Database Agents*</span> - The
  OpenLink VDB(Virtual Database) layer has been ported to C# and linked
  into the Provider, enabling it to communicate directly with the
  OpenLink Multi-Tier Database agents installed on the remote machine
  (or via 3-Tier connection) as indicated in the diagram below:

  <div id="mt_dnetjpg1" class="figure">

  **Figure 4.1. Managed VDB .Net Data Provider**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Managed VDB .Net Data Provider](images/dnetmanage.jpg)

  </div>

  </div>

  </div>

    

  The diagram above lists all the databases current supported in our
  Multi-Tier Data Access suite, but note that ODBC is also included
  which if chosen would enabled connectivity to any third party ODBC
  driver also via our ODBC agent(bridge).

- <span class="emphasis">*TDS Protocol*</span> - The TDS protocol has
  been ported to C# and linked into the Provider, enabling two 100%
  Managed Providers to be created capable of direct connectivity to
  Microsoft and Sybase SQLServer Databases without the need for any
  additional components on the Server, as indicated in the diagram
  below:

  <div id="mt_dnetjpg2" class="figure">

  **Figure 4.2. Managed SQLServer .Net Data Provider**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Managed SQLServer .Net Data Provider](images/dnetmantdsms.jpg)

  </div>

  </div>

  </div>

    

  <div id="mt_dnetjpg21" class="figure">

  **Figure 4.3. Managed Sybase .Net Data Provider**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Managed Sybase .Net Data Provider](images/dnetmantdsyb.jpg)

  </div>

  </div>

  </div>

    

</div>

</div>

<div id="mt_dnetunmanage" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.2. Unmanaged Data Provider

</div>

</div>

</div>

The UDA Unmanaged .NET Data Provider enables connectivity to any ODBC
Data Source by acting as a Bridge between ADO.Net and ODBC. This
Provider is provided as a stop-gap solution enabling connectivity to
Data source for which managed .Net Providers are not already available
as indicated in the diagram below, and as such does not provide the
benefits of security and performance available from its Managed
counterpart:

<div id="mt_dnetjpg3" class="figure">

**Figure 4.4. Unmanaged ODBC .Net Data Provider**

<div class="figure-contents">

<div class="mediaobject">

![Unmanaged ODBC .Net Data Provider](images/dnetunmanage.jpg)

</div>

</div>

</div>

  

</div>

</div>
