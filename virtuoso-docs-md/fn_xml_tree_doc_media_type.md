<div id="fn_xml_tree_doc_media_type" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_tree_doc_media_type

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_tree_doc_media_type" class="funcsynopsis">

|                                             |                           |
|---------------------------------------------|---------------------------|
| `varchar `**`xml_tree_doc_media_type`**` (` | in `xml_entity ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xml_tree_doc_media_type" class="refsect1">

## Description

This function returns the media type in effect for the result of the
xslt() (XSL-T) transformation , based on xsl:output "media-type" and
"method" attributes of the XSL-T style-sheet applied. It accepts an
entity (potentially resulting from using xslt()) as a argument and will
return a string containing the media-type.

</div>

<div id="params_xml_tree_doc_media_type" class="refsect1">

## Parameters

<div id="id123487" class="refsect2">

### xml_entity

An XML entity such as that returned by the xslt() function.

</div>

</div>

<div id="ret_xml_tree_doc_media_type" class="refsect1">

## Return Types

If xsl:output "media-type" specified in XSL-T sheet it's value will be
returned. If no "media-type" is specified, the valid results dependent
on the \<xsl:output "method" attribute are:

|                               |
|-------------------------------|
| if unknown : non-string value |
| if 'html' : 'text/html'       |
| if 'xhtml' : 'text/html'      |
| if 'xml' : 'text/xml'         |
| if 'text' : 'text/plain'.     |

</div>

<div id="errors_xml_tree_doc_media_type" class="refsect1">

## Errors

This function can generate the following errors:

<span class="errorcode">22023 </span><span class="errorcode">SR003
</span> Function xml_tree_doc_media_type needs an XML entity as argument
1, not an arg of type \<type_name\> (\<type\>)

</div>

<div id="examples_xml_tree_doc_media_type" class="refsect1">

## Examples

<div id="ex_xml_tree_doc_media_type" class="example">

**Example 24.519. Assessing the media type**

<div class="example-contents">

``` screen
-- x.xsl --

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:output method="text" />
....
</xsl:stylesheet>

-- execute a simple transformation via ISQL tool
SQL> select xml_tree_doc_media_type (xslt ('file:/x.xsl',xml_tree_doc ('<A />')));
Connected to OpenLink Virtuoso
Driver: 03.00.2310 OpenLink Virtuoso ODBC Driver
callret
VARCHAR
_______________________________________________________________________________

text/plain

1 Rows. -- 95 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xml_tree_doc_media_type" class="refsect1">

## See Also

<a href="fn_xml_tree_doc.html" class="link" title="xml_tree_doc"><code
class="function">xml_tree_doc() </code></a>

</div>

</div>
