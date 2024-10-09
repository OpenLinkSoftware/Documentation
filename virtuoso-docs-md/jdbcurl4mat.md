<div>

<div>

<div>

<div>

### 7.4.2. Virtuoso Driver For JDBC URL Format

</div>

</div>

</div>

JDBC compliant applications and applets connect to JDBC Drivers using
JDBC Uniform Resource Locators (URLs). Although there are two Virtuoso
Drivers for JDBC, both share the same JDBC URL format.

The Virtuoso Driver for JDBC URL format takes the following form:

``` programlisting
jdbc:virtuoso://<Hostname>:<Port#>/DATABASE=<dbname>/UID=<user name>/PWD=<password>/
  CERT=<certificate_alias>/KPATH=<keystore_path>/PASS=<keystore_password>/
  PROVIDER=<ssl_provider_classname>/SSL/CHARSET=<character set>/
  TIMEOUT=<timeout_secs>/PWDTYPE=<authentication_type>/log_enable=<integer>
```

Also is supported Host:Port list in connection string:

``` programlisting
jdbc:virtuoso://<Hostname>:<Port#>,<Hostname1>:<Port1#>,<Hostname2>:<Port2#>/
```

If Port is omitted, the default port 1111 is used.

Each part of the URL is explained below:

**Protocol Identifiers. ** this is a constant value of "jdbc" since JDBC
is the protocol in question

**Sub Protocol Identifier. ** this is a constant value that identifies
"virtuoso" as a sub protocol of JDBC

**Hostname. ** this identifies the machine hosting a server process that
speaks the "virtuoso" sub dialect of the "jdbc" protocol

**Port Number. ** this identifies the port number on the machine from
which the server which speaks the "virtuoso" sub dialect of "jdbc"
listening for incoming client connections The default port number for a
Virtuoso server is "1111".

**/DATABASE. ** this identifies the database (Qualifier or Catalog) that
you are connecting to via a Virtuoso server

**/UID. ** a valid user name for the Virtuoso database that you are
connecting to via JDBC

**/PWD. ** a valid password for the user name

**/CERT=\<certificate \_alias\>. ** name of the certificate to use for
the SSL connection stored in the keystore. This is a required option for
an SSL authenticated connection

**/KPATH=\<keystore_p ath\>. ** This optional parameter lets you specify
the keystore file name (default: \$HOME/.keystore). The path separator
is \\ and which is then replaced during the connection by the right
platform path separator.

**/PASS=\<keystore_pa ssword\>. ** password required for accessing the
keystore file. This is required for the SSL authenticated connection.

**/PROVIDER=\<ssl_pro vider_classname\>. ** The class name of the SSL
Provider (e.g. com.sun.ssl.net.internal.ssl.Provider) to use for the SSL
cryptography. This parameter is required for SSL connections.

**/SSL. ** The SSL option is used only for SSL connection without user
authentication

**/CHARSET=\<characte r set\>. ** This allows the client to specify a
character set for data encoding. When this option is set then all Java
strings, natively Unicode, are converted to the character set specified
here.

**/TIMEOUT=\<timeout\_ secs\>. ** Specifies the maximum amount of time
(in seconds) that the driver will wait for a response to a query. When
this time is exceeded a time-out error will be reported and the network
connection closed, assumed to be broken.

**/PWDCLEAR=\<authent ication_type\>. ** Specifies the authentication
mode; how the user credentials may be transmitted to the server. This
option can be one of the following 3 types: cleartext, encrypt, digest.
The default is digest.

"cleartext" will transfer the password to the server in cleartext

"encrypt" will transfer the password to the server using Virtuoso's
symmetric encryption technique.

"digest" will calculate an MD5 digest of the password (and some
additional session variables) that will be sent to the server to be
compared with the value calculated server-side.

**/log_enable=\<integ er\>. ** Set log_enable=2 in order to auto commit
on every changed row. Out of memory cannot be caused as with this
setting there is no image in the memory for rollback.

**/roundrobin. ** boolean attribute 1 - for use RoundRobin; 0 - do not
use . (used only if more than one host:post values are in connection
string)

**/fbs. ** integer attribute, prefetch buffer size (default is 100)

**/sendbs. ** integer attribute, socket send buffer size (default is
32768 bytes)

**/recvbs. ** integer attribute, socket receive buffer size (default is
32768 bytes)

**/usepstmtpool. ** boolean attribute 1 - for use PreparedStatement
pool; 0 - do not use (Only for Java 1.6 and above)

**/pstmtpoolsize. ** integer attribute, PreparedStatement pool size
(default is 25)

<div>

|                              |                                                                                                                                                                 |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                           |
|                              | Since JSSE has only incorporated SSL support for JDK 1.2 and above, SSL has only been implemented for the JDBC 2.x, JDBC 3.x and JDBC 4.x drivers for Virtuoso. |

</div>

</div>
