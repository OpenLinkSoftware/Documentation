<div id="lite_dnetclasses" class="section">

<div class="titlepage">

<div>

<div>

## 6.4. OpenLink .NET Data Providers Class Implementation

</div>

</div>

</div>

This section details the classes exposed by the OpenLink .NET Data
Providers, which users must be familiar with in order to make effective
use of the providers.

Many of the OpenLink Generic Provider classes implement interfaces or
inherit from the .NET Framework namespaces System.Data and
System.Data.Common. A summary of the classes exposed by the provider is
given below.

The table only shows classes or interfaces inherited from System.Data or
System.Data.Common. Some of the OpenLink.Data.GenericClient classes
implement additional interfaces or inherit from a class belonging to a
namespace other than System.Data or System.Data.Common. These details
are not shown. For full details refer to the detailed documentation for
the appropriate class in OpenLink.Data.GenericClient Namespace.

<div id="id45338" class="decimalstyle">

**Table 6.7. Classes**

<div class="decimalstyle-contents">

| Classes                                                               | Implements / inherits System.Data or System.Data.Common interface / class | Description                                                                                                                   |
|:----------------------------------------------------------------------|---------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| <a href="lite_dnetnamespace.html#lite_cloplcommand" class="link"      
 title="6.5.1. OPLCommand">OPLCommand</a>                               | IDbCommand                                                                | Represents an SQL statement or stored procedure to execute against a database.                                                |
| <a href="lite_dnetnamespace.html#lite_cloplcommandbuild" class="link" 
 title="6.5.2. OPLCommandBuilder">OPLCommandBuilder</a>                 |                                                                           | Automatically generates single-table commands used to reconcile changes made to a DataSet with the associated data source.    |
| <a href="lite_dnetnamespace.html#lite_cloplconnect" class="link"      
 title="6.5.3. OPLConnect">OPLConnection</a>                            | IDbConnection                                                             | Represents an open connection to a data source.                                                                               |
| <a href="lite_dnetnamespace.html#lite_clopldataadapter" class="link"  
 title="6.5.4. OPLDataAdapter">OPLDataAdapter</a>                       | IDbDataAdapter, DbDataAdapter                                             | Represents a set of data commands and a database connection that are used to fill a DataSet and update a data source.         |
| <a href="lite_dnetnamespace.html#lite_clopldatareader" class="link"   
 title="6.5.5. OPLDataReader">OPLDataReader</a>                         | IDataReader, IDataRecord                                                  | Provides a way of reading a forward-only stream of data rows from a data source.                                              |
| <a href="lite_dnetnamespace.html#lite_cloplerror" class="link"        
 title="6.5.6. OPLError">OPLError</a>                                   |                                                                           | Holds information about a warning or error returned by a data source.                                                         |
| <a href="lite_dnetnamespace.html#lite_cloplerrorcol" class="link"     
 title="6.5.7. OPLErrorCollection">OPLErrorCollection</a>               |                                                                           | Represents a collection of one or more OPLError objects that give detailed information about an OPLException.                 |
| <a href="lite_dnetnamespace.html#lite_cloplexcept" class="link"       
 title="6.5.8. OPLException">OPLErrorException</a>                      |                                                                           | The exception that is generated when a warning or error is returned by a data source or the Generic Provider.                 |
| <a href="lite_dnetnamespace.html#lite_cloplparam" class="link"        
 title="6.5.9. OPLParameter">OPLParameter</a>                           | IDbDataParameter, IDataParameter                                          | Represents a parameter to an OPLCommand and optionally, its mapping to a DataSet column.                                      |
| <a href="lite_dnetnamespace.html#lite_cloplparamcol" class="link"     
 title="6.5.10. OPLParameterCollection">OPLParameterCollection</a>      | IDataParameterCollection                                                  | Represents a collection of parameters relevant to an OPLCommand as well as their respective mappings to columns in a DataSet. |
| O PLPermission                                                        |                                                                           | Enables the Generic Provider to ensure that a user has a security level adequate to access a data source.                     |
| O PLPermissionAttribute                                               |                                                                           | Associates a security action with a custom security attribute.                                                                |
| <a href="lite_dnetnamespace.html#lite_clopltran" class="link"         
 title="6.5.15. OPLTransaction">OPLTransaction</a>                      | IDbTransaction                                                            | Represents a SQL transaction to be made at a data source.                                                                     |

</div>

</div>

  

<div id="id45411" class="decimalstyle">

**Table 6.8. Delegates**

<div class="decimalstyle-contents">

| Delegates                                                              | Description                                                                      |     |
|:-----------------------------------------------------------------------|----------------------------------------------------------------------------------|-----|
| <a href="lite_dnetnamespace.html#lite_rUpdated" class="link"           
 title="6.5.11. OPLRowUpdatedEventArgs">OPLRowUpdatedEventHandler</a>\>  | Represents a method that will handle the RowUpdated event of an OPLDataAdapter.  |     |
| <a href="lite_dnetnamespace.html#lite_rUpdating" class="link"          
 title="6.5.13. OPLRowUpdatingEventArgs">OPLRowUpdatingEventHandler</a>  | Represents a method that will handle the RowUpdating event of an OPLDataAdapter. |     |

</div>

</div>

  

<div id="id45428" class="decimalstyle">

**Table 6.9. Enumerations**

<div class="decimalstyle-contents">

| Enumeration  | Description                                                   |     |
|:-------------|---------------------------------------------------------------|-----|
| O PLDbType\> | Specifies the data type of a field, property or OPLParameter. |     |

</div>

</div>

  

</div>
