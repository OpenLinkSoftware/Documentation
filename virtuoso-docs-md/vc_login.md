<div>

<div>

</div>

<div>

## Name

login — Authentication parameters of a page.

</div>

<div>

## Synopsis

<div>

|                       |                                    |
|-----------------------|------------------------------------|
| ` <`**`login`**` />(` | `name` (required) ,                |
|                       | `annotation` (optional) ,          |
|                       | `initial-enable` (optional) ,      |
|                       | `enabled` (optional) ,             |
|                       | `instantiate` (optional) ,         |
|                       | `control-udt` (optional) ,         |
|                       | `xsd-stub-xhtml` (optional) ,      |
|                       | `width` (optional) ,               |
|                       | `height` (optional) ,              |
|                       | `realm` (required) ,               |
|                       | `mode` (required) ,                |
|                       | `user-password` (optional) ,       |
|                       | `user-password-check` (optional) , |
|                       | `debug-srcfile` (optional) ,       |
|                       | `debug-srcline` (optional) ,       |
|                       | `debug-log` (optional) `)`;        |

<div>

 

</div>

</div>

</div>

<div>

## Description

The login control controls authentication for its page. Depending on
options this may or may not be visible. This works together with a
login-form and logout-button controls. The storage of passwords and user
names is left to the application, which can specify functions called by
these widgets. The server keeps login information in the following
table:

``` programlisting

create table VSPX_SESSION (VS_REALM varchar, VS_SID varchar, VS_UID varchar, VS_STATE long varchar,
  primary key (VS_REALM, VS_SID));
```

This table is shared between all vspx applications, each with their
login differentiated by realm. The state is an array of name value pairs
which will be accessed through connection_get and connection_set inside
the page code. There are three methods of keeping session
state:URL-poisoning, digest authentication and Cookies.The URL-poisoning
scheme presents a login dialog form and sets a session ID as hidden form
element. Digest authentication uses an opaque value as session id and is
available only for browsers that support standard HTTP 1.1 digest
authentication. The Cookie is an analogue of URL poisoning, but in that
case session ID is kept as a Cookie, thus cookies must be enabled on the
browser. The login control is mandatory when using a persistent page
variables (see persist="session" attribute of 'variable' control). This
is because HTTP protocol is state-less; therefore value of such
variables have to be stored in a table and restored on next hit with
same session ID (and realm). Hence as login control maintains a session
state (via some mechanism, see notes above), this capability is used to
maintain persistent page variables. Note also that persistent page
variables can be used between different pages, in that case all of those
pages need to have login control (in most cases it is invisible).

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

**realm. ** This is the authentication realm name.

**mode. ** This specifies the preferred mode of keeping session and
login information. In the case of url and cookie the name and password
will have to be supplied in a form submit. The vspx:login-form control
provides a convenient way of doing this. If passwords are transmitted in
a form submit, it is best for security to have the login page accessed
via SSL only. Many values may be separated by spaces. This is the order
of preference. The system will use the first available depending on the
user agent.

<div>

**Table 14.8. Allowed values of the 'mode' attribute**

<div>

|        |                                                                                                                                                                                                 |
|--------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| digest | HTTP digest authentication is used and the session id will travel as the opaque data in the digest headers.                                                                                     |
| url    | The url mode means that URL poisoning is used and that the session id passes with the links, posts etc. Some automation is offered for this by the vspx:url and vspx:form and derived controls. |
| cookie | The session id is set in a cookie on browser.                                                                                                                                                   |

</div>

</div>

  

**user-password. ** The name of a SQL function which will retrieve the
password given a user name. If digest authentication is to be possible,
this function must be specified. Example:

``` programlisting
create procedure
sql_user_password (in name varchar)
{
  declare pass varchar;
  pass := NULL;
  whenever not found goto none;
  select pwd_magic_calc (U_NAME, U_PASSWORD, 1) into pass
          from SYS_USERS where U_NAME = name and U_SQL_ENABLE = 1 and U_IS_ROLE = 0;
none:
  return pass;
}
;
```

**user-password-check. ** This is a function which takes the user name
and password (unencrypted) and returns true if these match, false
otherwise.

``` programlisting

create procedure
sql_user_password_check (in name varchar, in pass varchar)
{
  if (exists (select 1 from SYS_USERS where U_NAME = name and U_SQL_ENABLE = 1 and U_IS_ROLE = 0 and
        pwd_magic_calc (U_NAME, U_PASSWORD, 1) = pass))
    return 1;
  return 0;
}
;
```

If the application will keep a session state which will automatically be
extracted from the application's user repository upon login, then either
of these functions may set this using connection_set. This will persist
in the session if the login is successful and will be discarded
otherwise. An example of such information is a user privilege class,
real name, email or such. These functions may be called one or more
times during the session, but no more than one call at the start is
guaranteed.

Example:

Note: when the mode is digest the login control will only call
user_password and in other modes it will only call user_password_check.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_login

``` screen
create type vspx_login under vspx_form
as (
    vl_realm varchar,
    vl_mode varchar,
    vl_pwd_get varchar,
    vl_usr_check varchar,
    vl_authenticated int default 0,
    vl_user varchar,
    vl_sid varchar,
    vl_no_login_redirect varchar,
    vl_logout_in_progress int default 0
   )
 temporary self as ref
overriding method vc_view_state (stream any, n int) returns any,
overriding method vc_set_view_state (e vspx_event) returns any,
constructor method vspx_login (name varchar, parent vspx_control)
```

</div>

<div>

## Examples

<div>

**Example 14.36.  Simple login dialog**

<div>

This example will show simltaniously 'not-autneticated' message and a
simple post counter.

``` screen
<v:page name="login__0" xmlns:v="http://http://example.com/vspx/">
<html>
  <body>
      <v:variable name="ctr" type="int" persist="session" default="0"/>
      <v:login name="lc1" realm="vspx" mode="url" user-password-check="sql_user_password_check">
        <v:template type="if-no-login">You are not logged in</v:template>
        <v:login-form name="f1" required="1" title="Login" user-title="User Name" password-title="Password" submit-title="Login"/>
        <v:template type="if-login">
    Posted #: <v:label name="l1" value="--self.ctr" format="%d"/>
          <v:button name="b1" action="simple" value="Reload">
            <v:on-post>
        self.ctr := self.ctr + 1;
        self.l1.vc_data_bind (e);
        </v:on-post>
          </v:button>
          <v:button name="b2" action="logout" value="Logout"/>
        </v:template>
      </v:login>
  </body>
</html>
</v:page>
```

</div>

</div>

  

<div>

|                            |                                                                     |
|:--------------------------:|:--------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                       |
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_6/login.vspx" 
                              class="ulink" target="_top">VX-S-6</a>                               |

</div>

</div>

</div>
