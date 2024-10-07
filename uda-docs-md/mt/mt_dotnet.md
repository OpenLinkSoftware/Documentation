<div id="mt_dotnet" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 4. OpenLink ADO.NET Data Providers

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

<span class="section">4.1. [Architecture](mt_dnetarch.html)</span>

<span class="section">4.1.1. [Managed Data
Provider](mt_dnetarch.html#mt_dnetmanage)</span>

<span class="section">4.1.2. [Unmanaged Data
Provider](mt_dnetarch.html#mt_dnetunmanage)</span>

<span class="section">4.2. [Developing .NET Data Provider
Application](mt_dnetdevel.html)</span>

<span class="section">4.3. [OpenLink .NET Data Providers Connect String
Attributes](mt_dnetconnstr.html)</span>

<span class="section">4.3.1. [Managed Generic Multi-Tier .NET Data
Provider
(OpenLink.Data.GenericClient)](mt_dnetconnstr.html#mt_dnetmconnstr_opl)</span>

<span class="section">4.3.2. [Managed Microsoft SQLServer .NET Data
Provider
(OpenLink.Data.SQLServer)](mt_dnetconnstr.html#mt_dnetmconnstr_sqlserver)</span>

<span class="section">4.3.3. [Managed Sybase .NET Data Provider
(OpenLink.Data.Sybase)](mt_dnetconnstr.html#mt_dnetmconnstr_sybase)</span>

<span class="section">4.3.4. [Unmanaged .NET Data Provider
(OpenLink.Data.OdbcClient)](mt_dnetconnstr.html#mt_dnetuconnstr)</span>

<span class="section">4.4. [OpenLink .NET Data Providers Class
Implementation](mt_dnetclasses.html)</span>

<span class="section">4.5. [OpenLink.Data
Namespace](mt_dnetnamespace.html)</span>

<span class="section">4.5.1.
[OPLCommand](mt_dnetnamespace.html#mt_cloplcommand)</span>

<span class="section">4.5.2.
[OPLCommandBuilder](mt_dnetnamespace.html#mt_cloplcommandbuild)</span>

<span class="section">4.5.3.
[OPLConnect](mt_dnetnamespace.html#mt_cloplconnect)</span>

<span class="section">4.5.4.
[OPLDataAdapter](mt_dnetnamespace.html#mt_clopldataadapter)</span>

<span class="section">4.5.5.
[OPLDataReader](mt_dnetnamespace.html#mt_clopldatareader)</span>

<span class="section">4.5.6.
[OPLError](mt_dnetnamespace.html#mt_cloplerror)</span>

<span class="section">4.5.7.
[OPLErrorCollection](mt_dnetnamespace.html#mt_cloplerrorcol)</span>

<span class="section">4.5.8.
[OPLException](mt_dnetnamespace.html#mt_cloplexcept)</span>

<span class="section">4.5.9.
[OPLParameter](mt_dnetnamespace.html#mt_cloplparam)</span>

<span class="section">4.5.10.
[OPLParameterCollection](mt_dnetnamespace.html#mt_cloplparamcol)</span>

<span class="section">4.5.11.
[OPLRowUpdatedEventArgs](mt_dnetnamespace.html#mt_rUpdated)</span>

<span class="section">4.5.12.
[OPLRowUpdatedEventHandler](mt_dnetnamespace.html#mt_rUpdatedHan)</span>

<span class="section">4.5.13.
[OPLRowUpdatingEventArgs](mt_dnetnamespace.html#mt_rUpdating)</span>

<span class="section">4.5.14.
[OPLRowUpdatingEventHandler](mt_dnetnamespace.html#mt_rUpdatingHan)</span>

<span class="section">4.5.15.
[OPLTransaction](mt_dnetnamespace.html#mt_clopltran)</span>

<span class="section">4.6. [Known Issues](mt_dnetissues.html)</span>

<span class="section">4.6.1. [Unsigned Type
Handling](mt_dnetissues.html#mt_dnetunsign)</span>

<span class="section">4.6.2. [Timestamp
Precision](mt_dnetissues.html#mt_dnettimestamp)</span>

<span class="section">4.7. [.Net Provider Test
Program](mt_dnettest.html)</span>

<span class="section">4.8. [New
Features](mt_features_dotnet.html)</span>

</div>

</div>
