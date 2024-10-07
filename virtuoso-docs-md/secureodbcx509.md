<div id="secureodbcx509" class="section">

<div class="titlepage">

<div>

<div>

### 7.3.2. Using X509 Certificates With ODBC Connection

</div>

</div>

</div>

Virtuoso can be configured to authenticate ODBC logins with a single
X.509 certificate. The certificate must be registered server side for
this purpose and may contain an additional custom attribute for the
users SQL account name. In this way all login information is held in the
possibly password protected certificate. The user specifies the
certificate path in the place of the user name and the certificate
encryption password as the password. This works with the login dialog of
the ODBC driver or within a SQLDriverConnect login string.

It is also possible to set up the ODBC client to check for the server's
X.509 certificate by specifying a client side CA (Certificate Authority)
list.

The X509 certificate can be used for authentication with the Virtuoso
server via SSL. In this case the ODBC client will use an X.509
certificate which contains a SQL username as an extension. This
extension is added when the certificate is issued. Since an object ID
(OID) of the username attribute can be used any valid object identifier
that does not conflict with existing OIDs (for example
2.16.840.1.NNNNNN). It will be best to have one's own registered OID for
that purpose.

<div id="secureodbcx509foafsll" class="section">

<div class="titlepage">

<div>

<div>

#### WebID Protocol ODBC Login

</div>

</div>

</div>

Virtuoso supports WebID Protocol ODBC Login. Thus, the INI parameter
X509ClientVerify can accept the following values:

<div class="itemizedlist">

- 0 - do not require

- 1 - ask for trusted certificates

- 2 - optionally ask, if certificate is given will be verified

- 3 - accept optionally any certificate even self-signed

</div>

If certificate contains WebID, the odbc login will use it. The WebID can
be setup to particular account via Conductor's users interface.

A typical \[Parameters\] INI section should contain:

``` programlisting
SSLServerPort         = 1113
SSLCertificate          = keys/server.crt
SSLPrivateKey         =  keys/server.key
X509ClientVerify      = 3
```

The client could connect in following way:

``` programlisting
isql 1113 "" -X client.p12 -T server.crt
```

Note: The client certificate client.p12 contains WebID which is
registered to some sql user account via Conductor.

</div>

<div id="secureodbccertgen" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Client Certificate Generation Using "openssl" Tool

</div>

</div>

</div>

To generate X509 certificates one can use the "openssl" tool obtained
freely from <a href="http://www.openssl.org/" class="ulink"
target="_top">www.openssl.org</a> . The `openssl.cnf` configuration file
must be edited to include the new extension for sqlUserName, but first
we have to find the hexadecimal representation of the SQL Username. Then
you can proceed the use the openssl to create and confirm the
certificate. Follow the steps below:

<div class="orderedlist">

1.  <span class="emphasis">*Find the HEX representation of the SQL
    Username*</span>

    You can either work this out from ASCII codes or use a hexdump
    utility found on most Unix platforms. The following command would be
    sufficient, replacing \<user_name\> with the actual username:

    ``` programlisting
    $ echo -n "<user_name>" | hexdump -e '":" 1/1 "%02X"'
    ```

    For example, the username `'dba'` would be `:64:62:61` .

2.  <span class="emphasis">*Edit the OpenSSL config file:
    openssl.cnf*</span>

    Open the file in a text editor of your choosing and add the
    following:

    ``` programlisting
    [ new_oids ]
    sqlUserName=2.16.840.1.NNNNNN.1

    ...
    [ usr_cert ]
    ...
    sqlUserName = DER:NN:NN:NN:NN:NN.....
    ```

    replacing `:NN:NN.....` with the hexadecimal representation of the
    username we discovered in the previous step.

3.  <span class="emphasis">*Make New Certificate Request*</span>

    Make new certificate request using the command:

    ``` programlisting
    $ openssl req -new
    ```

    The tool will ask for certain details. Once completed it will
    generate a private key also.

4.  <span class="emphasis">*Generate Certificate*</span>

    Assuming the role of CA, generate a certificate using the request
    from the previous step, using the following command:

    ``` programlisting
    $ openssl ca -in <req_file>
    ```

    The tool will print the details of request and will ask you to sign
    and commit the certificate into the CA repository.

5.  <span class="emphasis">*Verify New Certificate*</span>

    Check that the certificate contains the right SQL account name; use
    the following command to obtain a text dump of the certificate:

    ``` programlisting
    openssl x509 -in <certfile> -text -noout
    ```

    Now we can scan the contents of the output for the extension entries
    we added earlier:

    ``` programlisting
    >>>>>
    X509v3 extensions:
    ....
    2.16.840.1.NNNNNNN.1:
    <SqlAccountName>
    ^^^^^^ this should match the new OID ^^^^^
    >>>>>
    ```

</div>

</div>

<div id="secureodbcclisrvsetup" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Server Configuration

</div>

</div>

</div>

The Virtuoso server can work in two modes based on an SSL connection:

|                                                                                                                                                                               |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*basic*</span> - this is when only connection is secured, no certificate verification. The client is not required to have its own trusted certificate. |
| <span class="emphasis">*trusted*</span> - additional mechanisms are enabled to check client's certificate. in this case the client is required to have a trusted certificate. |

To allow Virtuoso to check the client's certificates, the virtuoso.ini
file must contain the following entries in \[Parameters\] section:

