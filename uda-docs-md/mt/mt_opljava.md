<div id="mt_opljava" class="section">

<div class="titlepage">

<div>

<div>

## 11.1. OpenLink JDBC Drivers

</div>

</div>

</div>

<div id="mt_New_Features_Summary" class="section">

<div class="titlepage">

<div>

<div>

### 11.1.1. New JDBC Driver Packages

</div>

</div>

</div>

OpenLink now has a broader range of JDBC Driver types which also
transcend JDBC versions.

The drivers are now categorized as follows:

<div class="itemizedlist">

- Generic Drivers for JDBC 1.1.x (compatible with Java Virtual Machine
  version 1.1.x)

- Generic Drivers for JDBC 2.0 (compatible with Java Virtual Machine
  version 1.2 & 1.3)

- Generic Drivers for JDBC 3.0 (compatible with Java Virtual Machine
  version 1.4)

- Megathin Drivers for JDBC 1.1.x (compatible with Java Virtual Machine
  version 1.1.x)

- Megathin Drivers for JDBC 2.0 (compatible with Java Virtual Machine
  version 1.2 & 1.3)

- Megathin Drivers for JDBC 3.0 (compatible with Java Virtual Machine
  version 1.4)

</div>

The following table depicts how each of these drivers is packaged, what
JDBC Driver formats are supported, and whether they are certified 100%
Pure Java or Not:

<div id="id10568" class="table">

**Table 11.1. **

<div class="table-contents">

| Product Name                    |
|---------------------------------|
| Generic Drivers for JDBC 1.1.x  |
| Generic Drivers for JDBC 2.0    |
| Generic Drivers for JDBC 3.0    |
| Megathin Drivers for JDBC 1.1.x |
| Megathin Drivers for JDBC 2.0   |
| Megathin Drivers for JDBC 3.0   |

</div>

</div>

  

</div>

<div id="mt_newfeat" class="section">

<div class="titlepage">

<div>

<div>

### 11.1.2. New Features & Enhancements

</div>

</div>

</div>

<div class="orderedlist">

1.  **Unicode Support. ** The OpenLink JDBC client is fully Unicode
    aware.

2.  **Enhanced Communications Layer. ** Prior to Release 4.1, the JDBC
    driver sent preformed database metadata calls in a manner considered
    to be redundant prior to SELECT statements. With this new release,
    each SELECT statement only sends and receives TCP packets associated
    with these metadata calls one time prior to execution.

3.  **Connection Pooling Support. ** The JDBC driver now supports
    connection pooling as defined in the JDBC 3.0 specification.

4.  #### Scrollable Cursors

    A new OpenLink RowSet class enables JDBC applications to take
    advantage of ODBC-style scrollable cursors functionality, with the
    ability to: retrieve rowsets, go to any row in the resultset or
    rowset, add new rows to the database, refresh and update any row
    with a single method invocation, lock and unlock any row, retrieve
    the current row number, as well as use ODBC-style bookmarks. This is
    an OpenLink extension to JDBC.

    The Drivers for JDBC 2.0 implement the Scrollable Cursor Interfaces
    introduced in JDBC 2.0. They also retain support for the OpenLink
    Scrollable Cursor extension so as to provide access to those
    Scrollable Cursor features that exist in ODBC but are missing from
    the JDBC 2.0 specification.

5.  #### Array Binding

    As part of the new RowSet class. It is now possible to bind data
    arrays to the columns of the OpenLink RowSet object, and retrieve
    the data directly into the arrays with a single invocation of the
    RowSet.next() method. Please see the accompanying demonstration
    application for an example of its usage.

    This approach enables you to retrieve multiple records with a
    reduced number of calls to the RowSet.next() method. It basically
    improves JDBC Application performance.

6.  #### openlink.sql.Statement

    This is a new OpenLink interface that extends java.sql.Statement to
    provide additional methods for configuring the ODBC-Style Scrollable
    Cursors functionality.

    You only need this functionality when working with the OpenLink
    Scrollable Cursor extensions. The Drivers for JDBC 2.0 implement
    similar features for the JDBC 2.0 Scrollable Cursor specification.

7.  **Security. ** The OpenLink client and server components for JDBC
    encrypt the data sent across the network between the client and
    server. This provides for enhanced security, particularly over a
    WAN. This is transparent to the application, and there are no driver
    specific properties for the application to set.

8.  **Version self-checking. ** The OpenLink client component for JDBC
    now cross checks version numbers with the server Agent for JDBC at
    connect time, this ensures that compatible components always in use.
    An exception will be thrown when incompatibilities are encountered,
    this exception will also contain information about the component
    versions relating to the exception.

9.  #### Easier Client Version checking

    There is now an easier way of checking the OpenLink client for JDBC
    version. Make sure that the driver is in the classpath and then at
    your command prompt enter the command:

    ``` programlisting
    java openlink.jdbc.Driver
    ```

    (for JDK 1.x Drivers)

    or

    ``` programlisting
    java openlink.jdbc2.Driver
    ```

    (for JDK 1.2 or 1.3/2.0 Drivers)

    or

    ``` programlisting
    java openlink.jdbc3.Driver
    ```

    (for JDK 1.4/3.0 Drivers)

    or

    ``` programlisting
    java openlink.jdbc.Driver
    ```

    (for 100% Pure Java Drivers for JDK 1.x)

    or

    ``` programlisting
    java openlink.jdbc2.Driver
    ```

    (for 100% Pure Java Drivers for JDK 1.2 or 1.32.0)

    or

    ``` programlisting
    java openlink.jdbc3.Driver
    ```

    (for 100% Pure Java Drivers for JDK 1.4/3.0)

    The driver will respond with appropriate version and release number
    information.

</div>

</div>

</div>
