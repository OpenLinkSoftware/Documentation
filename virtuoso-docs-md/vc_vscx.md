<div id="vc_vscx" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vscx

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_vscx" class="funcsynopsis">

|                      |                               |
|----------------------|-------------------------------|
| ` <`**`vscx`**` />(` | `name` (required) ,           |
|                      | `annotation` (optional) ,     |
|                      | `initial-enable` (optional) , |
|                      | `enabled` (optional) ,        |
|                      | `instantiate` (optional) ,    |
|                      | `control-udt` (optional) ,    |
|                      | `xsd-stub-xhtml` (optional) , |
|                      | `width` (optional) ,          |
|                      | `height` (optional) ,         |
|                      | `url` (required) ,            |
|                      | `debug-srcfile` (optional) ,  |
|                      | `debug-srcline` (optional) ,  |
|                      | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_vscx" class="refsect1">

## Description

Custom control encapsulated in a separate VSPX page. This is a wrapper
for custom control instantiation. The target URL MUST contain a valid
VSPX page reference. In this way repeatable pieces of code can be reused
in form of instantiation of their page class, this is different from
inclusion. The target page variables can be initialized as attributes in
this control, where name of attribute is a name of variable of target
page and value is an expression to be assigned.

</div>

<div id="vc_attrs_vscx" class="refsect1">

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

**url. ** Reference to a VSPX page to be instantiated as a control.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_vscx" class="refsect1">

## Declaration of type vspx_vscx

``` screen
create type vspx_vscx under vspx_form
self as ref temporary
constructor method vspx_vscx (name varchar, parent vspx_control, uri varchar),
overriding method vc_pre_render (stream any, n int) returns any
```

</div>

<div id="vc_ex_vscx" class="refsect1">

## Examples

<div id="vc_ex_vscx__0" class="example">

**Example 14.48.  Outer page, including a navigation bar via
vscx\_\_1.vspx**

<div class="example-contents">

This page will embed another page twice, but not as simple inclusion.
The second page is treated as a control and it's page class will be
instantiated twice as as a child of outer page.

``` screen
<v:page name="outer_page" xmlns:v="http://http://example.com/vspx/">
  <html>
    <body>
      <v:variable name="var1" type="int" default="0" />
      <h3>Embeeding a page as a custom control</h3>
      <v:form type="simple" name="f1">
    <div>
      <div>control1</div>
      <v:vscx name="bar1" url="vscx__1.vspx"/>
    </div>
    <div>
      <div>control2</div>
      <v:vscx name="bar2" url="vscx__1.vspx"/>
    </div>
    <div>
      <v:text name="txt2" />
      <v:button action="simple" value="Outer" name="b2" />
    </div>
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div id="vc_ex_vscx__1" class="example">

**Example 14.49.  Simple navigation bar used as custom control**

<div class="example-contents">

This page is used inside vscx\_\_0.vspx one as a custom control.

``` screen
<v:page name="custom_bar" xmlns:v="http://http://example.com/vspx/">
  <v:variable name="test" type="int" default="12" />
  <table border="1" cellspacing="1" cellpadding="0">
    <tr>
      <td>
    <v:url name="u1" value="Home" url="--http_path ()" /> |
      </td>
      <td>
    <v:url name="u2" value="Settings" url="--http_path ()||'?settings'" /> |
      </td>
      <td>
    <v:url name="u3" value="Posts" url="--http_path ()||'?posts'" /> |
      </td>
      <td>
    <v:url name="u4" value="Maintenance" url="--http_path ()||'?maint'" />
      </td>
    </tr>
  </table>
  <div>
    <v:form type="simple" name="f1">
      <v:text name="txt1" />
      <v:button name="b1" action="simple" value="Inner"/>
    </v:form>
  </div>
</v:page>
```

</div>

</div>

  

</div>

</div>
