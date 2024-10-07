<div id="lite_dotnet" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 6. OpenLink ADO.NET Data Providers

</div>

<div>

<div class="abstract">

**Abstract**

ADO.NET is the new feature-rich, data access Model used within the
Microsoft.NET framework. It supports the data access requirements of the
loosely coupled, multi-tier Web and Web services based applications of
today. ADO.NET relies on the services of .NET Data Providers. These
provide access to the underlying data source through four key objects:
`Connection`, `Command`, `DataReader`, and `DataAdapter`.

The OpenLink .Net Data Providers are available as a suite of Managed and
Unmanaged Data Providers providing a natural extension of our Universal
Data Access Driver Suite. Thus providing .Net connectivity to the full
range of Databases support in our Universal Data Access Driver suite.
Two generic .Net Data Providers are available each exposing a common
namespace/interface for accessing remote data sources as explained in
the component architecture section below.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">6.1. [Architecture](lite_dnetarch.html)</span>

<span class="section">6.1.1. [Managed Data
Provider](lite_dnetarch.html#lite_dnetmanage)</span>

<span class="section">6.1.2. [Unmanaged Data
Provider](lite_dnetarch.html#lite_dnetunmanage)</span>

<span class="section">6.2. [Developing .NET Data Provider
Application](lite_dnetdevel.html)</span>

<span class="section">6.3. [OpenLink .NET Data Providers Connect String
Attributes](lite_dnetconnstr.html)</span>

<span class="section">6.3.1. [Managed Generic Multi-Tier .NET Data
Provider
(OpenLink.Data.GenericClient)](lite_dnetconnstr.html#lite_dnetmconnstr_opl)</span>

<span class="section">6.3.2. [Managed Microsoft SQLServer .NET Data
Provider
(OpenLink.Data.SQLServer)](lite_dnetconnstr.html#lite_dnetmconnstr_sqlserver)</span>

<span class="section">6.3.3. [Managed Sybase .NET Data Provider
(OpenLink.Data.Sybase)](lite_dnetconnstr.html#lite_dnetmconnstr_sybase)</span>

<span class="section">6.3.4. [Unmanaged .NET Data Provider
(OpenLink.Data.OdbcClient)](lite_dnetconnstr.html#lite_dnetuconnstr)</span>

<span class="section">6.4. [OpenLink .NET Data Providers Class
Implementation](lite_dnetclasses.html)</span>

<span class="section">6.5. [OpenLink.Data
Namespace](lite_dnetnamespace.html)</span>

<span class="section">6.5.1.
[OPLCommand](lite_dnetnamespace.html#lite_cloplcommand)</span>

<span class="section">6.5.2.
[OPLCommandBuilder](lite_dnetnamespace.html#lite_cloplcommandbuild)</span>

<span class="section">6.5.3.
[OPLConnect](lite_dnetnamespace.html#lite_cloplconnect)</span>

<span class="section">6.5.4.
[OPLDataAdapter](lite_dnetnamespace.html#lite_clopldataadapter)</span>

<span class="section">6.5.5.
[OPLDataReader](lite_dnetnamespace.html#lite_clopldatareader)</span>

<span class="section">6.5.6.
[OPLError](lite_dnetnamespace.html#lite_cloplerror)</span>

<span class="section">6.5.7.
[OPLErrorCollection](lite_dnetnamespace.html#lite_cloplerrorcol)</span>

<span class="section">6.5.8.
[OPLException](lite_dnetnamespace.html#lite_cloplexcept)</span>

<span class="section">6.5.9.
[OPLParameter](lite_dnetnamespace.html#lite_cloplparam)</span>

<span class="section">6.5.10.
[OPLParameterCollection](lite_dnetnamespace.html#lite_cloplparamcol)</span>

<span class="section">6.5.11.
[OPLRowUpdatedEventArgs](lite_dnetnamespace.html#lite_rUpdated)</span>

<span class="section">6.5.12.
[OPLRowUpdatedEventHandler](lite_dnetnamespace.html#lite_rUpdatedHan)</span>

<span class="section">6.5.13.
[OPLRowUpdatingEventArgs](lite_dnetnamespace.html#lite_rUpdating)</span>

<span class="section">6.5.14.
[OPLRowUpdatingEventHandler](lite_dnetnamespace.html#lite_rUpdatingHan)</span>

<span class="section">6.5.15.
[OPLTransaction](lite_dnetnamespace.html#lite_clopltran)</span>

<span class="section">6.6. [Known Issues](lite_dnetissues.html)</span>

<span class="section">6.6.1. [Unsigned Type
Handling](lite_dnetissues.html#lite_dnetunsign)</span>

<span class="section">6.6.2. [Timestamp
Precision](lite_dnetissues.html#lite_dnettimestamp)</span>

<span class="section">6.7. [.Net Provider Test
Program](lite_dnettest.html)</span>

<span class="section">6.8. [New
Features](lite_features_dotnet.xml.html)</span>

</div>

</div>
