<div id="fn_xml_template" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_template — Execute XML template from Virtuoso PL

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_template" class="funcsynopsis">

|                           |                                      |
|---------------------------|--------------------------------------|
| ` `**`xml_template`**` (` | in `xml_document_entity ` any ,      |
|                           | in `parameters ` vector ,            |
|                           | inout `session ` string_session `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xml_template" class="refsect1">

## Description

The `xml_template() ` function was introduced to enable PL programming
to make use of XML templates. This function expects an XML entity for
the first argument, that will be the XML template file contents. Usually
this entity is composed making use of the `xtree_doc()` function from
the XML template file.

The second argument should be a vector of name-value pairs of the
parameters for XML template.

The last argument is an output string stream for the result. If the
output stream is not specified the HTTP internal stream will be used if
it is available, otherwise an error will be signalled.

</div>

<div id="params_xml_template" class="refsect1">

## Parameters

<div id="id123314" class="refsect2">

### xml_document_entity

XML entity such as that returned by `xtree_doc() `

</div>

<div id="id123318" class="refsect2">

### parameters

Vector or name-value pairs: vector('name1', 'value1', 'name2', 'value2',
...).

</div>

<div id="id123321" class="refsect2">

### session

Output stream for handling the results of XML template. If this
parameter is unspecified then the HTTP internal stream will be assumed,
which if not applicable will signal an error.

</div>

</div>

<div id="ret_xml_template" class="refsect1">

## Return Types

A URL of the XSLT stylesheet for further transformation will be
returned. If xsl attribute was not specified in the XML template then
the return value will be NULL.

</div>

</div>
