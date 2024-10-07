<div id="vc_item" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

item — Item representing a selection inside a select list.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_item" class="funcsynopsis">

|                      |                               |
|----------------------|-------------------------------|
| ` <`**`item`**` />(` | `name` (required) ,           |
|                      | `value` (required) ,          |
|                      | `xsd-stub-xhtml` (optional) , |
|                      | `width` (optional) ,          |
|                      | `height` (optional) ,         |
|                      | `debug-srcfile` (optional) ,  |
|                      | `debug-srcline` (optional) ,  |
|                      | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_item" class="refsect1">

## Description

Item representing a selection inside a select list.

</div>

<div id="vc_attrs_item" class="refsect1">

## Attributes

**name =
<a href="vc_type_sqlcode.html" class="link" title="SqlCode">SqlCode</a>
. ** The visible value of the option, it will be shown in the option
list.

**value. ** The key value of the option, it will be assigned to the
select control ufl_value is given option is seelcted.

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
