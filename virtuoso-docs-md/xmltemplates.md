<div>

<div>

<div>

<div>

## 15.6. XML Templates

</div>

</div>

</div>

Virtuoso XML templates allow execution of queries over HTTP in order to
achieve any combination of the following:

|                                                                                                            |
|------------------------------------------------------------------------------------------------------------|
| Execution of SQL queries returned in an XML formatted resultset.                                           |
| Execution of XQuery and XPath queries against XML and SQL-XML documents in the Virtuoso WebDAV repository. |
| Use an XML notation (Updategrams) to insert/update/delete SQL data.                                        |

An XML template is an XML file containing a query, optional parameters
with default values for the query, a place to specify an XSL stylesheet,
and a section for specifying updatagram based synchronization metrics.
They are meant to be executed as an XML described short-cut to an query
result, an XML document. The XML document returned from calling an XML
template can be served raw, or transformed using XSLT.

XML templates can be executed from within Virtuoso procedure language
using the
<a href="fn_xml_template.html" class="link" title="xml_template"><code
class="function">xml_template()</code></a> function, or published as
SOAP compliant XML Web Services, which makes them accessible to any SOAP
and WSDL aware environment.

XML templates provide quick easy access to results from a SQL query as
usual, but now this can be saved to a file. The results are not saved,
just the query definition. You can use this feature to rapidly produce
dynamic reports that can potentially be rendered in different ways by
providing an alternate stylesheet. The report can be refined on the fly
by providing parameters for the query. The output is reachable via HTTP
directly by providing the URL to the template.

When XML templates are executed via HTTP, the XSLT transformation will
be performed automatically if the "sql:xsl" attribute is specified in
the templates root element. This means that the default XSLT
transformation cannot be avoided if the template is executed over HTTP.
However, you have the option whether to apply the transformation or not
when using the `xml_template()` function. XML templates containing
\<sql:query\> elements return either results or messages regarding the
queries. An XSLT transformation can be made on the result from
`xml_template()` using the returned XSLT sheet URL. Hence it is
conditional in PL programming. The application developers can choose to
either use the style sheet specified in the template, use another style
sheet, or skip XSLT transformation entirely. This feature provides full
flexibility for the procedure developer.

XML templates are intended for execution over HTTP. The template file
can be stored either on the file system, WebDAV repository or stored on
another HTTP server being referenced by a URL parameter. Specifying a
template as a URL parameter naturally introduces a new potential
security risk associated with the template owners web server.

<div>

<div>

**Figure 15.1. Conceptual View of XML Templates**

<div>

<div>

![Conceptual View of XML Templates](images/xmltemplatediagram.jpg)

</div>

</div>

</div>

  

</div>

Queries and updategrams can be parameterized. The parameters must be
defined in the header element, which consists of zero or more param
elements. The default value of the parameter is enclosed within the
param element whose values are typically replaced during the execution
phases. When XML templates are executed from the `xml_template()`
function the parameters are specified in a vector as an input parameter.
When XML templates are executed via HTTP the parameters are contained in
the URL.

<div>

|                                        |                                                                                                                                                                                          |
|:--------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Important\]](images/important.png) | Important                                                                                                                                                                                |
|                                        | All \<sql:param\> parameter definitions in the template for SQL queries need to be named parameters, and the names must be preceded by a colon i.e. :ParamName (note colon at the front) |

</div>

. The colon is not required for updategrams.

If an error occurs as a result of executing a SQL query or updategram,
the comment will be included in the result detailing the error. The
subsequent queries and updategrams will still be executed.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>The <a
href="expwsmodules.html" class="link"
title="17.13. Exposing Persistent Stored Modules as Web Services">Exposing
Persistent Stored Modules as Web Services</a> section as this also
describes how XML Templates can be published to web services as a SOAP
messages using a PL Wrapper. This is achieved using the Administrative
Interface.</p>
<p><a href="fn_xml_template.html" class="link"
title="xml_template"><code
class="function">xml_template()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

<div>

<div>

<div>

<div>

### 15.6.1. Syntax

</div>

</div>

</div>

