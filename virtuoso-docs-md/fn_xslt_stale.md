<div>

<div>

</div>

<div>

## Name

xslt_stale — force reload of XSL stylesheet

</div>

<div>

## Synopsis

<div>

|                         |                        |
|-------------------------|------------------------|
| ` `**`xslt_stale`**` (` | in `uri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### uri

The location of the style sheet to force a reload.

</div>

</div>

<div>

## Errors

The function never signals any errors. E.g. it is not an error if the
specified stylesheet does not exist or if the specified stylesheet is
used by other transaction when the `xslt_stale()` is called.

</div>

<div>

## Examples

<div>

**Example 24.536. Simple Use**

<div>

``` programlisting
sheet := 'virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/stylesheets/document.xsl';
xslt_stale (sheet);
xslt(sheet, xml_doc_tree);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt() </code></a>

<a href="fn_http_xslt.html" class="link" title="http_xslt"><code
class="function">http_xslt() </code></a>

</div>

</div>
