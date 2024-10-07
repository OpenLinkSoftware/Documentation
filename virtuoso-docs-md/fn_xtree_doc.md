<div id="fn_xtree_doc" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xtree_doc — returns an entity object created from an XML document

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xtree_doc" class="funcsynopsis">

|                        |                                         |
|------------------------|-----------------------------------------|
| ` `**`xtree_doc`**` (` | in `document ` varchar ,                |
|                        | in `parser_mode ` integer ,             |
|                        | in `base_uri ` varchar ,                |
|                        | in `content_encoding ` varchar ,        |
|                        | in `content_language ` varchar ,        |
|                        | in `dtd_validator_config ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_81" class="refsect1">

## Description

This parses the argument, which is expected to be a well formed XML
fragment and returns a parse tree as a special memory-resident object.
While
<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc</a>
creates some disk-resident data structure, xtree_doc() will work faster
but it may require more memory. You may wish to use xtree_doc for small
documents (e.g. less than 5 megabytes and xper_doc for larger documents.

</div>

<div id="params_43" class="refsect1">

## Parameters

<div id="id124822" class="refsect2">

### document

well formed XML or HTML document

</div>

<div id="id124825" class="refsect2">

### parser_mode

0, 1 or 2; 0 - XML parser mode, 1 - HTML parser mode, 2 - 'dirty HTML'
mode (with quiet recovery after any syntax error)

</div>

<div id="id124828" class="refsect2">

### base_uri

in HTML parser mode change all absolute references to relative from
given base_uri (http://\<host\>:\<port\>/\<path\>)

</div>

<div id="id124831" class="refsect2">

### content_encoding

string with content encoding type of \<document\>; valid are 'ASCII',
'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML
mode and 'LATIN-1' for HTML mode.

</div>

<div id="id124834" class="refsect2">

### content_language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages')

</div>

<div id="id124837" class="refsect2">

### dtd_validator_config

configuration string for DTD validator, default is empty string meaning
that DTD validator should be fully disabled. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

</div>

<div id="ret_26" class="refsect1">

## Return Types

XML entity with underlying parse tree of source document; the tree will
be a memory-resident structure of nested heterogeneous vectors.

</div>

<div id="examples_28" class="refsect1">

## Examples

<div id="ex_xtree_doc" class="example">

**Example 24.537. xtree_doc**

<div class="example-contents">

``` programlisting
declare tree any;

tree := xtree_doc (file_to_string ('doc.html'), 1,
        'http://localhost.localdomain/', 'ISO');
...
tree := xtree_doc (file_to_string ('doc.xml'));
```

</div>

</div>

  

</div>

<div id="seealso_51" class="refsect1">

## See Also

<a href="fn_xml_tree.html" class="link" title="xml_tree">xml_tree</a>

<a href="fn_xml_tree_doc.html" class="link"
title="xml_tree_doc">xml_tree_doc</a>

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc</a>

</div>

</div>
