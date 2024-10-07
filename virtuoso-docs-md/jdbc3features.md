<div id="jdbc3features" class="section">

<div class="titlepage">

<div>

<div>

### 7.4.3. Virtuoso Driver JDBC 3.0 features

</div>

</div>

</div>

<div id="jdbc3dsprops" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver For JDBC 3.0 javax.sql.DataSource

</div>

</div>

</div>

JDBC 3.0 compliant applications and applets may connect to a JDBC data
source using JDBC `javax.sql.DataSource` instances. The Virtuoso JDBC
3.0 driver provides an implementation of the `javax.sql.DataSource`
interface in the `virtuoso.jdbc3.VirtuosoDataSource` class, supporting
the following properties:

<div id="jdbcdatasourceprops" class="decimalstyle">

**Table 7.15. JDBC 3.0 VirtuosoDataSource properties**

<div class="decimalstyle-contents">

| Name           | Type             | URL Option Equivalent | Description                                    |     |
|:---------------|------------------|-----------------------|------------------------------------------------|-----|
| dataSourceName | java.lang.String |                       | used in connection pooling                     |     |
| description    | java.lang.String |                       | string to describe the data source (free form) |     |
| serverName     | java.lang.String |                       | The host name of the remote host to connect to |     |
| portNumber     | int              |                       | The port on the remote host to connect to      |     |
| user           | java.lang.String | /UID                  | username to use for the session                |     |
| password       | java.lang.String | /PWD                  | password to use for the session                |     |
| databaseName   | java.lang.String | /DATABASE             | Initial catalog qualifier for the session      |     |
| charset        | java.lang.String | /CHARSET              | Charset used in wide\<-\>narrow translations   |     |
| pwdClear       | java.lang.String | /PWDTYPE              | authentication method                          |     |

</div>

</div>

  

</div>

<div id="jdbcdspool" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver For JDBC 3.0 & Connection Pooling

</div>

</div>

</div>

The Virtuoso JDBC 3.0 driver supports connection pooling.

The virtuoso.jdbc3.VirtuosoDataSource implements the
`javax.sql.ConnectionPoolDataSource` interface. In order to use the
connection pooling the administrator must deploy one instance of the
`virtuoso.jdbc3.VirtuosoDriver` in the JNDI repository and set all of
it's properties except `dataSourceName` . This is the "main" connection
pooling data source. Then the administrator should deploy a second
instance of the `virtuoso.jdbc3.VirtuosoDataSource` class and set only
it's `dataSourceName` property.

Applications will use the second `virtuoso.jdbc3.VirtuosoDataSource`
instance to get a connection. It will in turn call the first one to
obtain all connect info and return the `java.sql.Connection` instance.

</div>

<div id="jdbcxa" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver For JDBC 3.0 & Distributed Transactions

</div>

</div>

</div>

Virtuoso supports the industry standard XA specification for distributed
transaction processing. The XA specification defines an interface
between the transaction manager (TM) and resource manager (RM) in a
distributed transaction system. This is a generic interface and it does
not directly address the use of distributed transactions from Java. The
Java mapping of the XA interface is defined in Sun Microsystems Java
Transaction API (JTA) and JDBC 3.0 specifications. The Virtuoso JDBC 3.0
driver supports the JTA architecture by providing the implementation of
JTA resource manager interfaces.

The Virtuoso JDBC 3.0 driver provides the `virtuoso.java3.VirtuosoXid` ,
`virtuoso.java3.VirtuosoXADataSource` ,
`virtuoso.java3.VirtuosoXAConnection` , and
`virtuoso.java3.VirtuosoXAResource` classes which implement the
interfaces `javax.transaction.xa.Xid` ,
`javax.transaction.xa.XADataSource` , `javax.sql.XAConnection` , and
`javax.sql.XAResource` respectively. The use if these interfaces is
usually transparent for applications and the application developer
shouldn't bother with them. They are used only by the JTS transaction
manager which normally runs as a part of the J2EE server.

The task of the J2EE server administrator is to setup the necessary
Virtuoso XA datasources. The exact procedure of this depends on the J2EE
server in use (such as BEA WebLogic, IBM WebSphere, etc). Generally,
this includes two steps:

<div class="orderedlist">

1.  Include the JDBC driver's jar file into J2EE server's class path.

2.  Deploy an instance of `javax.transaction.xa.XADataSource` with
    appropriately set properties into the J2EE server's JNDI repository.

</div>

The `virtuoso.java3.VirtuosoXADataSource` class is derived from
`virtuoso.java3.VirtuosoDataSource` and inherits all of its properties.
These properties has to be set as described in the section
<a href="jdbc3features.html#jdbc3dsprops" class="link"
title="Virtuoso Driver For JDBC 3.0 javax.sql.DataSource">Virtuoso
Driver For JDBC 3.0 javax.sql.DataSource</a> .

