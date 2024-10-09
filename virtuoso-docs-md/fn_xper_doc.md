<div>

<div>

</div>

<div>

## Name

xper_doc — returns an entity object ('XPER entity') created from an XML
document

</div>

<div>

## Synopsis

<div>

|                       |                                      |
|-----------------------|--------------------------------------|
| ` `**`xper_doc`**` (` | in `document ` varchar ,             |
|                       | in `parser_mode ` integer ,          |
|                       | in `base_uri ` varchar ,             |
|                       | in `content_encoding ` varchar ,     |
|                       | in `content_language ` varchar ,     |
|                       | in `dtd_validator_config ` varchar , |
|                       | in `index_attrs ` integer `)`;       |

<div>

 

</div>

</div>

</div>

<div>

## Description

This parses the argument, which is expected to be a well formed XML
fragment and returns a parse tree as a special object with underlying
disk structure, named "persistent XML" or "XPER" While the result of
<a href="fn_xml_tree.html" class="link" title="xml_tree">xml_tree</a> is
a memory-resident array of vectors, the XPER object consumes only a
little amount of memory, and almost all data are disk-resident. XPERs
are better then "XML trees" for large documents and for "write once --
read many" stores such as a table with one XML document per row used as
a "library" of documents. To be saved in a LONG VARCHAR column, "XML
tree" entity will be converted back to plain text of XML syntax; but
"XPER" entity will be saved as a ready-to-use disk structure.

</div>

<div>

## Parameters

<div>

### document

well formed XML or HTML document

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
mode and 'LATIN-1' for HTML mode.

</div>

<div>

### content_language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages)

</div>

<div>

### dtd_validator_config

configuration string for DTD validator, default is empty string meaning
that DTD validator should be fully disabled. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

<div>

### index_attrs

1 or 0, indicating if additional free-text indexing information must be
stored for all attributes of the document. It is 1 by default. If set to
'0', it will produce a disk structure compatible with old versions of
Virtuoso and will give a small benefit in disk usage but it will disable
some important optimizations in free-text search operations.

</div>

</div>

<div>

## Return Types

XML entity with underlying parse tree of source document; the tree will
be a special sort of BLOB.

</div>

<div>

## Examples

<div>

**Example 24.530. Xper_Doc**

<div>

``` screen
declare tree any;

tree := xper_doc (file_to_string ('doc.html'), 1,
        'http://localhost.localdomain/', 'ISO');
...
tree := xper_doc (file_to_string ('doc.xml'));
...
-- String cannot be longer than 10 megabytes. String session can.
tree := xper_doc (file_to_string_output ('huge_doc.xml'));
...
-- A special way to read local files.
-- Strings started from characters 'file://'
-- are treated as local filesystem URIs.
tree := xper_doc ('file://doc.xml');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xtree_doc.html" class="link" title="xtree_doc">xtree_doc</a>

<a href="fn_xml_tree_doc.html" class="link"
title="xml_tree_doc">xml_tree_doc</a>

<a href="fn_xper_cut.html" class="link" title="xper_cut">xper_cut</a>

<a href="fn_xper_right_sibling.html" class="link"
title="XPER navigation">xper_right_sibling, xper_left_sibling,
xper_parent, xper_root_entity, xper_tell, xper_length</a>

</div>

</div>
