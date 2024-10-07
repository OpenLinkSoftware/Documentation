<div id="vc_button" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

button — Scriptable button.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_button" class="funcsynopsis">

|                        |                                     |
|------------------------|-------------------------------------|
| ` <`**`button`**` />(` | `name` (required) ,                 |
|                        | `annotation` (optional) ,           |
|                        | `initial-enable` (optional) ,       |
|                        | `enabled` (optional) ,              |
|                        | `instantiate` (optional) ,          |
|                        | `control-udt` (optional) ,          |
|                        | `xsd-stub-xhtml` (optional) ,       |
|                        | `width` (optional) ,                |
|                        | `height` (optional) ,               |
|                        | `column` (optional) ,               |
|                        | `null-value` (optional) ,           |
|                        | `action` (required) ,               |
|                        | `value` (required) ,                |
|                        | `style` (optional) ,                |
|                        | `active` (optional) ,               |
|                        | `initial-active` (optional) ,       |
|                        | `child-window-options` (optional) , |
|                        | `browser-current` (optional) ,      |
|                        | `browser-filter` (optional) ,       |
|                        | `browser-list` (optional) ,         |
|                        | `browser-mode` (optional) ,         |
|                        | `browser-type` (optional) ,         |
|                        | `browser-xfer` (optional) ,         |
|                        | `selector` (optional) ,             |
|                        | `format` (optional) ,               |
|                        | `debug-srcfile` (optional) ,        |
|                        | `debug-srcline` (optional) ,        |
|                        | `debug-log` (optional) `)`;         |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_button" class="refsect1">

## Description

Scriptable version of Submit Button of the HTML form. Depending of
'action' attribute it may have variants. In some of these variants the
button will not have a submit function, as in select and browse buttons.
In these cases the button will use client JavaScript to pop up new
windows or for setting values in other windows.

</div>

<div id="vc_attrs_button" class="refsect1">

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

**action. ** This specifies the button subclass to use.

<div id="id39067" class="table">

**Table 14.1. Allowed values of the 'action' attribute**

<div class="table-contents">

|        |                                                                                                                                                                                                                                                                                                                                                 |
|--------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| simple | is a simple submit button, no special functions                                                                                                                                                                                                                                                                                                 |
| submit | an alias of 'simple' button, obsolete                                                                                                                                                                                                                                                                                                           |
| delete | a button for deleting a row in a data-set or data-grid control. This is represented as a submit button with a special on-post script. The delete function is performed based on table, key attributes. (check implementation!!)                                                                                                                 |
| browse | Button that opens pup-up window using client-side javascript (browse-button). This control allows the designer to place some part of a form's input into a pop-up window. When the HTML page is rendered, this control puts a button and associated client-side javascript into the resulting page so clicking the button opens a child window. |
| return | This is to be used on a page invoked for selecting from a browse button. Specifies that the value of the fields designated by the field children are to be asigned to the corresponding fields of the invoking page.                                                                                                                            |
| logout | This will terminate the current session when clicked. Can only occur inside the login control.                                                                                                                                                                                                                                                  |

</div>

</div>

  

**value = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Text of the label
of the button.

**style. ** A style of button, affects appearance.

<div id="id39102" class="table">

**Table 14.2. Allowed values of the 'style' attribute**

<div class="table-contents">

|        |                                                                                                                                                |
|--------|------------------------------------------------------------------------------------------------------------------------------------------------|
| submit | This is a default style used, no special handling. The button will be rendered as a usual submit button.                                       |
| url    | The button will be rendered as a link, furthermore client side JavaScript code will be produced to act as submit button.                       |
| image  | The button will be rendered as an image on the browser under link button. In that case value of button control must be link to the image file. |

</div>

</div>

  

**active = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A data bound
value to enable or disable the button. The default is '1' meaning
'enable'.

**initial-active =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A data bound
value to enable or disable the button. The default is '1' meaning
'enable'. Unlike 'active' attribute, this one is effective only when the
page is displayed in the first time, not after user posts data back to
the page.

**child-window-options. ** Options for oppening a child pop-up
window.This can be used only in conjuction with action browse.

**browser-current. ** Current directory of browsing. Can be used only
with browse button for WebDAV or File system resources.

**browser-filter. ** Filter expression(s) for browsing. (see above)

**browser-list. ** Type of browser list, 0 - short, 1 - long

**browser-mode. ** COL, RES or STANDALONE , for a file system or DAV
browse button, this specifies whether to return an path name or internal
ID.

**browser-type. ** This designates the type of browser: dav or OS
(filesystem).

**browser-xfer. ** For a browse button, this is the means of
transferring the data between windows, DOM is default. No other options
in current implementation.

**selector. ** For a browse button this is the URL that will be loaded
into the pop up window.

