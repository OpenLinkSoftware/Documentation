<div>

<div>

<div>

<div>

## 2.10. Creating a Web Browser Application to Access RDF Data Using The Virtuoso ADO.Net Provider

</div>

</div>

</div>

This section will guide you through creating first a Web Service that
exposes RDF data from Virtuoso and then a simple web browser application
that consumes the Web Service and allowing you to access and explore the
RDF data by clicking on dereferenceable
<a href="ch-rdfandsparql.html#rdfiriidtype" class="link"
title="16.1.1. IRI_ID Type">IRIs</a> .

<div>

<div>

<div>

<div>

### 2.10.1. Pre-requisites

</div>

</div>

</div>

<div>

1.  The example assumes that you have a local Virtuoso server with the
    Northwind demo database installed. If the demo database is not
    already installed then download the <a
    href="http://download.openlinksw.com/packages/5.0/virtuoso/demo_dav.vad"
    class="ulink" target="_top">demo database VAD package</a>
    (demo_dav.vad) and install it. The VAD package will create a new
    database in Virtuoso called demo containing the familiar Northwind
    tables. It will also creates
    <a href="rdfviewsrdbms.html" class="link"
    title="16.5. Linked Data Views over RDBMS Data Source">Linked Data
    Views</a> of the Northwind tables. In the example we assume the
    database is accessible on a hostname of "demo.openlinksw.com" on the
    default port 80, where an actually live instance of the Virtuoso
    Demo database is hosted. Users would use the appropriate hostname
    and port number of their Virtuoso installation to create the sample
    application, and would be would be example.com for a default
    installation or whatever the
    <a href="ch-server.html#ini_uriqa" class="link" title="[URIQA]">URIQA
    DefaultHost</a> Virtuoso configuration parameter is set to when the
    demo database VAD package is installed.

2.  The Virtuoso ADO.Net provider for .Net 3.5 and the Entity Framework.

3.  Microsoft Visual Studio 2008

4.  The Virtuoso <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/cartridges_dav.vad"
    class="ulink" target="_top">Cartridges VAD package</a> .

</div>

</div>

</div>
