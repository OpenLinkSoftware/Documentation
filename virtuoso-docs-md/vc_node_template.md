<div>

<div>

</div>

<div>

## Name

node-template

</div>

<div>

## Synopsis

<div>

|                               |                               |
|-------------------------------|-------------------------------|
| ` <`**`node-template`**` />(` | `name` (required) ,           |
|                               | `annotation` (optional) ,     |
|                               | `initial-enable` (optional) , |
|                               | `enabled` (optional) ,        |
|                               | `instantiate` (optional) ,    |
|                               | `control-udt` (optional) ,    |
|                               | `xsd-stub-xhtml` (optional) , |
|                               | `width` (optional) ,          |
|                               | `height` (optional) ,         |
|                               | `debug-srcfile` (optional) ,  |
|                               | `debug-srcline` (optional) ,  |
|                               | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

</div>

<div>

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

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_node_template

``` screen
create type vspx_node_template under vspx_control
as ( vc_stub any ) temporary self as ref
```

</div>

</div>
