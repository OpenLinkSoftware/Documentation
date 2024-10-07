<div id="vfoafsslsethttps" class="section">

<div class="titlepage">

<div>

<div>

### 17.3.2. Setting up Virtuoso HTTPS

</div>

</div>

</div>

To enable the HTTPS listener, you will need another certificate.
Existing certificates may not have Subject Alternate Name, so you may
want to generate one as in the previous section.

<div class="orderedlist">

1.  The next step is to move newcert.pem, newkey.pem, and cacert.pem
    into the server's working directory. In our test case, we put the
    keys in a 'keys' sub-directory, and added the following lines to the
    \[HTTPServer\] section of the Virtuoso INI file, virtuoso.ini:

    ``` programlisting
    SSLPort                     = 4443
    SSLCertificate              = ./keys/localhost.cert.pem
    SSLPrivateKey               = ./keys/localhost.key.pem
    X509ClientVerifyCAFile      = ./keys/localhost.ca.pem
    X509ClientVerify            = 1
    X509ClientVerifyDepth       = 15
    ```

2.  Also in the Virtuoso INI file, in the \[URIQA\] section, DefaultHost
    (localhost:8890 below) must be edited to correspond to the
    DNS-resolvable host name ("CNAME") of the Virtuoso host, combined
    with the ServerPort as set in the \[HTTPServer\] section of the same
    INI file.

    ``` programlisting
    [URIQA]
    DynamicLocal = 1
    DefaultHost  = localhost:8890
    ```

    For instance, if the CNAME of the host is virtuoso.example.com, and
    the ServerPort is 4321, the DefaultHost should be set to
    virtuoso.example.com:4321

    ``` programlisting
    [URIQA]
    DynamicLocal = 1
    DefaultHost  = virtuoso.example.com:4321
    ```

3.  Start the Virtuoso server, and look at the log file. Once HTTPS is
    up, you should see something like:

    ``` programlisting
    HTTPS Using X509 Client CA ....
    HTTPS/X509 server online at 4443
    ```

</div>

</div>
