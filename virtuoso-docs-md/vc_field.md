<div id="vc_field" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

field — Name of input to be sent to and back between pup-up and parent
window.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_field" class="funcsynopsis">

|                       |                               |
|-----------------------|-------------------------------|
| ` <`**`field`**` />(` | `name` (required) ,           |
|                       | `annotation` (optional) ,     |
|                       | `initial-enable` (optional) , |
|                       | `enabled` (optional) ,        |
|                       | `instantiate` (optional) ,    |
|                       | `control-udt` (optional) ,    |
|                       | `xsd-stub-xhtml` (optional) , |
|                       | `width` (optional) ,          |
|                       | `height` (optional) ,         |
|                       | `ref` (optional) ,            |
|                       | `debug-srcfile` (optional) ,  |
|                       | `debug-srcline` (optional) ,  |
|                       | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_field" class="refsect1">

## Description

This element may occur under browse-button or select button, it
enumerates the names of inputs to be sent between pop-up and parent
window.

</div>

<div id="vc_attrs_field" class="refsect1">

## Attributes

**name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** A page level unique name identifying a control.

**annotation. ** A human readable comment.

**initial-enable =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Determines
whether a control is initially visible. True by default. Could be
data-bound to an SQL expression.

**enabled = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Determines
whether a control is visible. True by default. Could be data-bound to an
SQL expression.

**instantiate = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Determines
whether a control instantiate its children. It is true by default. It
could be data-bound to an SQL expression. Unlike most of calcucateable
attributes, the value of this attribute for a control is calcluated
before calling 'on-init' event handler of the control; other values are
calculated before calling 'before-data-bind' event handler.

**control-udt =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** At run time every control is represented as an instance of some
user-defined type (UDT). VSPX compiles selects the UDT to use depending
on name of the XML element that represents the control and maybe some of
its attributes. In some specific cases the application developer may
instruct VSPX compiler to use some other UDT, e.g. an
application-specific UDT that is derived from the preset one. If
specified, the value of 'control-udt' attribute should be equal to the
name of the desired target UDT.

**xsd-stub-xhtml. ** This attribute is for internal use only. It has no
effect if added to the source VSPX file.

**width. ** Visible width of the control when it is displayed in WYSIWYG
tools when the source VSPX text is edited. The value of this attribute
will not be used when the resulting HTML is rendered.

**height. ** Visible width of the control when it is displayed in
WYSIWYG tools when the source VSPX text is edited. The value of this
attribute will not be used when the resulting HTML is rendered.

**ref =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** When a field is used as child of and return button then this must
contain valid reference to name of a input control (like text,
select-list, data-list etc.) from current page. The referenced control's
value will be used to set the value of control with name specified in
attribute 'name' in the target page. The data will be set using
automatically generated JavaScript function.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

</div>
