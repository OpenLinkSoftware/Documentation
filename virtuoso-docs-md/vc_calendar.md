<div>

<div>

</div>

<div>

## Name

calendar — Databound calendar control.

</div>

<div>

## Synopsis

<div>

|                          |                               |
|--------------------------|-------------------------------|
| ` <`**`calendar`**` />(` | `name` (required) ,           |
|                          | `annotation` (optional) ,     |
|                          | `initial-enable` (optional) , |
|                          | `enabled` (optional) ,        |
|                          | `instantiate` (optional) ,    |
|                          | `control-udt` (optional) ,    |
|                          | `xsd-stub-xhtml` (optional) , |
|                          | `width` (optional) ,          |
|                          | `height` (optional) ,         |
|                          | `initial-date` (optional) ,   |
|                          | `debug-srcfile` (optional) ,  |
|                          | `debug-srcline` (optional) ,  |
|                          | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is the generic calendar control.

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

**initial-date = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Expression which
returns a date for setting initially the current date of the calendar.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_calendar

``` screen
create type vspx_calendar under vspx_control as
(
  cal_date date,
  cal_meta any,
  cal_selected datetime,
  cal_current_row vspx_row_template
) temporary self as ref
method vc_get_date_array () returns any,
overriding method vc_view_state (stream any, n int) returns any,
overriding method vc_set_view_state (e vspx_event) returns any,
constructor method vspx_calendar (name varchar, parent vspx_control)
```

</div>

<div>

## Examples

<div>

**Example 14.21.  A calendar**

<div>

This demo will show a calendar allowing to list dates by months:

``` screen
<v:page name="pagecal1" xmlns:v="http://http://example.com/vspx/">
<html>
<body>
<v:form name="form1" type="simple" method="POST" >
    <v:calendar name="cal1" initial-date="--now()">
      <v:template type="simple" name="chead1" name-to-remove="table" set-to-remove="bottom">
      <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td align="center">
      <v:button name="pmon" value="<" action="simple" style="url">
        <v:on-post>
        self.cal1.cal_date := dateadd ('month', -1, self.cal1.cal_date);
        self.cal1.vc_data_bind (e);
        </v:on-post>
      </v:button>
     </td>
     <td colspan="5" align="center">
           <?V monthname((control.vc_parent as vspx_calendar).cal_date) ?>
       <?V year((control.vc_parent as vspx_calendar).cal_date) ?>
     </td>
         <td align="center">
      <v:button name="nmon" value=">" action="simple" style="url">
        <v:on-post>
        self.cal1.cal_date := dateadd ('month', 1, self.cal1.cal_date);
        self.cal1.vc_data_bind (e);
        </v:on-post>
      </v:button>
     </td>
     </tr>
        <tr><td>Sun</td><td>|Mon</td><td>|Tue</td><td>|Wed</td><td>|Thu</td><td>|Fri</td><td>|Sat</td></tr>
      </table>
      </v:template>
      <v:template type="repeat" name="cbody1" name-to-remove="" set-to-remove="">
      <v:template type="browse" name="crow1" name-to-remove="table" set-to-remove="both">
      <table>
      <tr>
       <td align="center"><v:button style="url" action="simple" name="b1" value="--cal_icell(control, 0)" /></td>
       <td align="center"><v:button style="url" action="simple" name="b2" value="--cal_icell(control, 1)" /></td>
       <td align="center"><v:button style="url" action="simple" name="b3" value="--cal_icell(control, 2)" /></td>
       <td align="center"><v:button style="url" action="simple" name="b4" value="--cal_icell(control, 3)" /></td>
       <td align="center"><v:button style="url" action="simple" name="b5" value="--cal_icell(control, 4)" /></td>
       <td align="center"><v:button style="url" action="simple" name="b6" value="--cal_icell(control, 5)" /></td>
       <td align="center"><v:button style="url" action="simple" name="b7" value="--cal_icell(control, 6)" /></td>
      </tr>
      </table>
      </v:template>
      </v:template>
      <v:template type="simple" name="cbott1" name-to-remove="table" set-to-remove="top">
      <table>
      </table>
      </v:template>
    </v:calendar>
</v:form>
</body>
</html>
</v:page>
```

</div>

</div>

  

</div>

</div>
