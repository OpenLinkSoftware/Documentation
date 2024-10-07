<div id="fn_xslt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xslt — returns an XML document transformed by an XSLT stylesheet

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xslt" class="funcsynopsis">

|                             |                                |
|-----------------------------|--------------------------------|
| `xml_entity `**`xslt`**` (` | in `sheet_uri ` varchar ,      |
|                             | in `entity ` any ,             |
|                             | in `sheet_params ` vector `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xslt" class="refsect1">

## Description

This function takes the URI of a stylesheet and an XML entity and
produces an XML entity representing the transformation result of the
given entity with the given stylesheet. The result tree is separate from
the argument tree and the only reference to it is the returned entity.
Errors occurring in the transformation will be signalled as SQL states,
with XML or XSLT specific conditions beginning with XS or XP.

The stylesheet can be passed parameters by specifying a third argument
to `xslt()` . This will be a vector of name/value pairs. The values can
be referenced from inside XPath expressions in the stylesheet. You may
use any Virtuoso data type. The names in the parameter vector should
appear without the '\$' sign. If any of the parameter values is NULL the
parameter will be ignored because NULL has no XPath counterpart. If the
same name appears more than once in the vector, the last name/value pair
is used and all preceding pairs with this name are silently ignored.
Obviously, names should be strings that are valid XPath variable names.

`xslt()` applies the transformation in the sheet to the specified
entity. The result is the root element of the result tree, an XML
entity. This entity can be used as input to another transformation, can
be serialized and sent to an HTTP client or stored, etc.

The URI of the sheet is used to locate the stylesheet. The protocol can
be http, file or virt. Once the stylesheet has been retrieved it is
cached and not refetched until the cache is invalidated with
`xslt_stale()` . Included or imported style sheets will be fetched
automatically, using the initial URI as base for any relative
references. The *`sheet_uri`* is the URI of a stylesheet. This should be
an absolute URI resolvable with `xml_uri_get()` . If the URI has
previously been used as a stylesheet and has not been marked stale with
`xslt_stale()` , Virtuoso will use the cached data instead of fetching
and parsing the stylesheet resource.

When a resource with a .xsl extension is stored into the WebDAV,
Virtuoso marks as stale any related cached resource. The URI for such
stylesheets will be

``` programlisting
virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:<path>
```

. See the section about entity references in stored text for more on
this type of URI. If the URI uses the file protocol, Virtuoso will
compare the date of the file against the date of the cached stylesheet,
automatically reloading the sheet if the file changes. This protocol is
subject to the limitations on file system access imposed by the host
operating system and the virtuoso.ini file system access control
settings.

</div>

<div id="params_xslt" class="refsect1">

## Parameters

<div id="id124611" class="refsect2">

### sheet_uri

URI pointing to the location of an XSL stylesheet.

</div>

<div id="id124614" class="refsect2">

### entity

parsed XML entity such as that returned by the xtree_doc() function

</div>

<div id="id124617" class="refsect2">

### sheet_params

A vector of keyword/value parameters to be passed to the XSLT engine for
use in the transformation.

</div>

</div>

<div id="ret_xslt" class="refsect1">

## Return Types

An XML entity resulting from transforming the given XML entity input
with the given style sheet.

</div>

<div id="examples_xslt" class="refsect1">

## Examples

<div id="ex_xslt" class="example">

**Example 24.533. Basic Use**

<div class="example-contents">

``` programlisting
declare sheet, xml varchar;
declare xml_entity, myparams any;

sheet := 'virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/stylesheets/mysheet.xsl';
xml := 'virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/xmlsource/myxml.xml';
xml_entity := xtree_doc(xml);

myparams := vector('chapter', 'overview', 'imgroot', '/DAV/images/');

http_value(xslt(sheet, xml_entity, myparams));
```

This code will send the resultant transformation to the http stream.
Note that the *`xml_entity`* must be a parsed XML entity such as that
produced by *`xtree_doc`* .

``` programlisting
<?xml version='1.0'?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/TR/WD-xsl">

  <xsl:param name="chapter">default</xsl:param>
  <xsl:param name="imgroot"></xsl:param>

  <xsl:template match="/">
    <xsl:text>Value of chapter: </xsl:text><xsl:value-of select="$chapter" />
    <xsl:text>Value of imgroot: </xsl:text><xsl:value-of select="$imgroot" />
  </xsl:template>

</xsl:stylesheet>
```

This style sheet illustrates using parameters. Note how default values
can be provided in the style sheet when the parameters are declared
using the *`xsl:param`* tag.

</div>

</div>

  

</div>

<div id="seealso_xslt" class="refsect1">

## See Also

<a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code
class="function">xtree_doc() </code></a>

<a href="fn_xper_doc.html" class="link" title="xper_doc"><code
class="function">xper_doc() </code></a>

<a href="fn_xml_tree_doc.html" class="link" title="xml_tree_doc"><code
class="function">xml_tree_doc() </code></a>

<a href="fn_xml_tree.html" class="link" title="xml_tree"><code
class="function">xml_tree() </code></a>

<a href="fn_xslt_stale.html" class="link" title="xslt_stale"><code
class="function">xslt_stale() </code></a>

<a href="fn_xmlupdate.html" class="link" title="XMLUpdate"><code
class="function">XMLUpdate() </code></a>

</div>

</div>
