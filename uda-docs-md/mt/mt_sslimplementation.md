<div id="mt_sslimplementation" class="section">

<div class="titlepage">

<div>

<div>

## 9.2. Implementing SSL Encryption

</div>

</div>

</div>

<div id="mt_sslserverside" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.1. Server-side Configuration for SSL

</div>

</div>

</div>

In order to make use of this functionality, you need to create a
certificate on the server running the request broker. On Unix platforms
we have provided a bin/mkcert.sh script as part of the installation. On
other platforms you may have to run openssl by hand or use another
system to generate the PEM file (such as generating it on a unix server
and copying the files across).

A sample run of the mkcert.sh script, showing the various questions it
asks to identify your organization, follows:

``` programlisting
bash$ cd /usr/openlink/bin/
bash$ ./mkcert.sh mykey
Checking OpenSSL: OpenSSL 0.9.7d 17 Mar 2004
Generating a 512 bit RSA private key
.++++++++++++
.......++++++++++++
writing new private key to 'mykey.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Host name (externally visible) [host.example.com]:purple
Organization (eg. company) [OpenLink Software]:
Organizational Unit [Research & Development]:Product Development
State or Province Name (full name) []:Surrey
Locality Name (eg. city) []:Croydon
Country Name (2 letter code) [US]:UK
1024 semi-random bytes loaded
Generating DH parameters, 512 bit long safe prime, generator 2
This is going to take a long time
..+........................+...........................+.......+...........
[]
.+.....++*++*++*++*++*++*
subject= /CN=purple/O=OpenLink Software/OU=Product Development/ST=Surrey/L=Croydon/C=UK
notBefore=Nov 12 10:43:14 2004 GMT
notAfter=Nov 10 10:43:14 2014 GMT
MD5 Fingerprint=E0:DB:53:E7:E7:68:21:53:1C:2B:1E:8E:D9:BF:25:F0
Created private key parameters in mykey.key
Created public key parameters in mykey.cer
bash$
```

Having created the key-pair, you now need to tell the request broker to
use them. This requires the following lines to be present in the
rulebook (oplrqb.ini):

``` programlisting
[Request Broker]
....
SSLKeyFile = mykey.pem
SSLRequired = No            
```

The SSLKeyFile is the filename of the key you just created; to deny
connections without SSL, set SSLRequired=Yes instead.

You can also put these options in the individual database agent
sections, such that one key is used for e.g. Ingres, and another for SQL
Server, or one for your sales database and another for people coming in
from VPN IP#s (by editing the mapping rules to match on a per-IP#
basis). For example:

``` programlisting
[generic_sqlserver]
.....
SSLKeyFile = mykey-sqlserver.pem
SSLRequired = Yes                  ; All SQLServer connections
MUST use SSL
```

As an alternative to editing oplrqb.ini by hand, you can use the
web-based Administrator GUI, either the form or wizards, to set the SSL
Key File and SSL Required fields, thus:

<div class="figure-float">

<div id="mtsslserverbrokerform" class="figure">

**Figure 9.1.  Server-side SSL Configuration of Request Broker via Web
Assistant**

<div class="figure-contents">

<div class="mediaobject">

![Server-side SSL Configuration of Request Broker via Web
Assistant](images/ssl-server-form.gif)

</div>

</div>

</div>

  

</div>

<div class="figure-float">

<div id="mtsslagentform" class="figure">

**Figure 9.2. Server-side SSL Configuration at the database agent level
via Web Assistant Form**

<div class="figure-contents">

<div class="mediaobject">

![Server-side SSL Configuration at the database agent level via Web
Assistant Form](images/sslagent-www-form.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_sslclientside" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.2. Client-side Configuration for SSL

</div>

</div>

</div>

<div id="mt_sslclientwindows" class="section">

<div class="titlepage">

<div>

<div>

#### SSL Configuration for Windows Clients

</div>

</div>

</div>

On the client, when you configure a new DSN there is now a checkbox for
"secure connection" adjacent to the username and password. Checking this
will invoke use of SSL on the server for connections going through this
DSN. This applies also to the web-based DSN configuration utility.

<div class="figure-float">

<div id="mtsslwwwform" class="figure">

**Figure 9.3. Client-side SSL DSN Configuration via Web Assistant Form**

<div class="figure-contents">

<div class="mediaobject">

![Client-side SSL DSN Configuration via Web Assistant
Form](images/mtssl-www-form.gif)

</div>

</div>

</div>

  

</div>

<div class="figure-float">

<div id="mtsslwwwwizard" class="figure">

**Figure 9.4. Client-side SSL DSN Configuration via Web Assistant Form**

<div class="figure-contents">

<div class="mediaobject">

![Client-side SSL DSN Configuration via Web Assistant
Form](images/mtssl-www.gif)

</div>

</div>

</div>

  

</div>

<div class="figure-float">

<div id="mtsslagentform_01" class="figure">

**Figure 9.5. Client-side SSL DSN Configuration through native Windows
ODBC Administrator interface**

<div class="figure-contents">

<div class="mediaobject">

![Client-side SSL DSN Configuration through native Windows ODBC
Administrator interface](images/mtssl.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_sslclientjdbc" class="section">

<div class="titlepage">

<div>

<div>

#### SSL with JDBC Clients

</div>

</div>

</div>

The Java JDBC classes make use of J2SSE from Sun: as such, SSL is not
supported with users of JDK1.1; it requires
<a href="http://java.sun.com/products/jsse/index.jsp" class="ulink"
target="_top">a separate download from Sun</a> for JDK1.2 and 1.3; and
these classes come as standard with JDK 1.4 and 1.5.

An SSL connection can be made by specifying the /UseSSL attribute in
your JDBC connectstring, thus:

``` programlisting
jdbc:openlink://localhost:5001/SVT=SQLServer/Database=pubs/UseSSL/UID=sa/PWD=
java -classpath .;.\opljdbc3.jar -Djavax.net.ssl.trustStore=<KeystoreFile> sample
```

where 'sample' is the name the JDBC Program. Note the use of the
keystore file which is a unique feature of the JSSE implmentation, being
the location where the certificate information is stored.

Should the JSSE classes not be located the JDBC client will return an
error of the form:

``` programlisting
"You need to add JSSE to your CLASSPATH in order to make a SSL connection
java.sql.SQLException: [OpenLink][OPLJDBC2]Connection failed:
java.io.IOException: java.lang.NoClassDefFoundError:javax/net/ssl/SSLSocket"
```

</div>

</div>

<div id="mt_sslpossibleerrors" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.3. Error Messages

</div>

</div>

</div>

The introduction of SSL brings two new possible error messages to be
seen at connect-time:

|                                                                                                                                                                                                                                                                        |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| IM600 (ER_SSL_NOT_IN_CLIENT) "SSL initialization failure": this indicates that the client either has no SSL support built in, or that the underlying SSL library failed to initialize properly.                                                                        |
| IM601 (ER_SSL_NOT_IN_SERVER) "The server does not support SSL": this indicates that the server has no SSL support built in, or that the SSL library failed to initialize properly. It could also mean that the required certificate could not be loaded on the server. |

</div>

</div>
