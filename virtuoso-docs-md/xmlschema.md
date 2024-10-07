<div id="xmlschema" class="section">

<div class="titlepage">

<div>

<div>

## 15.7. XML DTD and XML Schemas

</div>

</div>

</div>

<div id="dtd_intro" class="section">

<div class="titlepage">

<div>

<div>

### 15.7.1. XML Document Type Definition (DTD)

</div>

</div>

</div>

It is always useful to store a description of an XML document inside the
document itself. XML DTD is a set of directives to describe the
structure of the document and references to other XML documents.

The XML parser of the Virtuoso Server can recognize and use most DTD
directives.

If DTD describes the structure of the document (i.e. the allowed content
of elements with particular names) then the XML parser can validate the
source document in order to check if it matches to the rules written in
the DTD.

If a DTD describes references to external XML entities then the parser
can build either "standalone" or "non-standalone" internal
representation. To build a "standalone" representation, the XML parser
will retrieve all external resources and then it will replace every
occurrence of every reference with a copy of the whole content of the
resource. To build a "non-standalone" representation, XML parser
remembers only referencing information but it tends to not retrieve
external documents; they can be retrieved on demand later.

A DTD may describe some attributes as "unique identifiers" and as
"references to unique identifiers". If requested, the XML parser can
check that identifiers are really unique or that there are no "dangling"
references to missing identifiers.

In an ideal world, source documents match the XML standard perfectly and
all declared URIs are valid and can be accessed. The real application,
however, should read inaccurate data and ignore some minor errors. To
let the XML parser signal only errors that really can affect the
application, it is possible to precisely configure the reaction of the
parser on every sort of problem. In addition, the application can get a
detailed human-readable log of diagnostic messages by calling
<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd"><code
class="function">xml_validate_dtd()</code></a> to let user fix the
document in question.

If an XML document contains a DTD then DTD is placed before any data
nodes (if parts of DTD can be placed in separate documents then they
will be retrieved before parsing data nodes). Thus XML parser has enough
data to perform "DTD validation" of the source document right during the
reading. It lets the parser provide detailed diagnostics with precise
location of detected errors.

</div>

</div>
