<div>

<div>

<div>

<div>

## 3.13. Third-Party Runtime Typing, Hosting & User Defined Types

</div>

</div>

</div>

All barriers are broken. If Virtuoso does not readily provide the data
type that you require, then make your own. If you want a database
trigger to test data against existing externally developed logic, then
do that too. Virtuoso has been designed with open-design in mind giving
ultimate flexibility. These are the systems current available (linked to
the appropriate section of this documentation):

<div>

- Runtime Hosting

  support other environments and/or languages in-process with Virtuoso
  and utilizing Virtuoso storage methods such as DAV for replication and
  roll-out benefits.

  <div>

  - <a href="rthclr.html" class="link"
    title="18.2. CLR, .Net &amp; ASPX Host">CLR</a> &
    <a href="rthclrmono.html" class="link"
    title="18.3. CLR &amp; Mono">Mono</a>

  - <a href="javaextvm.html" class="link"
    title="18.4. Embedded Java VM API">Java</a> &
    <a href="rthjsp.html" class="link"
    title="14.9. Deploying JSP Applications">Jakarta JSP</a>

  - <a href="servphpext.html" class="link"
    title="14.8. Deploying PHP Applications">PHP</a>

  </div>

- <a href="vseplugins.html" class="link"
  title="18.6. VSEI Plugins">Plugins</a>

  enable support for other scripting langauges.

  <div>

  - <a href="perlhosting.html" class="link"
    title="14.10. Perl Hosting">Perl</a>

  - <a href="pythonhosting.html" class="link"
    title="14.11. Python Hosting">Python</a>

  - <a href="rubyhosting.html" class="link"
    title="14.12. Ruby Hosting">Ruby</a>

  </div>

- <a href="cinterface.html" class="link"
  title="18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)">Extensibility</a>

  the above features are applications of one or another of these
  interfaces, which are provided so that you have the potential to
  enhance Virtuoso further for more custom requirements.

  <div>

  - <a href="cinterface.html" class="link"
    title="18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)">Virtuoso
    Server Extension Interface (VSEI)</a>

  - <a href="vseplugins.html" class="link" title="18.6. VSEI Plugins">VSEI
    Plugins</a>

  - <a href="ch-functions.html#udt" class="link">User-Defined Types
    (UDT)</a>

  - <a href="createassembly.html" class="link"
    title="11.10. CREATE ASSEMBLY Syntax - External Libraries">Hosted/Imported
    Assemblies/Classes</a>

  </div>

- Web/Service Exposure

  every part of Virtuoso can be view, interacted with or consumed by
  some third-party via a plethora of interfaces, to name a few:

  <div>

  - <a href="ch-functions.html#soap" class="link">SOAP</a>

  - <a href="wsdl.html" class="link" title="17.2. WSDL">WSDL</a>

  - Static/Dynamic Web Content

  - XML/XSLT

    <a href="xmlstoragesystem.html" class="link"
    title="14.7.12. xmlStorageSystem API">XML Storage System</a>

    <a href="xmlrpc.html" class="link" title="17.10. XML-RPC support">XML
    RPC</a>

  </div>

</div>

</div>
