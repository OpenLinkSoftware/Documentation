<div>

<div>

<div>

<div>

## 2.12. Creating A Simple .NET RIA Services Application To Display Data From Virtuoso

</div>

</div>

</div>

.NET RIA Services is a new framework from Microsoft that simplifies the
development of n-tier web applications. A typical application will
consist of a presentation layer, application logic and a data access
layer. In these examples a combination of Silverlight 3 and .NET RIA
Services will provide the presentation layer and application layer while
the data will reside in Virtuoso and be accessed using the Virtuoso
ADO.NET provider. The first example demonstrates how to display data
from the Employee table in the Demo database in a grid on a web page.
The second example shows how to display IRIs from the Linked Data Views
of the demo data. The IRIs are used to create hyperlinks that are the
starting point for exploring the linked data.

<div>

<div>

<div>

<div>

### 2.12.1. Pre-requisites

</div>

</div>

</div>

<div>

1.  The example assumes that you have a local Virtuoso server with the
    Northwind demo database installed. If the demo database is not
    already installed then download the demo database VAD package
    (demo_dav.vad) and install it. The VAD package will create a new
    database in Virtuoso called demo containing the familiar Northwind
    tables. It will also creates Linked Data Views of the Northwind
    tables. In the example we assume the database is accessible on a
    hostname of "demo.openlinksw.com" on the default port 80, where an
    actually live instance of the Virtuoso Demo database is hosted.
    Users would use the appropriate hostname and port number of their
    Virtuoso installation to create the sample application, and would be
    would be example.com for a default installation or whatever the
    URIQA DefaultHost Virtuoso configuration parameter is set to when
    the demo database VAD package is installed.

2.  The Virtuoso ADO.Net provider for .Net 3.5 and the Entity Framework.

3.  Microsoft Visual Studio 2008

4.  The Virtuoso <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/cartridges_dav.vad"
    class="ulink" target="_top">Cartridges VAD package</a> .

5.  <a
    href="http://www.microsoft.com/downloads/details.aspx?familyid=9442b0f2-7465-417a-88f3-5e7b5409e9dd&amp;displaylang=en"
    class="ulink" target="_top">Silverlight 3 Tools for Visual Studio 2008
    SP1</a> .

6.  <a
    href="http://www.microsoft.com/downloads/details.aspx?FamilyID=76bb3a07-3846-4564-b0c3-27972bcaabce&amp;displaylang=en"
    class="ulink" target="_top">Microsoft .NET RIA Services July 2009
    Preview</a> .

</div>

</div>

</div>
