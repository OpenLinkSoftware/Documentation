<div id="xsltfunctions" class="section">

<div class="titlepage">

<div>

<div>

### 15.9.4. Functions

</div>

</div>

</div>

The <a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt()</code></a> Virtuoso/PL function applies a given
stylesheet to a given source XML document and returns the transformed
document. There is no restriction to what a VSP page can output, this is
usually HTML but can be XML. The function
<a href="fn_http_xslt.html" class="link" title="http_xslt"><code
class="function">http_xslt()</code></a> allows a stylesheet to be
applied to a whole output of an VSP page before it is sent to the user
agent. Functions
<a href="fn_xslt_sheet.html" class="link" title="xslt_sheet"><code
class="function">xslt_sheet()</code></a> and
<a href="fn_xslt_stale.html" class="link" title="xslt_stale"><code
class="function">xslt_stale()</code></a> allow you to create and destroy
a stylesheet dynamically. Function
<a href="fn_xmlupdate.html" class="link" title="XMLUpdate"><code
class="function">xmlupdate()</code></a> is convenient for very simple
"search-and replace" transformations.

</div>
