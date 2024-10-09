<div>

<div>

</div>

<div>

## Name

form — Generic scriptable container for elements that may accept user's
input.

</div>

<div>

## Synopsis

<div>

|                      |                               |
|----------------------|-------------------------------|
| ` <`**`form`**` />(` | `name` (required) ,           |
|                      | `annotation` (optional) ,     |
|                      | `initial-enable` (optional) , |
|                      | `enabled` (optional) ,        |
|                      | `instantiate` (optional) ,    |
|                      | `control-udt` (optional) ,    |
|                      | `xsd-stub-xhtml` (optional) , |
|                      | `width` (optional) ,          |
|                      | `height` (optional) ,         |
|                      | `type` (optional) ,           |
|                      | `action` (optional) ,         |
|                      | `method` (optional) ,         |
|                      | `table` (optional) ,          |
|                      | `if-not-exists` (optional) ,  |
|                      | `concurrency` (optional) ,    |
|                      | `triggers` (optional) ,       |
|                      | `data-source` (optional) ,    |
|                      | `debug-srcfile` (optional) ,  |
|                      | `debug-srcline` (optional) ,  |
|                      | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is a grouping element for controls that handle post data and
validation of user's input. In case of type 'update', this is a single
row update control for a database table. This retrieves the data from
the row identified by the keys and shows the data in the column bound
fields enclosed. If responding to a post for a submit inside this form,
the form updates/inserts the data and shows the resulting state at the
render pass.

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

**type. ** Type of form, can be 'simple' or 'update'. When this is
'simple' the vspx_form class will be instantiated, otherwise in case of
'update' vspx_update_form subclass will be used.

<div>

**Table 14.6. Allowed values of the 'type' attribute**

<div>

|        |                                                               |
|--------|---------------------------------------------------------------|
| simple | Form with no special data binding.                            |
| update | Form that may be used in templates of type 'update' or 'add'. |

</div>

</div>

  

**action. ** A URL for processing. The data filled-in the form will be
submitted to the 'action' page. Therefore this is a page where the
content of that form will be processed. If it is empty, the target is a
current page.

**method. ** A method of transferring the form data, can be POST or GET.
The same as 'method' of HTML forms.

The use of 'GET' is not recommended because the length of the URI may
easily exceed internal limits of the browser or an intermediate proxy
server.

**table. ** If the value of 'type' attribute is 'update', the form acts
as a single row update control for a database table; and the value of
'table' attribute specifies the name of that table. It retrieves the
data from the row identified by the keys and shows the data in the
column bound fields enclosed. If responding to a post for a submit
inside this form, the form updates/inserts the data and shows the
resulting state at the render pass. This attribute is required if 'type'
is 'update' and prohibited otherwise.

**if-not-exists. ** If the keys do not select any row, and the value of
this attribute is 'insert', the update form will be filled in with
defaults filled in and will do an insert into the table when the form is
submitted. In this case of course the keys will have to be defaulted
after the post or will have to be supplied in the post as fields. Any
defaulting should take place in the v:on-post handler which is before
the insert or update in the event of the post.

**concurrency. ** If true and a previous value was shown in the form
before the post being processed, this causes the system to check whether
any of the data has been updated between getting it and the post at
hand. This is a sort of optimistic concurrency control at the row level.
If an update is detected, the updated_meanwhile message is set as the
error message of the form and no update is made. The render pass may
choose to process this message as it will, the default is to show it as
any other error message for form level validation failure.

**triggers. ** This is applicable for update form only, when this is OFF
no PL triggers will be fired when inserting or updating.

**data-source =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** This is applicable to the update form and is An alternative of
'table'. When is specified the value is suppsed to be valid reference to
existing data-source control. Further the given data-source will be used
to bind/update the data.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_form

``` screen
create type vspx_form under vspx_control
   as
     (
       uf_action varchar default '',
       uf_method varchar default 'post',
       --uf_inside_form int default 0,
       uf_validators any,
       uf_xmodel any default null,
       uf_xsubmit any default null,
       uf_xschema any default null
     )  temporary self as ref
   constructor method vspx_form (name varchar, parent vspx_control),
   method prologue_render (sid varchar, realm varchar, nonce varchar) returns any,
   method epilogue_render () returns any,
   overriding method vc_set_model () returns any
```

</div>

<div>

## Examples

<div>

**Example 14.32.  Simple entry form**

<div>

The OK button of the form submits data from the form back to the same
page.

``` screen
<v:page name="form__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:form</title>
    </head>
    <body>
      <v:form name="form1" type="simple" action="" method="POST">
        <v:label name="label1" value="--'Simple form'"/>
        <v:text name="txt1" default=""/>
        <v:text name="txt2" default=""/>
        <v:button name="submit1" action="simple" value="OK"/>
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div>

**Example 14.33.  Simple entry form containing various controls**

<div>

The OK button of the form submits data from the form back to the same
page. The check-box is validated against ragio group:

``` screen
<v:page name="form__1" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:form | v:validator</title>
    </head>
    <body>
      <v:form name="f1" type="simple" method="POST">
    <v:error-summary/><br/>
        <v:label name="l1" value="--'Simple form'"/><br/>
        <v:url name="u1" value="--'This page'" url="--self.f1.uf_action" /><br/>
        <v:text name="t1" value="--self.rb1.ufl_value"/><br/>
        <v:text name="t2" value="--'my'||'password'" type="password"/><br/>
        <v:text name="t3" value="--'something'||'hidden'" type="hidden"/>
    <v:textarea name="ta1" value="--'some text'" /><br/>
        <v:check-box name="cb1" value="check-box" /><br/>
    <v:radio-group name="rg1">
     <v:radio-button name="rb1" value="one" />
     <v:radio-button name="rb2" value="two" />
        </v:radio-group><br/>
        <v:button name="b1" action="simple" value="--'OK'"/><br/>
    <v:validator test="sql" message="only when radio is on position one check-box could be checked">
    if (self.rb2.ufl_selected and self.cb1.ufl_selected)
      {
        return 1;
      }
    </v:validator>
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div>

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
href="http://demo.openlinksw.com/tutorial/web/vx_s_3/update_form.vspx"
class="ulink" target="_top">VX-S-3</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
