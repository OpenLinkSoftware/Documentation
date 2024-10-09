<div>

<div>

</div>

<div>

## Name

validator — A validator that is applied to user input.

</div>

<div>

## Synopsis

<div>

|                           |                               |
|---------------------------|-------------------------------|
| ` <`**`validator`**` />(` | `name` (required) ,           |
|                           | `annotation` (optional) ,     |
|                           | `initial-enable` (optional) , |
|                           | `enabled` (optional) ,        |
|                           | `instantiate` (optional) ,    |
|                           | `control-udt` (optional) ,    |
|                           | `xsd-stub-xhtml` (optional) , |
|                           | `width` (optional) ,          |
|                           | `height` (optional) ,         |
|                           | `test` (required) ,           |
|                           | `min` (optional) ,            |
|                           | `max` (optional) ,            |
|                           | `regexp` (optional) ,         |
|                           | `expression` (optional) ,     |
|                           | `empty-allowed` (optional) ,  |
|                           | `message` (optional) ,        |
|                           | `runat` (optional) ,          |
|                           | `debug-srcfile` (optional) ,  |
|                           | `debug-srcline` (optional) ,  |
|                           | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

The validator objects are invoked when the element's control gets
posted. the validator elements only make sense inside field or form
types of controls. the validators are invoked in the order given, and
the first one to fail stops the invocation chain, so that no later ones
are attempted. furthermore the vc_is_valid member of the containing page
class instance will be reset to false (0) to stop further processing.
see also error-summary element and error-glyph attribute of field
element.

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

**test. ** The type of test to be performed, can be 'length', 'value',
'regexp' or 'sql'.

**min. ** A lower limit in value and length tests

**max. ** The upper limit for value and length tests

**regexp. ** The REGEXP pattern to match field value

**expression. ** A SQL expression for validation

**empty-allowed. ** If specified as true (1) this will allow submitting
an empty field

**message. ** The error message to be associated to parent control when
the test represented by this validator fails.

**runat. ** Where to perform validation, at server side after posting,
or at browser side when entering the values. Note that client side
validators can be assigned only to input controls, hence client side
form validators for inter-field integrity testing are not allowed.

Client side validators will generate client side JavaScript.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_validator

``` screen
```

</div>

<div>

## Examples

<div>

**Example 14.46.  Validation of text area input**

<div>

The form contains a v:textarea control with v:validator assigned. When
the OK button is pressed, data are posted back to the same URI so the
page is instantiated again. If validator found a violation, the message
is shown right after the text input. (The error reporting may be changed
by using v:error-summary VSPX control and by adding 'error-glyph'
attribute to the v:textarea.)

``` screen
<v:page name="validator__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head>
      <title>VSPX samples | v:validator</title>
    </head>
    <body>
      <v:form name="form1" type="simple" action="" method="POST">
        <v:textarea name="ta1" default="enter your text here" value="--coalesce ({?'ta1'}, control.ufl_value)">
          <v:validator test="length" min="0" max="50" message="The input length should not exceed 50 chars."/>
        </v:textarea>
        <v:button name="submit1" action="simple" value="OK"/>
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div>

|                            |                                                                    |
|:--------------------------:|:-------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                      |
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_2/date.vspx" 
                              class="ulink" target="_top">VX-S-2</a>                              |

</div>

</div>

</div>
