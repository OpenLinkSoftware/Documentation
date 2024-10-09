<div>

<div>

</div>

<div>

## Name

document-literal — Parses given XML text and returns the resulting XML
data.

</div>

<div>

## Synopsis

<div>

|                                       |                                      |
|---------------------------------------|--------------------------------------|
| `node-set `**`document-literal`**` (` | `document_text ` varchar ,           |
|                                       | `cache_uri ` varchar ,               |
|                                       | `parser_mode ` integer ,             |
|                                       | `content_encoding ` varchar ,        |
|                                       | `content_language ` varchar ,        |
|                                       | `dtd_validator_config ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function tries to parse an XML text as if it is obtained from a
location specified by *`cache_uri`* . On success, it returns the root
entity of the "XML Tree" document; the result is identical to the entity
created by <a href="fn_xtree_doc.html" class="link"
title="xtree_doc">xtree_doc()</a> Virtuoso/PL function.

When XPath processor parses a document, it saves it in a temporary
cache. If a cached document is accessed again then no actual retrieval
or parsing is made and a cached value is returned. The cache persists
till the end of execution of a XPath query or till the end of the XSLT
transformation if the XPath expression is a part of XSLT stylesheet. The
*`cache_uri`* specifies the URI used as a key if the parsed document is
cached. If *`cache_uri`* is not specified or the specified value is
equal to an empty string, then no caching is performed. If the specified
*`cache_uri`* is not equal to an empty string then it should distinct
from URIs of other XML resources that are sources of the XPath query, to
prevent confusion.

The *`cache_uri`* is also used by XML parser as a base URI to resolve
relative URIs of external entities, so it is a good idea to specify some
absolute URI if the parsed text is not a "standalone" document.

The *`document_text`* argument may be a sequence, not a single string.
In this case a node-set is returned as if `document-literal` is applied
to string-value of every element of the sequence. It is obvious that
caching should not be used if there's a chance that the sequence may
have more than one distinct element.

Note that the `document-literal` is not a part of XPATH 1.0 or XQuery
1.0 standard library.

</div>

<div>

## Parameters

<div>

### document_text

well formed XML or HTML text

</div>

<div>

### cache_uri

The URI that is used to resolve all relative URIs (i.e. to convert them
into absolute in order to locate and load subdocuments) and to change
'local' absolute references to relative when in HTML mode.

</div>

<div>

### parser_mode

0, 1 or 2; 0 - XML parser mode, 1 - HTML parser mode, 2 - 'dirty HTML'
mode (with quiet recovery after any syntax error)

</div>

<div>

### content_encoding

string with content encoding type of *`document_text `* ; valid are
'ASCII', 'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are
'UTF-8' for XML mode and 'LATIN-1' for HTML mode.

</div>

<div>

### content_language

string with language tag of content of *`document_text `* ; valid names
are listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words
from various human languages')

</div>

<div>

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

<div>

## Return Types

Node-set

</div>

<div>

## Errors

<div>

**Table 24.140. Errors signalled by document-literal()**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                     | Description                                         |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF15 </span> | <span class="errortext">Too many arguments passed to XPATH function document-literal() </span> | The number of parameters may vary only from 1 to 6. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.581. Simple reading of a standalone XML document**

<div>

Read a short document from string

``` screen
document-literal("
<html><body><p>Hello
</p></body></html>)
```

</div>

</div>

  

<div>

**Example 24.582. Simple reading of a non-standalone document**

<div>

Read a non-standalone document from local mirror but access its
subdocuments as if it is retrieved directly from
'http://www.example.com/sales/prices.xml', so e.g. the subdocument that
is referenced as 'termsandconditions.xml' is retrieved from
'http://www.example.com/sales/termsandconditions.xml'

``` screen
document-literal('
<!DOCTYPE price-list SYSTEM "http://www.example.com/dtd/sales.dtd" [
<!ENTITY t_and_c SYSTEM "termsandconditions.xml">
<!ENTITY prices_oct2002 SYSTEM "prices/2002/oct.xml">
]>
<price-list>
&t_and_c;
&prices_oct2002;
</price-list>
',
'http://webcache.localdomain/examplesales/prices.xml' )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_document.html" class="link" title="document">document()</a>

<a href="fn_xtree_doc.html" class="link"
title="xtree_doc">xtree_doc()</a>

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc()</a>

</div>

</div>
