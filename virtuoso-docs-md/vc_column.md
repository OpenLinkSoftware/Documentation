<div id="vc_column" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

column — A column marker.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_column" class="funcsynopsis">

|                        |                               |
|------------------------|-------------------------------|
| ` <`**`column`**` />(` | `name` (required) ,           |
|                        | `label` (optional) ,          |
|                        | `input-format` (optional) ,   |
|                        | `output-format` (optional) ,  |
|                        | `xsd-stub-xhtml` (optional) , |
|                        | `width` (optional) ,          |
|                        | `height` (optional) ,         |
|                        | `debug-srcfile` (optional) ,  |
|                        | `debug-srcline` (optional) ,  |
|                        | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_column" class="refsect1">

## Description

A column marker for use in v:data-set, v:data-grid and v:data-source.
This element should exist for each selected column of the SQL expression
of the data set. If this is specified under data-set, data-source or
data-grid controls, this must be the exact same columns as in SQL
statement to be evaluated. If those element is omitted in data-set or
data-grid, the columns will be extracted from compilation of the SQL
statement. However, this will always be required for calls of stored
procedures that return resultsets and for the data-source control.

</div>

<div id="vc_attrs_column" class="refsect1">

## Attributes

**name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The name of column

**label = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Alternate text
which could be used to display in column headings.

**input-format. ** A sprintf format string for printing the input value

**output-format. ** A sprintf format string for printing the output
value

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
