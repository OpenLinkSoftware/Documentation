<div>

<div>

</div>

<div>

## Name

select-list — Fixed initialized select list.

</div>

<div>

## Synopsis

<div>

|                             |                                      |
|-----------------------------|--------------------------------------|
| ` <`**`select-list`**` />(` | `name` (required) ,                  |
|                             | `annotation` (optional) ,            |
|                             | `initial-enable` (optional) ,        |
|                             | `enabled` (optional) ,               |
|                             | `instantiate` (optional) ,           |
|                             | `control-udt` (optional) ,           |
|                             | `xsd-stub-xhtml` (optional) ,        |
|                             | `width` (optional) ,                 |
|                             | `height` (optional) ,                |
|                             | `column` (optional) ,                |
|                             | `null-value` (optional) ,            |
|                             | `error-glyph` (optional) ,           |
|                             | `auto-submit` (optional) ,           |
|                             | `multiple` (optional) ,              |
|                             | `value` (optional) ,                 |
|                             | `element-value` (optional) ,         |
|                             | `element-place` (optional) ,         |
|                             | `element-path` (optional) ,          |
|                             | `element-params` (optional) ,        |
|                             | `element-update-path` (optional) ,   |
|                             | `element-update-params` (optional) , |
|                             | `fmt-function` (optional) ,          |
|                             | `cvt-function` (optional) ,          |
|                             | `debug-srcfile` (optional) ,         |
|                             | `debug-srcline` (optional) ,         |
|                             | `debug-log` (optional) `)`;          |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is a scriptable version of HTML select control. It shows a static
list of items (see item element). Databind and on-post scripts are
allowed.

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

**column =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The name of the column bound. If nothing else is specified, the
column meta data from the containing update form sets the field's
attributes.

**null-value. ** This value will be shown if value of the column is
NULL, also value of the control will be set to null if this value is
passed upon POST request.

**error-glyph. ** The character to be displayed near the resulting HTML
input element if the test of v:validator of the element detects an error
in the current value of the element.

**auto-submit. ** Flag to auto submit the parent form if value of the
control is changed.

**multiple. ** Used to designate a multiple selection list box. In this
case the control's value will be an array of key data of selected items.

**value = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Data bindable
value of control, represents value of HTML control to be drawn. The
calculated value of this attribute is stored in the control in ufl_value
field.

**element-value = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** An XML entity
that contains a value to be displayed by an HTML control. The calculated
value is stored in ufl_element_value field of the control. This value is
used only if ufl_value is null (e.g. if the 'value' attribute is not set
at all), and the method vc_get_value_from_element() will be used to
calculate ufl_value based on ufl_element_value, ufl_element_path and
ufl_element_place.

**element-place = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** The place of
actual data inside an XML element. The calculated value of this
attribute is stored in ufl_element_place field of the control. This is
to process XMLSchema-compatible data without writing extra code for
handling NULL values. The XML element can contain the value to be bound
in either attribute or in an inner text node. XMLSchema treats missing
attributes as NULL values. missing text node as an empty string value
and if 'xsi:nil' attribute is 'true' then inner text value is NULL no
matter if there are any text nodes. These self-evident rules are
convenient for XQuery data retrieval but not for data update: an result
of some XQuery expression can point to data but not to a place where
data should occur in the future. The use of 'element-place' allows to
eliminate the problem. Attributes 'element-value', 'element-path' and
'element-update-path' may locate an element that is always present
whereas 'element-place' describes where the desired datum will occur in
the element. The value of this attribute should be a string of syntax
'@attributename' or 'text()'. If this is '@attributename' then the
effective bound value is a value of the specified attribute or NULL if
the specified attribute is missing. On update, either the attribute is
created/edited in order to set non-NULL value or the attribute is
deleted in order to set NULL. If text() is specified then both text
value of the element and the value of its 'xsi:nil' are properly handled
on both data bind and update.

**element-path = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is the path
inside the entity that comes from 'element-value' attribute. The default
path is 'self::node()'. This path is used to point precisely to an
subentity that should actually be used for data binding. The calculated
value of this attribute should be a string in XQuery syntax, and it is
saved in ufl_element_path member of the control.

