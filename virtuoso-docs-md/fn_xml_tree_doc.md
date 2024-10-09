<div>

<div>

</div>

<div>

## Name

xml_tree_doc — returns an entity object given a tree from xml_tree

</div>

<div>

## Synopsis

<div>

|                           |                             |
|---------------------------|-----------------------------|
| ` `**`xml_tree_doc`**` (` | in `tree ` any ,            |
|                           | in `base_uri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This returns an entity object given a tree of the form returned by
xml_tree.

If it is given a string as an argument, it will automatically generate
the parse tree and use it to make the entity instead requiring you to
run the string through xml_tree first. Note that it is better to use
<a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code
class="function">xtree_doc</code></a> or
<a href="fn_xper_doc.html" class="link" title="xper_doc"><code
class="function">xper_doc</code></a> for converting source XML text
directly to an XML entity.

If the argument is an XML tree entity, the function will return it as
is, so e.g. redundant calls of `xml_tree_doc` will have no effect. The
only thing xml_tree_doc can alter in the returned value is base URI of
the document entity: if *`base_uri`* is provided and is not NULL, and
argument entity has no base URI set then the provided URI is assigned to
the returned entity.

Any other type of argument is illegal, including XML persistent entity.

</div>

<div>

## Parameters

<div>

### tree

either an XML tree such as that returned by xml_tree(), or a string of
XML data. If a string is provided then it will automatically generate
the parse tree and form an entity instead of requiring you to run the
string through xml_tree() first.

</div>

<div>

### base_uri

Base URI of the original document, if known. It will be useful if the
document is not "standalone" and some entity references are relative
references to resources located "somewhere near" the "top-level"
document passes as "tree" parameter.

</div>

</div>

<div>

## Return Types

XML entity object

</div>

<div>

## Errors

<div>

**Table 24.130. Errors signalled by**

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

**Example 24.518. Transforming an XML Document**

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

<a href="fn_xtree_doc.html" class="link" title="xtree_doc">xtree_doc</a>

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc</a>

<a href="fn_xml_tree.html" class="link" title="xml_tree">xml_tree</a>

<a href="fn_xslt.html" class="link" title="xslt">xslt</a>

<a href="fn_xml_uri_get.html" class="link"
title="xml_uri_get">xml_uri_get</a>

</div>

</div>
