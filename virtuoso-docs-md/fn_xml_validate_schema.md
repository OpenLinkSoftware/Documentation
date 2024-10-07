<div id="fn_xml_validate_schema" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_validate_schema — returns a string with list of errors detected by
DTD and XML Schema validator on reading given XML document.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_validate_schema" class="funcsynopsis">

|                                  |                                         |
|----------------------------------|-----------------------------------------|
| ` `**`xml_validate_schema`**` (` | in `document ` varchar ,                |
|                                  | in `parser_mode ` integer ,             |
|                                  | in `base_uri ` varchar ,                |
|                                  | in `content_encoding ` varchar ,        |
|                                  | in `content_language ` varchar ,        |
|                                  | in `dtd_validator_config ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_71" class="refsect1">

## Description

This parses the argument, which is expected to be an XML fragment
(possibly with syntax errors, violations of validity conditions etc.)
and returns a human-readable list of errors as a string. If there is a
"schemaLocation" attribute in root element, XML Schema declaration will
be loaded and partial schema validation will be performed. If this
attribute does not exist and the Validation option below is not set to
DISABLED, then an error will be returned: ('FATAL : Schema declaration
is not loaded').

The XML Schema validation routines are tightly coupled with DTD
validator. If the document contains both Schema and DTD information then
both validations are made in the same time in order to provide as
accurate diagnostics as possible. However, it is impossible to check
whether the declared DTD matches or contradicts to the declared Schema,
so the parser performs two independent validations to every item of
source data. E.g. if DTD contradicts to the schema in description of
some particular element and data in the document does not contain this
element then no errors is reported; but if sun an element occurs in the
document then either DTD validator or Schema validator will log an
error.

</div>

<div id="params_35" class="refsect1">

## Parameters

<div id="id123684" class="refsect2">

### document

XML or HTML document to check

</div>

<div id="id123687" class="refsect2">

### parser_mode

0 or 1; 0 - XML parser mode 1 - HTML parser mode

</div>

<div id="id123690" class="refsect2">

### base_uri

in HTML parser mode change all absolute references to relative from
given base_uri (http://\<host\>:\<port\>/\<path\>)

</div>

<div id="id123693" class="refsect2">

### content_encoding

string with content encoding type of \<document\>; valid are 'ASCII',
'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML
mode and 'LATIN-1' for HTML mode

</div>

<div id="id123696" class="refsect2">

### content_language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages)

</div>

<div id="id123699" class="refsect2">

### dtd_validator_config

configuration string of the validator, default is empty string meaning
that DTD validator should be fully disabled and only critical errors
should be reported. It is very probable that this is not the best choice
for your application, so please refer
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> to find out how to let validator to do
better job.

</div>

</div>

<div id="ret_22" class="refsect1">

## Return Types

Human readable list of errors if applicable as a varchar.

</div>

<div id="examples_19_01" class="refsect1">

## Validating XML Against a DTD

<div id="ex_xml_validate_schema" class="example">

**Example 24.522. Simple Use**

<div class="example-contents">

``` programlisting
declare _result varchar;
_result := xml_validate_schema (
  _text, 0, 'http://localhost.localdomain/xmlrepository', 'UTF-8', 'x-any',
  'Validation=SGML FsaBadWs=IGNORE BuildStandalone=ENABLE MaxErrors=100');

if (_res = '') _res := 'NO ERRORS DETECTED';
```

</div>

</div>

  

</div>

<div id="seealso_44" class="refsect1">

## See Also

<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd"><code
class="function">xml_validate_dtd() </code></a>

<a href="fn_xml_view_dtd.html" class="link" title="xml_view_dtd"><code
class="function">xml_view_dtd() </code></a>

<a href="fn_xml_view_schema.html" class="link"
title="xml_view_schema"><code
class="function">xml_view_schema() </code></a>

<a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code
class="function">xtree_doc() </code></a>

<a href="fn_xper_doc.html" class="link" title="xper_doc"><code
class="function">xper_doc() </code></a>

</div>

</div>
