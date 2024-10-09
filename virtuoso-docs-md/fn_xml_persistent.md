<div>

<div>

</div>

<div>

## Name

xml_persistent — returns an entity object ('XPER entity') created from
given XML document

</div>

<div>

## Synopsis

<div>

|                             |                                         |
|-----------------------------|-----------------------------------------|
| ` `**`xml_persistent`**` (` | in `document ` varchar ,                |
|                             | in `parser_mode ` integer ,             |
|                             | in `base_uri ` varchar ,                |
|                             | in `content_encoding ` varchar ,        |
|                             | in `content_language ` varchar ,        |
|                             | in `dtd_validator_config ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This parses the argument, which is expected to be a well formed XML
fragment and returns a parse tree as a special object with underlying
disk structure, named "persistent XML" or "XPER" While the result of
<a href="fn_xml_tree.html" class="link" title="xml_tree"><code
class="function">xml_tree()</code></a> is a memory-resident array of
vectors, the XPER object consumes only a little amount of memory, and
almost all data is disk-resident.

This function is equivalent to
<a href="fn_xper_doc.html" class="link" title="xper_doc"><code
class="function">xper_doc()</code></a> , and the only difference is in
the order of arguments; xper_doc() has the same order of arguments as
<a href="fn_xml_tree.html" class="link" title="xml_tree"><code
class="function">xml_tree()</code></a> .

</div>

<div>

## Parameters

<div>

### document

well formed XML or HTML documen

</div>

<div>

### parser_mode

0, 1 or 2; 0 - XML parser mode, 1 - HTML parser mode, 2 - 'dirty HTML'
mode (with quiet recovery after any syntax error)

</div>

<div>

### base_uri

in HTML parser mode change all absolute references to relative from
given base_uri (http://\<host\>:\<port\>/\<path\>)

</div>

<div>

### content_encoding

string with content encoding type of \<document\>; valid are 'ASCII',
'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML
mode and 'LATIN-1' for HTML mode

</div>

<div>

### content_language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages)

</div>

<div>

### dtd_validator_config

configuration string for the DTD validator, default is empty string
meaning that DTD validator should be fully disabled. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

</div>

<div>

## Return Types

Parse tree as a structure of nested heterogeneous vectors.

</div>

<div>

## Examples

<div>

**Example 24.516. XML_Persistent**

<div>

``` screen
declare tree any;

tree := xml_persistent (file_to_string ('doc.html'), 1,
        'http://localhost.localdomain/', 'ISO');
...
tree := xml_persistent (file_to_string ('doc.xml'));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xml_tree.html" class="link" title="xml_tree">xml_tree</a> ,
<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc</a> ,
<a href="fn_xml_view_dtd.html" class="link"
title="xml_view_dtd">xml_view_dtd</a> ,
<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd">xml_validate_dtd</a>

</div>

</div>
