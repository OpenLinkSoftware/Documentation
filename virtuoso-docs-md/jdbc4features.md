<div id="jdbc4features" class="section">

<div class="titlepage">

<div>

<div>

### 7.4.4. Virtuoso Driver JDBC 4.0 features

</div>

</div>

</div>

<div id="jdbc4dsprops" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver For JDBC 4.0 javax.sql.DataSource

</div>

</div>

</div>

JDBC 4.0 compliant applications and applets may connect to a JDBC data
source using JDBC `javax.sql.DataSource` instances. The Virtuoso JDBC
4.0 driver provides an implementation of the `javax.sql.DataSource`
interface in the `virtuoso.jdbc4.VirtuosoDataSource` class, supporting
the following properties:

<div id="jdbcdatasourceprops_01" class="decimalstyle">

**Table 7.16. JDBC 4.0 VirtuosoDataSource properties**

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

  

Additionally, the following attributres are supported:

``` programlisting

--- for SSL enabled ---
   public void setCertificate (String value);
   public String getCertificate ();

   public void setKeystorepass (String value);
   public String getKeystorepass ();

   public void setKeystorepath (String value);
   public String getKeystorepath ();

   public void setProvider (String value);
   public String getProvider ();

----------------------

   public void setFbs (int value);
   public int getFbs ();

   public void setSendbs (int value);
   public int getSendbs ();

   public void setRecvbs (int value);
   public int getRecvbs ();

   public void setRoundrobin (boolean value);
   public boolean getRoundrobin ();

-- For Java 1.6 and above
   public void setUsepstmtpool (boolean value);
   public boolean getUsepstmtpool ();

   public void setPstmtpoolsize (int value);
   public int getPstmtpoolsize ();
```

</div>

<div id="jdbcdspool4" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver For JDBC 4.0 & Connection Pooling

</div>

</div>

</div>

The Virtuoso JDBC 4.0 driver supports connection pooling.

The virtuoso.jdbc4.VirtuosoDataSource implements the
`javax.sql.ConnectionPoolDataSource` interface. In order to use the
connection pooling the administrator must deploy one instance of the
`virtuoso.jdbc4.VirtuosoDriver` in the JNDI repository and set all of
it's properties except `dataSourceName` . This is the "main" connection
pooling data source. Then the administrator should deploy a second
instance of the `virtuoso.jdbc4.VirtuosoDataSource` class and set only
it's `dataSourceName` property.

Applications will use the second `virtuoso.jdbc4.VirtuosoDataSource`
instance to get a connection. It will in turn call the first one to
obtain all connect info and return the `java.sql.Connection` instance.

VirtuosoConnectionPoolDataSource.class has the following connection
pooling attributes:

``` programlisting
/**
 * Get the minimum number of physical connections
 * the pool will keep available at all times. Zero ( 0 ) indicates that
 * connections will be created as needed.
 *
 * @return   the minimum number of physical connections
 *
**/
public int getMinPoolSize();

/**
 * Set the number of physical connections the pool should keep available
 * at all times. Zero ( 0 ) indicates that connections should be created
 * as needed
 * The default value is 0 .
 *
 * @param   parm a minimum number of physical connections
 *
 * @exception  java.sql.SQLException if an error occurs
 *
**/

public void setMinPoolSize(int parm);

/**
 * Get the maximum number of physical connections
 * the pool will be able contain. Zero ( 0 ) indicates no maximum size.
 *
 * @return   the maximum number of physical connections
 *
**/
public int getMaxPoolSize();

/**
 * Set the maximum number of physical conections that the pool should contain.
 * Zero ( 0 ) indicates no maximum size.
 * The default value is 0 .
 *
 * @param   parm a maximum number of physical connections
 *
 * @exception  java.sql.SQLException if an error occurs
 *
**/
public void setMaxPoolSize(int parm);

/**
 * Get the number of physical connections the pool
 * will contain when it is created
 *
 * @return   the number of physical connections
 *
**/
public int getInitialPoolSize();

/**
 * Set the number of physical connections the pool
 * should contain when it is created
 *
 * @param   parm a number of physical connections
 *
 * @exception  java.sql.SQLException if an error occurs
 *
**/
public void setInitialPoolSize(int parm);

/**
 * Get the number of seconds that a physical connection
 * will remain unused in the pool before the
 * connection is closed. Zero ( 0 ) indicates no limit.
 *
 * @return   the number of seconds
**/
public int getMaxIdleTime();

/**
 * Set the number of seconds that a physical connection
 * should remain unused in the pool before the
 * connection is closed. Zero ( 0 ) indicates no limit.
 *
 * @param  parm a number of seconds
 *
 * @exception  java.sql.SQLException if an error occurs
 *
**/
public void setMaxIdleTime(int parm);

/**
 * Get the interval, in seconds, that the pool will wait
 * before enforcing the current policy defined by the
 * values of the above connection pool properties
 *
 * @return  the interval (in seconds)
**/
public int getPropertyCycle();

/**
 * Set the interval, in seconds, that the pool should wait
 * before enforcing the current policy defined by the
 * values of the above connection pool properties
 *
 * @param  parm an interval (in seconds)
**/
public void setPropertyCycle(int parm);

/**
 * Get the total number of statements that the pool will
 * keep open. Zero ( 0 ) indicates that caching of
 * statements is disabled.
 *
 * @return  the total number of statements
**/
public int getMaxStatements();

/**
 * Set the total number of statements that the pool should
 * keep open. Zero ( 0 ) indicates that caching of
 * statements is disabled.
 *
 * @param  parm a total number of statements
 *
 * @exception  java.sql.SQLException if an error occurs
 *
**/
public void setMaxStatements(int parm);
```

