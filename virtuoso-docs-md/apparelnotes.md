<div id="apparelnotes" class="section">

<div class="titlepage">

<div>

<div>

## 23.4. Release Notes

</div>

</div>

</div>

<div id="feat30" class="section">

<div class="titlepage">

<div>

<div>

### 23.4.1. New Features

</div>

</div>

</div>

<div class="itemizedlist">

- <span class="emphasis">*SOAP 1.1 Implementation*</span> - this new
  release includes a wide range of new SOAP features, bringing it up to
  date with the most recent developments of this rapidly evolving
  technology :

- <div class="itemizedlist">

  - Flexibility in configuring SOAP access points using a WEB based user
    interface allowing exposure of selected stored procedures as SOAP
    services. These procedures may be local or linked from any 3rd party
    databases. The effective privileges for running SOAP exposed
    procedures can also be set at the access point level.

  - Improved SOAP to Virtuoso/PL Language Binding allowing the receiving
    and returning of arbitrarily complex arrays and structures, using
    XML Schema to describe the mapping of Virtuoso internal types to
    precisely match specification expressed in XML Schema.

  - Automated generation of WSDL descriptions of SOAP access points -
    Simple procedure parameter lists map automatically to SOAP types
    described in XML Schema. For complex types, procedures can be
    annotated with explicit references to XML Schema types. Thus the
    developer has complete control over the presentation of web
    services.

  - Import of WSDL descriptions of outside web services. Virtuoso
    automatically generates Virtuoso/PL wrappers based on an outside
    WSDL file, making all its services transparently callable as stored
    procedures from Virtuoso/PL.

  - Virtuoso's SOAP client and server implementations pass the SOAP
    Interop tests levels 1, 2 and most of 3.

  - Virtuoso Service Module for XML (VSMX) is a mechanism provided by
    Virtuoso for testing SOAP messages by automatically generating a
    test page - a VSMX file - that has the extension .vsmx. The VSMX
    file is generated at the same time as the WSDL file is generated,
    giving instant access to your SOAP messages to test they perform as
    expected. Web Service developers would use VSMX to forego the test
    bed creation step in light of automatic test page generation.
    Project managers can easily keep track of their developers progress
    by checking the test page periodically.

  </div>

- <span class="emphasis">*XSLT 1.1 Implementation*</span> - support for
  the XSLT 1.1 Draft Specification has been added.

- <span class="emphasis">*Exposure of Stored Procedures as Web
  Services*</span> - Stored procedures can be exposed as SOAP services
  very simply from Virtuoso, whether the procedures are native Virtuoso
  or on remote data sources. This powerful ability means that any
  database servers already existing within an organization can easily
  become a component in an eBusiness solution using Virtuoso.

- <span class="emphasis">*XML Schema*</span> - contains a built-in XML
  Schema 2001 validator. This is accessible from Virtuoso/PL as a
  function and is used for SOAP and XQuery where appropriate.

- <span class="emphasis">*XML Templates*</span> - Virtuoso XML templates
  allow execution of SQL/XML queries over HTTP to obtain an XML document
  in response and/or perform some operation in the database using
  updategrams. The XML Template file can be stored either on the file
  system, WebDAV repository or stored on another HTTP server being
  referenced by a URL parameter.

- <span class="emphasis">*XQuery*</span> - Virtuoso provides support for
  the XQuery 1.0 XML Query Language specification. This specification is
  currently in the working draft stage at the W3C XML Query Working
  Group working in collaboration with the W3C XSL Working Group.

- <span class="emphasis">*Web DAV*</span> - support for redirection of
  resources, using the Web DAV Redirect Reference Resource Protocol
  draft 02 specification.

- <span class="emphasis">*Remote Stored Procedures*</span> - Stored
  Procedures located in remote databases can now be linked into the
  Virtuoso Server in the same manner as you would link in tables or
  views. This enables remote stored procedures to be readily and easily
  exposed as WEB Services.

- <span class="emphasis">*OLE DB Provider*</span> - native OLE DB
  Provider is now available allowing direct connection from ADO and .Net
  applications.

- <span class="emphasis">*JDBC Driver*</span> - enhanced JDBC support
  with full compliance with JDBC J2EE standard.

- <span class="emphasis">*Free Text*</span> - The full text indexing
  capability has been extended, giving the developer flexibility in
  choosing complex, multi-part document id's for application specific
  sorting of hits, efficient storage of secondary, non-free text data in
  the free text index for best retrieval performance, options for
  restarting searches at a specific hit, ascending and descending orders
  of document id's and more.

- <span class="emphasis">*Free Text Triggers*</span> - The free text
  triggers system allows persisting free text queries into a table, so
  that when a free text index is updated, the incoming data gets
  automatically matched against these persisted criteria, generating
  hits as the index is updated. This allows very high performance
  filtering of fast changing text data, e.g. news feeds without having
  to run periodic query batches and is ideal for creating personalized
  information feeds.

- <span class="emphasis">*LDAP*</span> - support for the Lightweight
  Directory Access Protocol (LDAP) protocol for accessing online
  directory services.

- <span class="emphasis">*Enhanced Flexibility of Database and VDB
  security*</span> - New SQL hooks allow the developer to customize
  password checking at the time of accepting SQL connections into the
  server. Another hook allows an application to dynamically determine
  the login/password to use when connecting to a remote database. These
  hooks make it possible for example to consult an LDAP directory for
  user information when validating logins.

- <span class="emphasis">*File DSN support*</span> - with the ability to
  describe a database connection in a simple disk file, Virtuoso becomes
  more portable, and no longer dependent on per-machine DSNs. If you use
  file DSNs you can move your database file and your connection
  information to any computer that has the appropriate drivers
  installed.

- <span class="emphasis">*Scrollable cursor support in the stored
  Procedure Language (PL)*</span> - Virtuoso PL now allows you direct
  access to all ODBC standard features of scrollable cursors through PL
  routines. ODBC calls are still supported but you have a choice of
  which level to write your code.

</div>

</div>

</div>
