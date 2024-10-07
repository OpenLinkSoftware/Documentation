<div id="mt_features_dotnet" class="section">

<div class="titlepage">

<div>

<div>

## 4.8. New Features

</div>

</div>

</div>

<div class="itemizedlist">

- **.Net Data Providers. ** A suite of Managed .Net Data Providers built
  with a thin generic .Net client classes for communicating with any of
  our supported Database agents on the Database Server, as well as a
  100% Managed TDS based .Net Provider for connectivity to Microsoft and
  Sybase SQLServer Database eliminating the need for any software
  installation on the Database Server machine. An Umanaged .Net ODBC
  Provider is also available, which makes use of the OpenLink built in
  Cursor Library to provide a greater level of .Net support when
  connecting via an ODBC Datasource.

- **Unicode Driver support. ** Database agents support the latest
  releases of all supported database engines this includes:

  <div class="orderedlist">

  1.  Oracle 8i & 9i

  2.  Microsoft SQL Server 2000

  3.  DB/2 v7

  4.  ODBC Agent

  5.  JDBC Agent

  6.  Informix 9

  7.  Sybase Adaptive Server 12.5

  8.  Progress 9 (SQL-92)

  </div>

- **Significant SQL Server and SYBASE Driver Enhancements. ** Our
  Drivers are now built to communicate directly with Microsoft SQL
  Server and SYBASE ASE using the TDS protocol (the native wire protocol
  for both database servers). This also implies that no additional
  software is required post installation in order for our ODBC Drivers
  to communicate with these Drivers (this applies to the Single Tier
  format Drivers only). The use of TDS has also enabled us to double the
  performance of both our Single Tier and Multi-Tier Drivers for these
  databases.

- **Array Optimisations on Select Queries. ** All drivers now support
  the SQLSetStmtAttr(SQL_ARRAY_SIZE) call for batch select statements,
  providing improved performance when re-execute select statements with
  bound paramters.

- **Deferred Fetching. ** The Release 4 OpenLink driver family brings
  marked communications layer improvements. Central to these are
  improved implementation of the `SQLGetData` and `SQLPutData` ODBC
  function calls.

  **Wholesale vs. Piecemeal Data Transfer. ** In previous releases of
  the drivers, parameter data at query execution was assembled in the
  OpenLink driver's client component and transferred to its server
  component in a single network hop. (The client and server components
  apply to both the Single- and Multi-Tier drivers; they refer to
  different layers within the driver entity.) Similarly, when fetching
  from a "long", or large binary data column, data was transferred from
  the driver's server component to the client component in a single
  network transfer. The only way data could manipulated in a piecemeal
  fashion, was within the ODBC application from the driver's client
  component (client side only).

  The Release 4 driver family now allow transferring parameter data in
  parts over the network between the client and server driver
  components. Once transferred, the fragmented column data are re-pieced
  together in their entirety within the client and server portions of
  the driver.

  **Deferred Fetching. ** When fetching, data from columns with "long"
  data are only transferred between the server and client components if
  one of the following applies to that column:

  |                                                                    |
  |--------------------------------------------------------------------|
  | It has been "bound" by the application via the SQLBindCol API call |
  | It has been retrieved via the SQLGetData API call                  |

  This mechanism is referred to as deferred fetching. In this method, as
  "long" column data is not reassembled within the OpenLink ODBC client
  itself (rather, within the application), driver memory overhead
  incurred is dramatically reduced. Deferred fetching applies to the
  following "long" database column types:

  <div class="variablelist">

  <span class="term">ODBC agent</span>  
  SQL_LONGVARCHAR

  SQL_LONGVARBINARY

  <span class="term">DB/2 agent</span>  
  SQL_BLOB

  SQL_CLOB

  SQL_DBCLOB

  If the long data compatibility option has been specified in the DB2
  database

  SQL_LONGVARCHAR

  SQL_LONGVARBINARY

  SQL_LONGVARGRAPHIC

  <span class="term">Oracle agent</span>  
  SQLT_BLOB

  SQLT_CLOB

  <span class="term">Sybase agent</span>  
  CS_IMAGE_TYPE

  CS_TEXT_TYPE

  </div>

  However, if a table contains a column defined as one of these "long"
  types, but the actual data stored in the column only fills a small
  proportion of the available space, deferred fetching is of no benefit.
  In these cases, performance may be improved by switching off the
  deferred fetching mechanism using the control in the OpenLink Generic
  Client data source setup dialog.

</div>

</div>