**element-params =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is the
vector of parameter values of the path specified by 'element-path'
attribute. The default is NULL indicating no parameters. The attribute
is calculated but not used if 'element-path' attribute is missing. The
calculated value of this attribute should be either NULL or a vector of
even length whose items are parameter names and parameter values; refer
to the description of xquery_eval() function for more details. The value
of the attribute is saved in ufl_element_params member of the control.

**element-update-path =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Like the value of
'element-path', this is the path inside the entity that comes from
'element-value' attribute. The difference is that 'element-path' is used
inside 'vc_get_value_from_element() during data-bind to set ufl_value
based on ufl_element_value whereas 'element-update-path' is used during
data update inside 'vc_put_value_to_element() in order to save data
inside the document that is referenced by ufl_element_value. The default
path for update is equal to the path for data bind, i.e. it is the value
of the calculated 'element-path' attribute or 'self::node()'. The
calculated value of 'element-update-path' should be a string in XQuery
syntax, and it is saved in ufl_element_update_path member of the
control.

**element-update-params =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is the
vector of parameter values of the path specified by
'element-update-path' attribute. The default is NULL indicating no
parameters. The attribute is calculated but not used if
'element-update-path' attribute is missing (e.g. you should not try to
specify 'element-path' without 'element-update-path' and both
'element-params' and 'element-update-params' in hope that values from
'element-update-params' will be passed to 'element-path' on update). The
calculated value of this attribute should be either NULL or a vector of
even length whose items are parameter names and parameter values; refer
to the description of xquery_eval() function for more details. The value
of the attribute is saved in ufl_element_update_params member of the
control.

**fmt-function = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is to
convert the value that is bound to the control into a string to use
during the rendering. The value of this attribute should be a name of
function that takes a single argument of the type that matches the type
of ufl_value and returns a string. If this is used then the value of
'cvt-function' should probably be a name of function that converts the
string back to the desired data type. If a control supports 'format'
attribute then the format is applied to the result of 'fmt-function', so
the value returned by fmt-function may be e.g. an integer to be
formatted by '%d' format. The calculated value of this attribute is
stored in ufl_fmt_fn field of the control.

**cvt-function = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is to
convert a user input of type varchar into a value that should be stored
in ufl_value (and e.g. placed into some database column by an update).
The calculated value of this attribute is stored in ufl_cvt_fn field of
the control. For more details, see the description of 'fmt_function'
attribute above.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_select_list

``` screen
create type vspx_select_list under vspx_field
as (
     vsl_items any,
     vsl_item_values any,
     vsl_selected_inx any default null,
     vsl_change_script int default 0,
     vsl_list_document any default null,
     vsl_list_match varchar default null,
     vsl_list_key_path varchar default null,
     vsl_list_value_path varchar default null,
     vsl_multiple int default 0
   )
  temporary self as ref
 overriding method vc_render () returns any,
 overriding method vc_view_state (stream any, n int) returns any,
 overriding method vc_set_view_state (e vspx_event) returns any,
 overriding method vc_set_model () returns any,
 overriding method vc_xrender () returns any,
 method vs_set_selected () returns any,
constructor method vspx_select_list (name varchar, parent vspx_control)
```

</div>

<div>

## Examples

<div>

**Example 14.41.  A simple static select list**

<div>

The form of the sample page contains a list of three items.

``` screen
<v:page name="select_list__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:select-list</title>
    </head>
    <body>
      <v:form name="form1" type="simple" action="" method="POST">
        <v:select-list name="sel_list">
          <v:item name="*default*" value="0"/>
          <v:item name="FIRST" value="1"/>
          <v:item name="SECOND" value="2"/>
        </v:select-list>
        <v:button name="submit1" action="simple" value="OK"/>
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div>

|                            |                                                                      |
|:--------------------------:|:---------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                        |
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_2/select.vspx" 
                              class="ulink" target="_top">VX-S-2</a>                                |

</div>

</div>

</div>
