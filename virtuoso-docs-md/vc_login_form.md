<div id="vc_login_form" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

login-form — A form to be shown if the user is not logged in.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_login_form" class="funcsynopsis">

|                            |                               |
|----------------------------|-------------------------------|
| ` <`**`login-form`**` />(` | `name` (required) ,           |
|                            | `annotation` (optional) ,     |
|                            | `initial-enable` (optional) , |
|                            | `enabled` (optional) ,        |
|                            | `instantiate` (optional) ,    |
|                            | `control-udt` (optional) ,    |
|                            | `xsd-stub-xhtml` (optional) , |
|                            | `width` (optional) ,          |
|                            | `height` (optional) ,         |
|                            | `required` (required) ,       |
|                            | `title` (optional) ,          |
|                            | `user-title` (optional) ,     |
|                            | `password-title` (optional) , |
|                            | `submit-title` (optional) ,   |
|                            | `debug-srcfile` (optional) ,  |
|                            | `debug-srcline` (optional) ,  |
|                            | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_login_form" class="refsect1">

## Description

login-form is the control for getting login information. This may only
appear inside a login. Its function will depend on the type of login
being attempted. If the type is digest, this is a button which, when
submitted, will send the digest challenge.

If the url or cookie session mode is chosen, this will be a form of 2
fields with user name and password and a submit button.

if the standard form is not suitable, this can be an arbitrary form.
This must post buttons values named "username" and "password" and a
submit button named "login". No children need be specified if the
default form is OK.

If the redirect attribute of template\[@type=if-no-login\] is not
specified, the contents of this child are instantiated and shown in the
place of the login control. This can be arbitrary content.

</div>

<div id="vc_attrs_login_form" class="refsect1">

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

**required. ** If digest is the mode, then this means that the login is
mandatory and that instead of displaying the login button which will
send the challenge if pressed, the challenge will be sent automatically.

**title. ** Title of login button if digest is attempted.

**user-title. ** Title of user name field

**password-title. ** Title of password field

**submit-title. ** Title of submit button

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_login_form" class="refsect1">

## Declaration of type vspx_login_form

``` screen
create type vspx_login_form under vspx_form
as
  (
   vlf_title varchar,
   vlf_user_title varchar,
   vlf_password_title varchar,
   vlf_submit_title varchar,
   vlf_login vspx_login
  ) temporary self as ref
constructor method vspx_login_form (name varchar,  parent vspx_control),
constructor method vspx_login_form (name varchar, title varchar, user_title varchar, password_title varchar, submit_tile varchar, login vspx_login),
overriding method vc_render () returns any
```

</div>

<div id="vc_ex_login_form" class="refsect1">

## Examples

<div id="vc_ex_login_form__0" class="example">

**Example 14.37.  A simple default login-form**

<div class="example-contents">

This example will render just a login form:

``` screen
<v:page name="login_form__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head><title>VSPX samples | v:login-form</title></head>
    <body>
      <v:login name="login_0" mode="url" user-password-check="sql_user_password_check" realm="vspx">
        <v:login-form name="login_form_0"
          required="1"
          title="Login"
          user-title="User Name"
          password-title="Password"
          submit-title="Login"/>
        </v:login>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

</div>

</div>
