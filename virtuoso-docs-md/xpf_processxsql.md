<div>

<div>

</div>

<div>

## Name

processXSQL — Executes XSQL page and returns the result.

</div>

<div>

## Synopsis

<div>

|                                |                              |
|--------------------------------|------------------------------|
| `entity `**`processXSQL`**` (` | `xsql_page_uri ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes a URI of an
<a href="xsql.html" class="link" title="17.16. XSQL">XSQL</a> page,
compiles the page into a Virtuoso/PL procedure (if not compiled earlier)
and executes the compiled procedure. The current entity is passed to the
page procedure as "context XML" argument. The function returns the XML
document composed by page procedure. The result tree is separate from
the argument tree and the only reference to it is the returned entity.

For compatibility, the `processXSQL()` function can also be called as
`http://schemas.oracle.com/xpath/extension:processXSQL()` .

</div>

<div>

## Parameters

<div>

### xsql_page_uri

URI pointing to the location of an XSQL page. It can be absolute or
relative. Relative <span class="emphasis">*xsql_page_uri*</span> should
be resolved before use, this requires base URI information. Base URI can
be declared explicitly by "\_\_base_uri" parameter in XPATH or "declare
base-uri" setter in XQuery. If this is not declared but the expression
is a part of some stylesheet or XQuery module then the URI of the
stylesheet or module is used as a base URI. A run-time error is
signalled if the URI is relative and the expression does not contain
explicit declaration and the expression is neither in a stylesheet nor
in a module.

In current version of Virtuoso, XSQL page should be either a file (with
URI like "file://...") or a DAV resource (with URI like
"virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:...")

</div>

</div>

<div>

## Return Types

The function returns an XML entity that is the root entity of the
resulting document of an XSQL page.

</div>

<div>

## Examples

<div>

**Example 24.613. Simple call**

<div>

The query passes its argument to the XSQL page and returns its result.
This is the simplest way of calling an XSQL page.

``` screen
processXSQL ("file://sample.xsql")
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_processxslt.html" class="link" title="processXSLT"><code
class="function">processXSLT() </code></a>

<a href="xpf_processxquery.html" class="link"
title="processXQuery"><code class="function">processXQuery() </code></a>

</div>

</div>
