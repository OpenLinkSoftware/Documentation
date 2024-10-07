<div id="mt_jdbcref" class="section">

<div class="titlepage">

<div>

<div>

## 11.11. JDBC 3 Driver Classes

</div>

</div>

</div>

The OpenLink JDBC driver for JDBC 3.0 has the following classes:

<div id="mt_jd1.1" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.1. Class BaseRowSet

</div>

</div>

</div>

<span id="id12188" class="indexterm"></span> <span id="id12190"
class="indexterm"></span>

<div id="mt_jd1.1.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
abstract public class BaseRowSet implements RowSet,Serializable {
  // Public Constructors
  public BaseRowSet();
  // Public Methods
  public void close() throws java.sql.SQLException;
  public void addRowSetListener(javax.sql.RowSetListener rowsetlistener);
  public void removeRowSetListener(javax.sql.RowSetListener rowsetlistener);
  public void clearParameters() throws java.sql.SQLException;
  public String getCommand();
  public int getConcurrency() throws java.sql.SQLException;
  public String getDataSourceName();
  public boolean getEscapeProcessing() throws java.sql.SQLException;
  public int getFetchDirection() throws java.sql.SQLException;
  public int getFetchSize() throws java.sql.SQLException;
  public int getMaxFieldSize() throws java.sql.SQLException;
  public int getMaxRows() throws java.sql.SQLException;
  public Object[] getParams() throws java.sql.SQLException;
  public String getPassword();
  public int getQueryTimeout() throws java.sql.SQLException;
  public int getTransactionIsolation();
  public int getType() throws java.sql.SQLException;
  public Map getTypeMap() throws java.sql.SQLException;
  public String getUrl() throws java.sql.SQLException;
  public String getUsername();
  public boolean isReadOnly();
  public void setArray(int parameterIndex, java.sql.Array x) 
      throws java.sql.SQLException;
  public void setAsciiStream(int parameterIndex, java.io.InputStream x, 
                             int length) throws java.sql.SQLException;
  public void setBigDecimal(int parameterIndex, java.math.BigDecimal x) 
      throws java.sql.SQLException;
  public void setBinaryStream(int parameterIndex, java.io.InputStream x, 
                              int length) throws java.sql.SQLException;
  public void setBlob(int parameterIndex, java.sql.Blob x) 
      throws java.sql.SQLException;
  public void setBoolean(int parameterIndex, boolean x) 
      throws java.sql.SQLException;
  public void setByte(int parameterIndex, byte x) throws java.sql.SQLException;
  public void setBytes(int parameterIndex, byte[] x) 
      throws java.sql.SQLException;
  public void setCharacterStream(int parameterIndex, java.io.Reader x, 
                                 int length) throws java.sql.SQLException;
  public void setClob(int parameterIndex, java.sql.Clob x) 
      throws java.sql.SQLException;
  public void setDate(int parameterIndex, java.sql.Date x) 
      throws java.sql.SQLException;
  public void setDate(int parameterIndex, java.sql.Date x, 
                      java.util.Calendar cal) throws java.sql.SQLException;
  public void setDouble(int parameterIndex, double x) 
      throws java.sql.SQLException;
  public void setFloat(int parameterIndex, float x) 
      throws java.sql.SQLException;
  public void setInt(int parameterIndex, int x) throws java.sql.SQLException;
  public void setLong(int parameterIndex, long x) throws java.sql.SQLException;
  public void setRef(int parameterIndex, java.sql.Ref x) 
      throws java.sql.SQLException;
  public void setShort(int parameterIndex, short x) 
      throws java.sql.SQLException;
  public void setString(int parameterIndex, java.lang.String x) 
      throws java.sql.SQLException;
  public void setTime(int parameterIndex, java.sql.Time x) 
      throws java.sql.SQLException;
  public void setTime(int parameterIndex, java.sql.Time x, 
                      java.util.Calendar cal) throws java.sql.SQLException;
  public void setTimestamp(int parameterIndex, java.sql.Timestamp x) 
      throws java.sql.SQLException;
  public void setTimestamp(int parameterIndex, java.sql.Timestamp x, 
                           java.util.Calendar cal) 
      throws java.sql.SQLException;
  public void setUnicodeStream(int parameterIndex, java.io.InputStream x, 
                               int length) throws java.sql.SQLException;
  public void setNull(int parameterIndex, int sqlType) 
      throws java.sql.SQLException;
  public void setNull(int parameterIndex, int sqlType, 
                      java.lang.String typeName) throws java.sql.SQLException;
  public void setObject(int parameterIndex, java.lang.Object x) 
      throws java.sql.SQLException;
  public void setObject(int parameterIndex, java.lang.Object x, 
                        int targetSqlType) throws java.sql.SQLException;
  public void setObject(int parameterIndex, java.lang.Object x, 
                        int targetSqlType, int scale) 
      throws java.sql.SQLException;
  public void setCommand(java.lang.String s) throws java.sql.SQLException;
  public void setConcurrency(int i) throws java.sql.SQLException;
  public void setDataSourceName(java.lang.String s) 
      throws java.sql.SQLException;
  public void setEscapeProcessing(boolean flag) throws java.sql.SQLException;
  public void setFetchDirection(int direction) throws java.sql.SQLException;
  public void setFetchSize(int rows) throws java.sql.SQLException;
  public void setMaxFieldSize(int max) throws java.sql.SQLException;
  public void setMaxRows(int max) throws java.sql.SQLException;
  public void setQueryTimeout(int seconds) throws java.sql.SQLException;
  public void setReadOnly(boolean value) throws java.sql.SQLException;
  public void setPassword(java.lang.String s) throws java.sql.SQLException;
  public void setTransactionIsolation(int value) throws java.sql.SQLException;
  public void setType(int value) throws java.sql.SQLException;
  public void setTypeMap(java.util.Map value) throws java.sql.SQLException;
  public void setUrl(java.lang.String s) throws java.sql.SQLException;
  public void setUsername(java.lang.String s) throws java.sql.SQLException;
}
      
```

<div class="informaltable">

|     Inheritance Path      |
|:-------------------------:|
|     java.lang.Object      |
|            \|             |
| openlink.javax.BaseRowSet |

</div>

</div>

<div id="mt_jd1.1.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.1.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method addRowSetListener(RowSetListener)

</div>

</div>

</div>

<span id="id12373" class="indexterm"></span> <span id="id12375"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void addRowSetListener(
>                         javax.sql.RowSetListener rowsetlistener);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                     |
|----------------------------------------------------------------|
| <span class="emphasis">*`listener`*</span> - an event listener |

</div>

RowSet listener registration. Listeners are notified when an event
occurs.

</div>

<div id="mt_jd1.1.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method clearParameters()

</div>

</div>

</div>

<span id="id12400" class="indexterm"></span> <span id="id12402"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void clearParameters() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

In general, parameter values remain in force for repeated use of a
RowSet. Setting a parameter value automatically clears its previous
value. However, in some cases it is useful to immediately release the
resources used by the current parameter values; this can be done by
calling clearParameters.

</div>

<div id="mt_jd1.1.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCommand()

</div>

</div>

</div>

<span id="id12427" class="indexterm"></span> <span id="id12429"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getCommand();
>           
> ```

</div>

Get the rowset's command property. The command property contains a
command string that can be executed to fill the rowset with data. The
default value is null.

</div>

<div id="mt_jd1.1.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConcurrency()

</div>

</div>

</div>

<span id="id12439" class="indexterm"></span> <span id="id12441"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getConcurrency() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the rowset concurrency.

</div>

<div id="mt_jd1.1.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDataSourceName()

</div>

</div>

</div>

<span id="id12466" class="indexterm"></span> <span id="id12468"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getDataSourceName();
>           
> ```

</div>

The JNDI name that identifies a JDBC data source. Users should set
either the url or data source name properties. The most recent property
set is used to get a connection.

</div>

<div id="mt_jd1.1.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method getEscapeProcessing()

</div>

</div>

</div>

<span id="id12478" class="indexterm"></span> <span id="id12480"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getEscapeProcessing() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

If escape scanning is on (the default), the driver will do escape
substitution before sending the SQL to the database.

</div>

<div id="mt_jd1.1.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFetchDirection()

</div>

</div>

</div>

<span id="id12505" class="indexterm"></span> <span id="id12507"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getFetchDirection() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Determine the fetch direction.

</div>

<div id="mt_jd1.1.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFetchSize()

</div>

</div>

</div>

<span id="id12532" class="indexterm"></span> <span id="id12534"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getFetchSize() throws java.sql.SQLException;
>           
> ```

</div>

Determine the default fetch size.

</div>

<div id="mt_jd1.1.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMaxFieldSize()

</div>

</div>

</div>

<span id="id12544" class="indexterm"></span> <span id="id12546"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMaxFieldSize() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The maxFieldSize limit (in bytes) is the maximum amount of data returned
for any column value; it only applies to BINARY, VARBINARY,
LONGVARBINARY, CHAR, VARCHAR, and LONGVARCHAR columns. If the limit is
exceeded, the excess data is silently discarded.

</div>

<div id="mt_jd1.1.2.10" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMaxRows()

</div>

</div>

</div>

<span id="id12571" class="indexterm"></span> <span id="id12573"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMaxRows() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The maxRows limit is the maximum number of rows that a RowSet can
contain. If the limit is exceeded, the excess rows are silently dropped.

</div>

<div id="mt_jd1.1.2.11" class="section">

<div class="titlepage">

<div>

<div>

##### Method getParams()

</div>

</div>

</div>

<span id="id12598" class="indexterm"></span> <span id="id12600"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object[] getParams() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the parameters that were set on the rowset.

</div>

<div id="mt_jd1.1.2.12" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPassword()

</div>

</div>

</div>

<span id="id12625" class="indexterm"></span> <span id="id12627"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getPassword();
>           
> ```

</div>

The password used to create a database connection. The password property
is set at runtime before calling execute(). It is not usually part of
the serialized state of a rowset object.

</div>

<div id="mt_jd1.1.2.13" class="section">

<div class="titlepage">

<div>

<div>

##### Method getQueryTimeout()

</div>

</div>

</div>

<span id="id12637" class="indexterm"></span> <span id="id12639"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getQueryTimeout() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The queryTimeout limit is the number of seconds the driver will wait for
a Statement to execute. If the limit is exceeded, a SQLException is
thrown.

</div>

<div id="mt_jd1.1.2.14" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTransactionIsolation()

</div>

</div>

</div>

<span id="id12664" class="indexterm"></span> <span id="id12666"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getTransactionIsolation();
>           
> ```

</div>

The transaction isolation property contains the JDBC transaction
isolation level used.

</div>

<div id="mt_jd1.1.2.15" class="section">

<div class="titlepage">

<div>

<div>

##### Method getType()

</div>

</div>

</div>

<span id="id12676" class="indexterm"></span> <span id="id12678"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getType() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Return the type of this result set.

</div>

<div id="mt_jd1.1.2.16" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTypeMap()

</div>

</div>

</div>

<span id="id12703" class="indexterm"></span> <span id="id12705"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Map getTypeMap() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the type-map object associated with this rowset. By default, the map
returned is empty.

</div>

<div id="mt_jd1.1.2.17" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUrl()

</div>

</div>

</div>

<span id="id12730" class="indexterm"></span> <span id="id12732"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getUrl() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the url used to create a JDBC connection. The default value is null.

</div>

<div id="mt_jd1.1.2.18" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUsername()

</div>

</div>

</div>

<span id="id12757" class="indexterm"></span> <span id="id12759"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getUsername();
>           
> ```

</div>

The username used to create a database connection. The username property
is set at runtime before calling execute(). It is not usually part of
the serialized state of a rowset object.

</div>

<div id="mt_jd1.1.2.19" class="section">

<div class="titlepage">

<div>

<div>

##### Method isReadOnly()

</div>

</div>

</div>

<span id="id12769" class="indexterm"></span> <span id="id12771"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isReadOnly();
>           
> ```

</div>

A rowset may be read-only. Attempts to update a read-only rowset will
result in an SQLException being thrown. Rowsets are updateable, by
default, if updates are possible.

</div>

<div id="mt_jd1.1.2.20" class="section">

<div class="titlepage">

<div>

<div>

##### Method removeRowSetListener(RowSetListener)

</div>

</div>

</div>

<span id="id12781" class="indexterm"></span> <span id="id12783"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void removeRowSetListener(
>                         javax.sql.RowSetListener rowsetlistener);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                     |
|----------------------------------------------------------------|
| <span class="emphasis">*`listener`*</span> - an event listener |

</div>

RowSet listener deregistration.

</div>

<div id="mt_jd1.1.2.21" class="section">

<div class="titlepage">

<div>

<div>

##### Method setArray(int, Array)

</div>

</div>

</div>

