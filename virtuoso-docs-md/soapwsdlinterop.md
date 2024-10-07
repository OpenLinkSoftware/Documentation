<div id="soapwsdlinterop" class="section">

<div class="titlepage">

<div>

<div>

### 17.2.6. SOAP/WSDL Interoperability

</div>

</div>

</div>

A key feature of the Web services promise is that Web services published
with one server can be called from any other client. The ability of each
implementation to make use of each others' output is called
interoperability. Thus, Web services created with Virtuoso should
interoperate smoothly with services created with Microsoft's .NET, Sun's
Java, and so on. Interoperable Web services mean that developers and
users do not have to think about which programming language or operating
system the services are hosted on.

The evolving nature of the SOAP specification, as well as its
complexity, leads to differences in SOAP implementations. Unfortunately,
these implementation differences decrease interoperability. To
counteract this problem, a volunteer group of SOAP application builders
has developed a series of interoperability tests.

OpenLink, as a participant in this group, ensures that its SOAP
implementation interoperates fully. This means that Virtuoso's SOAP
server properly exposes your Web services so they can be used by any
client. It also means that Virtuoso can call services published by any
compliant provider.

You can view the Round 1 "Interoperability Lab" at
<a href="http://www.xmethods.net/ilab/" class="ulink"
target="_top">www.xmethods.net</a> and the Round 2 at
<a href="http://www.whitemesa.com/interop.htm" class="ulink"
target="_top">www.whitemesa.com</a> . Please note that OpenLink has no
connection with these companies; they are simply places that volunteered
to host the testing reference documents on their servers.

The Round 2 tests include base functionality (which duplicates Round 1)
as well as more advanced tests labeled "Group B" and "Group C". The WSDL
published by OpenLink containing the descriptions of these tests can be
found at
<a href="http://demo.openlinksw.com:8890/Interop/" class="ulink"
target="_top">http://demo.openlinksw.com:8890/Interop/</a> . This URL
will be updated as new interoperability tests are devised.

The SOAP implementation passes all known interoperability tests.

</div>
