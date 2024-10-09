<div>

<div>

</div>

<div>

## Name

xml_tree_doc_media_type

</div>

<div>

## Synopsis

<div>

|                                             |                           |
|---------------------------------------------|---------------------------|
| `varchar `**`xml_tree_doc_media_type`**` (` | in `xml_entity ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the media type in effect for the result of the
xslt() (XSL-T) transformation , based on xsl:output "media-type" and
"method" attributes of the XSL-T style-sheet applied. It accepts an
entity (potentially resulting from using xslt()) as a argument and will
return a string containing the media-type.

</div>

<div>

## Parameters

<div>

### xml_entity

An XML entity such as that returned by the xslt() function.

</div>

</div>

<div>

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

<div>

## Errors

This function can generate the following errors:

<span class="errorcode">22023 </span><span class="errorcode">SR003
</span> Function xml_tree_doc_media_type needs an XML entity as argument
1, not an arg of type \<type_name\> (\<type\>)

</div>

<div>

## Examples

<div>

**Example 24.519. Assessing the media type**

<div>

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

<div>

## See Also

<a href="fn_xml_tree_doc.html" class="link" title="xml_tree_doc"><code
class="function">xml_tree_doc() </code></a>

</div>

</div>
