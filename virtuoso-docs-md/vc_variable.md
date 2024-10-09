<div>

<div>

</div>

<div>

## Name

variable — Page variable - a user defined member of page class.

</div>

<div>

## Synopsis

<div>

|                          |                               |
|--------------------------|-------------------------------|
| ` <`**`variable`**` />(` | `name` (required) ,           |
|                          | `type` (required) ,           |
|                          | `default` (optional) ,        |
|                          | `persist` (optional) ,        |
|                          | `param-name` (optional) ,     |
|                          | `xsd-stub-xhtml` (optional) , |
|                          | `width` (optional) ,          |
|                          | `height` (optional) ,         |
|                          | `debug-srcfile` (optional) ,  |
|                          | `debug-srcline` (optional) ,  |
|                          | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

This element declares a data member for the page subclass corresponding
to the containing page. The value of this data member can be preserved
between consecutive postbacks. The attribute "persist" determine how to
save the variable's value: to session table for inter-page usage, keep
in page state only or do not keep it at all. Note that inter-page
variable storage is available only when a vspx:login control is included
on the page and authentication is performed; also the name of page
variables in corresponding pages needs to be same. There is no special
class for this control because only a data member will be added. Also
the page defines two special variables 'sid' and 'realm' for login
control. So when an existing login control is is in authenticated state,
these will contain values for session id and application realm. Also
every non-repeating control of the page will be represented as a page
variable and thus be acessible as 'self.\<name_of_control\>' anywhere in
the VSPX page after page initialization.

</div>

<div>

## Attributes

**name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The name of page class member.

**type =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The SQL data type of the variable.

**default =
<a href="vc_type_sqlcode.html" class="link" title="SqlCode">SqlCode</a>
. ** The default value. Must be a literal scalar value suitable for the
default clause of a user defined type member.

**persist. **

<div>

**Table 14.13. Allowed values of the 'persist' attribute**

<div>

|           |                                                                       |
|-----------|-----------------------------------------------------------------------|
| session   | keep the variable in the session; needs a login control to be present |
| pagestate | keep the variable in page view state                                  |
| temp      | do not keep variable                                                  |
| 0         | same as 'pagestate'                                                   |
| 1         | same as 'session'                                                     |

</div>

</div>

  

**param-name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** This specifies an optional name of a URL parameter for setting the
page variable value. When this is specified and there is a parameter
matching the name, the variable is set after it. This is a shorthand for
an explicit call of keyword_get.

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

<div>

## Examples

<div>

**Example 14.47.  Declaration of page variable**

<div>

The v:variable element defines a new member of page class and hance we
can access it with self.mask in rest of VSPX code.

``` screen
<v:page name="variable__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:variable</title>
    </head>
    <body>
      <v:variable name="mask" type="varchar" default="null"/>
      <?vsp self.mask := 'first value'; ?>
      <p>The variable value is set to '<?V self.mask ?>'</p>
      <?vsp self.mask := 'second value'; ?>
      <p>The variable value is set to '<?V self.mask ?>'</p>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

</div>

</div>
