<div>

<div>

<div>

<div>

## 3.3. Virtual Database Server

</div>

</div>

</div>

Virtuoso's Virtual Database Engine enables you to produce Dynamic Web
Content from any major database management system. This enables dynamic,
real-time HTML and XML generation from any number of different database
engines concurrently. The Visual Server Administration Interface of
Virtuoso allows you to effortlessly remotely choose and configure remote
data sources to be linked into Virtuoso. Once a table is linked into
Virtuoso then it is usable like any native table leaving you free to
perform join queries without ever worrying about the underlying data
source.

The <a href="ch-server.html#vdbconcepts" class="link"
title="6.1.2. Virtual Database">Virtual Database (VDB) Engine</a>
section of the Conceptual Overview chapter explains the concepts in more
details.

Visit the <a href="dbadmin.html#remotetables" class="link"
title="External Linked Objects">Visual Server Administration
Interface</a> section to see how to link tables into Virtuoso, or follow
the small example below to get you started:

<div>

<div>

<div>

<div>

### 3.3.1. Configuring Your ODBC Data Sources

</div>

</div>

</div>

Before you can link a table into Virtuoso, you need to configure an ODBC
datasource. It is quite likely that you already have ODBC data sources
defined. If so, you can skip this part of the tour.

If you do not have any data sources defined, you should configure your
datasource using an appropriate ODBC driver. The ODBC driver may come
from the database vendor or a third-party middleware vendor, such as
OpenLink Software. You will need to configure your ODBC datasource in
accordance with the directions from your driver vendor.

In this part of the tour, we show sample DSN configuration information
for some database vendor drivers. These examples of working data sources
are not meant to replace the instructions from the driver vendor. In
your specific installation other parameters may be necessary.

To define ODBC data sources on Windows XP/95/98/NT, in the Control Panel
go to Administrative Tools and then click the Data Sources (ODBC) icon.

This first datasource uses OpenLink Generic ODBC Driver V6.0 to create
DSN to a MySQL 5.x database.

<div>

<div>

**Figure 3.7. OpenLink Mutli Tier DSN Configuration with database MySQL
5.x**

<div>

<div>

![OpenLink Mutli Tier DSN Configuration with database MySQL
5.x](images/virttour1.png)

</div>

</div>

</div>

  

</div>

The next example is an Informix 7 datasource using the driver from
Informix Software, Inc.

<div>

<div>

**Figure 3.8. Informix Driver DSN Configuration**

<div>

<div>

![Informix Driver DSN Configuration](images/virttour2.gif)

</div>

</div>

</div>

  

</div>

The next few images show a Microsoft SQL Server 6.5 datasource using the
Microsoft Corporation SQL Server driver.

<div>

<div>

**Figure 3.9. MS SQL Server DSN Configuration**

<div>

<div>

![MS SQL Server DSN Configuration](images/virttour3.gif)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 3.10. MS SQL Server DSN Configuration**

<div>

<div>

![MS SQL Server DSN Configuration](images/virttour4.gif)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 3.11. MS SQL Server DSN Configuration**

<div>

<div>

![MS SQL Server DSN Configuration](images/virttour5.gif)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 3.12. MS SQL Server DSN Configuration**

<div>

<div>

![MS SQL Server DSN Configuration](images/virttour6.gif)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 3.13. MS SQL Server DSN Configuration**

<div>

<div>

![MS SQL Server DSN Configuration](images/virttour7.gif)

</div>

</div>

</div>

  

</div>

Finally, review the configuration information for your default local
Virtuoso datasource, named "<span class="emphasis">*Local
Virtuoso*</span> ".

<div>

<div>

**Figure 3.14. OpenLink Virtuoso DSN Configuration**

<div>

<div>

![OpenLink Virtuoso DSN Configuration](images/virttour8.png)

</div>

</div>

</div>

  

</div>

DSNs can be created and configured within the Virtuoso Conductor. Go to
"Database", then to "External Data Sources" and then go to "Configure
Data Sources" tab. Click the "Add System DSN", or "Add User DSN", or
"Add File DSN" button.

<div>

<div>

**Figure 3.15. Creating a new DSN**

<div>

<div>

![Creating a new DSN](images/newdsn.png)

</div>

</div>

</div>

  

</div>

</div>

</div>
