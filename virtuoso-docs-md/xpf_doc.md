<div>

<div>

</div>

<div>

## Name

doc — Returns data from XML doc other than the main source document.

</div>

<div>

## Synopsis

<div>

|                          |                              |
|--------------------------|------------------------------|
| `node-set `**`doc`**` (` | `document_uri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function tries to access an XML text at location specified by
*`document_uri`* .

If the *`document_uri`* argument is node-set, not a string, then a
node-set is returned as if document() function is applied to
string-value of the first node of the node-set.

The result of call doc(\$uri) is similar to the call of function
document() with default parameters:

``` screen
 document($uri, document-uri(.), 0, 'UTF-8', 'x-any', 'Include=ERROR IdCache=ENABLE')
```

I.e. the retrieved document should be XML or XHTML (but not an old-style
HTML) in 'UTF-8' encoding, content language is 'x-any' (it means 'mix of
words from various human languages'), DTD should be read but validation
should be disabled; errors on including subdocuments should be reported
as errors and thus should abort the processing; a dictionary of
element's IDs should be created in order to support XQuery 'pointer
operator'.

</div>

<div>

## Parameters

<div>

### document_uri

An absolute or relative URI that points to a well formed XML or HTML
document. If the URI is relative, then the base URI of context node is
used to convert the given URI into absolute one.

</div>

</div>

<div>

## Return Types

Node-set

</div>

<div>

## Errors

The function may signal variety of errors when it reads the requested
document(s) from network or from local resources. It may even cause
deadlocks e.g. if documents are retrieved from the Virtuoso's own
webserver and these documents must be created on the fly from data that
are locked by Virtuoso/PL procedure that invokes the XPATH processor.

</div>

<div>

## Examples

<div>

**Example 24.578. Simple reading of a standalone XML document**

<div>

Read a standalone document from http://www.example.com/sales/prices.xml

``` screen
doc("http://www.example.com/sales/prices.xml")
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_document.html" class="link" title="document">document()</a>

<a href="xpf_document_literal.html" class="link"
title="document-literal">document-literal()</a>

<a href="fn_xtree_doc.html" class="link"
title="xtree_doc">xtree_doc()</a>

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc()</a>

</div>

</div>