**format = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A sprintf format
string for printing the value

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_button" class="refsect1">

## Declaration of type vspx_button

Button class, encapsulate all controls originating a event

``` screen
create type vspx_button under vspx_field as
(
  bt_pressed int default 0,
  bt_style  varchar default 'submit',
  bt_close_img varchar,
  bt_open_img varchar,
  bt_url varchar default '',
  bt_l_pars varchar default '',
  bt_text varchar default '',
  bt_anchor int default 0
)  temporary self as ref
overriding method vc_render () returns any,
overriding method vc_xrender () returns any,
overriding method vc_set_model () returns any,
constructor method vspx_button (name varchar, parent vspx_control)
```

</div>

<div id="vc_ex_button" class="refsect1">

## Examples

<div id="vc_ex_button__0" class="example">

**Example 14.16.  Buton shown as an image**

<div class="example-contents">

The button of the form will be shown as a picture plus.gif. Attributes
whose names start with 'xhtml\_' are placed into the resulting HTML with
no changes.

``` screen
<v:page name="button__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:button</title>
    </head>
    <body>
      <v:form name="form1" type="simple" action="" method="POST">
        <v:text name="txt1" default=""/>
        <v:button name="submit1" action="simple" style="image" xhtml_alt="A test button" value="--'plus.gif'" />
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div id="vc_ex_button__1" class="example">

**Example 14.17.  Simple 'Add-Number' example**

<div class="example-contents">

The form accepts two numbers and calculates their sum.

``` screen
<v:page name="button__1" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:button</title>
    </head>
    <body>
      <v:form name="f1" type="simple" action="" method="POST">
    <v:label name="l1" value="--0" format="%.2f" /><br/>
        <v:text name="t1" default="0"/>
        <v:text name="t2" default="0"/>
        <v:button name="b1" action="simple" value="Add" >
    <v:on-post>
     self.l1.ufl_value := atof (self.t1.ufl_value) + atof (self.t2.ufl_value);
    </v:on-post>
    </v:button>
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div id="vc_ex_button__2" class="example">

**Example 14.18.  Simple 'Browse File' dialog**

<div class="example-contents">

The form allows to select a file from server's file system \<html\>
\<body\>

``` screen
<v:page name="browse__2" xmlns:v="http://http://example.com/vspx/">
  <v:form name="f1" type="simple" method="POST">
      <v:text name="floc" value="" xhtml_size="60%" />
      <v:button action='browse' name="cmb" selector="browser/dav_browser.vsp"
        child-window-options="resizable=yes, status=no, menubar=no, scrollbars=no, width=640, height=400"
        value="Browse"
        browser-type="os"
        browser-mode="RES"
        browser-xfer="DOM"
        browser-list="1"
        browser-current="1"
        browser-filter="*">
        <v:field name="floc" />
      </v:button>
  </v:form>
</v:page>
</body>
</html>
```

</div>

</div>

  

<div id="vc_ex_button__3" class="example">

**Example 14.19.  Simple browse button example**

<div class="example-contents">

The form allows to select a two values from a different page \<html\>
\<body\>

``` screen
<v:page name="button__3" xmlns:v="http://http://example.com/vspx/">
  <v:form name="frm" type="simple" method="POST">
      <v:text name="fld1" value="" />
      <v:text name="fld2" value="" />
      <v:button action='browse' name="br1" selector="button__4.vspx"
        child-window-options="scrollbars=yes, menubar=no, height=630, width=600"
        value="Browse">
        <v:field name="fld1" />
        <v:field name="fld2" />
      </v:button>
  </v:form>
</v:page>
</body>
</html>
```

</div>

</div>

  

<div id="vc_ex_button__4" class="example">

**Example 14.20.  Simple select button example**

<div class="example-contents">

The form returns back to caller form two walues from a text box and
select list \<html\> \<body\>

``` screen
<v:page name="button__4" xmlns:v="http://http://example.com/vspx/">
  <v:form name="f1" type="simple" method="POST">
     <v:text name="sl1" value="Test" />
     <v:select-list name="sl2">
       <v:item name="*default*" value="0" />
       <v:item name="FIRST"  value="1" />
       <v:item name="SECOND"     value="2" />
     </v:select-list>
    <v:button name="select1" action="return" value="Select">
      <v:field name="fld1" ref="sl1" />
      <v:field name="fld2" ref="sl2" />
    </v:button>
 </v:form>
</v:page>
</body>
</html>
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
href="http://demo.openlinksw.com/tutorial/web/vx_s_2/form.vspx"
class="ulink" target="_top">VX-S-2</a></p>
<p><a
href="http://demo.openlinksw.com/tutorial/web/vx_s_7/products.vspx"
class="ulink" target="_top">VX-S-7</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
