<div id="vc_hidden" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

hidden — A wrapper that prevents WYSIWYG editors from displaying its
content.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_hidden" class="funcsynopsis">

|                        |                               |
|------------------------|-------------------------------|
| ` <`**`hidden`**` />(` | `xsd-stub-xhtml` (optional) , |
|                        | `width` (optional) ,          |
|                        | `height` (optional) ,         |
|                        | `debug-srcfile` (optional) ,  |
|                        | `debug-srcline` (optional) ,  |
|                        | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_hidden" class="refsect1">

## Description

This control does not affect the resulting HTML and Virtuoso/PL code. It
is used by some WYSIWYG editors in order to temporarily hide details of
the page fragment from the editor's drawing area.

</div>

<div id="vc_attrs_hidden" class="refsect1">

## Attributes

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
