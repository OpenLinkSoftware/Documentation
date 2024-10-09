<div>

<div>

<div>

<div>

## 17.3. WebID Protocol Support

</div>

</div>

</div>

WebID Protocol is an authentication and authorization protocol that
links a "Web ID" or "<a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/GetAPersonalURIIn5MinutesOrLess"
class="ulink" target="_top">Personal URI</a> " to a public key to create
a global, decentralized, distributed, and secure authentication system
that functions with existing browsers.

WebID Protocol uses PKI standards - usually thought of as hierarchical
trust management tools -
<a href="http://blogs.sun.com/bblfish/entry/foaf_ssl_pki_and_the"
class="ulink" target="_top">in a decentralized web-of-trust way</a> .
The web of trust is built using semantic web vocabularies (particularly
<a href="http://www.foaf-project.org/" class="ulink"
target="_top">FOAF</a> ) published in RESTful manner to form Linked
Data.

Based on well known existing standards, WebID Protocol is currently in
development, and is being discussed on the
<a href="http://lists.foaf-project.org/mailman/listinfo/foaf-protocols"
class="ulink" target="_top">FOAF protocols mailing list</a> .

For the most recent description of the protocol, read the one-page
"<a href="http://blogs.sun.com/bblfish/entry/foaf_ssl_adding_security_to"
class="ulink" target="_top">WebID Protocol: Adding Security to Open
Distributed Social Networks</a> ". For a more detailed explanation of
how the authentication works, see "<a
href="http://blogs.sun.com/bblfish/entry/more_on_authorization_in_foaf"
class="ulink" target="_top">WebID Protocol: Creating a Web of Trust
without Key Signing Parties</a> ".

Automatic discovery of interpersonal trust relationships enables
automatic application of appropriate permissions.

In other words, data owners can set fuzzy permissions like "only let my
friends see this" or "only let my family edit this." Applications can
discover the relationships between the data owner and the data
requester/user, and permit (or disallow) any attempted actions, without
needing the data owner to explicitly set permissions for each potential
user.

One example might be a parent setting permissions on a photo gallery, to
permit viewing only by "immediate family". The parent need not list each
and every such relative specifically for this application - and need not
add new permissions for a new family member (whether by marriage, birth,
or otherwise), though they do need to be added to the owner's FOAF. When
a new user comes and asks to see the pictures, the gallery application
would check the relationships declared by each person (the owner and the
visitor), and if they matched up (in other words, the visitor could not
get in simply by claiming a family relationship; the relationship must
be confirmed by the owner's FOAF data), the pictures would be shown.

<div>

<div>

<div>

<div>

### 17.3.1. x.509 certificate

</div>

</div>

</div>

The WebID Protocol consumer needs an x509 certificate with v3 extension
"Subject Alternate Name". This attribute is used for the owner's Web ID.
For testing purposes we used OpenSSL demo CA to generate such
certificates. If you are not using the OpenSSL demo CA, you must first
setup a self-signed CA; read OpenSSL documents on how to do this.

<div>

1.  Add the following line to the \[usr_cert\] section of the
    openssl.cnf file:

    ``` programlisting
    subjectAltName=$ENV::ALTNAME
    ```

2.  Set the environment variable ALTNAME to the owner's Web ID, e.g.,

    ``` programlisting
    export ALTNAME=URI:http://example.com/dataspace/person/myname#this
    ```

3.  Make a self-signed certificate, e.g.,

    ``` programlisting
    $ CA.pl -newreq (follow the dialog)
    $ CA.pl -sign
    ```

4.  When asked to commit the certificate, make sure you see several
    lines above, like:

    ``` programlisting
     X509v3 Subject Alternative Name:
                    URI:http://example.com/dataspace/person/myname#this
    ```

5.  If your browser wants a PKCS#12 bundle, you must make one:

    ``` programlisting
    $ openssl pkcs12 -export -in newcert.pem -inkey newkey.pem -out mycert.p12
    ```

6.  Rename newcert.pem and newkey.pem, to mycert.pem and mykey.pem for
    example. The PEM format of the certificate will be needed below.

</div>

</div>

</div>