The format of an XML template is shown below, illustrating how SQL
queries and updategrams are specified:

``` programlisting
<root xmlns:sql="urn:schemas-openlink-com:xml-sql" sql:xsl='xslt url' >
  <sql:header>
    <sql:param name=":...">..</sql:param>
    <sql:param name=":...">..</sql:param>...
  </sql:header>
  <sql:query>
    select ... for xml ..
  </sql:query>
  <sql:sync>
    Update gramm
  </sql:sync>
</root>
```

The root element can contain two attributes. The first is the required
namespace declaration of xmlns:sql="urn:schemas-openlink-com:xml-sql",
required to identify the XML as an XML template. The second attribute
allows the specification of an optional XSLT stylesheet to be applied to
the resulting XML document, if applicable. The XSLT stylesheet file can
be specified as either a relative or absolute URL.

The following elements can be defined in the "sql" namespace for an XML
Template:

<div>

- The

  <span class="emphasis">*"root"*</span>

  tag can be any name, its purpose is to provide the top-level element
  required for any well-formed XML, and provides the root element for
  the resulting XML document, if any.

- <span class="emphasis">*\<sql:header\>*</span>

  This tag is used to hold the parameters for templates execution such
  as \<sql:param\> elements. The \<sql:header\> element allow us to
  define multiple parameters.

- <span class="emphasis">*\<sql:param\>*</span>

  This element is used to define a named parameter that is passed to the
  query and/or updategram inside the template. Each \<xsl:param\>
  element defines one parameter. Multiple \<xsl:param\> elements can be
  specified within the \<sql:header\> element.

- <span class="emphasis">*\<sql:query\>*</span>

  This element is used to specify SQL/XML queries. It is possible to
  specify multiple \<sql:query\> elements within a single template.

- <span class="emphasis">*\<sql:sync\>*</span>

  This element is used to contain updategrams.

</div>

\<sql:query\> and \<sql:sync\> entries are executed sequentially in the
order they appear as separate transactions. Therefore, if you have
multiple \<sql:query\> or \<sql:sync\> elements in the template, if one
fails, the others will proceed.

XML templates can be executed directly from Virtuoso PL using the
<a href="fn_xml_template.html" class="link" title="xml_template"><code
class="function">xml_template()</code></a> function.

To allow XML template execution from a Virtuoso virtual directory and
it's descendants the special option: 'xml_templates' must be used in the
virtual directory definition. This option can be set from the
<a href="admui.internetdomains.html#httpvirtualdirs" class="link"
title="HTTP Virtual Directories">Conductor / Web Application Server /
Virtual Domains &amp; Directories</a> or from SQL (or ISQL) using the
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define(.... , opts=&gt;vector('xml_templates', 'yes'));</code></a>
function. In the usual way, the SQL user specified for VSP execution
within the virtual directory definition will be used for executing the
templates within such web directories. If your XML Templates are to run
from a DAV directory then you must allow suitable execute permissions
for the file and directory.

When a virtual directory is configured to allow execution of XML
templates be aware that this also means that descendant directories
inherit this property. Also be aware that this also allows execution of
VSP files in the normal way. WebDAV also has another layer of security
attributes that will need to be set to enable files to be executable. By
default files in DAV do not have execute privileges.

Explicitly specifying "contenttype=text/html" as a URL parameter will
instruct the Virtuoso HTTP server to return the HTML output.

<div>

<table data-border="0" data-summary="Tip: See Also">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>Functions: <a
href="fn_xml_template.html" class="link" title="xml_template"><code
class="function">xml_template()</code></a> , <a
href="fn_xmlsql_update.html" class="link" title="xmlsql_update"><code
class="function">xmlsql_update()</code></a> , <a href="fn_xml_auto.html"
class="link" title="xml_auto"><code
class="function">xml_auto()</code></a> .</p>
<p><a href="updategrams.html" class="link"
title="15.5. Using UpdateGrams to Modify Data">UpdateGrams</a> .</p>
<p>The <a href="ch-webandxml.html#forxmlforsql" class="link"
title="15.1. Rendering SQL Queries as XML (FOR XML Clause)">FOR XML
clause</a> .</p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