``` programlisting
; Basic session encryption only parameters
SSLServerPort           = 1113
SSLCertificate          = ./srv.cert.pem ; server's certificate
SSLPrivateKey           = ./srv.key.pem  ; server's private key, must match the certificate
; Trusted operation parameters
X509ClientVerify        = 1
X509ClientVerifyCAFile  = ./ca.pem     ; CA list; file containing certificates of acceptable CA
X509ClientVerifyDepth   = 1            ; dependent of type of certificate checking can be &gt;1
X509ExtensionOID      = 2.16.840.1.NNNNNNN.1 ; the OID value, same as that used to make client's certificates
```

All certificate/key files need to be in PEM format.

The server needs an "SSLCertificate" and "SSLPrivateKey" to begin
listening on the "SSLServerPort". These are essential for the secure
operations. Furthermore the certificate must match the private key;
non-matching certificate and private keys will prevent server startup
and an error will be logged. The private key is required to guarantee
that the certificate's claim is true. The server certificate is used by
the client to identify the server. The client can retrieve and verify
this key and choose whether the server an be trusted depending on
circumstances.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                 |
|:----------------------------:|:------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                           |
|                              | basic operation (SSL/TLS) encryption only cannot be used to identify a client with certificate. |

</div>

The "X509ClientVerifyCAFile" is a file containing a CA's (Certificate
Authority) certificates that the server can use to verify client
certificates. The client certificate verification in general depends on
the "X509ClientVerify" flag, which enables or disable this feature. The
'X509ClientVerifyDepth" parameter is used to verify to what degree
server will trust the client's certificate. The lower the value, the
higher the restriction levels, with a minimum value of 1. This means
that the server will look in CA's certificates to find who has issued
the client certificate. If there is no matching CA entry the connection
will be rejected; If there is a matching entry then verify the issuer
chain; If issuer chain is greater than "X509ClientVerifyDepth", the
connection will be rejected.

All file paths above must be either absolute or relative to the server
working directory.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                   |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                             |
|                              | If primary key file is encrypted then the server must be started in foreground mode so that a password can be supplied in order to open the file. |

</div>

</div>

<div id="secureodbcclisetup" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Client Configuration

</div>

</div>

</div>

The following connection options control the client's behavior regarding
SSL:

|                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Encrypt*</span> - specifies type of secure connection to be used.                                             |
| <span class="emphasis">*ServerCert*</span> - (optional) to specify which certificate(s) are to be used to verify server certificates. |

The <span class="emphasis">*Encrypt*</span> option can be set to '1' to
specify a basic secure connection; no server identity verification will
be performed. Note that this is only possible when the server is also
set to make basic SSL connections.

To ensure server's identity the <span class="emphasis">*Encrypt*</span>
option must be set to full or relative (to application working
directory) path to the file containing client's certificate and private
key. This file can be encoded in PKCS#12 or PEM format. The certificate
and private key contained may be generated using the steps outlined
above.

When the Encrypt option is set to point to a certificate file, the
<span class="emphasis">*ServerCert*</span> option must be set to the
full or relative path to file containing list of CA certificates in PEM
format. The content of this file will be used to verify server's
certificate.

When using these options the UID connection-option must be set to an
empty string to enable certificate authorization. The PWD option will be
used to open the private key.

Here is an example of an ODBC connect-string:

``` programlisting
...
connectString =
"HOST=localhost:1113;UID=;PWD=keysecret;ENCRYPT=c:\certs\mycertwithkey.p12;SERVERCERT=c:\certs\ca.pem"
...
```

If client's certificate does not contains user name for SQL login then
the server will try matching the certificate fingerprint against
registered certificates. If any SQL account has such a certificate
registered it will be used for login. Otherwise login will be rejected.

</div>

<div id="secureodbcregkeys" class="section">

<div class="titlepage">

<div>

<div>

#### Registering Keys with Virtuoso

</div>

</div>

</div>

To enable a client certificate to be used for authorization, the DBA
must register it's MD5 fingerprint (checksum) in the database.
Registered certificates can be removed from system. Two functions exist
for the purposes: `USER_CERT_REGISTER()` , and `USER_CERT_UNREGISTER()`
. Both functions rely on the MD5 checksum of the certificates being
registered or un-registered, therefor you have the option of supplying
these functions with the certificate file or the MD5 checksum directly.

The functions are:

`USER_CERT_REGISTER (user_name , certificate , password , type );`

`USER_CERT_UNREGISTER (user_name , certificate , password , type );`

The registered certificate's fingerprints are kept in the
DB.DBA.SYS_USERS table as vectors of strings under the
'LOGIN_CERTIFICATES' user option value (U_OPTS column). The data stored
there can be retrieved using a third function:

`USER_GET_OPTION()`

For example, one might invoke:

``` programlisting
USER_CERT_REGISTER ('DBA', 'file:/dba.pem', '', 'PEM');
```

Note that 'file:' URL is needed to designate certificate is in a file on
file system.

The above action can be performed also without certificate supplied if
the MD5 fingerprint is known:

``` programlisting
USER_CERT_REGISTER ('DBA', 'D9:6D:47:D7:67:47:D7:3C:2C:E0:89:91:F3:BC:E7:59');
```

and

``` programlisting
USER_CERT_UNREGISTER ('DBA', 'D9:6D:47:D7:67:47:D7:3C:2C:E0:89:91:F3:BC:E7:59');
```

</div>

</div>
