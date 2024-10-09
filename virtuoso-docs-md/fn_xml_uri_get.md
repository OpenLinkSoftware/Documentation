<div>

<div>

</div>

<div>

## Name

xml_uri_get — Retrieve a resource based on a URI

</div>

<div>

## Synopsis

<div>

|                                         |                        |
|-----------------------------------------|------------------------|
| `varchar DB.DBA. `**`xml_uri_get`**` (` | in `base ` varchar ,   |
|                                         | in `ref ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function combines a base URI and a relative URI and returns the
referenced resource.

The supported protocol identifiers are http: file: and virt:. The virt:
allows referencing data stored in local Virtuoso tables without passing
through HTTP. See 'Entity References in Stored XML' for details.

The effective URI will be the reference if the URI of the reference is
absolute. Otherwise it will be the base URI modified by the relative
reference.

Authorization is derived from the SQL or DAV identification of the
caller. The DAV identification is used if processing DAV content in
response to a DAV request. The SQL user account is used otherwise.

xml_uri_get returns the text of the requested resource. If specific
encodings or special authentication schemes are desired one may use
http_get directly.

</div>

<div>

## Parameters

<div>

### base

A string containing the name of the location (URI) of the resource to be
referenced.

</div>

<div>

### ref

The name of the resource as a relative reference from the base URI.

</div>

</div>

<div>

## Return Types

The referenced resource.

</div>

<div>

## Errors

<div>

**Table 24.131. Errors signalled by**

<div>

| SQL State                       | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.520. Basic Application of xml_uri_get()**

<div>

``` programlisting
declare doc_base varchar;
declare doc_tree any;

doc_base := 'virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/docsrc/';
doc_tree := xml_tree_doc(xml_tree(
    xml_uri_get(doc_base, 'virtdocs.xml')
      ), doc_base);

http_value(
  xslt('virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/stylesheets/html_chapter.xsl',
    doc_tree
  )
);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xslt.html" class="link" title="xslt">???</a> xslt()

<a href="fn_http_value.html" class="link" title="http_value">???</a>
http_value()

<a href="fn_xml_tree_doc.html" class="link" title="xml_tree_doc">???</a>
xml_tree_doc()

<a href="fn_xml_tree.html" class="link" title="xml_tree">???</a>
xml_tree()

</div>

</div>
