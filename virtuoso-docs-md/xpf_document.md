<div id="xpf_document" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

document — Returns data from XML documents other than the main source
document.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_document" class="funcsynopsis">

|                               |                                      |
|-------------------------------|--------------------------------------|
| `node-set `**`document`**` (` | `document_uri ` varchar ,            |
|                               | `base_uri ` varchar ,                |
|                               | `parser_mode ` integer ,             |
|                               | `content_encoding ` varchar ,        |
|                               | `content_language ` varchar ,        |
|                               | `dtd_validator_config ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_document" class="refsect1">

## Description

The function tries to access an XML text at location specified by
*`document_uri`* and optionally *`base_uri`* . On success, it parses the
text and returns the root entity of the "XML Tree" document; the result
is identical to the entity created by
<a href="fn_xtree_doc.html" class="link"
title="xtree_doc">xtree_doc()</a> Virtuoso/PL function.

If the *`document_uri`* argument is node-set, not a string, then a
node-set is returned as if document() function is applied to
string-value of every node of the node-set.

Note that the list of attributes of the function differs from specified
in XSLT 1.0 standard. In XPATH 1.0, there is no such function at all.

</div>

<div id="xpf_params_document" class="refsect1">

## Parameters

<div id="id126878" class="refsect2">

### document_uri

An absolute or relative URI that points to a well formed XML or HTML
document. If the URI is relative, then the *`base_uri `* must be
specified.

</div>

<div id="id126882" class="refsect2">

### base_uri

The URI that is used to resolve all relative URIs (i.e. to convert them
into absolute in order to locate and load subdocuments) and to change
'local' absolute references to relative when in HTML mode.

</div>

<div id="id126885" class="refsect2">

### parser_mode

0, 1 or 2; 0 - XML parser mode, 1 - HTML parser mode, 2 - 'dirty HTML'
mode (with quiet recovery after any syntax error)

</div>

<div id="id126888" class="refsect2">

### content_encoding

string with content encoding type of document; valid are 'ASCII', 'ISO',
'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML mode
and 'LATIN-1' for HTML mode.

</div>

<div id="id126891" class="refsect2">

### content_language

string with language tag of content of document; valid names are listed
in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages')

</div>

<div id="id126894" class="refsect2">

### dtd_validator_config

configuration string for DTD validator, default is "Include=ERROR
IdCache=ENABLE" meaning that DTD should be read but validation should be
disabled; errors on including subdocuments should be reported as errors
and thus should abort the processing; a dictionary of element's IDs
should be created in order to support XQuery 'pointer operator'. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

</div>

<div id="xpf_ret_document" class="refsect1">

## Return Types

Node-set

</div>

<div id="xpf_errors_document" class="refsect1">

## Errors

<div id="id126903" class="table">

**Table 24.140. Errors signalled by document()**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                            | Description                                                                                                                           |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF09 </span> | <span class="errortext">Too many arguments passed to XPATH function document() </span>                                | The number of parameters may vary only from 1 to 6.                                                                                   |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF10 </span> | <span class="errortext">XML entity or a string expected as \\base_uri\\ argument of XPATH function document() </span> | If presents, the second argument of the function must be either a string or an XML entity whose XML document has a suitable base URI. |

</div>

</div>

  

The function may signal variety of errors when it reads the requested
document(s) from network or from local resources. It may even cause
deadlocks e.g. if documents are retrieved from the Virtuoso's own
webserver and these documents must be created on the fly from data that
are locked by Virtuoso/PL procedure that invokes the XPATH processor.

</div>

<div id="xpf_examples_document" class="refsect1">

## Examples

<div id="xpf_ex_document1" class="example">

**Example 24.579. Simple reading of a standalone XML document**

<div class="example-contents">

Read a standalone document from http://www.example.com/sales/prices.xml

``` screen
document("http://www.example.com/sales/prices.xml")
```

</div>

</div>

  

<div id="xpf_ex_document2" class="example">

**Example 24.580. Simple reading of a non-standalone document**

<div class="example-contents">

Read a non-standalone document from local mirror but access its
subdocuments as if it is retrieved directly from
'http://www.example.com/sales/prices.xml', so e.g. the subdocument that
is referenced as 'termsandconditions.xml' is retrieved from
http://www.example.com/sales/termsandconditions.xml but not from
http://webcache.localdomain/examplesales/termsandconditions.xml .

``` screen
document("http://webcache.localdomain/examplesales/prices.xml", "http://www.example.com/sales/prices.xml")
```

</div>

</div>

  

</div>

<div id="xpf_seealso_document" class="refsect1">

## See Also

<a href="xpf_doc.html" class="link" title="doc">doc()</a>

<a href="xpf_document_literal.html" class="link"
title="document-literal">document-literal()</a>

<a href="fn_xtree_doc.html" class="link"
title="xtree_doc">xtree_doc()</a>

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc()</a>

</div>

</div>
