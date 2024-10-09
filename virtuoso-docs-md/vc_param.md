<div>

<div>

</div>

<div>

## Name

param — Named parameter for the cursor.

</div>

<div>

## Synopsis

<div>

|                       |                               |
|-----------------------|-------------------------------|
| ` <`**`param`**` />(` | `name` (required) ,           |
|                       | `value` (required) ,          |
|                       | `xsd-stub-xhtml` (optional) , |
|                       | `width` (optional) ,          |
|                       | `height` (optional) ,         |
|                       | `debug-srcfile` (optional) ,  |
|                       | `debug-srcline` (optional) ,  |
|                       | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

Named parameter for execution of the cursor select statement. This must
be the name of a parameter for SQL statement specified, but without
leading colon.

</div>

<div>

## Attributes

**name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** Name of the parameter.

**value = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Data bound value
of the parameter.

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
