<div id="vc_key" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

key — A key value of the vspx:form of type 'update'.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_key" class="funcsynopsis">

|                     |                               |
|---------------------|-------------------------------|
| ` <`**`key`**` />(` | `name` (optional) ,           |
|                     | `column` (required) ,         |
|                     | `value` (required) ,          |
|                     | `default` (optional) ,        |
|                     | `xsd-stub-xhtml` (optional) , |
|                     | `width` (optional) ,          |
|                     | `height` (optional) ,         |
|                     | `debug-srcfile` (optional) ,  |
|                     | `debug-srcline` (optional) ,  |
|                     | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_key" class="refsect1">

## Description

This control defines a key value of the vspx:form of type 'update'. All
the vspx:key children together should select one or zero rows from the
table. Controls inside the form will process fields of this selected
row.

</div>

<div id="vc_attrs_key" class="refsect1">

## Attributes

**name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** Not used

**column =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** Name of the column in the table to be updated. This may be either
the name of a primary key column or an other column, as long as the
selection specified by all vspx:key children of the vspx:form is
unambiguous.

**value = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** The value of the
key field referred to by the 'column' attribute.

**default = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** The default value
to be used when the 'value' expression returns NULL.

**xsd-stub-xhtml. ** This attribute is for internal use only. It has no
effect if added to the source VSPX file.

**width. ** Visible width of the control when it is displayed in WYSIWYG
tools when the source VSPX text is edited. The value of this attribute
will not be used when the resulting HTML is rendered.

**height. ** Visible width of the control when it is displayed in
WYSIWYG tools when the source VSPX text is edited. The value of this
attribute will not be used when the resulting HTML is rendered.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

</div>
