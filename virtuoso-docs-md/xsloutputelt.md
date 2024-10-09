<div>

<div>

<div>

<div>

### 15.9.2. The *`<xsl:output>`* Tag

</div>

</div>

</div>

The Virtuoso XSLT processor recognizes and verifies the *`<xsl:output>`*
tag. The only *`<xsl:output>`* attributes that are used are the
*`method`* , *`encoding`* , *`omit-xml-declaration`* , *`media-type`* ,
*`doctype-public`* *`doctype-system`* and *`indent`* . The processor
output is created in the character set that is in effect for the client
or the one specified by encoding.

The SQL function <a href="fn_xml_tree_doc_media_type.html" class="link"
title="xml_tree_doc_media_type"><code
class="function">xml_tree_doc_media_type()</code></a> returns the media
type in effect for the result of the
<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt()</code></a> function based on the xsl:output
*`media-type`* and *`method`* attributes of the stylesheet applied. This
method is also used for producing FOR XML AUTO WebDAV resources for HTTP
reply generation.

</div>