</div>

<div id="jdbcxa4" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver For JDBC 4.0 & Distributed Transactions

</div>

</div>

</div>

Virtuoso supports the industry standard XA specification for distributed
transaction processing. The XA specification defines an interface
between the transaction manager (TM) and resource manager (RM) in a
distributed transaction system. This is a generic interface and it does
not directly address the use of distributed transactions from Java. The
Java mapping of the XA interface is defined in Sun Microsystems Java
Transaction API (JTA) and JDBC 4.0 specifications. The Virtuoso JDBC 4.0
driver supports the JTA architecture by providing the implementation of
JTA resource manager interfaces.

The Virtuoso JDBC 4.0 driver provides the `virtuoso.java3.VirtuosoXid` ,
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
<a href="jdbc4features.html#jdbc4dsprops" class="link"
title="Virtuoso Driver For JDBC 4.0 javax.sql.DataSource">Virtuoso
Driver For JDBC 4.0 javax.sql.DataSource</a> .

For example, the following has to be done in case of Sun's J2EE
Reference Implementation.

<div class="orderedlist">

1.  Add the path of virtjdbc4.jar to the J2EE_CLASSPATH variable in the
    file \$(J2EE_HOME)/bin/userconfig.bat on Windows or
    \$(J2EE_HOME)/bin/userconfig.sh on Unix/Linux:

    ``` programlisting
        set J2EE_CLASSPATH=C:/Virtuoso/lib/virtjdbc4.jar
    ```

    or

    ``` programlisting
        J2EE_CLASSPATH=/home/login/virtuoso/lib/virtjdbc4.jar
        export J2EE_CLASSPATH
    ```

2.  Using the following command add the XA datasource with JNDI name
    "jdbc/Virtuoso" which refers to the Virtuoso server running on the
    same computer on port 1111:

    ``` programlisting
        j2eeadmin -addJdbcXADatasource jdbc/Virtuoso virtuoso.jdbc4.VirtuosoXADataSource -props serverName=localhost portNumber=1111
    ```

</div>

</div>

<div id="jdbcrs4" class="section">

<div class="titlepage">

<div>

<div>

#### JDBC 4.0 javax.sql.RowSet Driver Implementation

</div>

</div>

</div>

The Virtuoso JDBC 4.0 driver has two implementations of the
`javax.sql.RowSet` interface - `virtuoso.javax.OPLCachedRowSet` and
`virtuoso.javax.OPLJdbcRowSet` .

The `virtuoso.javax.OPLCachedRowSet` class implements a totally
disconnected, memory cached rowset and the
`virtuoso.javax.OPLJdbcRowset` class spans the rest of the JDBC API to
implement it's methods.

</div>

<div id="jdbcrdf4" class="section">

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
RDF store: `virtuoso.jdbc4.VirtuosoExtendedString` for IRIs and
`virtuoso.jdbc4.VirtuosoRdfBox` for RDF literal objects.

The class `virtuoso.jdbc4.VirtuosoExtendedString` will be returned when
a string representing an IRI is returned to the client. It has two
members "str" and "iriType", the "str" member keeps string
representation of the IRI, "iriType" denote regular IRI or blank node
with enum values VirtuosoExtendedString.IRI and
VirtuosoExtendedString.BNODE.

If the RDF literal object have language or datatype specified then
`virtuoso.jdbc4.VirtuosoRdfBox` will be returned. The following methods
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
