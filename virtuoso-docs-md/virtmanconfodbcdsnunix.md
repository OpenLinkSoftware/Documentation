<div>

<div>

<div>

<div>

### 7.3.3. Manually configuring a Virtuoso ODBC DSN on Unix

</div>

</div>

</div>

If you have
<a href="http://www.iodbc.org" class="ulink" target="_top">iODBC</a>
installed, you can configure Virtuoso data sources by adding the
following entry into the relevant .odbc.ini file. Usually it is the
value of the ODBCINI environment variable or \$HOME/.odbc.ini:

Sample DSN:

``` programlisting
[LocalVirt]
Driver=/usr/local/lib/virtodbc_32.so
# absolute path to the shared object
Address=localhost:1111
# host and port of the Virtuoso server
```

If the application that will load the ODBC driver is multithreaded, use
the virtodbc32_r.so driver instead.

<div>

<div>

<div>

<div>

#### Linking Client Applications

</div>

</div>

</div>

The isql and other utilities are linked directly with the Virtuoso
client code. See the Makefiles for the libraries used. These are
identical in function with the ODBC driver but accept a host:port in the
place of a data-source name to be resolved from the odbc ini file.

Generally applications should pass via ODBC. Directly linking with the
ODBC driver shared object is also possible.

</div>

<div>

<div>

<div>

<div>

#### JDBC

</div>

</div>

</div>

If you specified:

``` programlisting
 --with-jdbc3=<path of JDK>
```

to the configure in the installation root directory, running make will
produce the files libsrc/JDBCDriverType4/virtjdbc3.jar and
virtjdbc3ssl.jar. These can be placed on the Java class path. See
<a href="virtuosodriverjdbc.html" class="link"
title="7.4. Virtuoso Driver for JDBC">Virtuoso JDBC Documentation</a>
for URL formats etc.

</div>

</div>
