<div id="fn_xml_uri_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_uri_get — Retrieve a resource based on a URI

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_uri_get" class="funcsynopsis">

|                                         |                        |
|-----------------------------------------|------------------------|
| `varchar DB.DBA. `**`xml_uri_get`**` (` | in `base ` varchar ,   |
|                                         | in `ref ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_69" class="refsect1">

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

<div id="params_33" class="refsect1">

## Parameters

<div id="id123540" class="refsect2">

### base

A string containing the name of the location (URI) of the resource to be
referenced.

</div>

<div id="id123543" class="refsect2">

### ref

The name of the resource as a relative reference from the base URI.

</div>

</div>

<div id="ret_09_01" class="refsect1">

## Return Types

The referenced resource.

</div>

<div id="errors_xml_uri_get" class="refsect1">

## Errors

<div id="id123551" class="table">

**Table 24.132. Errors signalled by**

<div class="table-contents">

| SQL State                       | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="examples_17_01" class="refsect1">

## Examples

<div id="ex_xml_uri_get" class="example">

**Example 24.520. Basic Application of xml_uri_get()**

<div class="example-contents">

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

<div id="seealso_42" class="refsect1">

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