For example, the following has to be done in case of Sun's J2EE
Reference Implementation.

<div class="orderedlist">

1.  Add the path of virtjdbc3.jar to the J2EE_CLASSPATH variable in the
    file \$(J2EE_HOME)/bin/userconfig.bat on Windows or
    \$(J2EE_HOME)/bin/userconfig.sh on Unix/Linux:

    ``` programlisting
        set J2EE_CLASSPATH=C:/Virtuoso/lib/virtjdbc3.jar
    ```

    or

    ``` programlisting
        J2EE_CLASSPATH=/home/login/virtuoso/lib/virtjdbc3.jar
        export J2EE_CLASSPATH
    ```

2.  Using the following command add the XA datasource with JNDI name
    "jdbc/Virtuoso" which refers to the Virtuoso server running on the
    same computer on port 1111:

    ``` programlisting
        j2eeadmin -addJdbcXADatasource jdbc/Virtuoso virtuoso.jdbc3.VirtuosoXADataSource -props serverName=localhost portNumber=1111
    ```

</div>

</div>

<div id="jdbcrs" class="section">

<div class="titlepage">

<div>

<div>

#### JDBC 3.0 javax.sql.RowSet Driver Implementation

</div>

</div>

</div>

The Virtuoso JDBC 3.0 driver has two implementations of the
`javax.sql.RowSet` interface - `virtuoso.javax.OPLCachedRowSet` and
`virtuoso.javax.OPLJdbcRowSet` .

The `virtuoso.javax.OPLCachedRowSet` class implements a totally
disconnected, memory cached rowset and the
`virtuoso.javax.OPLJdbcRowset` class spans the rest of the JDBC API to
implement it's methods.

</div>

<div id="jdbcrdf" class="section">

<div class="titlepage">

<div>

<div>

#### Extension datatype for RDF

</div>

</div>

</div>

The IRIs and RDF literals, kept in the Virtuoso RDF store are
represented by a strings and structures. Thus accessing RDF objects
needs special datatypes in order to distinguish strings from IRIs and to
get language and datatype of the RDF literals.

Therefore Virtuoso JDBC driver provides following classes for accessing
RDF store: `virtuoso.jdbc3.VirtuosoExtendedString` for IRIs and
`virtuoso.jdbc3.VirtuosoRdfBox` for RDF literal objects.

The class `virtuoso.jdbc3.VirtuosoExtendedString` will be returned when
a string representing an IRI is returned to the client. It has two
members "str" and "iriType", the "str" member keeps string
representation of the IRI, "iriType" denote regular IRI or blank node
with enum values VirtuosoExtendedString.IRI and
VirtuosoExtendedString.BNODE.

If the RDF literal object have language or datatype specified then
`virtuoso.jdbc3.VirtuosoRdfBox` will be returned. The following methods
could be used :

``` programlisting
      String toString () : returns string representation of the literal
      String getType () : returns string containing the datatype  of the literal
      String getLang () : returns language code for the literal
      
```

The following code snippet demonstrates how to use extension datatypes
for RDF

``` programlisting
    ... initialization etc. skipped for brevity
    boolean more = stmt.execute("sparql select * from <gr> where { ?x ?y ?z }");
    ResultSetMetaData data = stmt.getResultSet().getMetaData();
    while(more)
    {
    rs = stmt.getResultSet();
    while(rs.next())
    {
        for(int i = 1;i <= data.getColumnCount();i++)
        {
        String s = rs.getString(i);
        Object o = ((VirtuosoResultSet)rs).getObject(i);
        if (o instanceof VirtuosoExtendedString) // String representing an IRI
          {
            VirtuosoExtendedString vs = (VirtuosoExtendedString) o;
                    if (vs.iriType == VirtuosoExtendedString.IRI && (vs.strType & 0x01) == 0x01)
            System.out.println ("<" + vs.str +">");
            else if (vs.iriType == VirtuosoExtendedString.BNODE)
            System.out.println ("<" + vs.str +">");
          }
        else if (o instanceof VirtuosoRdfBox) // Typed literal
          {
            VirtuosoRdfBox rb = (VirtuosoRdfBox) o;
            System.out.println (rb.rb_box + " lang=" + rb.getLang() + " type=" + rb.getType());

          }
        else if(stmt.getResultSet().wasNull())
            System.out.println("NULL");
        else //
        {
            System.out.println(s);
        }

        }
    }
    more = stmt.getMoreResults();
    }
    ...
        
```

</div>

</div>
