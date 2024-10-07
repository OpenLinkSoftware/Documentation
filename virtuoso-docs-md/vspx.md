<div id="vspx" class="section">

<div class="titlepage">

<div>

<div>

## 14.4. Virtuoso Server Pages for XML (VSPX)

</div>

</div>

</div>

VSPX is an XML vocabulary for server generated HTML and XHTML pages that
may or may not be bound to native or third-party data sources. VSPX is a
framework for building and deploying dynamic web content atop Virtuoso.
VSPX offers a widget set and event model which is similar to that of GUI
tool kits, providing the developer with much automation for common web
development tasks. Many controls are tightly integrated with the
Virtuoso database, providing seamless data binding to local or remote
relational and XML data. Server side scripting in VSPX is performed in
Virtuoso/PL. The VSPX source code consists of HTML or XML with
interspersed VSPX specific XML elements which describe the UI control
hierarchy of the page.

VSPX covers the following areas:

|                                                                                                                                                                                                                                                                                                     |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Rich set of controls, covering all basic HTML plus complex composite controls like data grids and tree browsers.                                                                                                                                                                                    |
| Session management - Transparent session and session state handling using cookies, URL poisoning or digest authentication.                                                                                                                                                                          |
| Form entry validation server and client side.                                                                                                                                                                                                                                                       |
| Single and multi-row controls for viewing and directly updating SQL tables, including scrolling through long result sets.                                                                                                                                                                           |
| Repeating and conditional instantiation of UI elements based on run time choices.                                                                                                                                                                                                                   |
| Event model for HTTP request handling, providing distinct phases for creating the controls, retrieving data, processing posted data, preserving state and rendering for a user agent.                                                                                                               |
| Object oriented architecture, allowing easy definition of subclasses of existing controls for new functionality. It suffices to implement a new SQL class with a few predefined methods and to implement an XSLT rule for generating the code based on the external XML syntax for the new control. |
| Easy automatic generation of VSPX pages. The pages being XML, it is simple to automate generating pages based on other data, such as automatically making table maintenance pages based on a SQL table definition.                                                                                  |

The VSPX development cycle consists of editing .vspx resources in the
file system or Virtuoso DAV. The editing can take place using a regular
text editor or a supporting HTML editor.

<div id="vspxprocmodel" class="section">

<div class="titlepage">

<div>

<div>

### 14.4.1. Processing Model

</div>

</div>

</div>

A VSPX page describes a web page in terms of static XHTML plus XML
elements in the VSPX namespace, `"http://example.com/vspx/"` . This
namespace is abbreviated as `v:` in the rest of this document.

Elements in the `v` namespace introduce VSPX elements, options or
controls. Some of these may in turn have HTML children. VSPX elements
with HTML children are called templates, as these will process their
HTML contents at run time, typically modifying these based on run time
data.

<div class="figure-float">

<div id="vspxconcept" class="figure">

**Figure 14.15. VSPX Conceptual Diagram**

<div class="figure-contents">

<div class="mediaobject">

![VSPX Conceptual Diagram](images/vspxconcept.jpg)

</div>

</div>

</div>

  

</div>

When the page is requested, the system checks whether it is already
compiled and compiles it if the compilation is absent or older than the
source. The VSPX compilation has two phases: pre-processing and
compilation. The first phase expands included files and applies the
external macro XSL-T sheet. The result of which is a single page
encapsulating all related components which will be stored in a .vspx-m
intermediary file. The result of second phase, compilation is a single
.vspx-sql file containing class and method definitions for a subclass of
the generic VSPX page class. All code directly derived from the
pre-processed page will be found in this file. The file can of course
refer to outside Virtuoso/PL code.

The results of compilation process are stored usually in an OS dependent
temporary directory. This would be the \$TMPDIR for UNIXes or %TMP% for
Windows platforms. If these environment variables are not available it
will be some default system specific location, such as `/var/tmp` or
`/tmp` on Unix's. Note that this temporary storage applies to the VSPX
pages that are stored within the file system, for the WebDAV repository
the product of compilation is stored as described below. For development
purposes the use of temporary storage can be turned off by executing:

``` programlisting
registry_set ('__no_vspx_temp', '1')
```

from ISQL. In this case both file-system and WebDAV repository will
contain .vspx-m and .vspx-sql files in the same place and with the same
name as the VSPX source file. VSPX temporary storage can be re-enabled
in the same way but using the string value '0' instead of '1'. Note that
this is a string rather than a number.

Any VSPX page invocation, whether through the GET or POST HTTP request,
consists of the following steps:

<div class="itemizedlist">

- **Instantiation. ** The tree of widgets is built according to the page
  description. The possibly saved state of controls is restored when
  instantiating these, if there was a persistent state vector as part of
  the post request or stored on the server.

- **Data Binding. ** The tree is traversed and attributes or subtrees
  depending on SQL expressions are set or instantiated.

- **Post Processing. ** If this was a POST request, the control that was
  mentioned in the POST gets a post event, as well as any enclosing
  controls or input controls affected by the posted data. The subtree
  containing the submit button originating the POST gets the post event
  to all its nodes, children before parents. Post data server side
  validation takes place during this phase. Any database updating takes
  place during this processing, typically inside the post handler of the
  form element, after the post handling of each individual field is
  complete.

- **Before Render. ** The control tree is now assumed to be in a state
  reflecting the operation intended by the POST or GET. This pass
  typically collects the page state to be persisted. Other application
  dependent finalization operations can be added here.

- **Render. ** This pass is a depth first traversal of the control tree
  and is responsible for generating the text to be sent to the user
  agent. This will typically be straight HTML, but can also be something
  else, such as XML for post processing in a style sheet.

</div>

Just as with VSP pages the code of the page make call http_xslt(), this
has the effect of applying the specific stylesheet to the HTML text
produced by the render phase. Since output contains HTML tags generated
by VSPX controls, the style-sheet should have these as a general rule to
leave these unchanged. The http_xslt () is more useful with VSP pages
producing XML than with VSPX pages.

</div>

</div>
