<div>

<div>

<div>

<div>

### 15.3.2. XPATH Query Options

</div>

</div>

</div>

``` programlisting
<xp option> ::=
    __* | __http | __key   | __view NAME | __tag NAME | __quiet | __base_uri STRING |
    xmlns:NAME '=' STRING | xmlns '=' STRING |
    __lang STRING | __enc STRING | KEYWORD '=' KEYWORD

<option list> ::=  | <option list> '[' <option> [...] ']'
```

The option list may occur between the XPATH keyword and the start of the
path, e.g.

``` programlisting
XPATH [__key __view "cat"] /category
```

The effects of the options are as follows:

**\_\_http. ** Send the serialization of the result entities to the HTTP
client. This may only be used inside a VSP page context.

**\_\_key. ** Select the key of the selected entities instead of the
serialization text.

**\_\_\*. ** Select all columns of the selected entity instead of its
serialization text. This is only valid when \_\_view is specified and
the result set is homogeneous.

**\_\_view STRING. ** Specify that the query be interpreted in the
context of the specified CREATE XML VIEW, directly accessing the tables.
This is mandatory since the elements referenced can only be mapped to
tables in the context of an XML view.

**\_\_quiet. ** Specify that the query should not signal non-fatal
errors. This option is for cases when an incomplete result is anyway
better than nothing. Typical example is search in the collection of
documents where not all documents are valid.

**\_\_base_uri STRING. ** Specify the base URI that can be used to
resolve relative URIs in calls of XPATH functions
<a href="xpf_processxquery.html" class="link"
title="processXQuery"><code class="function">processXQuery()</code></a>
, <a href="xpf_processxslt.html" class="link" title="processXSLT"><code
class="function">processXSLT()</code></a> and
<a href="xpf_processxsql.html" class="link" title="processXSQL"><code
class="function">processXSLT()</code></a> . This is similar to the
effect of "declare base-uri" in XQuery.

**xmlns:NAME '=' STRING. ** This declares a pair of namespace prefix and
namespace URI for use in the query expression, e.g.
xmlns:xs="http://www.w3.org/2001/XMLSchema" or
xmlns:ora="http://schemas.oracle.com/xpath/extension"

**xmlns '=' STRING. ** This declares the default namespace URI for use
in the query expression, e.g. xmlns="http://www.example.com/my-schema".
This namespace will become both default element namespace and default
function namespace.

**\_\_lang STRING. ** This declares the language that is used for text
search expressions. This is for internationalization purposes only. See
subsection <a href="langfuncapi.html" class="link"
title="18.5.10. Adding New Languages And Encodings Into Virtuoso">"Adding
New Languages And Encodings Into Virtuoso"</a> for more details.

**\_\_enc STRING. ** This declares encoding of strings that are used for
text search expressions. This is for internationalization purposes only.
See subsections <a href="xmlencoding.html#encodingxpathexp" class="link"
title="Encoding in XPath Expressions">"Encoding in XPath
Expressions"</a> and <a href="langfuncapi.html" class="link"
title="18.5.10. Adding New Languages And Encodings Into Virtuoso">"Adding
New Languages And Encodings Into Virtuoso"</a> for more details.

**KEYWORD '=' KEYWORD. ** This is useful only if the expression uses
XPATH functions like
<a href="xpf_document.html" class="link" title="document"><code
class="function">document()</code></a> or
<a href="xpf_document.html" class="link" title="document"><code
class="function">doc()</code></a> or if the XPATH expression is an
argument of `xpath_contains` or similar special SQL predicate. These are
configuration options that XPATH processor provides to the XML parser
when the processor should read a document. Section
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">"Configuration
Options of the DTD Validator"</a> lists all supported options.

</div>
