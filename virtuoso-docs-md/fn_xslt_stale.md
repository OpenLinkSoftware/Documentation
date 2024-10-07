<div id="fn_xslt_stale" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xslt_stale — force reload of XSL stylesheet

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xslt_stale" class="funcsynopsis">

|                         |                        |
|-------------------------|------------------------|
| ` `**`xslt_stale`**` (` | in `uri ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xslt_stale" class="refsect1">

## Description

This function can be used to force Virtuoso to reload a cached
stylesheet from the URI when next used with `xslt()` or `http_xslt()` .
Using this function before every application of the stylesheet is
extremely inefficient. If stylesheets are stored in the database, you
can use this function in an update trigger on the table storing the
stylesheets but you don't have to use it before every application of the
sheet.

This function never needs to be applied to a stylesheet URI with the
file:// protocol since `xslt()` and `http_xslt()` will automatically
detect a stale cache entry. However if the stylesheet is stored on a
remote web server, or if the stylesheet contains subdocuments ( e.g.
external XML entities, xsl:include or xsl:import statements) this
function is needed to force a reload.

</div>

<div id="params_xslt_stale" class="refsect1">

## Parameters

<div id="id124772" class="refsect2">

### uri

The location of the style sheet to force a reload.

</div>

</div>

<div id="errors_xslt_stale" class="refsect1">

## Errors

The function never signals any errors. E.g. it is not an error if the
specified stylesheet does not exist or if the specified stylesheet is
used by other transaction when the `xslt_stale()` is called.

</div>

<div id="examples_xslt_stale" class="refsect1">

## Examples

<div id="ex_xslt_stale" class="example">

**Example 24.536. Simple Use**

<div class="example-contents">

``` programlisting
sheet := 'virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/stylesheets/document.xsl';
xslt_stale (sheet);
xslt(sheet, xml_doc_tree);
```

</div>

</div>

  

</div>

<div id="seealso_xslt_stale" class="refsect1">

## See Also

<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt() </code></a>

<a href="fn_http_xslt.html" class="link" title="http_xslt"><code
class="function">http_xslt() </code></a>

</div>

</div>
