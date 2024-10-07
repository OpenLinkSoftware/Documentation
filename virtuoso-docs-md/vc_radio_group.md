<div id="vc_radio_group" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

radio-group — A group of radio-buttons.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_radio_group" class="funcsynopsis">

|                             |                               |
|-----------------------------|-------------------------------|
| ` <`**`radio-group`**` />(` | `name` (required) ,           |
|                             | `annotation` (optional) ,     |
|                             | `initial-enable` (optional) , |
|                             | `enabled` (optional) ,        |
|                             | `instantiate` (optional) ,    |
|                             | `control-udt` (optional) ,    |
|                             | `xsd-stub-xhtml` (optional) , |
|                             | `width` (optional) ,          |
|                             | `height` (optional) ,         |
|                             | `error-glyph` (optional) ,    |
|                             | `auto-submit` (optional) ,    |
|                             | `column` (optional) ,         |
|                             | `debug-srcfile` (optional) ,  |
|                             | `debug-srcline` (optional) ,  |
|                             | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_radio_group" class="refsect1">

## Description

This control is used to group containing radio-buttons in a group. This
ensures that only one button is selected at a time. Note: This control
is not mandatory for making such group of buttons, another option is to
use 'group-name' attribute of the radio-button control.

</div>

<div id="vc_attrs_radio_group" class="refsect1">

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

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_radio_group" class="refsect1">

## Declaration of type vspx_radio_group

``` screen
create type vspx_radio_group under vspx_field
temporary self as ref
constructor method vspx_radio_group (name varchar, parent vspx_control),
method vc_choose_selected () returns any,
overriding method vc_xrender () returns any,
overriding method vc_set_model () returns any
```

</div>

<div id="vc_ex_radio_group" class="refsect1">

## Examples

<div id="vc_ex_radio_group__0" class="example">

**Example 14.40.  Groups of radio buttons.**

<div class="example-contents">

The form contains a groups of radio buttons, grouped with radio-group
control.

``` screen
<v:page name="radio_group_demo" xmlns:v="http://http://example.com/vspx/">
<html>
<body>
  <v:form name="sf" type="simple" method="POST">
     <v:radio-group name="radio00">
       <v:radio-button name="radiob01" value="--'one'" />
       <v:radio-button name="radiob02" value="--'two'" />
     </v:radio-group>
  </v:form>
</body>
</html>
</v:page>
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0"
data-summary="Tip: See Also: Reference Material in the Tutorial:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also: Reference Material in the
Tutorial:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="http://demo.openlinksw.com/tutorial/web/vx_s_2/radio_group.vspx"
class="ulink" target="_top">VX-S-2</a></p>
<p><a
href="http://demo.openlinksw.com/tutorial/web/vx_s_3/update_radio.vspx"
class="ulink" target="_top">VX-S-3</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
