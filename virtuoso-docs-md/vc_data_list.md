<div>

<div>

</div>

<div>

## Name

data-list — Select list initialized from database table.

</div>

<div>

## Synopsis

<div>

|                           |                                      |
|---------------------------|--------------------------------------|
| ` <`**`data-list`**` />(` | `name` (required) ,                  |
|                           | `annotation` (optional) ,            |
|                           | `initial-enable` (optional) ,        |
|                           | `enabled` (optional) ,               |
|                           | `instantiate` (optional) ,           |
|                           | `control-udt` (optional) ,           |
|                           | `xsd-stub-xhtml` (optional) ,        |
|                           | `width` (optional) ,                 |
|                           | `height` (optional) ,                |
|                           | `error-glyph` (optional) ,           |
|                           | `auto-submit` (optional) ,           |
|                           | `column` (optional) ,                |
|                           | `null-value` (optional) ,            |
|                           | `value` (optional) ,                 |
|                           | `element-value` (optional) ,         |
|                           | `element-place` (optional) ,         |
|                           | `element-path` (optional) ,          |
|                           | `element-params` (optional) ,        |
|                           | `element-update-path` (optional) ,   |
|                           | `element-update-params` (optional) , |
|                           | `fmt-function` (optional) ,          |
|                           | `cvt-function` (optional) ,          |
|                           | `table` (optional) ,                 |
|                           | `key-column` (optional) ,            |
|                           | `value-column` (optional) ,          |
|                           | `sql` (optional) ,                   |
|                           | `defvalue` (optional) ,              |
|                           | `multiple` (optional) ,              |
|                           | `list-document` (optional) ,         |
|                           | `list-match` (optional) ,            |
|                           | `list-key-path` (optional) ,         |
|                           | `list-value-path` (optional) ,       |
|                           | `debug-srcfile` (optional) ,         |
|                           | `debug-srcline` (optional) ,         |
|                           | `debug-log` (optional) `)`;          |

<div>

 

</div>

</div>

</div>

<div>

## Description

This control is used to make a select list, based on a SQL expression.
Also instead of SQL expression only table name could be given, so then
control will compose apropriate select statement.

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

**error-glyph. ** The character to be displayed near the resulting HTML
input element if the test of v:validator of the element detects an error
in the current value of the element.

**auto-submit. ** Flag to auto submit the parent form if value of the
control is changed.

**column =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The name of the column bound. If nothing else is specified, the
column meta data from the containing update form sets the field's
attributes.

**null-value. ** This value will be shown if value of the column is
NULL, also value of the control will be set to null if this value is
passed upon POST request.

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

**table. ** A table name for select statement.

**key-column =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** A key column name.

**value-column =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** A value column name.

**sql = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** An alterantive of
'table' attribute, when this attribute is specified it must contains a
valid select statement. The selection list will be instantiated using a
cursor as this expression is defined.

**defvalue = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A default value
for the control.

**multiple. ** Used to desigante a multiple selection list box. In this
case the control's value will be an array of key data of selected items.

**list-document = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is to obtain
all or some of items of the select-list from an XML document. If this
attribute is specified then the value of the calculated attribute should
be an XML entity and this entity will be saved in vsl_list_document
field of the control; values of 'list-match', 'list-key-path' and
'list-value-path' arguments should specify XQuery expressions that
should be used to retrieve keys and displayable values of items. All
selection items composed from the value of 'list-document' will be
listed before all items from 'table' or 'sql', if both methods of data
retrieval are used.

**list-match = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is to
calculate a string value that is an XQuery expression. The text of this
expression will be saved in 'vsl_list_match' member of the control. This
expression will be used during data binding to get array of displayable
items from the value of 'list-document'. The expression should return a
node-set using 'list-document' entity as a context mode; every item of
the node-set will be converted into list item via 'list-key-path' and
'list-value-path' expressions.

**list-key-path = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is to
specify the XQuery expression that calculates key value of a list item,
using a result of 'list-match' as a context node. The text of the
expression will be saved in 'vsl_list_key_path' member of the control.

**list-value-path =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is to
specify the XQuery expression that calculates a displayable value of a
list item, using a result of 'list-match' as a context node. The text of
the expression will be saved in 'vsl_list_value_path' member of the
control.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_data_list

``` screen
create type vspx_data_list under vspx_select_list temporary self as ref
constructor method vspx_data_list (name varchar, parent vspx_control)
```

</div>

<div>

## Examples

<div>

**Example 14.25.  Select list based on table source**

<div>

This example will render in a form a select list containing the
customers from Northwind demo database with a option values their
customer IDs.

``` screen
<v:page name="data_list__0" xmlns:v="http://http://example.com/vspx/">
<html>
  <body>
      <v:form name="f1" type="simple" method="POST">
        <v:data-list name="dl1" table="Demo.demo.Customers" key-column="CustomerID" value-column="CompanyName"/>
      </v:form>
  </body>
</html>
</v:page>
```

</div>

</div>

  

<div>

**Example 14.26.  Select list based on SQL select statement**

<div>

This example will render in a form a select list containing the
customers from Northwind demo database with a option values their
customer IDs.

``` screen
<v:page name="data_list__1" xmlns:v="http://http://example.com/vspx/">
<html>
  <body>
      <v:form name="f1" type="simple" method="POST">
        <v:data-list name="dl1" sql="select * from Demo.demo.Customers" key-column="CustomerID" value-column="CompanyName"/>
      </v:form>
  </body>
</html>
</v:page>
```

</div>

</div>

  

<div>

|                            |                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                          |
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_3/selectdb.vspx" 
                              class="ulink" target="_top">VX-S-3</a>                                  |

</div>

</div>

</div>
