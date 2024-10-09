<div>

<div>

</div>

<div>

## Name

isql — An interactive SQL control that allows the user to type an SQL
statement and to see the result of its execution.

</div>

<div>

## Synopsis

<div>

|                      |                               |
|----------------------|-------------------------------|
| ` <`**`isql`**` />(` | `name` (required) ,           |
|                      | `annotation` (optional) ,     |
|                      | `initial-enable` (optional) , |
|                      | `enabled` (optional) ,        |
|                      | `instantiate` (optional) ,    |
|                      | `control-udt` (optional) ,    |
|                      | `xsd-stub-xhtml` (optional) , |
|                      | `width` (optional) ,          |
|                      | `height` (optional) ,         |
|                      | `isolation` (optional) ,      |
|                      | `timeout` (optional) ,        |
|                      | `maxrows` (optional) ,        |
|                      | `user` (optional) ,           |
|                      | `password` (optional) ,       |
|                      | `debug-srcfile` (optional) ,  |
|                      | `debug-srcline` (optional) ,  |
|                      | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

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

**isolation. ** Transaction isolation level to be used.

<div>

**Table 14.7. Allowed values of the 'isolation' attribute**

<div>

|              |                                            |
|--------------|--------------------------------------------|
| uncomitted   | 'uncomitted' transaction isolation level   |
| committed    | 'committed' transaction isolation level    |
| repeatable   | 'repeatable' transaction isolation level   |
| serializable | 'serializable' transaction isolation level |

</div>

</div>

  

**timeout = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Query time-out in
seconds (currently not supported)

**maxrows = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Maximum number of
rows to be displayed.

**user = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** SQL user account
to perform the query, if not specified the SQL account used to run the
VSPX page will be used.

**password = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** When the 'user'
attribute is supplied, this is the user's password.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_isql

A isql control

``` screen
create type vspx_isql under vspx_form
as
 (
   -- parameters
   isql_custom_exec integer default 0,  -- do nothing to allow vspx code to perform actual exec (i.e. dataset open)
   isql_explain integer default 0,  -- explain instead of execute
   isql_maxrows integer default 20,
   isql_chunked integer default 0,
   isql_current_stmt varchar default null,
   isql_current_state any default null,
   isql_current_meta any default null,
   isql_current_pos int default 0,
   isql_current_row int default 0,
   isql_rows_fetched int default 0,
   isql_user varchar default null,
   isql_password varchar default null,
   isql_isolation varchar default 'committed',
   isql_timeout integer default 60,
   isql_text varchar default '', -- sql text to execute
   --results
   --also used vc_error_message as vector(vector('sqlstate','sqlmessage'), ... ) for multiple statements
   isql_mtd any default null, --as vector(mtd, ... ) for multiple statements
   isql_res any default null,  --as vector(res, ... ) for multiple statements
   isql_stmts any default null -- array of statements to be executed on render as cursors
 )
   temporary self as ref
  constructor method vspx_isql (name varchar, parent vspx_control),
  method isql_exec () returns any
```

</div>

</div>
