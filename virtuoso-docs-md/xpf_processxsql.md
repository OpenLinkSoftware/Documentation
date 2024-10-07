<div id="xpf_processxsql" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

processXSQL — Executes XSQL page and returns the result.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_processxsql_01" class="funcsynopsis">

|                                |                              |
|--------------------------------|------------------------------|
| `entity `**`processXSQL`**` (` | `xsql_page_uri ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_processxsql_01" class="refsect1">

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

<div id="xpf_params_processxsql_01" class="refsect1">

## Parameters

<div id="id128688" class="refsect2">

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

<div id="xpf_ret_processxsql_01" class="refsect1">

## Return Types

The function returns an XML entity that is the root entity of the
resulting document of an XSQL page.

</div>

<div id="xpf_examples_processxsql_01" class="refsect1">

## Examples

<div id="xpf_ex_processxsql_01" class="example">

**Example 24.613. Simple call**

<div class="example-contents">

The query passes its argument to the XSQL page and returns its result.
This is the simplest way of calling an XSQL page.

``` screen
processXSQL ("file://sample.xsql")
```

</div>

</div>

  

</div>

<div id="xpf_seealso_processxsql_01" class="refsect1">

## See Also

<a href="xpf_processxslt.html" class="link" title="processXSLT"><code
class="function">processXSLT() </code></a>

<a href="xpf_processxquery.html" class="link"
title="processXQuery"><code class="function">processXQuery() </code></a>

</div>

</div>
