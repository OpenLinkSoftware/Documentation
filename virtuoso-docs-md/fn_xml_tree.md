<div>

<div>

</div>

<div>

## Name

xml_tree — Parses an XML fragment and returns the parse tree as nested
vectors.

</div>

<div>

## Synopsis

<div>

|                       |                                         |
|-----------------------|-----------------------------------------|
| ` `**`xml_tree`**` (` | in `document ` varchar ,                |
|                       | in `parser_mode ` integer ,             |
|                       | in `base_uri ` varchar ,                |
|                       | in `content_encoding ` varchar ,        |
|                       | in `content_language ` varchar ,        |
|                       | in `dtd_validator_config ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This parses the argument, which is expected to be a well formed XML
fragment and returns a parse tree as a structure of nested heterogeneous
vectors.

</div>

<div>

## Parameters

<div>

### document

(mandatory) A well formed XML or HTML document

</div>

<div>

### parser_mode

0, 1 or 2; 0 - XML parser mode, 1 - HTML parser mode, 2 - 'dirty HTML'
mode (with quiet recovery after any syntax error)

</div>

<div>

### base_uri

(optional) in HTML parser mode change all absolute references to
relative from given base_uri (http://\<host\>:\<port\>/\<path\>)

</div>

<div>

### content_encoding

(optional) string with content encoding type of \<document\> valid is
'ASCII', 'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1'.

</div>

<div>

### content_language

(optional) - string with language tag of content of \<document\>; valid
names are listed in IETF RFC 1766, default is 'x-any' (it means 'mix of
words from various human languages).

</div>

<div>

### dtd_validator_config

configuration string for DTD validator, default is empty string meaning
that DTD validator should be fully disabled. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

</div>

<div>

## Return Types

vector of vectors representing the parsed tree of XML.

</div>

<div>

## Examples

<div>

**Example 24.517. Making an XML tree**

<div>

``` screen
declare tree any;

tree := xml_tree (file_to_string ('doc.html'), 1,
        'http://localhost.localdomain/', 'ISO');
...
tree := xml_tree (file_to_string ('doc.xml'));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt </code></a> ,
<a href="fn_xml_uri_get.html" class="link" title="xml_uri_get"><code
class="function">xml_uri_get</code></a> ,
<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd"><code
class="function">xml_validate_dtd</code></a> .

</div>

</div>
