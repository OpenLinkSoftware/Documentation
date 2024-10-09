<div>

<div>

</div>

<div>

## Name

xml_validate_dtd — returns a string with list of errors detected by DTD
validator on reading given XML document

</div>

<div>

## Synopsis

<div>

|                               |                                         |
|-------------------------------|-----------------------------------------|
| ` `**`xml_validate_dtd`**` (` | in `document ` varchar ,                |
|                               | in `parser_mode ` integer ,             |
|                               | in `base_uri ` varchar ,                |
|                               | in `content_encoding ` varchar ,        |
|                               | in `content_language ` varchar ,        |
|                               | in `dtd_validator_config ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This parses the argument, which is expected to be an XML fragment
(possibly with syntax errors, violations of validity conditions etc.)
and returns a human-readable list of errors as a string. DTD validation
may be performed during any reading of XML source in functions
`xml_tree()` , `xml_persistent()` or `xper_doc()` , so that an
application may check XML source on the fly; severe constraint
violations in source XML will be signalled as SQL runtime errors.

</div>

<div>

## Parameters

<div>

### document

XML or HTML document to check

</div>

<div>

### parser_mode

0 or 1; 0 - XML parser mode 1 - HTML parser mode

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

configuration string of the validator, default is empty string meaning
that only critical errors should be reported. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

</div>

<div>

## Return Types

Human readable list of errors if applicable as a varchar.

</div>

<div>

## Validating XML Against a DTD

<div>

**Example 24.521. Simple Use**

<div>

``` programlisting
declare _result varchar;
_result := xml_validate_dtd (
  _text, 0, 'http://localhost.localdomain/xmlrepository', 'UTF-8', 'x-any',
  'Validation=SGML FsaBadWs=IGNORE BuildStandalone=ENABLE MaxErrors=100');

if (_res = '') _res := 'NO ERRORS DETECTED';
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xml_validate_schema.html" class="link"
title="xml_validate_schema"><code
class="function">xml_validate_schema() </code></a>

<a href="fn_xml_view_dtd.html" class="link" title="xml_view_dtd"><code
class="function">xml_view_dtd() </code></a>

<a href="fn_xml_view_schema.html" class="link"
title="xml_view_schema"><code
class="function">xml_view_schema() </code></a>

</div>

</div>