<span id="id12808" class="indexterm"></span> <span id="id12810"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setArray(int parameterIndex, java.sql.Array x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`i`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - an object representing an SQL array            |

</div>

Set an Array parameter.

</div>

<div id="mt_jd1.1.2.22" class="section">

<div class="titlepage">

<div>

<div>

##### Method setAsciiStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id12841" class="indexterm"></span> <span id="id12843"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setAsciiStream(int parameterIndex, java.io.InputStream x, 
>                                      int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                           |
|------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ...    |
| <span class="emphasis">*`x`*</span> - the java input stream which contains the ASCII parameter value |
| <span class="emphasis">*`length`*</span> - the number of bytes in the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

When a very large ASCII value is input to a LONGVARCHAR parameter, it
may be more practical to send it via a java.io.InputStream. JDBC will
read the data from the stream as needed, until it reaches end-of-file.

<span class="emphasis">*Note:*</span> This stream object can either be a
standard Java stream object or your own subclass that implements the
standard interface.

</div>

<div id="mt_jd1.1.2.23" class="section">

<div class="titlepage">

<div>

<div>

##### Method setBigDecimal(int, BigDecimal)

</div>

</div>

</div>

<span id="id12897" class="indexterm"></span> <span id="id12899"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setBigDecimal(int parameterIndex, java.math.BigDecimal x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.lang.BigDecimal value.

</div>

<div id="mt_jd1.1.2.24" class="section">

<div class="titlepage">

<div>

<div>

##### Method setBinaryStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id12945" class="indexterm"></span> <span id="id12947"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setBinaryStream(int parameterIndex, 
>                                       java.io.InputStream x, int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                            |
|-------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ...     |
| <span class="emphasis">*`x`*</span> - the java input stream which contains the binary parameter value |
| <span class="emphasis">*`length`*</span> - the number of bytes in the stream                          |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

When a very large binary value is input to a LONGVARBINARY parameter, it
may be more practical to send it via a java.io.InputStream. JDBC will
read the data from the stream as needed, until it reaches end-of-file.

<span class="emphasis">*Note:*</span> This stream object can either be a
standard Java stream object or your own subclass that implements the
standard interface.

</div>

<div id="mt_jd1.1.2.25" class="section">

<div class="titlepage">

<div>

<div>

##### Method setBlob(int, Blob)

</div>

</div>

</div>

<span id="id13001" class="indexterm"></span> <span id="id13003"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setBlob(int parameterIndex, java.sql.Blob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`i`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - an object representing a BLOB                  |

</div>

Set a BLOB parameter.

</div>

<div id="mt_jd1.1.2.26" class="section">

<div class="titlepage">

<div>

<div>

##### Method setBoolean(int, boolean)

</div>

</div>

</div>

<span id="id13034" class="indexterm"></span> <span id="id13036"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setBoolean(int parameterIndex, boolean x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java boolean value.

</div>

<div id="mt_jd1.1.2.27" class="section">

<div class="titlepage">

<div>

<div>

##### Method setByte(int, byte)

</div>

</div>

</div>

<span id="id13082" class="indexterm"></span> <span id="id13084"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setByte(int parameterIndex, byte x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java byte value.

</div>

<div id="mt_jd1.1.2.28" class="section">

<div class="titlepage">

<div>

<div>

##### Method setBytes(int, byte\[\])

</div>

</div>

</div>

<span id="id13130" class="indexterm"></span> <span id="id13132"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setBytes(int parameterIndex, byte[] x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java array of bytes.

</div>

<div id="mt_jd1.1.2.29" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCharacterStream(int, Reader, int)

</div>

</div>

</div>

<span id="id13178" class="indexterm"></span> <span id="id13180"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCharacterStream(int parameterIndex, java.io.Reader x, 
>                                          int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the java reader which contains the UNICODE data             |
| <span class="emphasis">*`length`*</span> - the number of characters in the stream                 |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

When a very large UNICODE value is input to a LONGVARCHAR parameter, it
may be more practical to send it via a java.io.Reader. JDBC will read
the data from the stream as needed, until it reaches end-of-file.

<span class="emphasis">*Note:*</span> This stream object can either be a
standard Java stream object or your own subclass that implements the
standard interface.

</div>

<div id="mt_jd1.1.2.30" class="section">

<div class="titlepage">

<div>

<div>

##### Method setClob(int, Clob)

</div>

</div>

</div>

<span id="id13234" class="indexterm"></span> <span id="id13236"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setClob(int parameterIndex, java.sql.Clob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`i`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - an object representing a CLOB                  |

</div>

Set a CLOB parameter.

</div>

<div id="mt_jd1.1.2.31" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCommand(String)

</div>

</div>

</div>

<span id="id13267" class="indexterm"></span> <span id="id13269"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCommand(java.lang.String s) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`cmd`*</span> - a command string, may be null |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the rowset's command property. This property is optional. The
command property may not be needed when a rowset is produced by a data
source that doesn't support commands, such as a spreadsheet.

</div>

<div id="mt_jd1.1.2.32" class="section">

<div class="titlepage">

<div>

<div>

##### Method setConcurrency(int)

</div>

</div>

</div>

<span id="id13309" class="indexterm"></span> <span id="id13311"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setConcurrency(int i) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                        |
|-----------------------------------------------------------------------------------|
| <span class="emphasis">*`concurrency`*</span> - a value from ResultSet.CONCUR_XXX |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the rowset concurrency.

</div>

<div id="mt_jd1.1.2.33" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDataSourceName(String)

</div>

</div>

</div>

<span id="id13351" class="indexterm"></span> <span id="id13353"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDataSourceName(java.lang.String s) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`name`*</span> - a data source name |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the data source name.

</div>

<div id="mt_jd1.1.2.34" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDate(int, Date)

</div>

</div>

</div>

<span id="id13393" class="indexterm"></span> <span id="id13395"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDate(int parameterIndex, java.sql.Date x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.sql.Date value.

</div>

<div id="mt_jd1.1.2.35" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDate(int, Date, Calendar)

</div>

</div>

</div>

<span id="id13441" class="indexterm"></span> <span id="id13443"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDate(int parameterIndex, java.sql.Date x, 
>                               java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.sql.Date value. The driver converts this to a
SQL DATE value when it sends it to the database.

</div>

<div id="mt_jd1.1.2.36" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDouble(int, double)

</div>

</div>

</div>

<span id="id13490" class="indexterm"></span> <span id="id13492"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDouble(int parameterIndex, double x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java double value.

</div>

<div id="mt_jd1.1.2.37" class="section">

<div class="titlepage">

<div>

<div>

##### Method setEscapeProcessing(boolean)

</div>

</div>

</div>

<span id="id13538" class="indexterm"></span> <span id="id13540"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setEscapeProcessing(boolean flag) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                  |
|-----------------------------------------------------------------------------|
| <span class="emphasis">*`enable`*</span> - true to enable; false to disable |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

If escape scanning is on (the default), the driver will do escape
substitution before sending the SQL to the database.

</div>

<div id="mt_jd1.1.2.38" class="section">

<div class="titlepage">

<div>

<div>

##### Method setFetchDirection(int)

</div>

</div>

</div>

<span id="id13580" class="indexterm"></span> <span id="id13582"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setFetchDirection(int direction) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                                                    |
|--------------|--------------------------------------------------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or the result set type is TYPE_FORWARD_ONLY and direction is not FETCH_FORWARD. |

</div>

Give a hint as to the direction in which the rows in this result set
will be processed. The initial value is determined by the statement that
produced the result set. The fetch direction may be changed at any time.

</div>

<div id="mt_jd1.1.2.39" class="section">

<div class="titlepage">

<div>

<div>

##### Method setFetchSize(int)

</div>

</div>

</div>

<span id="id13608" class="indexterm"></span> <span id="id13610"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setFetchSize(int rows) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                           |
|----------------------------------------------------------------------|
| <span class="emphasis">*`rows`*</span> - the number of rows to fetch |

</div>

<div class="informaltable">

| Exceptions   |                                                                                                        |
|--------------|--------------------------------------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or the condition 0 \<= rows \<= this.getMaxRows() is not satisfied. |

</div>

Give the JDBC driver a hint as to the number of rows that should be
fetched from the database when more rows are needed for this result set.
If the fetch size specified is zero, then the JDBC driver ignores the
value, and is free to make its own best guess as to what the fetch size
should be. The default value is set by the statement that creates the
result set. The fetch size may be changed at any time.

</div>

<div id="mt_jd1.1.2.40" class="section">

<div class="titlepage">

<div>

<div>

##### Method setFloat(int, float)

</div>

</div>

</div>

<span id="id13650" class="indexterm"></span> <span id="id13652"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setFloat(int parameterIndex, float x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java float value. The driver converts this to a SQL
FLOAT value when it sends it to the database.

</div>

<div id="mt_jd1.1.2.41" class="section">

<div class="titlepage">

<div>

<div>

##### Method setInt(int, int)

</div>

</div>

</div>

<span id="id13698" class="indexterm"></span> <span id="id13700"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setInt(int parameterIndex, int x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java int value.

</div>

<div id="mt_jd1.1.2.42" class="section">

<div class="titlepage">

<div>

<div>

##### Method setLong(int, long)

</div>

</div>

</div>

<span id="id13746" class="indexterm"></span> <span id="id13748"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setLong(int parameterIndex, long x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java long value.

</div>

<div id="mt_jd1.1.2.43" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMaxFieldSize(int)

</div>

</div>

</div>

<span id="id13794" class="indexterm"></span> <span id="id13796"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMaxFieldSize(int max) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`max`*</span> - the new max column size limit; zero means unlimited |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The maxFieldSize limit (in bytes) is set to limit the size of data that
can be returned for any column value; it only applies to BINARY,
VARBINARY, LONGVARBINARY, CHAR, VARCHAR, and LONGVARCHAR fields. If the
limit is exceeded, the excess data is silently discarded. For maximum
portability use values greater than 256.

</div>

<div id="mt_jd1.1.2.44" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMaxRows(int)

</div>

</div>

</div>

<span id="id13836" class="indexterm"></span> <span id="id13838"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMaxRows(int max) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`max`*</span> - the new max rows limit; zero means unlimited |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The maxRows limit is set to limit the number of rows that any RowSet can
contain. If the limit is exceeded, the excess rows are silently dropped.

</div>

<div id="mt_jd1.1.2.45" class="section">

<div class="titlepage">

<div>

<div>

##### Method setNull(int, int)

</div>

</div>

</div>

<span id="id13878" class="indexterm"></span> <span id="id13880"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setNull(int parameterIndex, int sqlType) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`sqlType`*</span> - SQL type code defined by java.sql.Types               |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to SQL NULL.

<span class="emphasis">*Note:*</span> You must specify the parameter's
SQL type.

</div>

<div id="mt_jd1.1.2.46" class="section">

<div class="titlepage">

<div>

<div>

##### Method setNull(int, int, String)

</div>

</div>

</div>

<span id="id13928" class="indexterm"></span> <span id="id13930"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setNull(int parameterIndex, int sqlType, 
>                               java.lang.String typeName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ...                                                         |
| <span class="emphasis">*`sqlType`*</span> - a value from java.sql.Types                                                                                   |
| <span class="emphasis">*`typeName`*</span> - the fully-qualified name of an SQL user-named type, ignored if the parameter is not a user-named type or REF |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Sets the designated parameter to SQL NULL. This version of setNull
should be used for user-named types and REF type parameters. Examples of
user-named types include: STRUCT, DISTINCT, JAVA_OBJECT, and named array
types.

<span class="emphasis">*Note:*</span> To be portable, applications must
give the SQL type code and the fully-qualified SQL type name when
specifying a NULL user-defined or REF parameter. In the case of a
user-named type the name is the type name of the parameter itself. For a
REF parameter the name is the type name of the referenced type. If a
JDBC driver does not need the type code or type name information, it may
ignore it. Although it is intended for user-named and Ref parameters,
this method may be used to set a null parameter of any JDBC type. If the
parameter does not have a user-named or REF type, the given typeName is
ignored.

</div>

<div id="mt_jd1.1.2.47" class="section">

<div class="titlepage">

<div>

<div>

##### Method setObject(int, Object)

</div>

</div>

</div>

<span id="id13984" class="indexterm"></span> <span id="id13986"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setObject(int parameterIndex, java.lang.Object x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - The first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - The object containing the input parameter value             |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the value of a parameter using an object; use the java.lang
equivalent objects for integral values.

The JDBC specification specifies a standard mapping from Java Object
types to SQL types. The given argument java object will be converted to
the corresponding SQL type before being sent to the database.

Note that this method may be used to pass datatabase specific abstract
data types, by using a Driver specific Java type. If the object is of a
class implementing SQLData, the rowset should call its method writeSQL()
to write it to the SQL data stream. else If the object is of a class
implementing Ref, Blob, Clob, Struct, or Array then pass it to the
database as a value of the corresponding SQL type. Raise an exception if
there is an ambiguity, for example, if the object is of a class
implementing more than one of those interfaces.

</div>

<div id="mt_jd1.1.2.48" class="section">

<div class="titlepage">

<div>

<div>

##### Method setObject(int, Object, int)

</div>

</div>

</div>

<span id="id14034" class="indexterm"></span> <span id="id14036"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setObject(int parameterIndex, java.lang.Object x, 
>                                 int targetSqlType) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

This method is like setObject above, but the scale used is the scale of
the second parameter. Scalar values have a scale of zero. Literal values
have the scale present in the literal. While it is supported, it is not
recommended that this method not be called with floating point input
values.

</div>

<div id="mt_jd1.1.2.49" class="section">

<div class="titlepage">

<div>

<div>

##### Method setObject(int, Object, int, int)

</div>

</div>

</div>

<span id="id14064" class="indexterm"></span> <span id="id14066"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setObject(int parameterIndex, java.lang.Object x, 
>                                 int targetSqlType, int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - The first parameter is 1, the second is 2, ...                                                                                                    |
| <span class="emphasis">*`x`*</span> - The object containing the input parameter value                                                                                                                |
| <span class="emphasis">*`targetSqlType`*</span> - The SQL type (as defined in java.sql.Types) to be sent to the database. The scale argument may further qualify this type.                          |
| <span class="emphasis">*`scale`*</span> - For java.sql.Types.DECIMAL or java.sql.Types.NUMERIC types this is the number of digits after the decimal. For all other types this value will be ignored, |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="informaltable">

| Additional Information |                                                |
|------------------------|------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.Types</span> |

</div>

Set the value of a parameter using an object; use the java.lang
equivalent objects for integral values.

The given Java object will be converted to the targetSqlType before
being sent to the database. If the object is of a class implementing
SQLData, the rowset should call its method writeSQL() to write it to the
SQL data stream. else If the object is of a class implementing Ref,
Blob, Clob, Struct, or Array then pass it to the database as a value of
the corresponding SQL type.

Note that this method may be used to pass datatabase- specific abstract
data types.

</div>

<div id="mt_jd1.1.2.50" class="section">

<div class="titlepage">

<div>

<div>

##### Method setPassword(String)

</div>

</div>

</div>

<span id="id14143" class="indexterm"></span> <span id="id14145"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setPassword(java.lang.String s) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                       |
|------------------------------------------------------------------|
| <span class="emphasis">*`password`*</span> - the password string |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the password.

</div>

<div id="mt_jd1.1.2.51" class="section">

<div class="titlepage">

<div>

<div>

##### Method setQueryTimeout(int)

</div>

</div>

</div>

<span id="id14185" class="indexterm"></span> <span id="id14187"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setQueryTimeout(int seconds) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                               |
|----------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`seconds`*</span> - the new query timeout limit in seconds; zero means unlimited |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The queryTimeout limit is the number of seconds the driver will wait for
a Statement to execute. If the limit is exceeded, a SQLException is
thrown.

</div>

<div id="mt_jd1.1.2.52" class="section">

<div class="titlepage">

<div>

<div>

##### Method setReadOnly(boolean)

</div>

</div>

</div>

<span id="id14227" class="indexterm"></span> <span id="id14229"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setReadOnly(boolean value) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`value`*</span> - true if read-only, false otherwise |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the read-onlyness of the rowset

</div>

<div id="mt_jd1.1.2.53" class="section">

<div class="titlepage">

<div>

<div>

##### Method setRef(int, Ref)

</div>

</div>

</div>

<span id="id14269" class="indexterm"></span> <span id="id14271"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setRef(int parameterIndex, java.sql.Ref x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`i`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - an object representing data of an SQL REF Type |

</div>

Set a REF(\<structured-type\>) parameter.

</div>

<div id="mt_jd1.1.2.54" class="section">

<div class="titlepage">

<div>

<div>

##### Method setShort(int, short)

</div>

</div>

</div>

<span id="id14302" class="indexterm"></span> <span id="id14304"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setShort(int parameterIndex, short x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java short value.

</div>

<div id="mt_jd1.1.2.55" class="section">

<div class="titlepage">

<div>

<div>

##### Method setString(int, String)

</div>

</div>

</div>

<span id="id14350" class="indexterm"></span> <span id="id14352"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setString(int parameterIndex, java.lang.String x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a Java String value.

</div>

<div id="mt_jd1.1.2.56" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTime(int, Time)

</div>

</div>

</div>

<span id="id14398" class="indexterm"></span> <span id="id14400"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTime(int parameterIndex, java.sql.Time x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.sql.Time value.

</div>

<div id="mt_jd1.1.2.57" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTime(int, Time, Calendar)

</div>

</div>

</div>

<span id="id14446" class="indexterm"></span> <span id="id14448"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTime(int parameterIndex, java.sql.Time x, 
>                               java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.sql.Time value. The driver converts this to a
SQL TIME value when it sends it to the database.

</div>

<div id="mt_jd1.1.2.58" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTimestamp(int, Timestamp)

</div>

</div>

</div>

<span id="id14495" class="indexterm"></span> <span id="id14497"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTimestamp(int parameterIndex, java.sql.Timestamp x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.sql.Timestamp value.

</div>

<div id="mt_jd1.1.2.59" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTimestamp(int, Timestamp, Calendar)

</div>

</div>

</div>

<span id="id14543" class="indexterm"></span> <span id="id14545"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTimestamp(int parameterIndex, java.sql.Timestamp x, 
>                                    java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                        |
|---------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the parameter value                                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set a parameter to a java.sql.Timestamp value. The driver converts this
to a SQL TIMESTAMP value when it sends it to the database.

</div>

<div id="mt_jd1.1.2.60" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTransactionIsolation(int)

</div>

</div>

</div>

<span id="id14592" class="indexterm"></span> <span id="id14594"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTransactionIsolation(int value) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                |
|---------------------------------------------------------------------------|
| <span class="emphasis">*`level`*</span> - the transaction isolation level |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the transaction isolation.

</div>

<div id="mt_jd1.1.2.61" class="section">

<div class="titlepage">

<div>

<div>

##### Method setType(int)

</div>

</div>

</div>

<span id="id14634" class="indexterm"></span> <span id="id14636"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setType(int value) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                            |
|-----------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`value`*</span> - may be TYPE_FORWARD_ONLY, TYPE_SCROLL_INSENSITIVE, or TYPE_SCROLL_SENSITIVE |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Set the type of this result set.

</div>

<div id="mt_jd1.1.2.62" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTypeMap(Map)

</div>

</div>

</div>

<span id="id14676" class="indexterm"></span> <span id="id14678"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTypeMap(java.util.Map value) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                           |
|------------------------------------------------------|
| <span class="emphasis">*`map`*</span> - a map object |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Install a type-map object as the default type-map for this rowset.

</div>

<div id="mt_jd1.1.2.63" class="section">

<div class="titlepage">

<div>

<div>

##### Method setUnicodeStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id14718" class="indexterm"></span> <span id="id14720"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setUnicodeStream(int parameterIndex, 
>                                        java.io.InputStream x, int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                             |
|--------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`parameterIndex`*</span> - the first parameter is 1, the second is 2, ...      |
| <span class="emphasis">*`x`*</span> - the java input stream which contains the UNICODE parameter value |
| <span class="emphasis">*`length`*</span> - the number of bytes in the stream                           |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                                                                                                                                                                                                                                                 |
|:----------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                                                                                                                                                                                                                                                      |
|                                    | When a very large UNICODE value is input to a LONGVARCHAR parameter, it may be more practical to send it via a java.io.InputStream. JDBC will read the data from the stream as needed, until it reaches end-of-file. The JDBC driver will do any necessary conversion from UNICODE to the database char format. |

</div>

<span class="emphasis">*Note:*</span> This stream object can either be a
standard Java stream object or your own subclass that implements the
standard interface.

</div>

<div id="mt_jd1.1.2.64" class="section">

<div class="titlepage">

<div>

<div>

##### Method setUrl(String)

</div>

</div>

</div>

<span id="id14776" class="indexterm"></span> <span id="id14778"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setUrl(java.lang.String s) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                          |
|---------------------------------------------------------------------|
| <span class="emphasis">*`url`*</span> - a string value, may be null |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the url used to create a connection. Setting this property is
optional. If a url is used, a JDBC driver that accepts the url must be
loaded by the application before the rowset is used to connect to a
database. The rowset will use the url internally to create a database
connection when reading or writing data. Either a url or a data source
name is used to create a connection, whichever was specified most
recently.

</div>

<div id="mt_jd1.1.2.65" class="section">

<div class="titlepage">

<div>

<div>

##### Method setUsername(String)

</div>

</div>

</div>

<span id="id14818" class="indexterm"></span> <span id="id14820"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setUsername(java.lang.String s) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                           |
|------------------------------------------------------|
| <span class="emphasis">*`name`*</span> - a user name |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the user name.

</div>

</div>

</div>

<div id="mt_jd1.2" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.2. Class OPLCachedRowSet

</div>

</div>

</div>

<span id="id14860" class="indexterm"></span> <span id="id14862"
class="indexterm"></span>

A OPLCachedRowSet is a disconnected, serializable, scrollable container
for tabular data. A primary purpose of the OPLCachedRowSet class is to
provide a representation of a JDBC ResultSet that can be passed between
different components of a remote application. For example, a
OPLCachedRowSet can be used to send the result of a query executed by an
Enterprise JavaBeans component running in a server environment over a
network to a client running in a web browser. A second use for
OPLCachedRowSets is to provide scrolling and updating for ResultSets
that don't provide these capabilities themselves. A OPLCachedRowSet can
be used to augment the capabilities of a JDBC driver that doesn't have
full support for scrolling and updating. Finally, a OPLCachedRowSet can
be used to provide Java applications with access to tabular data in an
environment such as a thin client or PDA, where it would be
inappropriate to use a JDBC driver due to resource limitations or
security considerations. The OPLCachedRowSet class provides a means to
"get rows in" and "get changed rows out" without the need to implement
the full JDBC API.

A OPLCachedRowSet object can contain data retrieved via a JDBC driver or
data from some other source, such as a spreadsheet. Both a
OPLCachedRowSet object and its metadata can be created from scratch. A
component that acts as a factory for rowsets can use this capability to
create a rowset containing data from non-JDBC data sources.

The term 'disconnected' implies that a OPLCachedRowSet only makes use of
a JDBC connection briefly while data is being read from the database and
used to populate it with rows, and again while updated rows are being
propagated back to the underlying database. During the remainder of its
lifetime, a OPLCachedRowSet object isn't associated with an underlying
database connection. A OPLCachedRowSet object can simply be thought of
as a disconnected set of rows that are being cached outside of a data
source. Since all data is cached in memory, OPLCachedRowSets are not
appropriate for extremely large data sets.

The contents of a OPLCachedRowSet may be updated and the updates can be
propagated to an underlying data source. OPLCachedRowSets support an
optimistic concurrency control mechanism - no locks are maintained in
the underlying database during disconnected use of the rowset. Both the
original value and current value of the OPLCachedRowSet are maintained
for use by the optimistic routines.

<div id="mt_jd1.2.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLCachedRowSet extends BaseRowSet implements RowSetInternal,Serializable,Cloneable {
  // Public Constructors
  public OPLCachedRowSet() throws java.sql.SQLException;
  // Public Methods
  public void finalize() throws java.lang.Throwable;
  public void setCommand(java.lang.String cmd) throws java.sql.SQLException;
  public void setConcurrency(int concurrency) throws java.sql.SQLException;
  public void acceptChanges() throws java.sql.SQLException;
  public void acceptChanges(java.sql.Connection _conn) 
      throws java.sql.SQLException;
  public void execute() throws java.sql.SQLException;
  public void execute(java.sql.Connection _conn) throws java.sql.SQLException;
  public void populate(java.sql.ResultSet rs) throws java.sql.SQLException;
  public void setShowDeleted(boolean value) throws java.sql.SQLException;
  public boolean getShowDeleted() throws java.sql.SQLException;
  public String getTableName() throws java.sql.SQLException;
  public void setTableName(java.lang.String _tableName) 
      throws java.sql.SQLException;
  public int[] getKeyCols() throws java.sql.SQLException;
  public void setKeyColumns(int[] keys) throws java.sql.SQLException;
  public void cancelRowDelete() throws java.sql.SQLException;
  public void cancelRowInsert() throws java.sql.SQLException;
  public void cancelRowUpdates() throws java.sql.SQLException;
  public boolean columnUpdated(int columnIndex) throws java.sql.SQLException;
  public void setOriginal() throws java.sql.SQLException;
  public void setOriginalRow() throws java.sql.SQLException;
  public void restoreOriginal() throws java.sql.SQLException;
  public int size();
  public Collection toCollection() throws java.sql.SQLException;
  public Collection toCollection(int col) throws java.sql.SQLException;
  public void release() throws java.sql.SQLException;
  public RowSet createCopy() throws java.sql.SQLException;
  public RowSet createShared() throws java.sql.SQLException;
  public void setMetaData(javax.sql.RowSetMetaData md) 
      throws java.sql.SQLException;
  public Connection getConnection() throws java.sql.SQLException;
  public ResultSet getOriginal() throws java.sql.SQLException;
  public ResultSet getOriginalRow() throws java.sql.SQLException;
  public void close() throws java.sql.SQLException;
  public boolean next() throws java.sql.SQLException;
  public boolean previous() throws java.sql.SQLException;
  public boolean first() throws java.sql.SQLException;
  public boolean last() throws java.sql.SQLException;
  public boolean absolute(int row) throws java.sql.SQLException;
  public boolean relative(int rows) throws java.sql.SQLException;
  public void beforeFirst() throws java.sql.SQLException;
  public void afterLast() throws java.sql.SQLException;
  public boolean isBeforeFirst() throws java.sql.SQLException;
  public boolean isAfterLast() throws java.sql.SQLException;
  public boolean isFirst() throws java.sql.SQLException;
  public boolean isLast() throws java.sql.SQLException;
  public int getRow() throws java.sql.SQLException;
  public boolean rowUpdated() throws java.sql.SQLException;
  public boolean rowInserted() throws java.sql.SQLException;
  public boolean rowDeleted() throws java.sql.SQLException;
  public void refreshRow() throws java.sql.SQLException;
  public void insertRow() throws java.sql.SQLException;
  public void updateRow() throws java.sql.SQLException;
  public void deleteRow() throws java.sql.SQLException;
  public void moveToInsertRow() throws java.sql.SQLException;
  public void moveToCurrentRow() throws java.sql.SQLException;
  public boolean wasNull() throws java.sql.SQLException;
  public SQLWarning getWarnings() throws java.sql.SQLException;
  public void clearWarnings() throws java.sql.SQLException;
  public String getCursorName() throws java.sql.SQLException;
  public ResultSetMetaData getMetaData() throws java.sql.SQLException;
  public int findColumn(java.lang.String columnName) 
      throws java.sql.SQLException;
  public String getString(int columnIndex) throws java.sql.SQLException;
  public boolean getBoolean(int columnIndex) throws java.sql.SQLException;
  public byte getByte(int columnIndex) throws java.sql.SQLException;
  public short getShort(int columnIndex) throws java.sql.SQLException;
  public int getInt(int columnIndex) throws java.sql.SQLException;
  public long getLong(int columnIndex) throws java.sql.SQLException;
  public float getFloat(int columnIndex) throws java.sql.SQLException;
  public double getDouble(int columnIndex) throws java.sql.SQLException;
  public BigDecimal getBigDecimal(int columnIndex) 
      throws java.sql.SQLException;
  public BigDecimal getBigDecimal(int columnIndex, int scale) 
      throws java.sql.SQLException;
  public byte[] getBytes(int columnIndex) throws java.sql.SQLException;
  public Date getDate(int columnIndex) throws java.sql.SQLException;
  public Time getTime(int columnIndex) throws java.sql.SQLException;
  public Timestamp getTimestamp(int columnIndex) throws java.sql.SQLException;
  public InputStream getAsciiStream(int columnIndex) 
      throws java.sql.SQLException;
  public InputStream getUnicodeStream(int columnIndex) 
      throws java.sql.SQLException;
  public InputStream getBinaryStream(int columnIndex) 
      throws java.sql.SQLException;
  public Object getObject(int columnIndex) throws java.sql.SQLException;
  public String getString(java.lang.String columnName) 
      throws java.sql.SQLException;
  public boolean getBoolean(java.lang.String columnName) 
      throws java.sql.SQLException;
  public byte getByte(java.lang.String columnName) 
      throws java.sql.SQLException;
  public short getShort(java.lang.String columnName) 
      throws java.sql.SQLException;
  public int getInt(java.lang.String columnName) throws java.sql.SQLException;
  public long getLong(java.lang.String columnName) 
      throws java.sql.SQLException;
  public float getFloat(java.lang.String columnName) 
      throws java.sql.SQLException;
  public double getDouble(java.lang.String columnName) 
      throws java.sql.SQLException;
  public BigDecimal getBigDecimal(java.lang.String columnName, int scale) 
      throws java.sql.SQLException;
  public byte[] getBytes(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Date getDate(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Time getTime(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Timestamp getTimestamp(java.lang.String columnName) 
      throws java.sql.SQLException;
  public InputStream getAsciiStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public InputStream getUnicodeStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public InputStream getBinaryStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Object getObject(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Reader getCharacterStream(int columnIndex) 
      throws java.sql.SQLException;
  public Reader getCharacterStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public BigDecimal getBigDecimal(java.lang.String columnName) 
      throws java.sql.SQLException;
  public void updateNull(int columnIndex) throws java.sql.SQLException;
  public void updateBoolean(int columnIndex, boolean x) 
      throws java.sql.SQLException;
  public void updateByte(int columnIndex, byte x) throws java.sql.SQLException;
  public void updateShort(int columnIndex, short x) 
      throws java.sql.SQLException;
  public void updateInt(int columnIndex, int x) throws java.sql.SQLException;
  public void updateLong(int columnIndex, long x) throws java.sql.SQLException;
  public void updateFloat(int columnIndex, float x) 
      throws java.sql.SQLException;
  public void updateDouble(int columnIndex, double x) 
      throws java.sql.SQLException;
  public void updateBigDecimal(int columnIndex, java.math.BigDecimal x) 
      throws java.sql.SQLException;
  public void updateString(int columnIndex, java.lang.String x) 
      throws java.sql.SQLException;
  public void updateBytes(int columnIndex, byte[] x) 
      throws java.sql.SQLException;
  public void updateDate(int columnIndex, java.sql.Date x) 
      throws java.sql.SQLException;
  public void updateTime(int columnIndex, java.sql.Time x) 
      throws java.sql.SQLException;
  public void updateTimestamp(int columnIndex, java.sql.Timestamp x) 
      throws java.sql.SQLException;
  public void updateAsciiStream(int columnIndex, java.io.InputStream x, 
                                int length) throws java.sql.SQLException;
  public void updateBinaryStream(int columnIndex, java.io.InputStream x, 
                                 int length) throws java.sql.SQLException;
  public void updateCharacterStream(int columnIndex, java.io.Reader x, 
                                    int length) throws java.sql.SQLException;
  public void updateObject(int columnIndex, java.lang.Object x, int scale) 
      throws java.sql.SQLException;
  public void updateObject(int columnIndex, java.lang.Object x) 
      throws java.sql.SQLException;
  public void updateNull(java.lang.String columnName) 
      throws java.sql.SQLException;
  public void updateBoolean(java.lang.String columnName, boolean x) 
      throws java.sql.SQLException;
  public void updateByte(java.lang.String columnName, byte x) 
      throws java.sql.SQLException;
  public void updateShort(java.lang.String columnName, short x) 
      throws java.sql.SQLException;
  public void updateInt(java.lang.String columnName, int x) 
      throws java.sql.SQLException;
  public void updateLong(java.lang.String columnName, long x) 
      throws java.sql.SQLException;
  public void updateFloat(java.lang.String columnName, float x) 
      throws java.sql.SQLException;
  public void updateDouble(java.lang.String columnName, double x) 
      throws java.sql.SQLException;
  public void updateBigDecimal(java.lang.String columnName, 
                               java.math.BigDecimal x) 
      throws java.sql.SQLException;
  public void updateString(java.lang.String columnName, java.lang.String x) 
      throws java.sql.SQLException;
  public void updateBytes(java.lang.String columnName, byte[] x) 
      throws java.sql.SQLException;
  public void updateDate(java.lang.String columnName, java.sql.Date x) 
      throws java.sql.SQLException;
  public void updateTime(java.lang.String columnName, java.sql.Time x) 
      throws java.sql.SQLException;
  public void updateTimestamp(java.lang.String columnName, 
                              java.sql.Timestamp x) 
      throws java.sql.SQLException;
  public void updateAsciiStream(java.lang.String columnName, 
                                java.io.InputStream x, int length) 
      throws java.sql.SQLException;
  public void updateBinaryStream(java.lang.String columnName, 
                                 java.io.InputStream x, int length) 
      throws java.sql.SQLException;
  public void updateCharacterStream(java.lang.String columnName, 
                                    java.io.Reader reader, int length) 
      throws java.sql.SQLException;
  public void updateObject(java.lang.String columnName, java.lang.Object x, 
                           int scale) throws java.sql.SQLException;
  public void updateObject(java.lang.String columnName, java.lang.Object x) 
      throws java.sql.SQLException;
  public Statement getStatement() throws java.sql.SQLException;
  public Object getObject(int colIndex, java.util.Map map) 
      throws java.sql.SQLException;
  public Ref getRef(int colIndex) throws java.sql.SQLException;
  public Blob getBlob(int colIndex) throws java.sql.SQLException;
  public Clob getClob(int colIndex) throws java.sql.SQLException;
  public Array getArray(int colIndex) throws java.sql.SQLException;
  public Object getObject(java.lang.String colName, java.util.Map map) 
      throws java.sql.SQLException;
  public Ref getRef(java.lang.String colName) throws java.sql.SQLException;
  public Blob getBlob(java.lang.String colName) throws java.sql.SQLException;
  public Clob getClob(java.lang.String colName) throws java.sql.SQLException;
  public Array getArray(java.lang.String colName) throws java.sql.SQLException;
  public Date getDate(int columnIndex, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Date getDate(java.lang.String columnName, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Time getTime(int columnIndex, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Time getTime(java.lang.String columnName, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Timestamp getTimestamp(int columnIndex, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Timestamp getTimestamp(java.lang.String columnName, 
                                java.util.Calendar cal) 
      throws java.sql.SQLException;
  public URL getURL(int columnIndex) throws java.sql.SQLException;
  public URL getURL(java.lang.String columnName) throws java.sql.SQLException;
  public void updateRef(int columnIndex, java.sql.Ref x) 
      throws java.sql.SQLException;
  public void updateRef(java.lang.String columnName, java.sql.Ref x) 
      throws java.sql.SQLException;
  public void updateBlob(int columnIndex, java.sql.Blob x) 
      throws java.sql.SQLException;
  public void updateBlob(java.lang.String columnName, java.sql.Blob x) 
      throws java.sql.SQLException;
  public void updateClob(int columnIndex, java.sql.Clob x) 
      throws java.sql.SQLException;
  public void updateClob(java.lang.String columnName, java.sql.Clob x) 
      throws java.sql.SQLException;
  public void updateArray(int columnIndex, java.sql.Array x) 
      throws java.sql.SQLException;
  public void updateArray(java.lang.String columnName, java.sql.Array x) 
      throws java.sql.SQLException;
}
      
```

<div class="informaltable">

|        Inheritance Path        |
|:------------------------------:|
|        java.lang.Object        |
|               \|               |
|   openlink.javax.BaseRowSet    |
|               \|               |
| openlink.javax.OPLCachedRowSet |

</div>

</div>

<div id="mt_jd1.2.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.2.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Constructor OPLCachedRowSet()

</div>

</div>

</div>

<span id="id15243" class="indexterm"></span> <span id="id15245"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public OPLCachedRowSet() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Create a OPLCachedRowSet object. The object has no metadata.

</div>

<div id="mt_jd1.2.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method absolute(int)

</div>

</div>

</div>

<span id="id15270" class="indexterm"></span> <span id="id15272"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean absolute(int row) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                      |
|--------------|--------------------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or row is 0, or rowset type is TYPE_FORWARD_ONLY. |

</div>

Move to an absolute row number in the rowset. It notifies listeners that
the cursor has moved.

If row is positive, moves to an absolute row with respect to the
beginning of the rowset. The first row is row 1, the second is row 2,
etc.

If row is negative, moves to an absolute row position with respect to
the end of rowset. For example, calling absolute(-1) positions the
cursor on the last row, absolute(-2) indicates the next-to-last row,
etc.

An attempt to position the cursor beyond the first/last row in the
rowset, leaves the cursor before/after the first/last row, respectively.

Note: Calling absolute(1) is the same as calling first(). Calling
absolute(-1) is the same as calling last().

</div>

<div id="mt_jd1.2.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method acceptChanges()

</div>

</div>

</div>

<span id="id15302" class="indexterm"></span> <span id="id15304"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void acceptChanges() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Propagate all row update, insert, and delete changes to a data source.
An SQLException is thrown if any of the updates cannot be propagated. If
acceptChanges() fails then the caller can assume that none of the
updates are reflected in the data source. The current row is set to the
first "updated" row that resulted in an exception, in the case that an
exception is thrown. With one exception, if the row that caused the
exception is a "deleted" row, then in the usual case, when deleted rows
are not shown, the current row isn't affected. When successful, calling
acceptChanges() replaces the original value of the rowset with the
current value. Note: Both the original and current value of the rowset
are maintained. The original state is the value of the rowset following
its creation (i.e. empty), or following the last call to
acceptChanges(), execute(), populate(), release(), or restoreOriginal().
Internally, a RowSetWriter component is envoked to write the data for
each row.

</div>

<div id="mt_jd1.2.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method acceptChanges(Connection)

</div>

</div>

</div>

<span id="id15329" class="indexterm"></span> <span id="id15331"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void acceptChanges(java.sql.Connection _conn) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                      |
|-----------------------------------------------------------------|
| <span class="emphasis">*`_conn`*</span> - a database connection |

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Like acceptChanges() above, but takes a Connection argument. The
Connection is used internally when doing the updates. This form isn't
used unless the underlying data source is a JDBC data source.

</div>

<div id="mt_jd1.2.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method afterLast()

</div>

</div>

</div>

<span id="id15371" class="indexterm"></span> <span id="id15373"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void afterLast() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or rowset type is TYPE_FORWARD_ONLY. |

</div>

Moves to the end of the rowset, just after the last row. Has no effect
if the rowset contains no rows. It notifies listeners that the cursor
has moved.

</div>

<div id="mt_jd1.2.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method beforeFirst()

</div>

</div>

</div>

<span id="id15398" class="indexterm"></span> <span id="id15400"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void beforeFirst() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                        |
|--------------|------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or rowset type is TYPE_FORWARD_ONLY |

</div>

Moves to the front of the rowset, just before the first row. Has no
effect if the rowset contains no rows. It notifies listeners that the
cursor has moved.

</div>

<div id="mt_jd1.2.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method cancelRowDelete()

</div>

</div>

</div>

<span id="id15425" class="indexterm"></span> <span id="id15427"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void cancelRowDelete() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Cancels deletion of the current row and notifies listeners that a row
has changed. After calling cancelRowDelete() the current row is no
longer marked for deletion. An exception is thrown if there is no
current row. Note: This method can be ignored if deleted rows aren't
being shown (the normal case).

</div>

<div id="mt_jd1.2.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method cancelRowInsert()

</div>

</div>

</div>

<span id="id15452" class="indexterm"></span> <span id="id15454"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void cancelRowInsert() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Cancels insertion of the current row and notifies listeners that a row
has changed. An exception is thrown if the row isn't an inserted row.
The current row is immediately removed from the rowset. This operation
cannot be undone.

</div>

<div id="mt_jd1.2.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method cancelRowUpdates()

</div>

</div>

</div>

<span id="id15479" class="indexterm"></span> <span id="id15481"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void cancelRowUpdates() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

The cancelRowUpdates() method may be called after calling an updateXXX()
method(s) and before calling updateRow() to rollback the updates made to
a row. If no updates have been made or updateRow() has already been
called, then this method has no effect. It notifies listeners that a row
has changed, if it has effect.

</div>

<div id="mt_jd1.2.2.10" class="section">

<div class="titlepage">

<div>

<div>

##### Method clearWarnings()

</div>

</div>

</div>

<span id="id15506" class="indexterm"></span> <span id="id15508"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void clearWarnings() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

After this call getWarnings returns null until a new warning is reported
for this ResultSet.

</div>

<div id="mt_jd1.2.2.11" class="section">

<div class="titlepage">

<div>

<div>

##### Method close()

</div>

</div>

</div>

<span id="id15533" class="indexterm"></span> <span id="id15535"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void close() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Releases the current contents of this rowset, discarding outstanding
updates. The rowset contains no rows after the method release is called.
This method sends a RowSetChangedEvent object to all registered
listeners prior to returning.

</div>

<div id="mt_jd1.2.2.12" class="section">

<div class="titlepage">

<div>

<div>

##### Method columnUpdated(int)

</div>

</div>

</div>

<span id="id15560" class="indexterm"></span> <span id="id15562"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean columnUpdated(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - true if the column has been updated                                              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Determine if the column from the current row has been updated.

</div>

<div id="mt_jd1.2.2.13" class="section">

<div class="titlepage">

<div>

<div>

##### Method createCopy()

</div>

</div>

</div>

<span id="id15606" class="indexterm"></span> <span id="id15608"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public RowSet createCopy() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Creates a RowSet object that is a deep copy of this OPLCachedRowSet
object's data. Updates made on a copy are not visible to the original
rowset; a copy of a rowset is completely independent from the original.
Making a copy saves the cost of creating an identical rowset from first
principles, which can be quite expensive. For example, it doesn't do the
query to a remote database server.

</div>

<div id="mt_jd1.2.2.14" class="section">

<div class="titlepage">

<div>

<div>

##### Method createShared()

</div>

</div>

</div>

<span id="id15633" class="indexterm"></span> <span id="id15635"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public RowSet createShared() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Returns a new rowset object backed by the same data. Updates made by a
shared duplicate are visible to the original rowset and other
duplicates. A rowset and its duplicates form a set of cursors that
iterate over a shared set of rows, providing different views of the
underlying data. Duplicates also share property values. So, for example,
if a rowset is read-only then all of its duplicates will be read-only.

</div>

<div id="mt_jd1.2.2.15" class="section">

<div class="titlepage">

<div>

<div>

##### Method deleteRow()

</div>

</div>

</div>

<span id="id15660" class="indexterm"></span> <span id="id15662"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void deleteRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or if called when on the insert row. |

</div>

Delete the current row from this OPLCachedRowSet object and it notifies
listeners that a row has changed. Cannot be called when the cursor is on
the insert row. The method marks the current row as deleted, but it does
not delete the row from the underlying data source. The method
acceptChanges must be called to delete the row in the data source.

</div>

<div id="mt_jd1.2.2.16" class="section">

<div class="titlepage">

<div>

<div>

##### Method execute()

</div>

</div>

</div>

<span id="id15687" class="indexterm"></span> <span id="id15689"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void execute() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Populates this OPLCachedRowSet object with data. This form of the method
uses the rowset's user, password, and url or data source name properties
to create a database connection. If properties that are needed have not
been set, this method will throw an exception. Another form of this
method uses an existing JDBC Connection object instead of creating a new
one; therefore, it ignores the properties used for establishing a new
connection. The query specified by the command property is executed to
create a ResultSet object from which to retrieve data. The current
contents of the rowset are discarded, and the rowset's metadata is also
(re)set. If there are outstanding updates, they are also ignored. The
method execute closes any database connections that it creates.

</div>

<div id="mt_jd1.2.2.17" class="section">

<div class="titlepage">

<div>

<div>

##### Method execute(Connection)

</div>

</div>

</div>

<span id="id15714" class="indexterm"></span> <span id="id15716"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void execute(java.sql.Connection _conn) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                      |
|-----------------------------------------------------------------|
| <span class="emphasis">*`_conn`*</span> - a database connection |

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Populates the rowset with data. The first form uses the properties:
url/data source name, user, and password to create a database
connection. If these properties haven't been set, an exception is
thrown. The second form uses an existing JDBC connection object instead.
The values of the url/data source name, user, and password properties
are ignored when the second form is used. Execute() closes any database
connections that it creates. The command specified by the command
property is executed to retrieve the data. The current contents of the
rowset are discarded and the rowset's metadata is also (re)set. If there
are outstanding updates, they are also ignored.

</div>

<div id="mt_jd1.2.2.18" class="section">

<div class="titlepage">

<div>

<div>

##### Method findColumn(String)

</div>

</div>

</div>

<span id="id15756" class="indexterm"></span> <span id="id15758"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int findColumn(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| `return` - the column index                                           |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Map a Resultset column name to a ResultSet column index.

</div>

<div id="mt_jd1.2.2.19" class="section">

<div class="titlepage">

<div>

<div>

##### Method first()

</div>

</div>

</div>

<span id="id15802" class="indexterm"></span> <span id="id15804"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean first() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or rowset type is TYPE_FORWARD_ONLY. |

</div>

Moves to the first row in the rowset. It notifies listeners that the
cursor has moved.

</div>

<div id="mt_jd1.2.2.20" class="section">

<div class="titlepage">

<div>

<div>

##### Method getArray(int)

</div>

</div>

</div>

<span id="id15829" class="indexterm"></span> <span id="id15831"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Array getArray(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing an SQL array                                           |

</div>

Get an array column.

</div>

<div id="mt_jd1.2.2.21" class="section">

<div class="titlepage">

<div>

<div>

##### Method getArray(String)

</div>

</div>

</div>

<span id="id15860" class="indexterm"></span> <span id="id15862"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Array getArray(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing an SQL array              |

</div>

Get an array column.

</div>

<div id="mt_jd1.2.2.22" class="section">

<div class="titlepage">

<div>

<div>

##### Method getAsciiStream(int)

</div>

</div>

</div>

<span id="id15891" class="indexterm"></span> <span id="id15893"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getAsciiStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                         |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                        |
| `return` - a Java input stream that delivers the database column value as a stream of one byte ASCII characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of ASCII characters and then
read in chunks from the stream. This method is particularly suitable for
retrieving large LONGVARCHAR values. The JDBC driver will do any
necessary conversion from the database format into ASCII.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream. . Also, a stream
may return 0 for available() whether there is data available or not.

</div>

<div id="mt_jd1.2.2.23" class="section">

<div class="titlepage">

<div>

<div>

##### Method getAsciiStream(String)

</div>

</div>

</div>

<span id="id15939" class="indexterm"></span> <span id="id15941"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getAsciiStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                         |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column                                                                                       |
| `return` - a Java input stream that delivers the database column value as a stream of one byte ASCII characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of ASCII characters and then
read in chunks from the stream. This method is particularly suitable for
retrieving large LONGVARCHAR values. The JDBC driver will do any
necessary conversion from the database format into ASCII.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream.

</div>

<div id="mt_jd1.2.2.24" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(int)

</div>

</div>

</div>

<span id="id15987" class="indexterm"></span> <span id="id15989"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value (full precision); if the value is SQL NULL, the result is null  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.math.BigDecimal
object.

</div>

<div id="mt_jd1.2.2.25" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(int, int)

</div>

</div>

</div>

<span id="id16033" class="indexterm"></span> <span id="id16035"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(int columnIndex, int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`scale`*</span> - the number of digits to the right of the decimal  |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                |
|:----------------------------------:|:-------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                     |
|                                    | Get the value of a column in the current row as a java.math.BigDecimal object. |

</div>

</div>

<div id="mt_jd1.2.2.26" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(String)

</div>

</div>

</div>

<span id="id16087" class="indexterm"></span> <span id="id16089"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

Get the value of a column in the current row as a java.math.BigDecimal
object.

</div>

<div id="mt_jd1.2.2.27" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(String, int)

</div>

</div>

</div>

<span id="id16100" class="indexterm"></span> <span id="id16102"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(java.lang.String columnName, 
>                                           int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                 |
|--------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column               |
| <span class="emphasis">*`scale`*</span> - the number of digits to the right of the decimal |
| `return` - the column value; if the value is SQL NULL, the result is null                  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                |
|:----------------------------------:|:-------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                     |
|                                    | Get the value of a column in the current row as a java.math.BigDecimal object. |

</div>

</div>

<div id="mt_jd1.2.2.28" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBinaryStream(int)

</div>

</div>

</div>

<span id="id16154" class="indexterm"></span> <span id="id16156"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getBinaryStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                  |
| `return` - a Java input stream that delivers the database column value as a stream of uninterpreted bytes. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of uninterpreted bytes and
then read in chunks from the stream. This method is particularly
suitable for retrieving large LONGVARBINARY values.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream. Also, a stream
may return 0 for available() whether there is data available or not.

</div>

<div id="mt_jd1.2.2.29" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBinaryStream(String)

</div>

</div>

</div>

<span id="id16202" class="indexterm"></span> <span id="id16204"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getBinaryStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column                                                                                 |
| `return` - a Java input stream that delivers the database column value as a stream of uninterpreted bytes. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of uninterpreted bytes and
then read in chunks from the stream. This method is particularly
suitable for retrieving large LONGVARBINARY values.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream.

</div>

<div id="mt_jd1.2.2.30" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBlob(int)

</div>

</div>

</div>

<span id="id16250" class="indexterm"></span> <span id="id16252"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Blob getBlob(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing a BLOB                                                 |

</div>

Get a BLOB column.

</div>

<div id="mt_jd1.2.2.31" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBlob(String)

</div>

</div>

</div>

<span id="id16281" class="indexterm"></span> <span id="id16283"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Blob getBlob(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing a BLOB                    |

</div>

Get a BLOB column.

</div>

<div id="mt_jd1.2.2.32" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBoolean(int)

</div>

</div>

</div>

<span id="id16312" class="indexterm"></span> <span id="id16314"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getBoolean(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is false                  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java boolean.

</div>

<div id="mt_jd1.2.2.33" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBoolean(String)

</div>

</div>

</div>

<span id="id16358" class="indexterm"></span> <span id="id16360"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getBoolean(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is false   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java boolean.

</div>

<div id="mt_jd1.2.2.34" class="section">

<div class="titlepage">

<div>

<div>

##### Method getByte(int)

</div>

</div>

</div>

<span id="id16404" class="indexterm"></span> <span id="id16406"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte getByte(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte.

</div>

<div id="mt_jd1.2.2.35" class="section">

<div class="titlepage">

<div>

<div>

##### Method getByte(String)

</div>

</div>

</div>

<span id="id16450" class="indexterm"></span> <span id="id16452"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte getByte(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte.

</div>

<div id="mt_jd1.2.2.36" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBytes(int)

</div>

</div>

</div>

<span id="id16496" class="indexterm"></span> <span id="id16498"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte[] getBytes(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte array. The
bytes represent the raw values returned by the driver.

</div>

<div id="mt_jd1.2.2.37" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBytes(String)

</div>

</div>

</div>

<span id="id16542" class="indexterm"></span> <span id="id16544"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte[] getBytes(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte array. The
bytes represent the raw values returned by the driver.

</div>

<div id="mt_jd1.2.2.38" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCharacterStream(int)

</div>

</div>

</div>

<span id="id16588" class="indexterm"></span> <span id="id16590"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Reader getCharacterStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

Get the value of a column in the current row as a java.io.Reader.

</div>

<div id="mt_jd1.2.2.39" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCharacterStream(String)

</div>

</div>

</div>

<span id="id16601" class="indexterm"></span> <span id="id16603"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Reader getCharacterStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

Get the value of a column in the current row as a java.io.Reader.

</div>

<div id="mt_jd1.2.2.40" class="section">

<div class="titlepage">

<div>

<div>

##### Method getClob(int)

</div>

</div>

</div>

<span id="id16614" class="indexterm"></span> <span id="id16616"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Clob getClob(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing a CLOB                                                 |

</div>

Get a CLOB column.

</div>

<div id="mt_jd1.2.2.41" class="section">

<div class="titlepage">

<div>

<div>

##### Method getClob(String)

</div>

</div>

</div>

<span id="id16645" class="indexterm"></span> <span id="id16647"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Clob getClob(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing a CLOB                    |

</div>

Get a CLOB column.

</div>

<div id="mt_jd1.2.2.42" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConnection()

</div>

</div>

</div>

<span id="id16676" class="indexterm"></span> <span id="id16678"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Connection getConnection() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the Connection passed to the rowset.

</div>

<div id="mt_jd1.2.2.43" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCursorName()

</div>

</div>

</div>

<span id="id16703" class="indexterm"></span> <span id="id16705"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getCursorName() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Get the name of the SQL cursor used by this ResultSet.

</div>

<div id="mt_jd1.2.2.44" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(int)

</div>

</div>

</div>

<span id="id16730" class="indexterm"></span> <span id="id16732"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.

</div>

<div id="mt_jd1.2.2.45" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(int, Calendar)

</div>

</div>

</div>

<span id="id16776" class="indexterm"></span> <span id="id16778"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(int columnIndex, java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the date        |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.
Use the calendar to construct an appropriate millisecond value for the
Date, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.2.2.46" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(String)

</div>

</div>

</div>

<span id="id16828" class="indexterm"></span> <span id="id16830"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.

</div>

<div id="mt_jd1.2.2.47" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(String, Calendar)

</div>

</div>

</div>

<span id="id16874" class="indexterm"></span> <span id="id16876"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(java.lang.String columnName, 
>                               java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column         |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the date |
| `return` - the column value; if the value is SQL NULL, the result is null            |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.
Use the calendar to construct an appropriate millisecond value for the
Date, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.2.2.48" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDouble(int)

</div>

</div>

</div>

<span id="id16926" class="indexterm"></span> <span id="id16928"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public double getDouble(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java double.

</div>

<div id="mt_jd1.2.2.49" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDouble(String)

</div>

</div>

</div>

<span id="id16972" class="indexterm"></span> <span id="id16974"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public double getDouble(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java double.

</div>

<div id="mt_jd1.2.2.50" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFloat(int)

</div>

</div>

</div>

<span id="id17018" class="indexterm"></span> <span id="id17020"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public float getFloat(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java float.

</div>

<div id="mt_jd1.2.2.51" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFloat(String)

</div>

</div>

</div>

<span id="id17064" class="indexterm"></span> <span id="id17066"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public float getFloat(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java float.

</div>

<div id="mt_jd1.2.2.52" class="section">

<div class="titlepage">

<div>

<div>

##### Method getInt(int)

</div>

</div>

</div>

<span id="id17110" class="indexterm"></span> <span id="id17112"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getInt(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java int.

</div>

<div id="mt_jd1.2.2.53" class="section">

<div class="titlepage">

<div>

<div>

##### Method getInt(String)

</div>

</div>

</div>

<span id="id17156" class="indexterm"></span> <span id="id17158"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getInt(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java int.

</div>

<div id="mt_jd1.2.2.54" class="section">

<div class="titlepage">

<div>

<div>

##### Method getKeyCols()

</div>

</div>

</div>

<span id="id17202" class="indexterm"></span> <span id="id17204"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int[] getKeyCols() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Returns the columns that make a key to uniquely identify a row in this
OPLCachedRowSet object.

</div>

<div id="mt_jd1.2.2.55" class="section">

<div class="titlepage">

<div>

<div>

##### Method getLong(int)

</div>

</div>

</div>

<span id="id17229" class="indexterm"></span> <span id="id17231"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getLong(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java long.

</div>

<div id="mt_jd1.2.2.56" class="section">

<div class="titlepage">

<div>

<div>

##### Method getLong(String)

</div>

</div>

</div>

<span id="id17275" class="indexterm"></span> <span id="id17277"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getLong(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java long.

</div>

<div id="mt_jd1.2.2.57" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMetaData()

</div>

</div>

</div>

<span id="id17321" class="indexterm"></span> <span id="id17323"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public ResultSetMetaData getMetaData() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The number, types and properties of a ResultSet's columns are provided
by the getMetaData method.

</div>

<div id="mt_jd1.2.2.58" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(int)

</div>

</div>

</div>

<span id="id17348" class="indexterm"></span> <span id="id17350"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - a java.lang.Object holding the column value.                                     |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java object.

This method will return the value of the given column as a Java object.
The type of the Java object will be the default Java object type
corresponding to the column's SQL type, following the mapping for
built-in types specified in the JDBC spec.

This method may also be used to read database specific abstract data
types. JDBC 2.0 New behavior for getObject(). The behavior of method
getObject() is extended to materialize data of SQL user-defined types.
When the column @column is a structured or distinct value, the behavior
of this method is as if it were a call to: getObject(column,
this.getStatement().getConnection().getTypeMap()).

</div>

<div id="mt_jd1.2.2.59" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(int, Map)

</div>

</div>

</div>

<span id="id17396" class="indexterm"></span> <span id="id17398"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(int colIndex, java.util.Map map) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`map`*</span> - the mapping from SQL type names to Java classes  |
| `return` - an object representing the SQL value                                          |

</div>

Returns the value of column @i as a Java object. Use the map to
determine the class from which to construct data of SQL structured and
distinct types.

</div>

<div id="mt_jd1.2.2.60" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(String)

</div>

</div>

</div>

<span id="id17433" class="indexterm"></span> <span id="id17435"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - a java.lang.Object holding the column value.                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java object.

This method will return the value of the given column as a Java object.
The type of the Java object will be the default Java object type
corresponding to the column's SQL type, following the mapping for
built-in types specified in the JDBC spec.

This method may also be used to read database specific abstract data
types. JDBC 2.0 New behavior for getObject(). The behavior of method
getObject() is extended to materialize data of SQL user-defined types.
When the column @columnName is a structured or distinct value, the
behavior of this method is as if it were a call to:
getObject(columnName, this.getStatement().getConnection().getTypeMap()).

</div>

<div id="mt_jd1.2.2.61" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(String, Map)

</div>

</div>

</div>

<span id="id17481" class="indexterm"></span> <span id="id17483"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(java.lang.String colName, java.util.Map map) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                              |
|-----------------------------------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name                             |
| <span class="emphasis">*`map`*</span> - the mapping from SQL type names to Java classes |
| `return` - an object representing the SQL value                                         |

</div>

Returns the value of column @i as a Java object. Use the map to
determine the class from which to construct data of SQL structured and
distinct types.

</div>

<div id="mt_jd1.2.2.62" class="section">

<div class="titlepage">

<div>

<div>

##### Method getOriginal()

</div>

</div>

</div>

<span id="id17518" class="indexterm"></span> <span id="id17520"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public ResultSet getOriginal() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Returns a result set containing the original value of the rowset. The
cursor is positioned before the first row in the result set. Only rows
contained in the result set returned by getOriginal() are said to have
an original value.

</div>

<div id="mt_jd1.2.2.63" class="section">

<div class="titlepage">

<div>

<div>

##### Method getOriginalRow()

</div>

</div>

</div>

<span id="id17545" class="indexterm"></span> <span id="id17547"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public ResultSet getOriginalRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Returns a result set containing the original value of the current row
only. If the current row has no original value an empty result set is
returned. If there is no current row an exception is thrown.

</div>

<div id="mt_jd1.2.2.64" class="section">

<div class="titlepage">

<div>

<div>

##### Method getRef(int)

</div>

</div>

</div>

<span id="id17572" class="indexterm"></span> <span id="id17574"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Ref getRef(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing data of an SQL REF type                                |

</div>

Get a REF(\<structured-type\>) column.

</div>

<div id="mt_jd1.2.2.65" class="section">

<div class="titlepage">

<div>

<div>

##### Method getRef(String)

</div>

</div>

</div>

<span id="id17603" class="indexterm"></span> <span id="id17605"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Ref getRef(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing data of an SQL REF type   |

</div>

Get a REF(\<structured-type\>) column.

</div>

<div id="mt_jd1.2.2.66" class="section">

<div class="titlepage">

<div>

<div>

##### Method getRow()

</div>

</div>

</div>

<span id="id17634" class="indexterm"></span> <span id="id17636"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine the current row number. The first row is number 1, the second
number 2, etc.

</div>

<div id="mt_jd1.2.2.67" class="section">

<div class="titlepage">

<div>

<div>

##### Method getShort(int)

</div>

</div>

</div>

<span id="id17661" class="indexterm"></span> <span id="id17663"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public short getShort(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java short.

</div>

<div id="mt_jd1.2.2.68" class="section">

<div class="titlepage">

<div>

<div>

##### Method getShort(String)

</div>

</div>

</div>

<span id="id17707" class="indexterm"></span> <span id="id17709"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public short getShort(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java short.

</div>

<div id="mt_jd1.2.2.69" class="section">

<div class="titlepage">

<div>

<div>

##### Method getShowDeleted()

</div>

</div>

</div>

<span id="id17753" class="indexterm"></span> <span id="id17755"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getShowDeleted() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

This property determines whether or not rows marked for deletion appear
in the set of current rows. The default value is false.

</div>

<div id="mt_jd1.2.2.70" class="section">

<div class="titlepage">

<div>

<div>

##### Method getStatement()

</div>

</div>

</div>

<span id="id17780" class="indexterm"></span> <span id="id17782"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Statement getStatement() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Return the Statement that produced the ResultSet.

</div>

<div id="mt_jd1.2.2.71" class="section">

<div class="titlepage">

<div>

<div>

##### Method getString(int)

</div>

</div>

</div>

<span id="id17807" class="indexterm"></span> <span id="id17809"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getString(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java String.

</div>

<div id="mt_jd1.2.2.72" class="section">

<div class="titlepage">

<div>

<div>

##### Method getString(String)

</div>

</div>

</div>

<span id="id17853" class="indexterm"></span> <span id="id17855"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getString(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java String.

</div>

<div id="mt_jd1.2.2.73" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTableName()

</div>

</div>

</div>

<span id="id17899" class="indexterm"></span> <span id="id17901"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getTableName() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Returns an identifier for the object (table) that was used to create
this rowset.

</div>

<div id="mt_jd1.2.2.74" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(int)

</div>

</div>

</div>

<span id="id17926" class="indexterm"></span> <span id="id17928"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.

</div>

<div id="mt_jd1.2.2.75" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(int, Calendar)

</div>

</div>

</div>

<span id="id17972" class="indexterm"></span> <span id="id17974"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(int columnIndex, java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the time        |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.
Use the calendar to construct an appropriate millisecond value for the
Time, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.2.2.76" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(String)

</div>

</div>

</div>

<span id="id18024" class="indexterm"></span> <span id="id18026"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.

</div>

<div id="mt_jd1.2.2.77" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(String, Calendar)

</div>

</div>

</div>

<span id="id18070" class="indexterm"></span> <span id="id18072"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(java.lang.String columnName, 
>                               java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column         |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the time |
| `return` - the column value; if the value is SQL NULL, the result is null            |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.
Use the calendar to construct an appropriate millisecond value for the
Time, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.2.2.78" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(int)

</div>

</div>

</div>

<span id="id18122" class="indexterm"></span> <span id="id18124"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object.

</div>

<div id="mt_jd1.2.2.79" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(int, Calendar)

</div>

</div>

</div>

<span id="id18168" class="indexterm"></span> <span id="id18170"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(int columnIndex, 
>                                         java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the timestamp   |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object. Use the calendar to construct an appropriate millisecond value
for the Timestamp, if the underlying database doesn't store timezone
information.

</div>

<div id="mt_jd1.2.2.80" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(String)

</div>

</div>

</div>

<span id="id18220" class="indexterm"></span> <span id="id18222"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object.

</div>

<div id="mt_jd1.2.2.81" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(String, Calendar)

</div>

</div>

</div>

<span id="id18266" class="indexterm"></span> <span id="id18268"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(java.lang.String columnName, 
>                                         java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                |
|-------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column              |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the timestamp |
| `return` - the column value; if the value is SQL NULL, the result is null                 |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object. Use the calendar to construct an appropriate millisecond value
for the Timestamp, if the underlying database doesn't store timezone
information.

</div>

<div id="mt_jd1.2.2.82" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUnicodeStream(int)

</div>

</div>

</div>

<span id="id18318" class="indexterm"></span> <span id="id18320"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getUnicodeStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                           |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                          |
| `return` - a Java input stream that delivers the database column value as a stream of two byte Unicode characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                                                                                                                                                                                                                  |
|:----------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                                                                                                                                                                                                                       |
|                                    | A column value can be retrieved as a stream of Unicode characters and then read in chunks from the stream. This method is particularly suitable for retrieving large LONGVARCHAR values. The JDBC driver will do any necessary conversion from the database format into Unicode. |

</div>

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream. . Also, a stream
may return 0 for available() whether there is data available or not.

</div>

<div id="mt_jd1.2.2.83" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUnicodeStream(String)

</div>

</div>

</div>

<span id="id18368" class="indexterm"></span> <span id="id18370"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getUnicodeStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                           |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column                                                                                         |
| `return` - a Java input stream that delivers the database column value as a stream of two byte Unicode characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                                                                                                                                                                                                                  |
|:----------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                                                                                                                                                                                                                       |
|                                    | A column value can be retrieved as a stream of Unicode characters and then read in chunks from the stream. This method is particularly suitable for retrieving large LONGVARCHAR values. The JDBC driver will do any necessary conversion from the database format into Unicode. |

</div>

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream.

</div>

<div id="mt_jd1.2.2.84" class="section">

<div class="titlepage">

<div>

<div>

##### Method getURL(int)

</div>

</div>

</div>

<span id="id18418" class="indexterm"></span> <span id="id18420"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public URL getURL(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                        |
|---------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the index of the column 1 is the first, 2 is the second,...                                       |
| `return` - the column value as a `java.net.URL` object; if the value is SQL `NULL`, the value returned is `null` in the Java programming language |

</div>

<div class="informaltable">

| Exceptions   |                                                             |
|--------------|-------------------------------------------------------------|
| SQLException | if a database access error occurs, or if a URL is malformed |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Retrieves the value of the designated column in the current row of this
`ResultSet` object as a `java.net.URL` object in the Java programming
language.

</div>

<div id="mt_jd1.2.2.85" class="section">

<div class="titlepage">

<div>

<div>

##### Method getURL(String)

</div>

</div>

</div>

<span id="id18486" class="indexterm"></span> <span id="id18488"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public URL getURL(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                        |
|---------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the SQL name of the column                                                                         |
| `return` - the column value as a `java.net.URL` object; if the value is SQL `NULL`, the value returned is `null` in the Java programming language |

</div>

<div class="informaltable">

| Exceptions   |                                                            |
|--------------|------------------------------------------------------------|
| SQLException | if a database access error occurs or if a URL is malformed |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Retrieves the value of the designated column in the current row of this
`ResultSet` object as a `java.net.URL` object in the Java programming
language.

</div>

<div id="mt_jd1.2.2.86" class="section">

<div class="titlepage">

<div>

<div>

##### Method getWarnings()

</div>

</div>

</div>

<span id="id18554" class="indexterm"></span> <span id="id18556"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public SQLWarning getWarnings() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The first warning reported by calls on this ResultSet is returned.
Subsequent ResultSet warnings will be chained to this SQLWarning.

The warning chain is automatically cleared each time a new row is read.

<span class="emphasis">*Note:*</span> This warning chain only covers
warnings caused by ResultSet methods. Any warning caused by statement
methods (such as reading OUT parameters) will be chained on the
Statement object.

</div>

<div id="mt_jd1.2.2.87" class="section">

<div class="titlepage">

<div>

<div>

##### Method insertRow()

</div>

</div>

</div>

<span id="id18584" class="indexterm"></span> <span id="id18586"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void insertRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                                      |
|--------------|------------------------------------------------------------------------------------------------------|
| SQLException | if a database access error occurs, if this method is called when the cursor is not on the insert row |

</div>

Inserts the contents of the insert row into this rowset following the
current row and it notifies listeners that the row has changed. The
cursor must be on the insert row when this method is called. The method
marks the current row as inserted, but it does not insert the row to the
underlying data source. The method acceptChanges must be called to
insert the row to the data source.

</div>

<div id="mt_jd1.2.2.88" class="section">

<div class="titlepage">

<div>

<div>

##### Method isAfterLast()

</div>

</div>

</div>

<span id="id18611" class="indexterm"></span> <span id="id18613"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isAfterLast() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is after the last row in the rowset.

</div>

<div id="mt_jd1.2.2.89" class="section">

<div class="titlepage">

<div>

<div>

##### Method isBeforeFirst()

</div>

</div>

</div>

<span id="id18638" class="indexterm"></span> <span id="id18640"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isBeforeFirst() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is before the first row in the rowset.

</div>

<div id="mt_jd1.2.2.90" class="section">

<div class="titlepage">

<div>

<div>

##### Method isFirst()

</div>

</div>

</div>

<span id="id18665" class="indexterm"></span> <span id="id18667"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isFirst() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is on the first row of the rowset.

</div>

<div id="mt_jd1.2.2.91" class="section">

<div class="titlepage">

<div>

<div>

##### Method isLast()

</div>

</div>

</div>

<span id="id18692" class="indexterm"></span> <span id="id18694"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isLast() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is on the last row of the rowset. Note: Calling
isLast() may be expensive since the rowset might need to check ahead one
row in order to determine whether the current row is the last row in the
rowset.

</div>

<div id="mt_jd1.2.2.92" class="section">

<div class="titlepage">

<div>

<div>

##### Method last()

</div>

</div>

</div>

<span id="id18719" class="indexterm"></span> <span id="id18721"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean last() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or rowset type is TYPE_FORWARD_ONLY. |

</div>

Moves to the last row in the rowset. It notifies listeners that the
cursor has moved.

</div>

<div id="mt_jd1.2.2.93" class="section">

<div class="titlepage">

<div>

<div>

##### Method moveToCurrentRow()

</div>

</div>

</div>

<span id="id18746" class="indexterm"></span> <span id="id18748"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void moveToCurrentRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                   |
|--------------|-------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or the rowset is not updatable |

</div>

Move the cursor to the remembered cursor position, usually the current
row. Has no effect unless the cursor is on the insert row.

</div>

<div id="mt_jd1.2.2.94" class="section">

<div class="titlepage">

<div>

<div>

##### Method moveToInsertRow()

</div>

</div>

</div>

<span id="id18773" class="indexterm"></span> <span id="id18775"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void moveToInsertRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                   |
|--------------|-------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or the rowset is not updatable |

</div>

Move to the insert row. The current cursor position is remembered while
the cursor is positioned on the insert row. The insert row is a special
row associated with an updatable rowset. It is essentially a buffer
where a new row may be constructed by calling the updateXXX() methods
prior to inserting the row into the rowset. Only the updateXXX(),
getXXX(), and insertRow() methods may be called when the cursor is on
the insert row. All of the columns in a rowset must be given a value
each time this method is called before calling insertRow().
UpdateXXX()must be called before getXXX() on a column.

</div>

<div id="mt_jd1.2.2.95" class="section">

<div class="titlepage">

<div>

<div>

##### Method next()

</div>

</div>

</div>

<span id="id18800" class="indexterm"></span> <span id="id18802"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean next() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A ResultSet is initially positioned before its first row; the first call
to next makes the first row the current row; the second call makes the
second row the current row, etc.

If an input stream from the previous row is open, it is implicitly
closed. The ResultSet's warning chain is cleared when a new row is read.

</div>

<div id="mt_jd1.2.2.96" class="section">

<div class="titlepage">

<div>

<div>

##### Method populate(ResultSet)

</div>

</div>

</div>

<span id="id18828" class="indexterm"></span> <span id="id18830"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void populate(java.sql.ResultSet rs) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                 |
|------------------------------------------------------------|
| <span class="emphasis">*`rs`*</span> - the data to be read |

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Populate the OPLCachedRowSet object with data from a ResultSet. This
method is an alternative to execute() for filling the rowset with data.
Populate() doesn't require that the properties needed by execute(), such
as the command property, be set. A RowSetChangedEvent is sent to all
registered listeners prior to returning.

</div>

<div id="mt_jd1.2.2.97" class="section">

<div class="titlepage">

<div>

<div>

##### Method previous()

</div>

</div>

</div>

<span id="id18870" class="indexterm"></span> <span id="id18872"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean previous() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or rowset type is TYPE_FORWAR_DONLY. |

</div>

Moves to the previous row in the rowset.

Note: previous() is not the same as relative(-1) since it makes sense to
call previous() when there is no current row.

</div>

<div id="mt_jd1.2.2.98" class="section">

<div class="titlepage">

<div>

<div>

##### Method refreshRow()

</div>

</div>

</div>

<span id="id18898" class="indexterm"></span> <span id="id18900"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void refreshRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or if called when on the insert row. |

</div>

Sets the current row with its original value and marks the row as not
updated, thus undoing any changes made to the row since the last call to
the methods updateRow or deleteRow. This method should be called only
when the cursor is on a row in this rowset. Cannot be called when on the
insert row.

</div>

<div id="mt_jd1.2.2.99" class="section">

<div class="titlepage">

<div>

<div>

##### Method relative(int)

</div>

</div>

</div>

<span id="id18925" class="indexterm"></span> <span id="id18927"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean relative(int rows) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                                     |
|--------------|-----------------------------------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or there is no current row, or rowset type is TYPE_FORWARD_ONLY. |

</div>

Moves a relative number of rows, either positive or negative. Attempting
to move beyond the first/last row in the rowset positions the cursor
before/after the the first/last row. Calling relative(0) is valid, but
does not change the cursor position. It notifies listeners that the
cursor has moved.

Note: Calling relative(1) is different than calling next() since is
makes sense to call next() when there is no current row, for example,
when the cursor is positioned before the first row or after the last row
of the rowset.

</div>

<div id="mt_jd1.2.2.100" class="section">

<div class="titlepage">

<div>

<div>

##### Method release()

</div>

</div>

</div>

<span id="id18954" class="indexterm"></span> <span id="id18956"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void release() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Releases the current contents of the rowset. Outstanding updates are
discarded. The rowset contains no rows after release is called. A
RowSetChangedEvent is sent to all registered listeners prior to
returning.

</div>

<div id="mt_jd1.2.2.101" class="section">

<div class="titlepage">

<div>

<div>

##### Method restoreOriginal()

</div>

</div>

</div>

<span id="id18981" class="indexterm"></span> <span id="id18983"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void restoreOriginal() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Restores the rowset to its original state ( the original value of the
rowset becomes the current value). All updates, inserts, and deletes
made to the original state are lost. The cursor is positioned before the
first row. A RowSetChangedEvent is sent to all registered listeners
prior to returning.

</div>

<div id="mt_jd1.2.2.102" class="section">

<div class="titlepage">

<div>

<div>

##### Method rowDeleted()

</div>

</div>

</div>

<span id="id19008" class="indexterm"></span> <span id="id19010"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean rowDeleted() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                              |
|------------------------|------------------------------------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.DatabaseMetaData.deletesAreDetected</span> |

</div>

Determine if this row has been deleted. A deleted row may leave a
visible "hole" in a rowset. This method can be used to detect holes in a
rowset. The value returned depends on whether or not the rowset can
detect deletions.

</div>

<div id="mt_jd1.2.2.103" class="section">

<div class="titlepage">

<div>

<div>

##### Method rowInserted()

</div>

</div>

</div>

<span id="id19052" class="indexterm"></span> <span id="id19054"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean rowInserted() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                              |
|------------------------|------------------------------------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.DatabaseMetaData.insertsAreDetected</span> |

</div>

Determine if the current row has been inserted. The value returned
depends on whether or not the rowset can detect visible inserts.

</div>

<div id="mt_jd1.2.2.104" class="section">

<div class="titlepage">

<div>

<div>

##### Method rowUpdated()

</div>

</div>

</div>

<span id="id19096" class="indexterm"></span> <span id="id19098"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean rowUpdated() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                              |
|------------------------|------------------------------------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.DatabaseMetaData.updatesAreDetected</span> |

</div>

Determine if the current row has been updated. The value returned
depends on whether or not the rowset can detect updates.

</div>

<div id="mt_jd1.2.2.105" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCommand(String)

</div>

</div>

</div>

<span id="id19140" class="indexterm"></span> <span id="id19142"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCommand(java.lang.String cmd) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                        |
|-------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`cmd`*</span> - - a String object containing an SQL query that will be set as the command |

</div>

<div class="informaltable">

| Exceptions   |                       |
|--------------|-----------------------|
| SQLException | \- if an error occurs |

</div>

Sets this OPLCachedRowSet object's command property to the given String
object and clears the parameters, if any, that were set for the previous
command.

</div>

<div id="mt_jd1.2.2.106" class="section">

<div class="titlepage">

<div>

<div>

##### Method setConcurrency(int)

</div>

</div>

</div>

<span id="id19182" class="indexterm"></span> <span id="id19184"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setConcurrency(int concurrency) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                 |
|--------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`concurrency`*</span> - - one of the following constants: ResultSet.CONCUR_READ_ONLY or ResultSet.CONCUR_UPDATABLE |

</div>

<div class="informaltable">

| Exceptions   |                       |
|--------------|-----------------------|
| SQLException | \- if an error occurs |

</div>

Sets the concurrency for this rowset to the specified concurrency. The
default concurrency is ResultSet.CONCUR_UPDATABLE.

</div>

<div id="mt_jd1.2.2.107" class="section">

<div class="titlepage">

<div>

<div>

##### Method setKeyColumns(int\[\])

</div>

</div>

</div>

<span id="id19224" class="indexterm"></span> <span id="id19226"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setKeyColumns(int[] keys) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                                                                                                          |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`keys`*</span> - - an array of int indicating the columns that form a key for this OPLCachedRowSet object; every element in the array must be greater than 0 and less than or equal to the number of columns in this rowset |

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Sets this OPLCachedRowSet object's keyCols field with the given array of
column numbers, which forms a key for uniquely identifying a row in this
rowset. Note: If you don't set the keyCols, the OPLCachedRowSet will set
automatically based on RowSetMetaData

</div>

<div id="mt_jd1.2.2.108" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMetaData(RowSetMetaData)

</div>

</div>

</div>

<span id="id19266" class="indexterm"></span> <span id="id19268"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMetaData(javax.sql.RowSetMetaData md) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                               |
|----------------------------------------------------------|
| <span class="emphasis">*`md`*</span> - a metadata object |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the rowset's metadata.

</div>

<div id="mt_jd1.2.2.109" class="section">

<div class="titlepage">

<div>

<div>

##### Method setOriginal()

</div>

</div>

</div>

<span id="id19308" class="indexterm"></span> <span id="id19310"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setOriginal() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Marks all rows in this rowset as being original rows. Any updates made
to the rows become the original values for the rowset. Calls to the
method setOriginal cannot be reversed.

</div>

<div id="mt_jd1.2.2.110" class="section">

<div class="titlepage">

<div>

<div>

##### Method setOriginalRow()

</div>

</div>

</div>

<span id="id19335" class="indexterm"></span> <span id="id19337"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setOriginalRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Marks the current row in this rowset as being an original row. The row
is no longer marked as inserted, deleted, or updated, and its values
become the original values. A call to setOriginalRow cannot be reversed.

</div>

<div id="mt_jd1.2.2.111" class="section">

<div class="titlepage">

<div>

<div>

##### Method setShowDeleted(boolean)

</div>

</div>

</div>

<span id="id19362" class="indexterm"></span> <span id="id19364"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setShowDeleted(boolean value) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                      |
|-------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`value`*</span> - true if deleted rows should be shown, false otherwise |

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Set the show deleted property.

</div>

<div id="mt_jd1.2.2.112" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTableName(String)

</div>

</div>

</div>

<span id="id19404" class="indexterm"></span> <span id="id19406"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTableName(java.lang.String _tableName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                  |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`_tabName`*</span> - - a String object that identifies the table from which this OPLCachedRowSet object was derived |

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Sets the identifier for the table from which this rowset was derived to
the given table name. Note: You don't usually need to set a table name,
because the OPLCachedRowSet tries to determine the table name from your
SQL query command.

</div>

<div id="mt_jd1.2.2.113" class="section">

<div class="titlepage">

<div>

<div>

##### Method size()

</div>

</div>

</div>

<span id="id19446" class="indexterm"></span> <span id="id19448"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int size();
>           
> ```

</div>

Returns the number of rows in this OPLCachedRowSet object.

</div>

<div id="mt_jd1.2.2.114" class="section">

<div class="titlepage">

<div>

<div>

##### Method toCollection()

</div>

</div>

</div>

<span id="id19458" class="indexterm"></span> <span id="id19460"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Collection toCollection() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Convert the rowset to a collection of tables. Each tables represents a
row of the original rowset. The tables are keyed by column number. A
copy of the rowset's contents is made.

</div>

<div id="mt_jd1.2.2.115" class="section">

<div class="titlepage">

<div>

<div>

##### Method toCollection(int)

</div>

</div>

</div>

<span id="id19485" class="indexterm"></span> <span id="id19487"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Collection toCollection(int col) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Return a column of the rowset as a collection. Makes a copy of the
column's data.

</div>

<div id="mt_jd1.2.2.116" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateArray(int, Array)

</div>

</div>

</div>

<span id="id19513" class="indexterm"></span> <span id="id19515"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateArray(int columnIndex, java.sql.Array x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Array` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.117" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateArray(String, Array)

</div>

</div>

</div>

<span id="id19581" class="indexterm"></span> <span id="id19583"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateArray(java.lang.String columnName, 
>                                   java.sql.Array x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Array` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.118" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateAsciiStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id19649" class="indexterm"></span> <span id="id19651"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateAsciiStream(int columnIndex, java.io.InputStream x, 
>                                         int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |
| <span class="emphasis">*`length`*</span> - the length of the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an ascii stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.119" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateAsciiStream(String, InputStream, int)

</div>

</div>

</div>

<span id="id19703" class="indexterm"></span> <span id="id19705"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateAsciiStream(java.lang.String columnName, 
>                                         java.io.InputStream x, 
>                                         int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |
| <span class="emphasis">*`length`*</span> - of the stream              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an ascii stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.120" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBigDecimal(int, BigDecimal)

</div>

</div>

</div>

<span id="id19757" class="indexterm"></span> <span id="id19759"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBigDecimal(int columnIndex, java.math.BigDecimal x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a BigDecimal value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.121" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBigDecimal(String, BigDecimal)

</div>

</div>

</div>

<span id="id19805" class="indexterm"></span> <span id="id19807"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBigDecimal(java.lang.String columnName, 
>                                        java.math.BigDecimal x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a BigDecimal value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.122" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBinaryStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id19853" class="indexterm"></span> <span id="id19855"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBinaryStream(int columnIndex, 
>                                          java.io.InputStream x, int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |
| <span class="emphasis">*`length`*</span> - the length of the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a binary stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.123" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBinaryStream(String, InputStream, int)

</div>

</div>

</div>

<span id="id19907" class="indexterm"></span> <span id="id19909"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBinaryStream(java.lang.String columnName, 
>                                          java.io.InputStream x, 
>                                          int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |
| <span class="emphasis">*`length`*</span> - of the stream              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a binary stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.124" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBlob(int, Blob)

</div>

</div>

</div>

<span id="id19961" class="indexterm"></span> <span id="id19963"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBlob(int columnIndex, java.sql.Blob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Blob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.125" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBlob(String, Blob)

</div>

</div>

</div>

<span id="id20029" class="indexterm"></span> <span id="id20031"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBlob(java.lang.String columnName, java.sql.Blob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Blob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.126" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBoolean(int, boolean)

</div>

</div>

</div>

<span id="id20097" class="indexterm"></span> <span id="id20099"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBoolean(int columnIndex, boolean x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a boolean value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.127" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBoolean(String, boolean)

</div>

</div>

</div>

<span id="id20145" class="indexterm"></span> <span id="id20147"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBoolean(java.lang.String columnName, boolean x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a boolean value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.128" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateByte(int, byte)

</div>

</div>

</div>

<span id="id20193" class="indexterm"></span> <span id="id20195"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateByte(int columnIndex, byte x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.129" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateByte(String, byte)

</div>

</div>

</div>

<span id="id20241" class="indexterm"></span> <span id="id20243"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateByte(java.lang.String columnName, byte x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.130" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBytes(int, byte\[\])

</div>

</div>

</div>

<span id="id20289" class="indexterm"></span> <span id="id20291"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBytes(int columnIndex, byte[] x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte array value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.131" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBytes(String, byte\[\])

</div>

</div>

</div>

<span id="id20337" class="indexterm"></span> <span id="id20339"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBytes(java.lang.String columnName, byte[] x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte array value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.132" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateCharacterStream(int, Reader, int)

</div>

</div>

</div>

<span id="id20385" class="indexterm"></span> <span id="id20387"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateCharacterStream(int columnIndex, java.io.Reader x, 
>                                             int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |
| <span class="emphasis">*`length`*</span> - the length of the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a character stream value. The updateXXX() methods
are used to update column values in the current row, or the insert row.
The updateXXX() methods do not update the underlying database, instead
the updateRow() or insertRow() methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.133" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateCharacterStream(String, Reader, int)

</div>

</div>

</div>

<span id="id20439" class="indexterm"></span> <span id="id20441"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateCharacterStream(java.lang.String columnName, 
>                                             java.io.Reader reader, 
>                                             int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |
| <span class="emphasis">*`length`*</span> - of the stream              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a character stream value. The updateXXX() methods
are used to update column values in the current row, or the insert row.
The updateXXX() methods do not update the underlying database, instead
the updateRow() or insertRow() methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.134" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateClob(int, Clob)

</div>

</div>

</div>

<span id="id20493" class="indexterm"></span> <span id="id20495"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateClob(int columnIndex, java.sql.Clob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Clob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.135" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateClob(String, Clob)

</div>

</div>

</div>

<span id="id20561" class="indexterm"></span> <span id="id20563"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateClob(java.lang.String columnName, java.sql.Clob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Clob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.136" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDate(int, Date)

</div>

</div>

</div>

<span id="id20629" class="indexterm"></span> <span id="id20631"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDate(int columnIndex, java.sql.Date x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Date value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.137" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDate(String, Date)

</div>

</div>

</div>

<span id="id20677" class="indexterm"></span> <span id="id20679"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDate(java.lang.String columnName, java.sql.Date x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Date value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.138" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDouble(int, double)

</div>

</div>

</div>

<span id="id20725" class="indexterm"></span> <span id="id20727"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDouble(int columnIndex, double x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Double value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.139" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDouble(String, double)

</div>

</div>

</div>

<span id="id20773" class="indexterm"></span> <span id="id20775"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDouble(java.lang.String columnName, double x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a double value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.140" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateFloat(int, float)

</div>

</div>

</div>

<span id="id20821" class="indexterm"></span> <span id="id20823"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateFloat(int columnIndex, float x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a float value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.141" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateFloat(String, float)

</div>

</div>

</div>

<span id="id20869" class="indexterm"></span> <span id="id20871"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateFloat(java.lang.String columnName, float x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a float value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.142" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateInt(int, int)

</div>

</div>

</div>

<span id="id20917" class="indexterm"></span> <span id="id20919"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateInt(int columnIndex, int x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an integer value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.143" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateInt(String, int)

</div>

</div>

</div>

<span id="id20965" class="indexterm"></span> <span id="id20967"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateInt(java.lang.String columnName, int x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an integer value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.144" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateLong(int, long)

</div>

</div>

</div>

<span id="id21013" class="indexterm"></span> <span id="id21015"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateLong(int columnIndex, long x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a long value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.145" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateLong(String, long)

</div>

</div>

</div>

<span id="id21061" class="indexterm"></span> <span id="id21063"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateLong(java.lang.String columnName, long x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a long value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.146" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateNull(int)

</div>

</div>

</div>

<span id="id21109" class="indexterm"></span> <span id="id21111"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateNull(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Give a nullable column a null value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.147" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateNull(String)

</div>

</div>

</div>

<span id="id21151" class="indexterm"></span> <span id="id21153"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateNull(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a null value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.148" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(int, Object)

</div>

</div>

</div>

<span id="id21193" class="indexterm"></span> <span id="id21195"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(int columnIndex, java.lang.Object x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.149" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(int, Object, int)

</div>

</div>

</div>

<span id="id21241" class="indexterm"></span> <span id="id21243"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(int columnIndex, java.lang.Object x, 
>                                    int scale) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                                                          |
| <span class="emphasis">*`x`*</span> - the new column value                                                                                                                                           |
| <span class="emphasis">*`scale`*</span> - For java.sql.Types.DECIMAL or java.sql.Types.NUMERIC types this is the number of digits after the decimal. For all other types this value will be ignored. |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.150" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(String, Object)

</div>

</div>

</div>

<span id="id21295" class="indexterm"></span> <span id="id21297"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(java.lang.String columnName, 
>                                    java.lang.Object x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.151" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(String, Object, int)

</div>

</div>

</div>

<span id="id21343" class="indexterm"></span> <span id="id21345"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(java.lang.String columnName, 
>                                    java.lang.Object x, int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column                                                                                                                                |
| <span class="emphasis">*`x`*</span> - the new column value                                                                                                                                           |
| <span class="emphasis">*`scale`*</span> - For java.sql.Types.DECIMAL or java.sql.Types.NUMERIC types this is the number of digits after the decimal. For all other types this value will be ignored. |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.152" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateRef(int, Ref)

</div>

</div>

</div>

<span id="id21397" class="indexterm"></span> <span id="id21399"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateRef(int columnIndex, java.sql.Ref x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Ref` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.153" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateRef(String, Ref)

</div>

</div>

</div>

<span id="id21465" class="indexterm"></span> <span id="id21467"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateRef(java.lang.String columnName, java.sql.Ref x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Ref` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.2.2.154" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateRow()

</div>

</div>

</div>

<span id="id21533" class="indexterm"></span> <span id="id21535"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                        |
|--------------|------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or if called when on the insert row |

</div>

Marks the current row of this rowset as updated but it does not update
the row to the underlying data source. The method acceptChanges must be
called to update the row to the data source. It notifies listeners that
the row has changed also. Cannot be called when on the insert row.

</div>

<div id="mt_jd1.2.2.155" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateShort(int, short)

</div>

</div>

</div>

<span id="id21560" class="indexterm"></span> <span id="id21562"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateShort(int columnIndex, short x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a short value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.156" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateShort(String, short)

</div>

</div>

</div>

<span id="id21608" class="indexterm"></span> <span id="id21610"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateShort(java.lang.String columnName, short x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a short value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.157" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateString(int, String)

</div>

</div>

</div>

<span id="id21656" class="indexterm"></span> <span id="id21658"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateString(int columnIndex, java.lang.String x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a String value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.158" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateString(String, String)

</div>

</div>

</div>

<span id="id21704" class="indexterm"></span> <span id="id21706"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateString(java.lang.String columnName, 
>                                    java.lang.String x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a String value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.159" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTime(int, Time)

</div>

</div>

</div>

<span id="id21752" class="indexterm"></span> <span id="id21754"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTime(int columnIndex, java.sql.Time x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Time value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.160" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTime(String, Time)

</div>

</div>

</div>

<span id="id21800" class="indexterm"></span> <span id="id21802"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTime(java.lang.String columnName, java.sql.Time x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Time value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.161" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTimestamp(int, Timestamp)

</div>

</div>

</div>

<span id="id21848" class="indexterm"></span> <span id="id21850"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTimestamp(int columnIndex, java.sql.Timestamp x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Timestamp value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.162" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTimestamp(String, Timestamp)

</div>

</div>

</div>

<span id="id21896" class="indexterm"></span> <span id="id21898"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTimestamp(java.lang.String columnName, 
>                                       java.sql.Timestamp x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Timestamp value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.2.2.163" class="section">

<div class="titlepage">

<div>

<div>

##### Method wasNull()

</div>

</div>

</div>

<span id="id21944" class="indexterm"></span> <span id="id21946"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean wasNull() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column may have the value of SQL NULL; wasNull reports whether the
last column read had this special value. Note that you must first call
getXXX on a column to try to read its value and then call wasNull() to
find if the value was the SQL NULL.

</div>

</div>

</div>

<div id="mt_jd1.3" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.3. Class OPLConnectionPoolDataSource

</div>

</div>

</div>

<span id="id21971" class="indexterm"></span> <span id="id21973"
class="indexterm"></span>

A ConnectionPoolDataSource object is a factory for PooledConnection
objects. An object that implements this interface will typically be
registered with a JNDI service.

<div id="mt_jd1.3.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLConnectionPoolDataSource extends OPLDataSource implements ConnectionPoolDataSource,Serializable,Referenceable,ConnectionEventListener {
  // Public Constructors
  public OPLConnectionPoolDataSource();
  // Public Methods
  public void finalize() throws java.lang.Throwable;
  public OPLPoolStatistic get_statistics();
  public OPLPoolStatistic[] getAll_statistics();
  public void close() throws java.sql.SQLException;
  public void connectionClosed(javax.sql.ConnectionEvent event);
  public void connectionErrorOccurred(javax.sql.ConnectionEvent event);
  public Reference getReference() throws javax.naming.NamingException;
  public void fill() throws java.sql.SQLException;
  public PooledConnection getPooledConnection() throws java.sql.SQLException;
  public PooledConnection getPooledConnection(java.lang.String _user, 
                                              java.lang.String _password) 
      throws java.sql.SQLException;
  public int getMinPoolSize();
  public void setMinPoolSize(int parm) throws java.sql.SQLException;
  public int getMaxPoolSize();
  public void setMaxPoolSize(int parm) throws java.sql.SQLException;
  public int getInitialPoolSize();
  public void setInitialPoolSize(int parm) throws java.sql.SQLException;
  public int getMaxIdleTime();
  public void setMaxIdleTime(int parm) throws java.sql.SQLException;
  public int getPropertyCycle();
  public void setPropertyCycle(int parm);
  public int getMaxStatements();
  public void setMaxStatements(int parm) throws java.sql.SQLException;
}
      
```

<div class="informaltable">

|              Inheritance Path              |
|:------------------------------------------:|
|              java.lang.Object              |
|                     \|                     |
|        openlink.javax.OPLDataSource        |
|                     \|                     |
| openlink.javax.OPLConnectionPoolDataSource |

</div>

</div>

<div id="mt_jd1.3.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.3.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method close()

</div>

</div>

</div>

<span id="id22042" class="indexterm"></span> <span id="id22044"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void close() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Physically close all the pooled connections in the cache and free all
the resources

</div>

<div id="mt_jd1.3.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method connectionClosed(ConnectionEvent)

</div>

</div>

</div>

<span id="id22069" class="indexterm"></span> <span id="id22071"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void connectionClosed(javax.sql.ConnectionEvent event);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                   |
|----------------------------------------------------------------------------------------------|
| <span class="emphasis">*`event`*</span> - an event object describing the source of the event |

</div>

Invoked when the application calls close() on its representation of the
connection.

</div>

<div id="mt_jd1.3.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method connectionErrorOccurred(ConnectionEvent)

</div>

</div>

</div>

<span id="id22096" class="indexterm"></span> <span id="id22098"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void connectionErrorOccurred(javax.sql.ConnectionEvent event);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                   |
|----------------------------------------------------------------------------------------------|
| <span class="emphasis">*`event`*</span> - an event object describing the source of the event |

</div>

Invoked when a fatal connection error occurs, just before an
SQLException is thrown to the application.

</div>

<div id="mt_jd1.3.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method fill()

</div>

</div>

</div>

<span id="id22123" class="indexterm"></span> <span id="id22125"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void fill() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                   |
|-----------------------|-------------------|
| java.sql.SQLException | if a error occurs |

</div>

Fills the cache with PooledConnections for later use. Ignored if the
MinPoolSize is 0. It is usually called when the
OPLConnectionPoolDataSource is created via JNDI calls.

</div>

<div id="mt_jd1.3.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method get_statistics()

</div>

</div>

</div>

<span id="id22150" class="indexterm"></span> <span id="id22152"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public OPLPoolStatistic get_statistics();
>           
> ```

</div>

Return the cache statistics for the OPLConnectionPoolDataSource

</div>

<div id="mt_jd1.3.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method getAll_statistics()

</div>

</div>

</div>

<span id="id22162" class="indexterm"></span> <span id="id22164"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public OPLPoolStatistic[] getAll_statistics();
>           
> ```

</div>

Return an array of the cache statistics for the all created
OPLConnectionPoolDataSources

</div>

<div id="mt_jd1.3.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method getInitialPoolSize()

</div>

</div>

</div>

<span id="id22174" class="indexterm"></span> <span id="id22176"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getInitialPoolSize();
>           
> ```

</div>

Get the number of physical connections the pool will contain when it is
created

</div>

<div id="mt_jd1.3.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMaxIdleTime()

</div>

</div>

</div>

<span id="id22186" class="indexterm"></span> <span id="id22188"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMaxIdleTime();
>           
> ```

</div>

Get the number of seconds that a physical connection will remain unused
in the pool before the connection is closed. Zero ( 0 ) indicates no
limit.

</div>

<div id="mt_jd1.3.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMaxPoolSize()

</div>

</div>

</div>

<span id="id22198" class="indexterm"></span> <span id="id22200"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMaxPoolSize();
>           
> ```

</div>

Get the maximum number of physical connections the pool will be able
contain. Zero ( 0 ) indicates no maximum size.

</div>

<div id="mt_jd1.3.2.10" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMaxStatements()

</div>

</div>

</div>

<span id="id22210" class="indexterm"></span> <span id="id22212"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMaxStatements();
>           
> ```

</div>

Get the total number of statements that the pool will keep open. Zero (
0 ) indicates that caching of statements is disabled.

</div>

<div id="mt_jd1.3.2.11" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMinPoolSize()

</div>

</div>

</div>

<span id="id22222" class="indexterm"></span> <span id="id22224"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMinPoolSize();
>           
> ```

</div>

Get the minimum number of physical connections the pool will keep
available at all times. Zero ( 0 ) indicates that connections will be
created as needed.

</div>

<div id="mt_jd1.3.2.12" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPooledConnection()

</div>

</div>

</div>

<span id="id22234" class="indexterm"></span> <span id="id22236"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public PooledConnection getPooledConnection() throws 
>             java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Attempt to establish a database connection.

</div>

<div id="mt_jd1.3.2.13" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPooledConnection(String, String)

</div>

</div>

</div>

<span id="id22261" class="indexterm"></span> <span id="id22263"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public PooledConnection getPooledConnection(java.lang.String _user, 
>                                                       java.lang.String _password) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                              |
|---------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`user`*</span> - the database user on whose behalf the Connection is being made |
| <span class="emphasis">*`password`*</span> - the user's password                                        |
| `return` - a PooledConnection to the database                                                           |

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Attempt to establish a database connection.

</div>

<div id="mt_jd1.3.2.14" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPropertyCycle()

</div>

</div>

</div>

<span id="id22313" class="indexterm"></span> <span id="id22315"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getPropertyCycle();
>           
> ```

</div>

Get the interval, in seconds, that the pool will wait before enforcing
the current policy defined by the values of the above connection pool
properties

</div>

<div id="mt_jd1.3.2.15" class="section">

<div class="titlepage">

<div>

<div>

##### Method setInitialPoolSize(int)

</div>

</div>

</div>

<span id="id22325" class="indexterm"></span> <span id="id22327"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setInitialPoolSize(int parm) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                |
|---------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - a number of physical connections |

</div>

<div class="informaltable">

| Exceptions            |                    |
|-----------------------|--------------------|
| java.sql.SQLException | if an error occurs |

</div>

Set the number of physical connections the pool should contain when it
is created

</div>

<div id="mt_jd1.3.2.16" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMaxIdleTime(int)

</div>

</div>

</div>

<span id="id22367" class="indexterm"></span> <span id="id22369"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMaxIdleTime(int parm) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                   |
|--------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - a number of seconds |

</div>

<div class="informaltable">

| Exceptions            |                    |
|-----------------------|--------------------|
| java.sql.SQLException | if an error occurs |

</div>

Set the number of seconds that a physical connection should remain
unused in the pool before the connection is closed. Zero ( 0 ) indicates
no limit.

</div>

<div id="mt_jd1.3.2.17" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMaxPoolSize(int)

</div>

</div>

</div>

<span id="id22409" class="indexterm"></span> <span id="id22411"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMaxPoolSize(int parm) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                        |
|-----------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - a maximum number of physical connections |

</div>

<div class="informaltable">

| Exceptions            |                    |
|-----------------------|--------------------|
| java.sql.SQLException | if an error occurs |

</div>

Set the maximum number of physical conections that the pool should
contain. Zero ( 0 ) indicates no maximum size. The default value is 0 .

</div>

<div id="mt_jd1.3.2.18" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMaxStatements(int)

</div>

</div>

</div>

<span id="id22451" class="indexterm"></span> <span id="id22453"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMaxStatements(int parm) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - a total number of statements |

</div>

<div class="informaltable">

| Exceptions            |                    |
|-----------------------|--------------------|
| java.sql.SQLException | if an error occurs |

</div>

Set the total number of statements that the pool should keep open. Zero
( 0 ) indicates that caching of statements is disabled.

</div>

<div id="mt_jd1.3.2.19" class="section">

<div class="titlepage">

<div>

<div>

##### Method setMinPoolSize(int)

</div>

</div>

</div>

<span id="id22493" class="indexterm"></span> <span id="id22495"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setMinPoolSize(int parm) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                        |
|-----------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - a minimum number of physical connections |

</div>

<div class="informaltable">

| Exceptions            |                    |
|-----------------------|--------------------|
| java.sql.SQLException | if an error occurs |

</div>

Set the number of physical connections the pool should keep available at
all times. Zero ( 0 ) indicates that connections should be created as
needed The default value is 0 .

</div>

<div id="mt_jd1.3.2.20" class="section">

<div class="titlepage">

<div>

<div>

##### Method setPropertyCycle(int)

</div>

</div>

</div>

<span id="id22535" class="indexterm"></span> <span id="id22537"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setPropertyCycle(int parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                        |
|-------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - an interval (in seconds) |

</div>

Set the interval, in seconds, that the pool should wait before enforcing
the current policy defined by the values of the above connection pool
properties

</div>

</div>

</div>

<div id="mt_jd1.4" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.4. Class OPLDataSource

</div>

</div>

</div>

<span id="id22562" class="indexterm"></span> <span id="id22564"
class="indexterm"></span>

A DataSource object is a factory for Connection objects. An object that
implements the DataSource interface will typically be registered with a
JNDI service provider. A JDBC driver that is accessed via the DataSource
API does not automatically register itself with the DriverManager.

<div id="mt_jd1.4.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLDataSource implements DataSource,Serializable,Referenceable {
  // Public Constructors
  public OPLDataSource();
  // Public Methods
  public Reference getReference() throws javax.naming.NamingException;
  public Connection getConnection() throws java.sql.SQLException;
  public Connection getConnection(java.lang.String user, 
                                  java.lang.String password) 
      throws java.sql.SQLException;
  public PrintWriter getLogWriter() throws java.sql.SQLException;
  public void setLogWriter(java.io.PrintWriter parm) 
      throws java.sql.SQLException;
  public int getLoginTimeout() throws java.sql.SQLException;
  public void setLoginTimeout(int parm) throws java.sql.SQLException;
  public String getDataSourceName();
  public void setDataSourceName(java.lang.String parm);
  public String getDescription();
  public void setDescription(java.lang.String parm);
  public int getPortNumber();
  public void setPortNumber(int parm);
  public String getServerName();
  public void setServerName(java.lang.String parm);
  public String getDatabaseName();
  public void setDatabaseName(java.lang.String parm);
  public String getUser();
  public void setUser(java.lang.String parm);
  public String getPassword();
  public void setPassword(java.lang.String parm);
  public String getSVT();
  public void setSVT(java.lang.String parm);
  public boolean getReadOnly();
  public void setReadOnly(boolean parm);
  public String getDbOptions();
  public void setDbOptions(java.lang.String parm);
  public String getFBS();
  public void setFBS(java.lang.String parm);
  public String getCharSet();
  public void setCharSet(java.lang.String parm);
  public String getCursorModel();
  public void setCursorModel(java.lang.String parm);
  public String getConcurrencyType();
  public void setConcurrencyType(java.lang.String parm);
  public boolean getEncrypted();
  public void setEncrypted(boolean parm);
  public boolean getDeferLongFetch();
  public void setDeferLongFetch(boolean parm);
  public String getApplication();
  public void setApplication(java.lang.String parm);
  public boolean getUnicode();
  public void setUnicode(boolean parm);
  public String getURL();
  public void setURL(java.lang.String parm);
}
      
```

<div class="informaltable">

|       Inheritance Path       |
|:----------------------------:|
|       java.lang.Object       |
|              \|              |
| openlink.javax.OPLDataSource |

</div>

</div>

<div id="mt_jd1.4.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.4.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method getApplication()

</div>

</div>

</div>

<span id="id22663" class="indexterm"></span> <span id="id22665"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getApplication();
>           
> ```

</div>

Get the Application name set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCharSet()

</div>

</div>

</div>

<span id="id22675" class="indexterm"></span> <span id="id22677"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getCharSet();
>           
> ```

</div>

Get the charset of remote database set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConcurrencyType()

</div>

</div>

</div>

<span id="id22687" class="indexterm"></span> <span id="id22689"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getConcurrencyType();
>           
> ```

</div>

Get the default Concurrency Type for scrollable ResultSets set on this
DataSource instance.

</div>

<div id="mt_jd1.4.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConnection()

</div>

</div>

</div>

<span id="id22699" class="indexterm"></span> <span id="id22701"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Connection getConnection() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Attempt to establish a database connection.

</div>

<div id="mt_jd1.4.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConnection(String, String)

</div>

</div>

</div>

<span id="id22726" class="indexterm"></span> <span id="id22728"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Connection getConnection(java.lang.String user, 
>                                           java.lang.String password) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                              |
|---------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`user`*</span> - the database user on whose behalf the Connection is being made |
| <span class="emphasis">*`password`*</span> - the user's password                                        |
| `return` - a Connection to the database                                                                 |

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Attempt to establish a database connection.

</div>

<div id="mt_jd1.4.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCursorModel()

</div>

</div>

</div>

<span id="id22778" class="indexterm"></span> <span id="id22780"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getCursorModel();
>           
> ```

</div>

Get the default Cursor Model for scrollable ResultSets set on this
DataSource instance.

</div>

<div id="mt_jd1.4.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDatabaseName()

</div>

</div>

</div>

<span id="id22790" class="indexterm"></span> <span id="id22792"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getDatabaseName();
>           
> ```

</div>

Get the name of the database set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDataSourceName()

</div>

</div>

</div>

<span id="id22802" class="indexterm"></span> <span id="id22804"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getDataSourceName();
>           
> ```

</div>

Get the datasource name for this instance if set. The default value is
"OPLDataSourceName"

</div>

<div id="mt_jd1.4.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDbOptions()

</div>

</div>

</div>

<span id="id22814" class="indexterm"></span> <span id="id22816"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getDbOptions();
>           
> ```

</div>

Get the Database Options set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.10" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDeferLongFetch()

</div>

</div>

</div>

<span id="id22826" class="indexterm"></span> <span id="id22828"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getDeferLongFetch();
>           
> ```

</div>

Get if the DataSource instance uses the deferLongFetch for long data.

</div>

<div id="mt_jd1.4.2.11" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDescription()

</div>

</div>

</div>

<span id="id22838" class="indexterm"></span> <span id="id22840"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getDescription();
>           
> ```

</div>

Get the description of this data source.

</div>

<div id="mt_jd1.4.2.12" class="section">

<div class="titlepage">

<div>

<div>

##### Method getEncrypted()

</div>

</div>

</div>

<span id="id22850" class="indexterm"></span> <span id="id22852"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getEncrypted();
>           
> ```

</div>

Get if the outgoing packets are encrypted for this DataSource instance.

</div>

<div id="mt_jd1.4.2.13" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFBS()

</div>

</div>

</div>

<span id="id22862" class="indexterm"></span> <span id="id22864"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getFBS();
>           
> ```

</div>

Get the Fetch Buffer Size set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.14" class="section">

<div class="titlepage">

<div>

<div>

##### Method getLoginTimeout()

</div>

</div>

</div>

<span id="id22874" class="indexterm"></span> <span id="id22876"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getLoginTimeout() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Gets the maximum time in seconds that this data source can wait while
attempting to connect to a database. A value of zero means that the
timeout is the default system timeout if there is one; otherwise it
means that there is no timeout. When a DataSource object is created the
login timeout is initially zero.

</div>

<div id="mt_jd1.4.2.15" class="section">

<div class="titlepage">

<div>

<div>

##### Method getLogWriter()

</div>

</div>

</div>

<span id="id22901" class="indexterm"></span> <span id="id22903"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public PrintWriter getLogWriter() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

The log writer is a character output stream to which all logging and
tracing messages for this data source object instance will be printed.
This includes messages printed by the methods of this object, messages
printed by methods of other objects manufactured by this object, and so
on. Messages printed to a data source specific log writer are not
printed to the log writer associated with the java.sql.Drivermanager
class. When a DataSource object is created the log writer is initially
null, in other words, logging is disabled.

</div>

<div id="mt_jd1.4.2.16" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPassword()

</div>

</div>

</div>

<span id="id22928" class="indexterm"></span> <span id="id22930"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getPassword();
>           
> ```

</div>

Get the password set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.17" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPortNumber()

</div>

</div>

</div>

<span id="id22940" class="indexterm"></span> <span id="id22942"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getPortNumber();
>           
> ```

</div>

Get the port number on which oplrqb is listening for requests. The
default value is 5000

</div>

<div id="mt_jd1.4.2.18" class="section">

<div class="titlepage">

<div>

<div>

##### Method getReadOnly()

</div>

</div>

</div>

<span id="id22952" class="indexterm"></span> <span id="id22954"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getReadOnly();
>           
> ```

</div>

Get the ReadOnly attribute set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.19" class="section">

<div class="titlepage">

<div>

<div>

##### Method getServerName()

</div>

</div>

</div>

<span id="id22964" class="indexterm"></span> <span id="id22966"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getServerName();
>           
> ```

</div>

Get the name of the host on which oplrqb is running. The default value
is "localhost"

</div>

<div id="mt_jd1.4.2.20" class="section">

<div class="titlepage">

<div>

<div>

##### Method getSVT()

</div>

</div>

</div>

<span id="id22976" class="indexterm"></span> <span id="id22978"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getSVT();
>           
> ```

</div>

Get the ServerType set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.21" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUnicode()

</div>

</div>

</div>

<span id="id22988" class="indexterm"></span> <span id="id22990"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getUnicode();
>           
> ```

</div>

Get if the DataSource instance uses the Unicode connection with a DBMS
agent.

</div>

<div id="mt_jd1.4.2.22" class="section">

<div class="titlepage">

<div>

<div>

##### Method getURL()

</div>

</div>

</div>

<span id="id23000" class="indexterm"></span> <span id="id23002"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getURL();
>           
> ```

</div>

Get the URL for this Datasource instance.

</div>

<div id="mt_jd1.4.2.23" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUser()

</div>

</div>

</div>

<span id="id23012" class="indexterm"></span> <span id="id23014"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getUser();
>           
> ```

</div>

Get the user name set on this DataSource instance.

</div>

<div id="mt_jd1.4.2.24" class="section">

<div class="titlepage">

<div>

<div>

##### Method setApplication(String)

</div>

</div>

</div>

<span id="id23024" class="indexterm"></span> <span id="id23026"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setApplication(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                          |
|---------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - Application name to be set |

</div>

Set the Application name with which connections have to be obtained.
Will be overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.25" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCharSet(String)

</div>

</div>

</div>

<span id="id23051" class="indexterm"></span> <span id="id23053"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCharSet(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                 |
|------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - CharSet to be set |

</div>

Set the charset of remote database with which connections have to be
obtained. The default value is get from `System.getProperty("fil...`
Will be overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.26" class="section">

<div class="titlepage">

<div>

<div>

##### Method setConcurrencyType(String)

</div>

</div>

</div>

<span id="id23079" class="indexterm"></span> <span id="id23081"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setConcurrencyType(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                          |
|---------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - Concurrency Type to be set |

</div>

Set the default Concurrency Type for scrollable ResultSets with which
connections have to be obtained. Will be overwritten with value from
URL, if URL is set.

</div>

<div id="mt_jd1.4.2.27" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCursorModel(String)

</div>

</div>

</div>

<span id="id23106" class="indexterm"></span> <span id="id23108"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCursorModel(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                     |
|----------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - CursorModel to be set |

</div>

Set the default Cursor Model for scrollable ResultSets with which
connections have to be obtained. Will be overwritten with value from
URL, if URL is set.

</div>

<div id="mt_jd1.4.2.28" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDatabaseName(String)

</div>

</div>

</div>

<span id="id23133" class="indexterm"></span> <span id="id23135"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDatabaseName(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                       |
|------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - database name to be set |

</div>

Set the name of a particular database on a server. Will be overwritten
with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.29" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDataSourceName(String)

</div>

</div>

</div>

<span id="id23160" class="indexterm"></span> <span id="id23162"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDataSourceName(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                         |
|--------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - DataSource name to be set |

</div>

Set the DataSource name. The default value is "OPLDataSourceName"

</div>

<div id="mt_jd1.4.2.30" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDbOptions(String)

</div>

</div>

</div>

<span id="id23187" class="indexterm"></span> <span id="id23189"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDbOptions(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                          |
|---------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - Database Options to be set |

</div>

Set the Database Options with which connections have to be obtained.
Will be overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.31" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDeferLongFetch(boolean)

</div>

</div>

</div>

<span id="id23214" class="indexterm"></span> <span id="id23216"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDeferLongFetch(boolean parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                    |
|-------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - true for a DeferLongFetch connection |

</div>

Set the DeferLongFetch attribute with which connections have to be
obtained. The default value is false . Will be overwritten with value
from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.32" class="section">

<div class="titlepage">

<div>

<div>

##### Method setDescription(String)

</div>

</div>

</div>

<span id="id23241" class="indexterm"></span> <span id="id23243"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setDescription(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                      |
|-----------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - Description to be set. |

</div>

Set the description for this data source instance.

</div>

<div id="mt_jd1.4.2.33" class="section">

<div class="titlepage">

<div>

<div>

##### Method setEncrypted(boolean)

</div>

</div>

</div>

<span id="id23268" class="indexterm"></span> <span id="id23270"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setEncrypted(boolean parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                          |
|-------------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - true if outgoing packets must be encrypted |

</div>

Set the Encrypted flag for outgoing packets with which connections have
to be obtained. Will be overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.34" class="section">

<div class="titlepage">

<div>

<div>

##### Method setFBS(String)

</div>

</div>

</div>

<span id="id23295" class="indexterm"></span> <span id="id23297"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setFBS(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                         |
|--------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - FetchBufferSize to be set |

</div>

Sets number of JDBC resultset rows that get packed into a single network
packet Will be overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.35" class="section">

<div class="titlepage">

<div>

<div>

##### Method setLoginTimeout(int)

</div>

</div>

</div>

<span id="id23322" class="indexterm"></span> <span id="id23324"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setLoginTimeout(int parm) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - the data source login time limit (in seconds) |

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Sets the maximum time in seconds that this data source will wait while
attempting to connect to a database. A value of zero specifies that the
timeout is the default system timeout if there is one; otherwise it
specifies that there is no timeout. When a DataSource object is created
the login timeout is initially zero.

</div>

<div id="mt_jd1.4.2.36" class="section">

<div class="titlepage">

<div>

<div>

##### Method setLogWriter(PrintWriter)

</div>

</div>

</div>

<span id="id23364" class="indexterm"></span> <span id="id23366"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setLogWriter(java.io.PrintWriter parm) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - the new log writer; to disable, set to null |

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

The log writer is a character output stream to which all logging and
tracing messages for this data source object instance will be printed.
This includes messages printed by the methods of this object, messages
printed by methods of other objects manufactured by this object, and so
on. Messages printed to a data source specific log writer are not
printed to the log writer associated with the java.sql.Drivermanager
class. When a DataSource object is created the log writer is initially
null, in other words, logging is disabled.

</div>

<div id="mt_jd1.4.2.37" class="section">

<div class="titlepage">

<div>

<div>

##### Method setPassword(String)

</div>

</div>

</div>

<span id="id23406" class="indexterm"></span> <span id="id23408"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setPassword(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - password to be set |

</div>

Set the password with which connections have to be obtained. Will be
overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.38" class="section">

<div class="titlepage">

<div>

<div>

##### Method setPortNumber(int)

</div>

</div>

</div>

<span id="id23433" class="indexterm"></span> <span id="id23435"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setPortNumber(int parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                        |
|-----------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - port number on which oplrqb is listening |

</div>

Set the port number where the oplrqb is listening for requests. The
default value is 5000 . Will be overwritten with value from URL, if URL
is set.

</div>

<div id="mt_jd1.4.2.39" class="section">

<div class="titlepage">

<div>

<div>

##### Method setReadOnly(boolean)

</div>

</div>

</div>

<span id="id23460" class="indexterm"></span> <span id="id23462"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setReadOnly(boolean parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                              |
|-------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - true for a readOnly connection |

</div>

Set the ReadOnly attribute with which connections have to be obtained.
The default value is false . Will be overwritten with value from URL, if
URL is set.

</div>

<div id="mt_jd1.4.2.40" class="section">

<div class="titlepage">

<div>

<div>

##### Method setServerName(String)

</div>

</div>

</div>

<span id="id23487" class="indexterm"></span> <span id="id23489"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setServerName(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - name of the host on which oplrqb is running |

</div>

Set the name of the host where the oplrqb is running. The default value
is "localhost" . Will be overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.41" class="section">

<div class="titlepage">

<div>

<div>

##### Method setSVT(String)

</div>

</div>

</div>

<span id="id23514" class="indexterm"></span> <span id="id23516"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setSVT(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                    |
|---------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - ServerType to be set |

</div>

Set the ServerType with which connections have to be obtained. Will be
overwritten with value from URL, if URL is set.

</div>

<div id="mt_jd1.4.2.42" class="section">

<div class="titlepage">

<div>

<div>

##### Method setUnicode(boolean)

</div>

</div>

</div>

<span id="id23541" class="indexterm"></span> <span id="id23543"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setUnicode(boolean parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                             |
|------------------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - true for a Unicode connection |

</div>

Set the Unicode attribute with which connections have to be obtained.
The default value is false . Will be overwritten with value from URL, if
URL is set.

</div>

<div id="mt_jd1.4.2.43" class="section">

<div class="titlepage">

<div>

<div>

##### Method setURL(String)

</div>

</div>

</div>

<span id="id23568" class="indexterm"></span> <span id="id23570"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setURL(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                             |
|--------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - URL to be set |

</div>

Set the URL with which connections have to be obtained.

</div>

<div id="mt_jd1.4.2.44" class="section">

<div class="titlepage">

<div>

<div>

##### Method setUser(String)

</div>

</div>

</div>

<span id="id23595" class="indexterm"></span> <span id="id23597"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setUser(java.lang.String parm);
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`parm`*</span> - username to be set |

</div>

Set the user name with which connections have to be obtained. Will be
overwritten with value from URL, if URL is set.

</div>

</div>

</div>

<div id="mt_jd1.5" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.5. Class OPLDataSourceFactory

</div>

</div>

</div>

<span id="id23622" class="indexterm"></span> <span id="id23624"
class="indexterm"></span>

<div id="mt_jd1.5.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLDataSourceFactory implements ObjectFactory {
  // Public Constructors
  public OPLDataSourceFactory();
  // Public Methods
  public Object getObjectInstance(java.lang.Object obj, javax.naming.Name name, 
                                  javax.naming.Context nameCtx, 
                                  java.util.Hashtable environment) 
      throws java.lang.Exception;
}
      
```

<div class="informaltable">

|          Inheritance Path           |
|:-----------------------------------:|
|          java.lang.Object           |
|                 \|                  |
| openlink.javax.OPLDataSourceFactory |

</div>

</div>

</div>

<div id="mt_jd1.6" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.6. Class OPLJdbcRowSet

</div>

</div>

</div>

<span id="id23657" class="indexterm"></span> <span id="id23659"
class="indexterm"></span>

A OPLJdbcRowSet is a connected rowset. The purpose of the OPLJdbcRowSet
class is to act like a JavaBean at design time and provide a thin layer
that wraps around a JDBC ResultSet at runtime.

When execute() is called a OPLJdbcRowSet object opens a JDBC connection
internally which remains open until close() is called, unless a
Connection is passed to execute() explicitly, in which case that
Connection is used instead. ResultSet operations such as cursor
movement, updating, etc. are simply delegated to an underlying JDBC
ResultSet object which is maintained internally.

<div id="mt_jd1.6.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLJdbcRowSet extends BaseRowSet  {
  // Public Constructors
  public OPLJdbcRowSet();
  // Public Methods
  public void finalize() throws java.lang.Throwable;
  public void execute() throws java.sql.SQLException;
  public void execute(java.sql.Connection _conn) throws java.sql.SQLException;
  public void close() throws java.sql.SQLException;
  public void cancelRowUpdates() throws java.sql.SQLException;
  public boolean next() throws java.sql.SQLException;
  public boolean previous() throws java.sql.SQLException;
  public boolean first() throws java.sql.SQLException;
  public boolean last() throws java.sql.SQLException;
  public boolean absolute(int row) throws java.sql.SQLException;
  public boolean relative(int rows) throws java.sql.SQLException;
  public void beforeFirst() throws java.sql.SQLException;
  public void afterLast() throws java.sql.SQLException;
  public boolean isBeforeFirst() throws java.sql.SQLException;
  public boolean isAfterLast() throws java.sql.SQLException;
  public boolean isFirst() throws java.sql.SQLException;
  public boolean isLast() throws java.sql.SQLException;
  public int getRow() throws java.sql.SQLException;
  public boolean rowUpdated() throws java.sql.SQLException;
  public boolean rowInserted() throws java.sql.SQLException;
  public boolean rowDeleted() throws java.sql.SQLException;
  public void refreshRow() throws java.sql.SQLException;
  public void insertRow() throws java.sql.SQLException;
  public void updateRow() throws java.sql.SQLException;
  public void deleteRow() throws java.sql.SQLException;
  public void moveToInsertRow() throws java.sql.SQLException;
  public void moveToCurrentRow() throws java.sql.SQLException;
  public boolean wasNull() throws java.sql.SQLException;
  public SQLWarning getWarnings() throws java.sql.SQLException;
  public void clearWarnings() throws java.sql.SQLException;
  public String getCursorName() throws java.sql.SQLException;
  public ResultSetMetaData getMetaData() throws java.sql.SQLException;
  public int findColumn(java.lang.String columnName) 
      throws java.sql.SQLException;
  public String getString(int columnIndex) throws java.sql.SQLException;
  public boolean getBoolean(int columnIndex) throws java.sql.SQLException;
  public byte getByte(int columnIndex) throws java.sql.SQLException;
  public short getShort(int columnIndex) throws java.sql.SQLException;
  public int getInt(int columnIndex) throws java.sql.SQLException;
  public long getLong(int columnIndex) throws java.sql.SQLException;
  public float getFloat(int columnIndex) throws java.sql.SQLException;
  public double getDouble(int columnIndex) throws java.sql.SQLException;
  public BigDecimal getBigDecimal(int columnIndex) 
      throws java.sql.SQLException;
  public BigDecimal getBigDecimal(int columnIndex, int scale) 
      throws java.sql.SQLException;
  public byte[] getBytes(int columnIndex) throws java.sql.SQLException;
  public Date getDate(int columnIndex) throws java.sql.SQLException;
  public Time getTime(int columnIndex) throws java.sql.SQLException;
  public Timestamp getTimestamp(int columnIndex) throws java.sql.SQLException;
  public InputStream getAsciiStream(int columnIndex) 
      throws java.sql.SQLException;
  public InputStream getUnicodeStream(int columnIndex) 
      throws java.sql.SQLException;
  public InputStream getBinaryStream(int columnIndex) 
      throws java.sql.SQLException;
  public Object getObject(int columnIndex) throws java.sql.SQLException;
  public String getString(java.lang.String columnName) 
      throws java.sql.SQLException;
  public boolean getBoolean(java.lang.String columnName) 
      throws java.sql.SQLException;
  public byte getByte(java.lang.String columnName) 
      throws java.sql.SQLException;
  public short getShort(java.lang.String columnName) 
      throws java.sql.SQLException;
  public int getInt(java.lang.String columnName) throws java.sql.SQLException;
  public long getLong(java.lang.String columnName) 
      throws java.sql.SQLException;
  public float getFloat(java.lang.String columnName) 
      throws java.sql.SQLException;
  public double getDouble(java.lang.String columnName) 
      throws java.sql.SQLException;
  public BigDecimal getBigDecimal(java.lang.String columnName, int scale) 
      throws java.sql.SQLException;
  public byte[] getBytes(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Date getDate(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Time getTime(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Timestamp getTimestamp(java.lang.String columnName) 
      throws java.sql.SQLException;
  public InputStream getAsciiStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public InputStream getUnicodeStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public InputStream getBinaryStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Object getObject(java.lang.String columnName) 
      throws java.sql.SQLException;
  public Reader getCharacterStream(int columnIndex) 
      throws java.sql.SQLException;
  public Reader getCharacterStream(java.lang.String columnName) 
      throws java.sql.SQLException;
  public BigDecimal getBigDecimal(java.lang.String columnName) 
      throws java.sql.SQLException;
  public void updateNull(int columnIndex) throws java.sql.SQLException;
  public void updateBoolean(int columnIndex, boolean x) 
      throws java.sql.SQLException;
  public void updateByte(int columnIndex, byte x) throws java.sql.SQLException;
  public void updateShort(int columnIndex, short x) 
      throws java.sql.SQLException;
  public void updateInt(int columnIndex, int x) throws java.sql.SQLException;
  public void updateLong(int columnIndex, long x) throws java.sql.SQLException;
  public void updateFloat(int columnIndex, float x) 
      throws java.sql.SQLException;
  public void updateDouble(int columnIndex, double x) 
      throws java.sql.SQLException;
  public void updateBigDecimal(int columnIndex, java.math.BigDecimal x) 
      throws java.sql.SQLException;
  public void updateString(int columnIndex, java.lang.String x) 
      throws java.sql.SQLException;
  public void updateBytes(int columnIndex, byte[] x) 
      throws java.sql.SQLException;
  public void updateDate(int columnIndex, java.sql.Date x) 
      throws java.sql.SQLException;
  public void updateTime(int columnIndex, java.sql.Time x) 
      throws java.sql.SQLException;
  public void updateTimestamp(int columnIndex, java.sql.Timestamp x) 
      throws java.sql.SQLException;
  public void updateAsciiStream(int columnIndex, java.io.InputStream x, 
                                int length) throws java.sql.SQLException;
  public void updateBinaryStream(int columnIndex, java.io.InputStream x, 
                                 int length) throws java.sql.SQLException;
  public void updateCharacterStream(int columnIndex, java.io.Reader x, 
                                    int length) throws java.sql.SQLException;
  public void updateObject(int columnIndex, java.lang.Object x, int scale) 
      throws java.sql.SQLException;
  public void updateObject(int columnIndex, java.lang.Object x) 
      throws java.sql.SQLException;
  public void updateNull(java.lang.String columnName) 
      throws java.sql.SQLException;
  public void updateBoolean(java.lang.String columnName, boolean x) 
      throws java.sql.SQLException;
  public void updateByte(java.lang.String columnName, byte x) 
      throws java.sql.SQLException;
  public void updateShort(java.lang.String columnName, short x) 
      throws java.sql.SQLException;
  public void updateInt(java.lang.String columnName, int x) 
      throws java.sql.SQLException;
  public void updateLong(java.lang.String columnName, long x) 
      throws java.sql.SQLException;
  public void updateFloat(java.lang.String columnName, float x) 
      throws java.sql.SQLException;
  public void updateDouble(java.lang.String columnName, double x) 
      throws java.sql.SQLException;
  public void updateBigDecimal(java.lang.String columnName, 
                               java.math.BigDecimal x) 
      throws java.sql.SQLException;
  public void updateString(java.lang.String columnName, java.lang.String x) 
      throws java.sql.SQLException;
  public void updateBytes(java.lang.String columnName, byte[] x) 
      throws java.sql.SQLException;
  public void updateDate(java.lang.String columnName, java.sql.Date x) 
      throws java.sql.SQLException;
  public void updateTime(java.lang.String columnName, java.sql.Time x) 
      throws java.sql.SQLException;
  public void updateTimestamp(java.lang.String columnName, 
                              java.sql.Timestamp x) 
      throws java.sql.SQLException;
  public void updateAsciiStream(java.lang.String columnName, 
                                java.io.InputStream x, int length) 
      throws java.sql.SQLException;
  public void updateBinaryStream(java.lang.String columnName, 
                                 java.io.InputStream x, int length) 
      throws java.sql.SQLException;
  public void updateCharacterStream(java.lang.String columnName, 
                                    java.io.Reader x, int length) 
      throws java.sql.SQLException;
  public void updateObject(java.lang.String columnName, java.lang.Object x, 
                           int scale) throws java.sql.SQLException;
  public void updateObject(java.lang.String columnName, java.lang.Object x) 
      throws java.sql.SQLException;
  public Statement getStatement() throws java.sql.SQLException;
  public Object getObject(int colIndex, java.util.Map map) 
      throws java.sql.SQLException;
  public Ref getRef(int colIndex) throws java.sql.SQLException;
  public Blob getBlob(int colIndex) throws java.sql.SQLException;
  public Clob getClob(int colIndex) throws java.sql.SQLException;
  public Array getArray(int colIndex) throws java.sql.SQLException;
  public Object getObject(java.lang.String colName, java.util.Map map) 
      throws java.sql.SQLException;
  public Ref getRef(java.lang.String colName) throws java.sql.SQLException;
  public Blob getBlob(java.lang.String colName) throws java.sql.SQLException;
  public Clob getClob(java.lang.String colName) throws java.sql.SQLException;
  public Array getArray(java.lang.String colName) throws java.sql.SQLException;
  public Date getDate(int columnIndex, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Date getDate(java.lang.String columnName, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Time getTime(int columnIndex, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Time getTime(java.lang.String columnName, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Timestamp getTimestamp(int columnIndex, java.util.Calendar cal) 
      throws java.sql.SQLException;
  public Timestamp getTimestamp(java.lang.String columnName, 
                                java.util.Calendar cal) 
      throws java.sql.SQLException;
  public URL getURL(int columnIndex) throws java.sql.SQLException;
  public URL getURL(java.lang.String columnName) throws java.sql.SQLException;
  public void updateRef(int columnIndex, java.sql.Ref x) 
      throws java.sql.SQLException;
  public void updateRef(java.lang.String columnName, java.sql.Ref x) 
      throws java.sql.SQLException;
  public void updateBlob(int columnIndex, java.sql.Blob x) 
      throws java.sql.SQLException;
  public void updateBlob(java.lang.String columnName, java.sql.Blob x) 
      throws java.sql.SQLException;
  public void updateClob(int columnIndex, java.sql.Clob x) 
      throws java.sql.SQLException;
  public void updateClob(java.lang.String columnName, java.sql.Clob x) 
      throws java.sql.SQLException;
  public void updateArray(int columnIndex, java.sql.Array x) 
      throws java.sql.SQLException;
  public void updateArray(java.lang.String columnName, java.sql.Array x) 
      throws java.sql.SQLException;
}
      
```

<div class="informaltable">

|       Inheritance Path       |
|:----------------------------:|
|       java.lang.Object       |
|              \|              |
|  openlink.javax.BaseRowSet   |
|              \|              |
| openlink.javax.OPLJdbcRowSet |

</div>

</div>

<div id="mt_jd1.6.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.6.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method absolute(int)

</div>

</div>

</div>

<span id="id24001" class="indexterm"></span> <span id="id24003"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean absolute(int row) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                          |
|--------------|------------------------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or row is 0, or result set type is TYPE_FORWARD_ONLY. |

</div>

Move to an absolute row number in the result set.

If row is positive, moves to an absolute row with respect to the
beginning of the result set. The first row is row 1, the second is row
2, etc.

If row is negative, moves to an absolute row position with respect to
the end of result set. For example, calling absolute(-1) positions the
cursor on the last row, absolute(-2) indicates the next-to-last row,
etc.

An attempt to position the cursor beyond the first/last row in the
result set, leaves the cursor before/after the first/last row,
respectively.

Note: Calling absolute(1) is the same as calling first(). Calling
absolute(-1) is the same as calling last().

</div>

<div id="mt_jd1.6.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method afterLast()

</div>

</div>

</div>

<span id="id24033" class="indexterm"></span> <span id="id24035"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void afterLast() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                             |
|--------------|-----------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or result set type is TYPE_FORWARD_ONLY. |

</div>

Moves to the end of the result set, just after the last row. Has no
effect if the result set contains no rows.

</div>

<div id="mt_jd1.6.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method beforeFirst()

</div>

</div>

</div>

<span id="id24060" class="indexterm"></span> <span id="id24062"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void beforeFirst() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                            |
|--------------|----------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or result set type is TYPE_FORWARD_ONLY |

</div>

Moves to the front of the result set, just before the first row. Has no
effect if the result set contains no rows.

</div>

<div id="mt_jd1.6.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method cancelRowUpdates()

</div>

</div>

</div>

<span id="id24087" class="indexterm"></span> <span id="id24089"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void cancelRowUpdates() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

The cancelRowUpdates() method may be called after calling an updateXXX()
method(s) and before calling updateRow() to rollback the updates made to
a row. If no updates have been made or updateRow() has already been
called, then this method has no effect.

</div>

<div id="mt_jd1.6.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method clearWarnings()

</div>

</div>

</div>

<span id="id24114" class="indexterm"></span> <span id="id24116"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void clearWarnings() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

After this call getWarnings returns null until a new warning is reported
for this ResultSet.

</div>

<div id="mt_jd1.6.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method close()

</div>

</div>

</div>

<span id="id24141" class="indexterm"></span> <span id="id24143"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void close() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

In some cases, it is desirable to immediately release a ResultSet's
database and JDBC resources instead of waiting for this to happen when
it is automatically closed; the close method provides this immediate
release.

<span class="emphasis">*Note:*</span> A ResultSet is automatically
closed by the Statement that generated it when that Statement is closed,
re-executed, or is used to retrieve the next result from a sequence of
multiple results. A ResultSet is also automatically closed when it is
garbage collected.

</div>

<div id="mt_jd1.6.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method deleteRow()

</div>

</div>

</div>

<span id="id24170" class="indexterm"></span> <span id="id24172"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void deleteRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or if called when on the insert row. |

</div>

Delete the current row from the result set and the underlying database.
Cannot be called when on the insert row.

</div>

<div id="mt_jd1.6.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method execute()

</div>

</div>

</div>

<span id="id24197" class="indexterm"></span> <span id="id24199"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void execute() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Populates the rowset with data. Execute() may use the following
properties: url, data source name, user name, password, transaction
isolation, and type map to create a connection for reading data. Execute
may use the following properties to create a statement to execute a
command: command, read only, maximum field size, maximum rows, escape
processing, and query timeout. If the required properties have not been
set, an exception is thrown. If successful, the current contents of the
rowset are discarded and the rowset's metadata is also (re)set. If there
are outstanding updates, they are ignored.

</div>

<div id="mt_jd1.6.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method execute(Connection)

</div>

</div>

</div>

<span id="id24224" class="indexterm"></span> <span id="id24226"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void execute(java.sql.Connection _conn) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                    |
|---------------------------------------------------------------|
| <span class="emphasis">*`_conn`*</span> - a Connection to use |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Populates the rowset with data. Uses an existing JDBC connection object.
The values of the url/data source name, user, and password properties
are ignored. The command specified by the command property is executed
to retrieve the data. The current contents of the rowset are discarded
and the rowset's metadata is also (re)set. If there are outstanding
updates, they are also ignored.

</div>

<div id="mt_jd1.6.2.10" class="section">

<div class="titlepage">

<div>

<div>

##### Method findColumn(String)

</div>

</div>

</div>

<span id="id24266" class="indexterm"></span> <span id="id24268"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int findColumn(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| `return` - the column index                                           |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Map a Resultset column name to a ResultSet column index.

</div>

<div id="mt_jd1.6.2.11" class="section">

<div class="titlepage">

<div>

<div>

##### Method first()

</div>

</div>

</div>

<span id="id24312" class="indexterm"></span> <span id="id24314"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean first() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                             |
|--------------|-----------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or result set type is TYPE_FORWARD_ONLY. |

</div>

Moves to the first row in the result set.

</div>

<div id="mt_jd1.6.2.12" class="section">

<div class="titlepage">

<div>

<div>

##### Method getArray(int)

</div>

</div>

</div>

<span id="id24339" class="indexterm"></span> <span id="id24341"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Array getArray(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing an SQL array                                           |

</div>

Get an array column.

</div>

<div id="mt_jd1.6.2.13" class="section">

<div class="titlepage">

<div>

<div>

##### Method getArray(String)

</div>

</div>

</div>

<span id="id24370" class="indexterm"></span> <span id="id24372"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Array getArray(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing an SQL array              |

</div>

Get an array column.

</div>

<div id="mt_jd1.6.2.14" class="section">

<div class="titlepage">

<div>

<div>

##### Method getAsciiStream(int)

</div>

</div>

</div>

<span id="id24401" class="indexterm"></span> <span id="id24403"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getAsciiStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                         |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                        |
| `return` - a Java input stream that delivers the database column value as a stream of one byte ASCII characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of ASCII characters and then
read in chunks from the stream. This method is particularly suitable for
retrieving large LONGVARCHAR values. The JDBC driver will do any
necessary conversion from the database format into ASCII.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream. . Also, a stream
may return 0 for available() whether there is data available or not.

</div>

<div id="mt_jd1.6.2.15" class="section">

<div class="titlepage">

<div>

<div>

##### Method getAsciiStream(String)

</div>

</div>

</div>

<span id="id24449" class="indexterm"></span> <span id="id24451"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getAsciiStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                         |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column                                                                                       |
| `return` - a Java input stream that delivers the database column value as a stream of one byte ASCII characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of ASCII characters and then
read in chunks from the stream. This method is particularly suitable for
retrieving large LONGVARCHAR values. The JDBC driver will do any
necessary conversion from the database format into ASCII.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream.

</div>

<div id="mt_jd1.6.2.16" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(int)

</div>

</div>

</div>

<span id="id24497" class="indexterm"></span> <span id="id24499"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value (full precision); if the value is SQL NULL, the result is null  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.math.BigDecimal
object.

</div>

<div id="mt_jd1.6.2.17" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(int, int)

</div>

</div>

</div>

<span id="id24543" class="indexterm"></span> <span id="id24545"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(int columnIndex, int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`scale`*</span> - the number of digits to the right of the decimal  |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                |
|:----------------------------------:|:-------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                     |
|                                    | Get the value of a column in the current row as a java.math.BigDecimal object. |

</div>

</div>

<div id="mt_jd1.6.2.18" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(String)

</div>

</div>

</div>

<span id="id24597" class="indexterm"></span> <span id="id24599"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

Get the value of a column in the current row as a java.math.BigDecimal
object.

</div>

<div id="mt_jd1.6.2.19" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBigDecimal(String, int)

</div>

</div>

</div>

<span id="id24610" class="indexterm"></span> <span id="id24612"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public BigDecimal getBigDecimal(java.lang.String columnName, 
>                                           int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                 |
|--------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column               |
| <span class="emphasis">*`scale`*</span> - the number of digits to the right of the decimal |
| `return` - the column value; if the value is SQL NULL, the result is null                  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                |
|:----------------------------------:|:-------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                     |
|                                    | Get the value of a column in the current row as a java.math.BigDecimal object. |

</div>

</div>

<div id="mt_jd1.6.2.20" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBinaryStream(int)

</div>

</div>

</div>

<span id="id24664" class="indexterm"></span> <span id="id24666"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getBinaryStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                  |
| `return` - a Java input stream that delivers the database column value as a stream of uninterpreted bytes. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of uninterpreted bytes and
then read in chunks from the stream. This method is particularly
suitable for retrieving large LONGVARBINARY values.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream. Also, a stream
may return 0 for available() whether there is data available or not.

</div>

<div id="mt_jd1.6.2.21" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBinaryStream(String)

</div>

</div>

</div>

<span id="id24712" class="indexterm"></span> <span id="id24714"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getBinaryStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column                                                                                 |
| `return` - a Java input stream that delivers the database column value as a stream of uninterpreted bytes. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column value can be retrieved as a stream of uninterpreted bytes and
then read in chunks from the stream. This method is particularly
suitable for retrieving large LONGVARBINARY values.

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream.

</div>

<div id="mt_jd1.6.2.22" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBlob(int)

</div>

</div>

</div>

<span id="id24760" class="indexterm"></span> <span id="id24762"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Blob getBlob(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing a BLOB                                                 |

</div>

Get a BLOB column.

</div>

<div id="mt_jd1.6.2.23" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBlob(String)

</div>

</div>

</div>

<span id="id24791" class="indexterm"></span> <span id="id24793"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Blob getBlob(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing a BLOB                    |

</div>

Get a BLOB column.

</div>

<div id="mt_jd1.6.2.24" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBoolean(int)

</div>

</div>

</div>

<span id="id24822" class="indexterm"></span> <span id="id24824"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getBoolean(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is false                  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java boolean.

</div>

<div id="mt_jd1.6.2.25" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBoolean(String)

</div>

</div>

</div>

<span id="id24868" class="indexterm"></span> <span id="id24870"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean getBoolean(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is false   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java boolean.

</div>

<div id="mt_jd1.6.2.26" class="section">

<div class="titlepage">

<div>

<div>

##### Method getByte(int)

</div>

</div>

</div>

<span id="id24914" class="indexterm"></span> <span id="id24916"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte getByte(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte.

</div>

<div id="mt_jd1.6.2.27" class="section">

<div class="titlepage">

<div>

<div>

##### Method getByte(String)

</div>

</div>

</div>

<span id="id24960" class="indexterm"></span> <span id="id24962"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte getByte(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte.

</div>

<div id="mt_jd1.6.2.28" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBytes(int)

</div>

</div>

</div>

<span id="id25006" class="indexterm"></span> <span id="id25008"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte[] getBytes(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte array. The
bytes represent the raw values returned by the driver.

</div>

<div id="mt_jd1.6.2.29" class="section">

<div class="titlepage">

<div>

<div>

##### Method getBytes(String)

</div>

</div>

</div>

<span id="id25052" class="indexterm"></span> <span id="id25054"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public byte[] getBytes(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java byte array. The
bytes represent the raw values returned by the driver.

</div>

<div id="mt_jd1.6.2.30" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCharacterStream(int)

</div>

</div>

</div>

<span id="id25098" class="indexterm"></span> <span id="id25100"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Reader getCharacterStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

Get the value of a column in the current row as a java.io.Reader.

</div>

<div id="mt_jd1.6.2.31" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCharacterStream(String)

</div>

</div>

</div>

<span id="id25111" class="indexterm"></span> <span id="id25113"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Reader getCharacterStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

Get the value of a column in the current row as a java.io.Reader.

</div>

<div id="mt_jd1.6.2.32" class="section">

<div class="titlepage">

<div>

<div>

##### Method getClob(int)

</div>

</div>

</div>

<span id="id25124" class="indexterm"></span> <span id="id25126"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Clob getClob(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing a CLOB                                                 |

</div>

Get a CLOB column.

</div>

<div id="mt_jd1.6.2.33" class="section">

<div class="titlepage">

<div>

<div>

##### Method getClob(String)

</div>

</div>

</div>

<span id="id25155" class="indexterm"></span> <span id="id25157"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Clob getClob(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing a CLOB                    |

</div>

Get a CLOB column.

</div>

<div id="mt_jd1.6.2.34" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCursorName()

</div>

</div>

</div>

<span id="id25186" class="indexterm"></span> <span id="id25188"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getCursorName() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                     |
|--------------|---------------------|
| SQLException | if an error occurs. |

</div>

Get the name of the SQL cursor used by this ResultSet.

</div>

<div id="mt_jd1.6.2.35" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(int)

</div>

</div>

</div>

<span id="id25213" class="indexterm"></span> <span id="id25215"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.

</div>

<div id="mt_jd1.6.2.36" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(int, Calendar)

</div>

</div>

</div>

<span id="id25259" class="indexterm"></span> <span id="id25261"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(int columnIndex, java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the date        |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.
Use the calendar to construct an appropriate millisecond value for the
Date, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.6.2.37" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(String)

</div>

</div>

</div>

<span id="id25311" class="indexterm"></span> <span id="id25313"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.

</div>

<div id="mt_jd1.6.2.38" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDate(String, Calendar)

</div>

</div>

</div>

<span id="id25357" class="indexterm"></span> <span id="id25359"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Date getDate(java.lang.String columnName, 
>                               java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column         |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the date |
| `return` - the column value; if the value is SQL NULL, the result is null            |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Date object.
Use the calendar to construct an appropriate millisecond value for the
Date, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.6.2.39" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDouble(int)

</div>

</div>

</div>

<span id="id25409" class="indexterm"></span> <span id="id25411"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public double getDouble(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java double.

</div>

<div id="mt_jd1.6.2.40" class="section">

<div class="titlepage">

<div>

<div>

##### Method getDouble(String)

</div>

</div>

</div>

<span id="id25455" class="indexterm"></span> <span id="id25457"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public double getDouble(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java double.

</div>

<div id="mt_jd1.6.2.41" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFloat(int)

</div>

</div>

</div>

<span id="id25501" class="indexterm"></span> <span id="id25503"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public float getFloat(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java float.

</div>

<div id="mt_jd1.6.2.42" class="section">

<div class="titlepage">

<div>

<div>

##### Method getFloat(String)

</div>

</div>

</div>

<span id="id25547" class="indexterm"></span> <span id="id25549"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public float getFloat(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java float.

</div>

<div id="mt_jd1.6.2.43" class="section">

<div class="titlepage">

<div>

<div>

##### Method getInt(int)

</div>

</div>

</div>

<span id="id25593" class="indexterm"></span> <span id="id25595"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getInt(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java int.

</div>

<div id="mt_jd1.6.2.44" class="section">

<div class="titlepage">

<div>

<div>

##### Method getInt(String)

</div>

</div>

</div>

<span id="id25639" class="indexterm"></span> <span id="id25641"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getInt(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java int.

</div>

<div id="mt_jd1.6.2.45" class="section">

<div class="titlepage">

<div>

<div>

##### Method getLong(int)

</div>

</div>

</div>

<span id="id25685" class="indexterm"></span> <span id="id25687"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getLong(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java long.

</div>

<div id="mt_jd1.6.2.46" class="section">

<div class="titlepage">

<div>

<div>

##### Method getLong(String)

</div>

</div>

</div>

<span id="id25731" class="indexterm"></span> <span id="id25733"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getLong(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java long.

</div>

<div id="mt_jd1.6.2.47" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMetaData()

</div>

</div>

</div>

<span id="id25777" class="indexterm"></span> <span id="id25779"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public ResultSetMetaData getMetaData() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The number, types and properties of a ResultSet's columns are provided
by the getMetaData method.

</div>

<div id="mt_jd1.6.2.48" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(int)

</div>

</div>

</div>

<span id="id25804" class="indexterm"></span> <span id="id25806"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - a java.lang.Object holding the column value.                                     |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java object.

This method will return the value of the given column as a Java object.
The type of the Java object will be the default Java object type
corresponding to the column's SQL type, following the mapping for
built-in types specified in the JDBC spec.

This method may also be used to read database specific abstract data
types. JDBC 2.0 New behavior for getObject(). The behavior of method
getObject() is extended to materialize data of SQL user-defined types.
When the column @column is a structured or distinct value, the behavior
of this method is as if it were a call to: getObject(column,
this.getStatement().getConnection().getTypeMap()).

</div>

<div id="mt_jd1.6.2.49" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(int, Map)

</div>

</div>

</div>

<span id="id25852" class="indexterm"></span> <span id="id25854"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(int colIndex, java.util.Map map) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`map`*</span> - the mapping from SQL type names to Java classes  |
| `return` - an object representing the SQL value                                          |

</div>

Returns the value of column @i as a Java object. Use the map to
determine the class from which to construct data of SQL structured and
distinct types.

</div>

<div id="mt_jd1.6.2.50" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(String)

</div>

</div>

</div>

<span id="id25889" class="indexterm"></span> <span id="id25891"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - a java.lang.Object holding the column value.                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java object.

This method will return the value of the given column as a Java object.
The type of the Java object will be the default Java object type
corresponding to the column's SQL type, following the mapping for
built-in types specified in the JDBC spec.

This method may also be used to read database specific abstract data
types. JDBC 2.0 New behavior for getObject(). The behavior of method
getObject() is extended to materialize data of SQL user-defined types.
When the column @columnName is a structured or distinct value, the
behavior of this method is as if it were a call to:
getObject(columnName, this.getStatement().getConnection().getTypeMap()).

</div>

<div id="mt_jd1.6.2.51" class="section">

<div class="titlepage">

<div>

<div>

##### Method getObject(String, Map)

</div>

</div>

</div>

<span id="id25937" class="indexterm"></span> <span id="id25939"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Object getObject(java.lang.String colName, java.util.Map map) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                              |
|-----------------------------------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name                             |
| <span class="emphasis">*`map`*</span> - the mapping from SQL type names to Java classes |
| `return` - an object representing the SQL value                                         |

</div>

Returns the value of column @i as a Java object. Use the map to
determine the class from which to construct data of SQL structured and
distinct types.

</div>

<div id="mt_jd1.6.2.52" class="section">

<div class="titlepage">

<div>

<div>

##### Method getRef(int)

</div>

</div>

</div>

<span id="id25974" class="indexterm"></span> <span id="id25976"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Ref getRef(int colIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`colIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - an object representing data of an SQL REF type                                |

</div>

Get a REF(\<structured-type\>) column.

</div>

<div id="mt_jd1.6.2.53" class="section">

<div class="titlepage">

<div>

<div>

##### Method getRef(String)

</div>

</div>

</div>

<span id="id26005" class="indexterm"></span> <span id="id26007"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Ref getRef(java.lang.String colName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                  |
|-------------------------------------------------------------|
| <span class="emphasis">*`colName`*</span> - the column name |
| `return` - an object representing data of an SQL REF type   |

</div>

Get a REF(\<structured-type\>) column.

</div>

<div id="mt_jd1.6.2.54" class="section">

<div class="titlepage">

<div>

<div>

##### Method getRow()

</div>

</div>

</div>

<span id="id26036" class="indexterm"></span> <span id="id26038"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine the current row number. The first row is number 1, the second
number 2, etc.

</div>

<div id="mt_jd1.6.2.55" class="section">

<div class="titlepage">

<div>

<div>

##### Method getShort(int)

</div>

</div>

</div>

<span id="id26063" class="indexterm"></span> <span id="id26065"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public short getShort(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is 0                      |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java short.

</div>

<div id="mt_jd1.6.2.56" class="section">

<div class="titlepage">

<div>

<div>

##### Method getShort(String)

</div>

</div>

</div>

<span id="id26109" class="indexterm"></span> <span id="id26111"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public short getShort(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is 0       |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java short.

</div>

<div id="mt_jd1.6.2.57" class="section">

<div class="titlepage">

<div>

<div>

##### Method getStatement()

</div>

</div>

</div>

<span id="id26155" class="indexterm"></span> <span id="id26157"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Statement getStatement() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Return the Statement that produced the ResultSet.

</div>

<div id="mt_jd1.6.2.58" class="section">

<div class="titlepage">

<div>

<div>

##### Method getString(int)

</div>

</div>

</div>

<span id="id26182" class="indexterm"></span> <span id="id26184"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getString(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java String.

</div>

<div id="mt_jd1.6.2.59" class="section">

<div class="titlepage">

<div>

<div>

##### Method getString(String)

</div>

</div>

</div>

<span id="id26228" class="indexterm"></span> <span id="id26230"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getString(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a Java String.

</div>

<div id="mt_jd1.6.2.60" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(int)

</div>

</div>

</div>

<span id="id26274" class="indexterm"></span> <span id="id26276"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.

</div>

<div id="mt_jd1.6.2.61" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(int, Calendar)

</div>

</div>

</div>

<span id="id26320" class="indexterm"></span> <span id="id26322"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(int columnIndex, java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the time        |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.
Use the calendar to construct an appropriate millisecond value for the
Time, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.6.2.62" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(String)

</div>

</div>

</div>

<span id="id26372" class="indexterm"></span> <span id="id26374"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.

</div>

<div id="mt_jd1.6.2.63" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTime(String, Calendar)

</div>

</div>

</div>

<span id="id26418" class="indexterm"></span> <span id="id26420"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Time getTime(java.lang.String columnName, 
>                               java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                           |
|--------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column         |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the time |
| `return` - the column value; if the value is SQL NULL, the result is null            |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Time object.
Use the calendar to construct an appropriate millisecond value for the
Time, if the underlying database doesn't store timezone information.

</div>

<div id="mt_jd1.6.2.64" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(int)

</div>

</div>

</div>

<span id="id26470" class="indexterm"></span> <span id="id26472"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object.

</div>

<div id="mt_jd1.6.2.65" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(int, Calendar)

</div>

</div>

</div>

<span id="id26516" class="indexterm"></span> <span id="id26518"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(int columnIndex, 
>                                         java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the timestamp   |
| `return` - the column value; if the value is SQL NULL, the result is null                   |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object. Use the calendar to construct an appropriate millisecond value
for the Timestamp, if the underlying database doesn't store timezone
information.

</div>

<div id="mt_jd1.6.2.66" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(String)

</div>

</div>

</div>

<span id="id26568" class="indexterm"></span> <span id="id26570"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                   |
|------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column |
| `return` - the column value; if the value is SQL NULL, the result is null    |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object.

</div>

<div id="mt_jd1.6.2.67" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTimestamp(String, Calendar)

</div>

</div>

</div>

<span id="id26614" class="indexterm"></span> <span id="id26616"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Timestamp getTimestamp(java.lang.String columnName, 
>                                         java.util.Calendar cal) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                |
|-------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column              |
| <span class="emphasis">*`cal`*</span> - the calendar to use in constructing the timestamp |
| `return` - the column value; if the value is SQL NULL, the result is null                 |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Get the value of a column in the current row as a java.sql.Timestamp
object. Use the calendar to construct an appropriate millisecond value
for the Timestamp, if the underlying database doesn't store timezone
information.

</div>

<div id="mt_jd1.6.2.68" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUnicodeStream(int)

</div>

</div>

</div>

<span id="id26666" class="indexterm"></span> <span id="id26668"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getUnicodeStream(int columnIndex) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                           |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                          |
| `return` - a Java input stream that delivers the database column value as a stream of two byte Unicode characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                                                                                                                                                                                                                  |
|:----------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                                                                                                                                                                                                                       |
|                                    | A column value can be retrieved as a stream of Unicode characters and then read in chunks from the stream. This method is particularly suitable for retrieving large LONGVARCHAR values. The JDBC driver will do any necessary conversion from the database format into Unicode. |

</div>

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream. . Also, a stream
may return 0 for available() whether there is data available or not.

</div>

<div id="mt_jd1.6.2.69" class="section">

<div class="titlepage">

<div>

<div>

##### Method getUnicodeStream(String)

</div>

</div>

</div>

<span id="id26716" class="indexterm"></span> <span id="id26718"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public InputStream getUnicodeStream(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                           |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - is the SQL name of the column                                                                                         |
| `return` - a Java input stream that delivers the database column value as a stream of two byte Unicode characters. If the value is SQL NULL then the result is null. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                    |                                                                                                                                                                                                                                                                                  |
|:----------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Warning\]](images/warning.png) | Deprecated                                                                                                                                                                                                                                                                       |
|                                    | A column value can be retrieved as a stream of Unicode characters and then read in chunks from the stream. This method is particularly suitable for retrieving large LONGVARCHAR values. The JDBC driver will do any necessary conversion from the database format into Unicode. |

</div>

<span class="emphasis">*Note:*</span> All the data in the returned
stream must be read prior to getting the value of any other column. The
next call to a get method implicitly closes the stream.

</div>

<div id="mt_jd1.6.2.70" class="section">

<div class="titlepage">

<div>

<div>

##### Method getURL(int)

</div>

</div>

</div>

<span id="id26766" class="indexterm"></span> <span id="id26768"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public URL getURL(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                        |
|---------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the index of the column 1 is the first, 2 is the second,...                                       |
| `return` - the column value as a `java.net.URL` object; if the value is SQL `NULL`, the value returned is `null` in the Java programming language |

</div>

<div class="informaltable">

| Exceptions   |                                                             |
|--------------|-------------------------------------------------------------|
| SQLException | if a database access error occurs, or if a URL is malformed |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Retrieves the value of the designated column in the current row of this
`ResultSet` object as a `java.net.URL` object in the Java programming
language.

</div>

<div id="mt_jd1.6.2.71" class="section">

<div class="titlepage">

<div>

<div>

##### Method getURL(String)

</div>

</div>

</div>

<span id="id26834" class="indexterm"></span> <span id="id26836"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public URL getURL(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                        |
|---------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the SQL name of the column                                                                         |
| `return` - the column value as a `java.net.URL` object; if the value is SQL `NULL`, the value returned is `null` in the Java programming language |

</div>

<div class="informaltable">

| Exceptions   |                                                            |
|--------------|------------------------------------------------------------|
| SQLException | if a database access error occurs or if a URL is malformed |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Retrieves the value of the designated column in the current row of this
`ResultSet` object as a `java.net.URL` object in the Java programming
language.

</div>

<div id="mt_jd1.6.2.72" class="section">

<div class="titlepage">

<div>

<div>

##### Method getWarnings()

</div>

</div>

</div>

<span id="id26902" class="indexterm"></span> <span id="id26904"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public SQLWarning getWarnings() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

The first warning reported by calls on this ResultSet is returned.
Subsequent ResultSet warnings will be chained to this SQLWarning.

The warning chain is automatically cleared each time a new row is read.

<span class="emphasis">*Note:*</span> This warning chain only covers
warnings caused by ResultSet methods. Any warning caused by statement
methods (such as reading OUT parameters) will be chained on the
Statement object.

</div>

<div id="mt_jd1.6.2.73" class="section">

<div class="titlepage">

<div>

<div>

##### Method insertRow()

</div>

</div>

</div>

<span id="id26932" class="indexterm"></span> <span id="id26934"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void insertRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                                                                                                                       |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SQLException | if a database access error occurs, if this method is called when the cursor is not on the insert row, or if not all of non-nullable columns in the insert row have been given a value |

</div>

Inserts the contents of the insert row into this `ResultSet` objaect and
into the database. The cursor must be on the insert row when this method
is called.

</div>

<div id="mt_jd1.6.2.74" class="section">

<div class="titlepage">

<div>

<div>

##### Method isAfterLast()

</div>

</div>

</div>

<span id="id26960" class="indexterm"></span> <span id="id26962"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isAfterLast() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is after the last row in the result set.

</div>

<div id="mt_jd1.6.2.75" class="section">

<div class="titlepage">

<div>

<div>

##### Method isBeforeFirst()

</div>

</div>

</div>

<span id="id26987" class="indexterm"></span> <span id="id26989"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isBeforeFirst() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is before the first row in the result set.

</div>

<div id="mt_jd1.6.2.76" class="section">

<div class="titlepage">

<div>

<div>

##### Method isFirst()

</div>

</div>

</div>

<span id="id27014" class="indexterm"></span> <span id="id27016"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isFirst() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is on the first row of the result set.

</div>

<div id="mt_jd1.6.2.77" class="section">

<div class="titlepage">

<div>

<div>

##### Method isLast()

</div>

</div>

</div>

<span id="id27041" class="indexterm"></span> <span id="id27043"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isLast() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Determine if the cursor is on the last row of the result set. Note:
Calling isLast() may be expensive since the JDBC driver might need to
fetch ahead one row in order to determine whether the current row is the
last row in the result set.

</div>

<div id="mt_jd1.6.2.78" class="section">

<div class="titlepage">

<div>

<div>

##### Method last()

</div>

</div>

</div>

<span id="id27068" class="indexterm"></span> <span id="id27070"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean last() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                             |
|--------------|-----------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or result set type is TYPE_FORWARD_ONLY. |

</div>

Moves to the last row in the result set.

</div>

<div id="mt_jd1.6.2.79" class="section">

<div class="titlepage">

<div>

<div>

##### Method moveToCurrentRow()

</div>

</div>

</div>

<span id="id27095" class="indexterm"></span> <span id="id27097"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void moveToCurrentRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                       |
|--------------|-----------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or the result set is not updatable |

</div>

Move the cursor to the remembered cursor position, usually the current
row. Has no effect unless the cursor is on the insert row.

</div>

<div id="mt_jd1.6.2.80" class="section">

<div class="titlepage">

<div>

<div>

##### Method moveToInsertRow()

</div>

</div>

</div>

<span id="id27122" class="indexterm"></span> <span id="id27124"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void moveToInsertRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                       |
|--------------|-----------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or the result set is not updatable |

</div>

Move to the insert row. The current cursor position is remembered while
the cursor is positioned on the insert row. The insert row is a special
row associated with an updatable result set. It is essentially a buffer
where a new row may be constructed by calling the updateXXX() methods
prior to inserting the row into the result set. Only the updateXXX(),
getXXX(), and insertRow() methods may be called when the cursor is on
the insert row. All of the columns in a result set must be given a value
each time this method is called before calling insertRow().
UpdateXXX()must be called before getXXX() on a column.

</div>

<div id="mt_jd1.6.2.81" class="section">

<div class="titlepage">

<div>

<div>

##### Method next()

</div>

</div>

</div>

<span id="id27149" class="indexterm"></span> <span id="id27151"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean next() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A ResultSet is initially positioned before its first row; the first call
to next makes the first row the current row; the second call makes the
second row the current row, etc.

If an input stream from the previous row is open, it is implicitly
closed. The ResultSet's warning chain is cleared when a new row is read.

</div>

<div id="mt_jd1.6.2.82" class="section">

<div class="titlepage">

<div>

<div>

##### Method previous()

</div>

</div>

</div>

<span id="id27177" class="indexterm"></span> <span id="id27179"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean previous() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                             |
|--------------|-----------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or result set type is TYPE_FORWAR_DONLY. |

</div>

Moves to the previous row in the result set.

Note: previous() is not the same as relative(-1) since it makes sense to
call previous() when there is no current row.

</div>

<div id="mt_jd1.6.2.83" class="section">

<div class="titlepage">

<div>

<div>

##### Method refreshRow()

</div>

</div>

</div>

<span id="id27205" class="indexterm"></span> <span id="id27207"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void refreshRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                         |
|--------------|-------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or if called when on the insert row. |

</div>

Refresh the value of the current row with its current value in the
database. Cannot be called when on the insert row. The refreshRow()
method provides a way for an application to explicitly tell the JDBC
driver to refetch a row(s) from the database. An application may want to
call refreshRow() when caching or prefetching is being done by the JDBC
driver to fetch the latest value of a row from the database. The JDBC
driver may actually refresh multiple rows at once if the fetch size is
greater than one. All values are refetched subject to the transaction
isolation level and cursor sensitivity. If refreshRow() is called after
calling updateXXX(), but before calling updateRow() then the updates
made to the row are lost. Calling refreshRow() frequently will likely
slow performance.

</div>

<div id="mt_jd1.6.2.84" class="section">

<div class="titlepage">

<div>

<div>

##### Method relative(int)

</div>

</div>

</div>

<span id="id27232" class="indexterm"></span> <span id="id27234"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean relative(int rows) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                                                         |
|--------------|---------------------------------------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or there is no current row, or result set type is TYPE_FORWARD_ONLY. |

</div>

Moves a relative number of rows, either positive or negative. Attempting
to move beyond the first/last row in the result set positions the cursor
before/after the the first/last row. Calling relative(0) is valid, but
does not change the cursor position.

Note: Calling relative(1) is different than calling next() since is
makes sense to call next() when there is no current row, for example,
when the cursor is positioned before the first row or after the last row
of the result set.

</div>

<div id="mt_jd1.6.2.85" class="section">

<div class="titlepage">

<div>

<div>

##### Method rowDeleted()

</div>

</div>

</div>

<span id="id27261" class="indexterm"></span> <span id="id27263"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean rowDeleted() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                              |
|------------------------|------------------------------------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.DatabaseMetaData.deletesAreDetected</span> |

</div>

Determine if this row has been deleted. A deleted row may leave a
visible "hole" in a result set. This method can be used to detect holes
in a result set. The value returned depends on whether or not the result
set can detect deletions.

</div>

<div id="mt_jd1.6.2.86" class="section">

<div class="titlepage">

<div>

<div>

##### Method rowInserted()

</div>

</div>

</div>

<span id="id27305" class="indexterm"></span> <span id="id27307"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean rowInserted() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                              |
|------------------------|------------------------------------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.DatabaseMetaData.insertsAreDetected</span> |

</div>

Determine if the current row has been inserted. The value returned
depends on whether or not the result set can detect visible inserts.

</div>

<div id="mt_jd1.6.2.87" class="section">

<div class="titlepage">

<div>

<div>

##### Method rowUpdated()

</div>

</div>

</div>

<span id="id27349" class="indexterm"></span> <span id="id27351"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean rowUpdated() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                              |
|------------------------|------------------------------------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.DatabaseMetaData.updatesAreDetected</span> |

</div>

Determine if the current row has been updated. The value returned
depends on whether or not the result set can detect updates.

</div>

<div id="mt_jd1.6.2.88" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateArray(int, Array)

</div>

</div>

</div>

<span id="id27393" class="indexterm"></span> <span id="id27395"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateArray(int columnIndex, java.sql.Array x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Array` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.89" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateArray(String, Array)

</div>

</div>

</div>

<span id="id27461" class="indexterm"></span> <span id="id27463"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateArray(java.lang.String columnName, 
>                                   java.sql.Array x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Array` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.90" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateAsciiStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id27529" class="indexterm"></span> <span id="id27531"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateAsciiStream(int columnIndex, java.io.InputStream x, 
>                                         int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |
| <span class="emphasis">*`length`*</span> - the length of the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an ascii stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.91" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateAsciiStream(String, InputStream, int)

</div>

</div>

</div>

<span id="id27583" class="indexterm"></span> <span id="id27585"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateAsciiStream(java.lang.String columnName, 
>                                         java.io.InputStream x, 
>                                         int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |
| <span class="emphasis">*`length`*</span> - of the stream              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an ascii stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.92" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBigDecimal(int, BigDecimal)

</div>

</div>

</div>

<span id="id27637" class="indexterm"></span> <span id="id27639"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBigDecimal(int columnIndex, java.math.BigDecimal x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a BigDecimal value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.93" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBigDecimal(String, BigDecimal)

</div>

</div>

</div>

<span id="id27685" class="indexterm"></span> <span id="id27687"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBigDecimal(java.lang.String columnName, 
>                                        java.math.BigDecimal x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a BigDecimal value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.94" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBinaryStream(int, InputStream, int)

</div>

</div>

</div>

<span id="id27733" class="indexterm"></span> <span id="id27735"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBinaryStream(int columnIndex, 
>                                          java.io.InputStream x, int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |
| <span class="emphasis">*`length`*</span> - the length of the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a binary stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.95" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBinaryStream(String, InputStream, int)

</div>

</div>

</div>

<span id="id27787" class="indexterm"></span> <span id="id27789"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBinaryStream(java.lang.String columnName, 
>                                          java.io.InputStream x, 
>                                          int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |
| <span class="emphasis">*`length`*</span> - of the stream              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a binary stream value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.96" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBlob(int, Blob)

</div>

</div>

</div>

<span id="id27841" class="indexterm"></span> <span id="id27843"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBlob(int columnIndex, java.sql.Blob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Blob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.97" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBlob(String, Blob)

</div>

</div>

</div>

<span id="id27909" class="indexterm"></span> <span id="id27911"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBlob(java.lang.String columnName, java.sql.Blob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Blob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.98" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBoolean(int, boolean)

</div>

</div>

</div>

<span id="id27977" class="indexterm"></span> <span id="id27979"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBoolean(int columnIndex, boolean x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a boolean value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.99" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBoolean(String, boolean)

</div>

</div>

</div>

<span id="id28025" class="indexterm"></span> <span id="id28027"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBoolean(java.lang.String columnName, boolean x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a boolean value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.100" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateByte(int, byte)

</div>

</div>

</div>

<span id="id28073" class="indexterm"></span> <span id="id28075"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateByte(int columnIndex, byte x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.101" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateByte(String, byte)

</div>

</div>

</div>

<span id="id28121" class="indexterm"></span> <span id="id28123"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateByte(java.lang.String columnName, byte x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.102" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBytes(int, byte\[\])

</div>

</div>

</div>

<span id="id28169" class="indexterm"></span> <span id="id28171"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBytes(int columnIndex, byte[] x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte array value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.103" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateBytes(String, byte\[\])

</div>

</div>

</div>

<span id="id28217" class="indexterm"></span> <span id="id28219"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateBytes(java.lang.String columnName, byte[] x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a byte array value. The updateXXX() methods are
used to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.104" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateCharacterStream(int, Reader, int)

</div>

</div>

</div>

<span id="id28265" class="indexterm"></span> <span id="id28267"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateCharacterStream(int columnIndex, java.io.Reader x, 
>                                             int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |
| <span class="emphasis">*`length`*</span> - the length of the stream                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a character stream value. The updateXXX() methods
are used to update column values in the current row, or the insert row.
The updateXXX() methods do not update the underlying database, instead
the updateRow() or insertRow() methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.105" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateCharacterStream(String, Reader, int)

</div>

</div>

</div>

<span id="id28319" class="indexterm"></span> <span id="id28321"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateCharacterStream(java.lang.String columnName, 
>                                             java.io.Reader x, 
>                                             int length) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |
| <span class="emphasis">*`length`*</span> - of the stream              |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a character stream value. The updateXXX() methods
are used to update column values in the current row, or the insert row.
The updateXXX() methods do not update the underlying database, instead
the updateRow() or insertRow() methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.106" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateClob(int, Clob)

</div>

</div>

</div>

<span id="id28373" class="indexterm"></span> <span id="id28375"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateClob(int columnIndex, java.sql.Clob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Clob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.107" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateClob(String, Clob)

</div>

</div>

</div>

<span id="id28441" class="indexterm"></span> <span id="id28443"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateClob(java.lang.String columnName, java.sql.Clob x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Clob` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.108" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDate(int, Date)

</div>

</div>

</div>

<span id="id28509" class="indexterm"></span> <span id="id28511"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDate(int columnIndex, java.sql.Date x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Date value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.109" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDate(String, Date)

</div>

</div>

</div>

<span id="id28557" class="indexterm"></span> <span id="id28559"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDate(java.lang.String columnName, java.sql.Date x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Date value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.110" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDouble(int, double)

</div>

</div>

</div>

<span id="id28605" class="indexterm"></span> <span id="id28607"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDouble(int columnIndex, double x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Double value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.111" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateDouble(String, double)

</div>

</div>

</div>

<span id="id28653" class="indexterm"></span> <span id="id28655"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateDouble(java.lang.String columnName, double x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a double value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.112" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateFloat(int, float)

</div>

</div>

</div>

<span id="id28701" class="indexterm"></span> <span id="id28703"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateFloat(int columnIndex, float x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a float value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.113" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateFloat(String, float)

</div>

</div>

</div>

<span id="id28749" class="indexterm"></span> <span id="id28751"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateFloat(java.lang.String columnName, float x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a float value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.114" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateInt(int, int)

</div>

</div>

</div>

<span id="id28797" class="indexterm"></span> <span id="id28799"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateInt(int columnIndex, int x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an integer value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.115" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateInt(String, int)

</div>

</div>

</div>

<span id="id28845" class="indexterm"></span> <span id="id28847"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateInt(java.lang.String columnName, int x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an integer value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.116" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateLong(int, long)

</div>

</div>

</div>

<span id="id28893" class="indexterm"></span> <span id="id28895"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateLong(int columnIndex, long x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a long value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.117" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateLong(String, long)

</div>

</div>

</div>

<span id="id28941" class="indexterm"></span> <span id="id28943"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateLong(java.lang.String columnName, long x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a long value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.118" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateNull(int)

</div>

</div>

</div>

<span id="id28989" class="indexterm"></span> <span id="id28991"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateNull(int columnIndex) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Give a nullable column a null value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.119" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateNull(String)

</div>

</div>

</div>

<span id="id29031" class="indexterm"></span> <span id="id29033"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateNull(java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a null value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.120" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(int, Object)

</div>

</div>

</div>

<span id="id29073" class="indexterm"></span> <span id="id29075"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(int columnIndex, java.lang.Object x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.121" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(int, Object, int)

</div>

</div>

</div>

<span id="id29121" class="indexterm"></span> <span id="id29123"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(int columnIndex, java.lang.Object x, 
>                                    int scale) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ...                                                                                                          |
| <span class="emphasis">*`x`*</span> - the new column value                                                                                                                                           |
| <span class="emphasis">*`scale`*</span> - For java.sql.Types.DECIMAL or java.sql.Types.NUMERIC types this is the number of digits after the decimal. For all other types this value will be ignored. |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.122" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(String, Object)

</div>

</div>

</div>

<span id="id29175" class="indexterm"></span> <span id="id29177"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(java.lang.String columnName, 
>                                    java.lang.Object x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.123" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateObject(String, Object, int)

</div>

</div>

</div>

<span id="id29223" class="indexterm"></span> <span id="id29225"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateObject(java.lang.String columnName, 
>                                    java.lang.Object x, int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column                                                                                                                                |
| <span class="emphasis">*`x`*</span> - the new column value                                                                                                                                           |
| <span class="emphasis">*`scale`*</span> - For java.sql.Types.DECIMAL or java.sql.Types.NUMERIC types this is the number of digits after the decimal. For all other types this value will be ignored. |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with an Object value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.124" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateRef(int, Ref)

</div>

</div>

</div>

<span id="id29277" class="indexterm"></span> <span id="id29279"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateRef(int columnIndex, java.sql.Ref x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Ref` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.125" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateRef(String, Ref)

</div>

</div>

</div>

<span id="id29345" class="indexterm"></span> <span id="id29347"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateRef(java.lang.String columnName, java.sql.Ref x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                     |
|------------------------|-------------------------------------|
| Since                  | <span class="simplelist">1.4</span> |

</div>

Updates the designated column with a `java.sql.Ref` value. The updater
methods are used to update column values in the current row or the
insert row. The updater methods do not update the underlying database;
instead the `updateRow` or `insertRow` methods are called to update the
database.

</div>

<div id="mt_jd1.6.2.126" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateRow()

</div>

</div>

</div>

<span id="id29413" class="indexterm"></span> <span id="id29415"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateRow() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                                                        |
|--------------|------------------------------------------------------------------------|
| SQLException | if a database-access error occurs, or if called when on the insert row |

</div>

Update the underlying database with the new contents of the current row.
Cannot be called when on the insert row.

</div>

<div id="mt_jd1.6.2.127" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateShort(int, short)

</div>

</div>

</div>

<span id="id29440" class="indexterm"></span> <span id="id29442"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateShort(int columnIndex, short x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a short value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.128" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateShort(String, short)

</div>

</div>

</div>

<span id="id29488" class="indexterm"></span> <span id="id29490"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateShort(java.lang.String columnName, short x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a short value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.129" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateString(int, String)

</div>

</div>

</div>

<span id="id29536" class="indexterm"></span> <span id="id29538"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateString(int columnIndex, java.lang.String x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a String value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.130" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateString(String, String)

</div>

</div>

</div>

<span id="id29584" class="indexterm"></span> <span id="id29586"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateString(java.lang.String columnName, 
>                                    java.lang.String x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a String value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.131" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTime(int, Time)

</div>

</div>

</div>

<span id="id29632" class="indexterm"></span> <span id="id29634"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTime(int columnIndex, java.sql.Time x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Time value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.132" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTime(String, Time)

</div>

</div>

</div>

<span id="id29680" class="indexterm"></span> <span id="id29682"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTime(java.lang.String columnName, java.sql.Time x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Time value. The updateXXX() methods are used to
update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.133" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTimestamp(int, Timestamp)

</div>

</div>

</div>

<span id="id29728" class="indexterm"></span> <span id="id29730"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTimestamp(int columnIndex, java.sql.Timestamp x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                  |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`columnIndex`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`x`*</span> - the new column value                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Timestamp value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.134" class="section">

<div class="titlepage">

<div>

<div>

##### Method updateTimestamp(String, Timestamp)

</div>

</div>

</div>

<span id="id29776" class="indexterm"></span> <span id="id29778"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void updateTimestamp(java.lang.String columnName, 
>                                       java.sql.Timestamp x) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                            |
|-----------------------------------------------------------------------|
| <span class="emphasis">*`columnName`*</span> - the name of the column |
| <span class="emphasis">*`x`*</span> - the new column value            |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database-access error occurs |

</div>

Update a column with a Timestamp value. The updateXXX() methods are used
to update column values in the current row, or the insert row. The
updateXXX() methods do not update the underlying database, instead the
updateRow() or insertRow() methods are called to update the database.

</div>

<div id="mt_jd1.6.2.135" class="section">

<div class="titlepage">

<div>

<div>

##### Method wasNull()

</div>

</div>

</div>

<span id="id29824" class="indexterm"></span> <span id="id29826"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean wasNull() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

A column may have the value of SQL NULL; wasNull reports whether the
last column read had this special value. Note that you must first call
getXXX on a column to try to read its value and then call wasNull() to
find if the value was the SQL NULL.

</div>

</div>

</div>

<div id="mt_jd1.7" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.7. Class OPLPooledConnection

</div>

</div>

</div>

<span id="id29851" class="indexterm"></span> <span id="id29853"
class="indexterm"></span>

A PooledConnection object is a connection object that provides hooks for
connection pool management. A PooledConnection object represents a
physical connection to a data source.

<div id="mt_jd1.7.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLPooledConnection implements PooledConnection,Cloneable {
  // Public Methods
  public void finalize() throws java.lang.Throwable;
  public void addConnectionEventListener(
                javax.sql.ConnectionEventListener parm);
  public void removeConnectionEventListener(
                javax.sql.ConnectionEventListener parm);
  public void close() throws java.sql.SQLException;
  public void closeAll() throws java.sql.SQLException;
  public Connection getConnection() throws java.sql.SQLException;
}
      
```

<div class="informaltable">

|          Inheritance Path          |
|:----------------------------------:|
|          java.lang.Object          |
|                 \|                 |
| openlink.javax.OPLPooledConnection |

</div>

</div>

<div id="mt_jd1.7.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.7.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method addConnectionEventListener(ConnectionEventListener)

</div>

</div>

</div>

<span id="id29890" class="indexterm"></span> <span id="id29892"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void addConnectionEventListener(
>                         javax.sql.ConnectionEventListener parm);
>           
> ```

</div>

Add an event listener.

</div>

<div id="mt_jd1.7.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method close()

</div>

</div>

</div>

<span id="id29903" class="indexterm"></span> <span id="id29905"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void close() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Close the physical connection.

</div>

<div id="mt_jd1.7.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method closeAll()

</div>

</div>

</div>

<span id="id29930" class="indexterm"></span> <span id="id29932"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void closeAll() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Close all the Statement objects that have been opened by this
PooledConnection object.

</div>

<div id="mt_jd1.7.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConnection()

</div>

</div>

</div>

<span id="id29957" class="indexterm"></span> <span id="id29959"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public Connection getConnection() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions            |                                   |
|-----------------------|-----------------------------------|
| java.sql.SQLException | if a database-access error occurs |

</div>

Create an object handle for this physical connection. The object
returned is a temporary handle used by application code to refer to a
physical connection that is being pooled.

</div>

<div id="mt_jd1.7.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method removeConnectionEventListener(ConnectionEventListener)

</div>

</div>

</div>

<span id="id29984" class="indexterm"></span> <span id="id29986"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void removeConnectionEventListener(
>                         javax.sql.ConnectionEventListener parm);
>           
> ```

</div>

Remove an event listener.

</div>

</div>

</div>

<div id="mt_jd1.8" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.8. Class OPLPoolStatistic

</div>

</div>

</div>

<span id="id29997" class="indexterm"></span> <span id="id29999"
class="indexterm"></span>

<div id="mt_jd1.8.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLPoolStatistic implements Cloneable {
  // Public Methods
  public int getHits();
  public int getMisses();
  public long getMaxWaitTime();
  public long getMinWaitTime();
  public long getCumWaitTime();
  public int getCacheSize();
  public int getConnsInUse();
  public int getConnsUnUsed();
  public String getName();
  public String toString();
}
      
```

<div class="informaltable">

|        Inheritance Path         |
|:-------------------------------:|
|        java.lang.Object         |
|               \|                |
| openlink.javax.OPLPoolStatistic |

</div>

</div>

<div id="mt_jd1.8.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.8.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCacheSize()

</div>

</div>

</div>

<span id="id30037" class="indexterm"></span> <span id="id30039"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getCacheSize();
>           
> ```

</div>

Returns the connection pool size.

</div>

<div id="mt_jd1.8.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConnsInUse()

</div>

</div>

</div>

<span id="id30049" class="indexterm"></span> <span id="id30051"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getConnsInUse();
>           
> ```

</div>

Returns the amount of used connections in the connection pool size.

</div>

<div id="mt_jd1.8.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method getConnsUnUsed()

</div>

</div>

</div>

<span id="id30061" class="indexterm"></span> <span id="id30063"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getConnsUnUsed();
>           
> ```

</div>

Returns the amount of unused connections in the connection pool size.

</div>

<div id="mt_jd1.8.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCumWaitTime()

</div>

</div>

</div>

<span id="id30073" class="indexterm"></span> <span id="id30075"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getCumWaitTime();
>           
> ```

</div>

Returns the sum of all waiting time for the connection pool.

</div>

<div id="mt_jd1.8.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method getHits()

</div>

</div>

</div>

<span id="id30085" class="indexterm"></span> <span id="id30087"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getHits();
>           
> ```

</div>

Returns the amount of the connection pool hits.

</div>

<div id="mt_jd1.8.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMaxWaitTime()

</div>

</div>

</div>

<span id="id30097" class="indexterm"></span> <span id="id30099"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getMaxWaitTime();
>           
> ```

</div>

Returns the maximal waiting time for the connection pool.

</div>

<div id="mt_jd1.8.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMinWaitTime()

</div>

</div>

</div>

<span id="id30109" class="indexterm"></span> <span id="id30111"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public long getMinWaitTime();
>           
> ```

</div>

Returns the minimal waiting time for the connection pool.

</div>

<div id="mt_jd1.8.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method getMisses()

</div>

</div>

</div>

<span id="id30121" class="indexterm"></span> <span id="id30123"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getMisses();
>           
> ```

</div>

Returns the amount of the connection pool misses.

</div>

<div id="mt_jd1.8.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method getName()

</div>

</div>

</div>

<span id="id30133" class="indexterm"></span> <span id="id30135"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getName();
>           
> ```

</div>

Returns the name of ConectionPoolDataSource.

</div>

</div>

</div>

<div id="mt_jd1.9" class="section">

<div class="titlepage">

<div>

<div>

### 11.11.9. Class OPLRowSetMetaData

</div>

</div>

</div>

<span id="id30145" class="indexterm"></span> <span id="id30147"
class="indexterm"></span>

The RowSetMetaData interface extends ResultSetMetaData with methods that
allow a metadata object to be initialized.

<div id="mt_jd1.9.1" class="section">

<div class="titlepage">

<div>

<div>

#### Synopsis

</div>

</div>

</div>

``` programlisting
public class OPLRowSetMetaData implements RowSetMetaData,Serializable {
  // Public Constructors
  public OPLRowSetMetaData(java.sql.ResultSetMetaData rsmd) 
      throws java.sql.SQLException;
  // Public Methods
  public void setAutoIncrement(int column, boolean property) 
      throws java.sql.SQLException;
  public void setCaseSensitive(int column, boolean property) 
      throws java.sql.SQLException;
  public void setCatalogName(int column, java.lang.String catalogName) 
      throws java.sql.SQLException;
  public void setColumnCount(int columnCount) throws java.sql.SQLException;
  public void setColumnDisplaySize(int column, int size) 
      throws java.sql.SQLException;
  public void setColumnLabel(int column, java.lang.String label) 
      throws java.sql.SQLException;
  public void setColumnName(int column, java.lang.String columnName) 
      throws java.sql.SQLException;
  public void setColumnType(int column, int SQLType) 
      throws java.sql.SQLException;
  public void setColumnTypeName(int column, java.lang.String typeName) 
      throws java.sql.SQLException;
  public void setCurrency(int column, boolean property) 
      throws java.sql.SQLException;
  public void setNullable(int column, int property) 
      throws java.sql.SQLException;
  public void setPrecision(int column, int precision) 
      throws java.sql.SQLException;
  public void setScale(int column, int scale) throws java.sql.SQLException;
  public void setSchemaName(int column, java.lang.String schemaName) 
      throws java.sql.SQLException;
  public void setSearchable(int column, boolean property) 
      throws java.sql.SQLException;
  public void setSigned(int column, boolean property) 
      throws java.sql.SQLException;
  public void setTableName(int column, java.lang.String tableName) 
      throws java.sql.SQLException;
  public int getColumnCount() throws java.sql.SQLException;
  public boolean isAutoIncrement(int column) throws java.sql.SQLException;
  public boolean isCaseSensitive(int column) throws java.sql.SQLException;
  public boolean isSearchable(int column) throws java.sql.SQLException;
  public boolean isCurrency(int column) throws java.sql.SQLException;
  public int isNullable(int column) throws java.sql.SQLException;
  public boolean isSigned(int column) throws java.sql.SQLException;
  public int getColumnDisplaySize(int column) throws java.sql.SQLException;
  public String getColumnLabel(int column) throws java.sql.SQLException;
  public String getColumnName(int column) throws java.sql.SQLException;
  public String getSchemaName(int column) throws java.sql.SQLException;
  public int getPrecision(int column) throws java.sql.SQLException;
  public int getScale(int column) throws java.sql.SQLException;
  public String getTableName(int column) throws java.sql.SQLException;
  public String getCatalogName(int column) throws java.sql.SQLException;
  public int getColumnType(int column) throws java.sql.SQLException;
  public String getColumnTypeName(int column) throws java.sql.SQLException;
  public boolean isReadOnly(int column) throws java.sql.SQLException;
  public boolean isWritable(int column) throws java.sql.SQLException;
  public boolean isDefinitelyWritable(int column) throws java.sql.SQLException;
  public String getColumnClassName(int column) throws java.sql.SQLException;
}
      
```

<div class="informaltable">

|         Inheritance Path         |
|:--------------------------------:|
|         java.lang.Object         |
|                \|                |
| openlink.javax.OPLRowSetMetaData |

</div>

</div>

<div id="mt_jd1.9.2" class="section">

<div class="titlepage">

<div>

<div>

#### Members

</div>

</div>

</div>

<div id="mt_jd1.9.2.1" class="section">

<div class="titlepage">

<div>

<div>

##### Method getCatalogName(int)

</div>

</div>

</div>

<span id="id30270" class="indexterm"></span> <span id="id30272"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getCatalogName(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - column name or "" if not applicable                                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Gets the designated column's table's catalog name.

</div>

<div id="mt_jd1.9.2.2" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnClassName(int)

</div>

</div>

</div>

<span id="id30316" class="indexterm"></span> <span id="id30318"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getColumnClassName(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                                                  |
|------------------------|----------------------------------------------------------------------------------|
| Since                  | <span class="simplelist">1.2</span>                                              |
| See Also               | <span class="simplelist"> <a href="package-summary.html#2.0%20API" class="ulink" 
                          target="_top">What Is in the JDBC 2.0 API</a> </span>                             |

</div>

Returns the fully-qualified name of the Java class whose instances are
manufactured if the method `ResultSet.getObject` is called to retrieve a
value from the column. `ResultSet.getObject` may return a subclass of
the class returned by this method.

</div>

<div id="mt_jd1.9.2.3" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnCount()

</div>

</div>

</div>

<span id="id30371" class="indexterm"></span> <span id="id30373"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getColumnCount() throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Returns the number of columns in this RowSet

</div>

<div id="mt_jd1.9.2.4" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnDisplaySize(int)

</div>

</div>

</div>

<span id="id30398" class="indexterm"></span> <span id="id30400"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getColumnDisplaySize(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                       |
|--------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...           |
| `return` - the normal maximum number of characters allowed as the width of the designated column |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates the designated column's normal maximum width in characters.

</div>

<div id="mt_jd1.9.2.5" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnLabel(int)

</div>

</div>

</div>

<span id="id30444" class="indexterm"></span> <span id="id30446"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getColumnLabel(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - the suggested column title                                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Gets the designated column's suggested title for use in printouts and
displays.

</div>

<div id="mt_jd1.9.2.6" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnName(int)

</div>

</div>

</div>

<span id="id30490" class="indexterm"></span> <span id="id30492"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getColumnName(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - column name                                                                 |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Get the designated column's name.

</div>

<div id="mt_jd1.9.2.7" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnType(int)

</div>

</div>

</div>

<span id="id30536" class="indexterm"></span> <span id="id30538"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getColumnType(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - SQL type from java.sql.Types                                                |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

<div class="informaltable">

| Additional Information |                                                |
|------------------------|------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.Types</span> |

</div>

Retrieves the designated column's SQL type.

</div>

<div id="mt_jd1.9.2.8" class="section">

<div class="titlepage">

<div>

<div>

##### Method getColumnTypeName(int)

</div>

</div>

</div>

<span id="id30599" class="indexterm"></span> <span id="id30601"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getColumnTypeName(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                          |
|-------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...                                              |
| `return` - type name used by the database. If the column type is a user-defined type, then a fully-qualified type name is returned. |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Retrieves the designated column's database-specific type name.

</div>

<div id="mt_jd1.9.2.9" class="section">

<div class="titlepage">

<div>

<div>

##### Method getPrecision(int)

</div>

</div>

</div>

<span id="id30645" class="indexterm"></span> <span id="id30647"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getPrecision(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - precision                                                                   |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Get the designated column's number of decimal digits.

</div>

<div id="mt_jd1.9.2.10" class="section">

<div class="titlepage">

<div>

<div>

##### Method getScale(int)

</div>

</div>

</div>

<span id="id30691" class="indexterm"></span> <span id="id30693"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int getScale(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - scale                                                                       |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Gets the designated column's number of digits to right of the decimal
point.

</div>

<div id="mt_jd1.9.2.11" class="section">

<div class="titlepage">

<div>

<div>

##### Method getSchemaName(int)

</div>

</div>

</div>

<span id="id30737" class="indexterm"></span> <span id="id30739"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getSchemaName(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - schema name or "" if not applicable                                         |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Get the designated column's table's schema.

</div>

<div id="mt_jd1.9.2.12" class="section">

<div class="titlepage">

<div>

<div>

##### Method getTableName(int)

</div>

</div>

</div>

<span id="id30783" class="indexterm"></span> <span id="id30785"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public String getTableName(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - table name or "" if not applicable                                          |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Gets the designated column's table name.

</div>

<div id="mt_jd1.9.2.13" class="section">

<div class="titlepage">

<div>

<div>

##### Method isAutoIncrement(int)

</div>

</div>

</div>

<span id="id30829" class="indexterm"></span> <span id="id30831"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isAutoIncrement(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - true if so                                                                  |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether the column is automatically numbered, thus read-only.

</div>

<div id="mt_jd1.9.2.14" class="section">

<div class="titlepage">

<div>

<div>

##### Method isCaseSensitive(int)

</div>

</div>

</div>

<span id="id30875" class="indexterm"></span> <span id="id30877"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isCaseSensitive(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether a column's case matters.

</div>

<div id="mt_jd1.9.2.15" class="section">

<div class="titlepage">

<div>

<div>

##### Method isCurrency(int)

</div>

</div>

</div>

<span id="id30923" class="indexterm"></span> <span id="id30925"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isCurrency(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether the designated column is a cash value.

</div>

<div id="mt_jd1.9.2.16" class="section">

<div class="titlepage">

<div>

<div>

##### Method isDefinitelyWritable(int)

</div>

</div>

</div>

<span id="id30971" class="indexterm"></span> <span id="id30973"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isDefinitelyWritable(int column) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether a write on the designated column will definitely
succeed.

</div>

<div id="mt_jd1.9.2.17" class="section">

<div class="titlepage">

<div>

<div>

##### Method isNullable(int)

</div>

</div>

</div>

<span id="id31019" class="indexterm"></span> <span id="id31021"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public int isNullable(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                 |
|----------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...                                     |
| `return` - the nullability status of the given column; one of `columnNoNulls`, `columnNullable` or `columnNullableUnknown` |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates the nullability of values in the designated column.

</div>

<div id="mt_jd1.9.2.18" class="section">

<div class="titlepage">

<div>

<div>

##### Method isReadOnly(int)

</div>

</div>

</div>

<span id="id31068" class="indexterm"></span> <span id="id31070"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isReadOnly(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether the designated column is definitely not writable.

</div>

<div id="mt_jd1.9.2.19" class="section">

<div class="titlepage">

<div>

<div>

##### Method isSearchable(int)

</div>

</div>

</div>

<span id="id31116" class="indexterm"></span> <span id="id31118"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isSearchable(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether the designated column can be used in a where clause.

</div>

<div id="mt_jd1.9.2.20" class="section">

<div class="titlepage">

<div>

<div>

##### Method isSigned(int)

</div>

</div>

</div>

<span id="id31164" class="indexterm"></span> <span id="id31166"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isSigned(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether values in the designated column are signed numbers.

</div>

<div id="mt_jd1.9.2.21" class="section">

<div class="titlepage">

<div>

<div>

##### Method isWritable(int)

</div>

</div>

</div>

<span id="id31212" class="indexterm"></span> <span id="id31214"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public boolean isWritable(int column) throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| `return` - `true` if so; `false` otherwise                                             |

</div>

<div class="informaltable">

| Exceptions   |                                   |
|--------------|-----------------------------------|
| SQLException | if a database access error occurs |

</div>

Indicates whether it is possible for a write on the designated column to
succeed.

</div>

<div id="mt_jd1.9.2.22" class="section">

<div class="titlepage">

<div>

<div>

##### Method setAutoIncrement(int, boolean)

</div>

</div>

</div>

<span id="id31260" class="indexterm"></span> <span id="id31262"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setAutoIncrement(int column, boolean property) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...   |
| <span class="emphasis">*`property`*</span> - is either true or false (default is false). |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify whether the is column automatically numbered, thus read-only.

</div>

<div id="mt_jd1.9.2.23" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCaseSensitive(int, boolean)

</div>

</div>

</div>

<span id="id31308" class="indexterm"></span> <span id="id31310"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCaseSensitive(int column, boolean property) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...   |
| <span class="emphasis">*`property`*</span> - is either true or false (default is false). |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify whether the column is case sensitive.

</div>

<div id="mt_jd1.9.2.24" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCatalogName(int, String)

</div>

</div>

</div>

<span id="id31356" class="indexterm"></span> <span id="id31358"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCatalogName(int column, java.lang.String catalogName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`catalogName`*</span> - column's catalog name.                 |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's table's catalog name, if any.

</div>

<div id="mt_jd1.9.2.25" class="section">

<div class="titlepage">

<div>

<div>

##### Method setColumnCount(int)

</div>

</div>

</div>

<span id="id31404" class="indexterm"></span> <span id="id31406"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setColumnCount(int columnCount) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                         |
|--------------------------------------------------------------------|
| <span class="emphasis">*`columnCount`*</span> - number of columns. |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Set the number of columns in the RowSet.

</div>

<div id="mt_jd1.9.2.26" class="section">

<div class="titlepage">

<div>

<div>

##### Method setColumnDisplaySize(int, int)

</div>

</div>

</div>

<span id="id31446" class="indexterm"></span> <span id="id31448"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setColumnDisplaySize(int column, int size) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`size`*</span> - size of the column                            |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's normal max width in chars.

</div>

<div id="mt_jd1.9.2.27" class="section">

<div class="titlepage">

<div>

<div>

##### Method setColumnLabel(int, String)

</div>

</div>

</div>

<span id="id31494" class="indexterm"></span> <span id="id31496"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setColumnLabel(int column, java.lang.String label) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`label`*</span> - the column title                             |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the suggested column title for use in printouts and displays, if
any.

</div>

<div id="mt_jd1.9.2.28" class="section">

<div class="titlepage">

<div>

<div>

##### Method setColumnName(int, String)

</div>

</div>

</div>

<span id="id31542" class="indexterm"></span> <span id="id31544"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setColumnName(int column, java.lang.String columnName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`columnName`*</span> - the column name                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column name.

</div>

<div id="mt_jd1.9.2.29" class="section">

<div class="titlepage">

<div>

<div>

##### Method setColumnType(int, int)

</div>

</div>

</div>

<span id="id31590" class="indexterm"></span> <span id="id31592"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setColumnType(int column, int SQLType) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`SQLType`*</span> - column's SQL type.                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

<div class="informaltable">

| Additional Information |                                                |
|------------------------|------------------------------------------------|
| See Also               | <span class="simplelist">java.sql.Types</span> |

</div>

Specify the column's SQL type.

</div>

<div id="mt_jd1.9.2.30" class="section">

<div class="titlepage">

<div>

<div>

##### Method setColumnTypeName(int, String)

</div>

</div>

</div>

<span id="id31655" class="indexterm"></span> <span id="id31657"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setColumnTypeName(int column, java.lang.String typeName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`typeName`*</span> - data source specific type name.           |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's data source specific type name, if any.

</div>

<div id="mt_jd1.9.2.31" class="section">

<div class="titlepage">

<div>

<div>

##### Method setCurrency(int, boolean)

</div>

</div>

</div>

<span id="id31703" class="indexterm"></span> <span id="id31705"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setCurrency(int column, boolean property) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...   |
| <span class="emphasis">*`property`*</span> - is either true or false (default is false). |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify whether the column is a cash value.

</div>

<div id="mt_jd1.9.2.32" class="section">

<div class="titlepage">

<div>

<div>

##### Method setNullable(int, int)

</div>

</div>

</div>

<span id="id31751" class="indexterm"></span> <span id="id31753"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setNullable(int column, int property) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                                                                                               |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...                                                                   |
| <span class="emphasis">*`property`*</span> - is either one of columnNoNulls, columnNullable or columnNullableUnknown (default is columnNullableUnknown). |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify whether the column's value can be set to NULL.

</div>

<div id="mt_jd1.9.2.33" class="section">

<div class="titlepage">

<div>

<div>

##### Method setPrecision(int, int)

</div>

</div>

</div>

<span id="id31799" class="indexterm"></span> <span id="id31801"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setPrecision(int column, int precision) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`precision`*</span> - number of decimal digits.                |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's number of decimal digits.

</div>

<div id="mt_jd1.9.2.34" class="section">

<div class="titlepage">

<div>

<div>

##### Method setScale(int, int)

</div>

</div>

</div>

<span id="id31847" class="indexterm"></span> <span id="id31849"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setScale(int column, int scale) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`scale`*</span> - number of digits to right of decimal point.  |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's number of digits to right of the decimal point.

</div>

<div id="mt_jd1.9.2.35" class="section">

<div class="titlepage">

<div>

<div>

##### Method setSchemaName(int, String)

</div>

</div>

</div>

<span id="id31895" class="indexterm"></span> <span id="id31897"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setSchemaName(int column, java.lang.String schemaName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`schemaName`*</span> - the schema name                         |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's table's schema, if any.

</div>

<div id="mt_jd1.9.2.36" class="section">

<div class="titlepage">

<div>

<div>

##### Method setSearchable(int, boolean)

</div>

</div>

</div>

<span id="id31943" class="indexterm"></span> <span id="id31945"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setSearchable(int column, boolean property) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...   |
| <span class="emphasis">*`property`*</span> - is either true or false (default is false). |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify whether the column can be used in a where clause.

</div>

<div id="mt_jd1.9.2.37" class="section">

<div class="titlepage">

<div>

<div>

##### Method setSigned(int, boolean)

</div>

</div>

</div>

<span id="id31991" class="indexterm"></span> <span id="id31993"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setSigned(int column, boolean property) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                               |
|------------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ...   |
| <span class="emphasis">*`property`*</span> - is either true or false (default is false). |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Speicfy whether the column is a signed number.

</div>

<div id="mt_jd1.9.2.38" class="section">

<div class="titlepage">

<div>

<div>

##### Method setTableName(int, String)

</div>

</div>

</div>

<span id="id32039" class="indexterm"></span> <span id="id32041"
class="indexterm"></span>

<div class="blockquote">

> ``` programlisting
> Synopsis: public void setTableName(int column, java.lang.String tableName) 
>               throws java.sql.SQLException;
>           
> ```

</div>

<div class="informaltable">

| Parameters                                                                             |
|----------------------------------------------------------------------------------------|
| <span class="emphasis">*`column`*</span> - the first column is 1, the second is 2, ... |
| <span class="emphasis">*`tableName`*</span> - column's table name.                     |

</div>

<div class="informaltable">

| Exceptions   |                                    |
|--------------|------------------------------------|
| SQLException | if a database-access error occurs. |

</div>

Specify the column's table name, if any.

</div>

</div>

</div>

</div>
