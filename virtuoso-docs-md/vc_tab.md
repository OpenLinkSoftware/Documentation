<div id="vc_tab" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

tab — Selects one of its children to be active at any one time.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_tab" class="funcsynopsis">

|                     |                               |
|---------------------|-------------------------------|
| ` <`**`tab`**` />(` | `name` (required) ,           |
|                     | `annotation` (optional) ,     |
|                     | `initial-enable` (optional) , |
|                     | `enabled` (optional) ,        |
|                     | `instantiate` (optional) ,    |
|                     | `control-udt` (optional) ,    |
|                     | `xsd-stub-xhtml` (optional) , |
|                     | `width` (optional) ,          |
|                     | `height` (optional) ,         |
|                     | `initial-active` (optional) , |
|                     | `style` (optional) ,          |
|                     | `active` (optional) ,         |
|                     | `is-input` (optional) ,       |
|                     | `debug-srcfile` (optional) ,  |
|                     | `debug-srcline` (optional) ,  |
|                     | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_tab" class="refsect1">

## Description

A container that contains some number of pages and displays them one by
one. This can be used for multi-page forms or Windows style tabbed decks
or making multi-part forms, alternative visualizations of the same data
etc.

</div>

<div id="vc_attrs_tab" class="refsect1">

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

**initial-active =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** This is the name of the child template which is active at the time
and which thus will be rendered. Whether inactive templates are
instantiated and keep state is controlled by is-input. The active
attribute initializes the tb_active member of the vspx_tab instance.
This is preserved in the view state. Data bindable.

**style. ** This determines what HTML control is used to select which
child is shown. If unspecified, there will be no such control and the
program logic is responsible for flipping the pages. Otherwise "list"
means there is a HTML select control showing the titles of the tabs.
"radio" means the titles of the tabs are shown as a radio group. If
there is a tab selector widget, it is always above the tabs.

**active = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A data bound
value to enable or disable the tab switch. The default is '1' meaning
'enable'.

**is-input. ** If true, all the children are considered to be
collectively a multipart form and each will be instantiated when the
page is made and will get to retain a view state. Although only one page
of the form is shown at a time, the state of all is kept. Not data
bindable. The default is '1' meaning 'template contains input'.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_tab" class="refsect1">

## Declaration of type vspx_tab

Tab Deck

``` screen
create type vspx_tab under vspx_form
as
   (
     tb_active vspx_template,
     tb_is_input int default 0,
     tb_style varchar
   )
    temporary self as ref
   constructor method vspx_tab (name varchar, parent vspx_control),
   --overriding method vc_render () returns any,
   overriding method vc_set_view_state (e vspx_event) returns any,
   overriding method vc_view_state (stream any, n int) returns any
```

</div>

<div id="vc_ex_tab" class="refsect1">

## Examples

<div id="vc_ex_tab__0" class="example">

**Example 14.42. Switching of page content**

<div class="example-contents">

The sample page contains three templates; only one of three is shown and
user can switch them to change the visible content of the page.

``` screen
<v:page name="tab__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head><title>VSPX samples | v:tab</title></head>
    <body>
      <v:tab name="tab" initial-active="template1" style="list" is-input="0">
        <v:template name="template1" type="simple">This is a first template</v:template>
        <v:template name="template2" type="simple">This is a second template</v:template>
        <v:template name="template3" type="simple">This is a third template</v:template>
      </v:tab>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                     |
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_5/tab.vspx" 
                              class="ulink" target="_top">VX-S-5</a>                             |

</div>

</div>

</div>
