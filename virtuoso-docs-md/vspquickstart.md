<div id="vspquickstart" class="section">

<div class="titlepage">

<div>

<div>

## 3.11. Dynamic Web Pages

</div>

</div>

</div>

Virtuoso provides an extensible array or dynamic methods for creating
data driven web pages. Through runtime hosting Virtuoso can directly
host, store and drive:

|                          |
|--------------------------|
| PHP                      |
| JSP                      |
| ASP.Net                  |
| Perl                     |
| Python                   |
| Ruby                     |
| Natively - VSP and VSPX: |

Virtuoso Server Pages (VSP) is Virtuoso's specification for creating
dynamic database driven Web pages, these files have the extension ".vsp"
and are identical in functionality to: ASP, PHP, and JSP pages. A
fundamental difference between VSP pages and others (PHP, ASP. and JSP
pages) is the fact that VSPs are specialized forms of Virtuoso Stored
procedures which implies that data is in-process rather than
out-of-process, you do not have to complete a client-server connection
in order to actually bind to the data being used in a VSP page. The
obvious benefit being significant performance improvements over ASP,
PHP, and JSP pages (which all bind to data out-of-process).

Since VSP is essentially Virtuoso PL in a web page you can do anything
that PL can from or part of a web page either directly or from
interaction with the user. A massive advantage of using VSP is that you
do not have to worry about making connections to the database or the
overhead of RPC's because the HTTP server is built into Virtuoso. When
you write a VSP page the connection is assumed since you are already in
Virtuoso! VSP is server script and is therefore executed in the server
as it is encountered on the page. For this reason client (JavaScript)
and server script cannot directly interact but can supplement each
other. You can call JavaScript inside a VSP loop, for example, to
manipulate something that already exists on the page but you cannot pass
variables by reference from VSP directly to JavaScript or vice versa.
Page flow control is managed using FORMs. The state of the page is
defined in form fields such as INPUT boxes and TEXTAREA boxes and then
passed on to the next form or page using POST.

Virtuoso Server Pages for XML (VSPX) is an XML based framework and
state-managed system similar to ASPX. Pages are written in XML to
describe templates of data-aware web-widgets. This massively reduces the
code-effort and avoids many bugs by providing the functionality for you,
of which you specify the data-source, be it XML, SQL or other, and which
predefined control you want it represented by. VSPX allows for
custom-designed controls too. Since XML is a key factor for VSPX so does
XSLT for providing total separation between the data, business logic and
the layout on the web page.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                          |
|:--------------------------:|:-----------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                |
|                            | The Web Application Development Chapter. |

</div>

</div>
