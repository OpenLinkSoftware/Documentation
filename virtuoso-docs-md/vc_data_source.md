<div id="vc_data_source" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

data-source — Scrollable multi-row data bound source.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_data_source" class="funcsynopsis">

|                             |                                |
|-----------------------------|--------------------------------|
| ` <`**`data-source`**` />(` | `name` (required) ,            |
|                             | `annotation` (optional) ,      |
|                             | `initial-enable` (optional) ,  |
|                             | `enabled` (optional) ,         |
|                             | `instantiate` (optional) ,     |
|                             | `control-udt` (optional) ,     |
|                             | `xsd-stub-xhtml` (optional) ,  |
|                             | `width` (optional) ,           |
|                             | `height` (optional) ,          |
|                             | `expression-type` (required) , |
|                             | `nrows` (optional) ,           |
|                             | `initial-offset` (optional) ,  |
|                             | `data` (optional) ,            |
|                             | `meta` (optional) ,            |
|                             | `debug-srcfile` (optional) ,   |
|                             | `debug-srcline` (optional) ,   |
|                             | `debug-log` (optional) `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_data_source" class="refsect1">

## Description

Invisible multi-row data source. This control is an invisible
represantation of a result set. Also it offer a number of methods for
accessing and updating the data. It can be used as a source in the
data-set control or as a separate data source for various form controls
(such as label, url etc.). This control is using 'SELECT TOP N,M ..'
statements to bind the data into the resultset (when source is a table
or SQL statement), hence this should be taken into account when using
it.

</div>

<div id="vc_attrs_data_source" class="refsect1">

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

**expression-type. ** Denotes the type of 'expression'

<div id="id40241" class="table">

**Table 14.5. Allowed values of the 'expression-type' attribute**

<div class="table-contents">

|           |                                                                   |
|-----------|-------------------------------------------------------------------|
| SQL       | The expression is a SQL select statement                          |
| TABLE     | The expression is a table reference                               |
| PROCEDURE | The expression is a procedure call                                |
| ARRAY     | The rowset is already prepared and supplied as an array of arrays |

</div>

</div>

  

**nrows = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** The maximum
number of rows to be selected. It is like the rowset size for a
scrollable cursor.

**initial-offset =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Number of record
to start data binding of rowset

**data = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** When this
attribute is specified it must be an expression returning array of
arrays. This is an alternative to specifying an SQL expression or
data-source. The result then will be used to instantiate the repeating
group. An example of such data is the result returned by 'exec'
function:

``` programlisting
(
  ("ALFKI" "Alfreds Futterkiste" "030-0074321" )
  ("ANATR" "Ana Trujillo Emparedados y helados" "(5) 555-4729" )
)
```

**meta = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This attribute is
used together with 'data', so when is specified it needs to be an
expression returning a meta-data for columns corresponding to the these
returned by 'data' expression. In practice it's same as 1-st element of
metadata returned by 'exec()' :

``` programlisting
(
  ("CustomerID" 182 0 5 0 1 1 "Demo" "CustomerID" "demo" "Customers" 0 )
  ("CompanyName" 182 0 40 1 1 1 "Demo" "CompanyName" "demo" "Customers" 0 )
  ("Phone" 182 0 24 1 1 1 "Demo" "Phone" "demo" "Customers" 0 )
)
```

for details of metadata see 'exec()' function description.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_data_source" class="refsect1">

## Declaration of type vspx_data_source

``` screen
create type vspx_data_source under vspx_control
as    (
    ds_row_meta any,      -- metadata
    ds_row_data any,      -- data coming from a function, rowset
    ds_array_data any,    -- data coming from @data=... where @expression-type='array'
    ds_rows_fetched int default 0,  -- these are to keep state for scrolling
    ds_rows_offs    int default 0,  -- this is the pos of row at 0 offset
    ds_nrows int,     -- how many rows to show on single page
    ds_total_pages int default 0,
    ds_current_page int default 0,
    ds_current_pager_idx int default 0,
    ds_npages int default 10,
    ds_first_page int default 0,
    ds_last_page int default 0,
    ds_total_rows int default 0,
    ds_prev_bookmark any default null,
    ds_next_bookmark any default null,
    ds_parameters any default null,
    ds_columns any default null,
    ds_sql varchar default null,
    ds_sql_type varchar default 'sql',
    ds_current_inx int default 0,
    ds_update_inx int default -1,
    ds_tables any default null,
    ds_insert any default null,
    ds_update any default null,
    ds_delete any default null,
    ds_rb_data any default null,
    ds_have_more any default null
      )
temporary self as ref
method set_parameter (num any, value any) returns any,
method get_parameter (num any) returns any,
method add_parameter (value any) returns any,
method delete_parameter (num any) returns any,
method get_column_name (num any) returns any,
method set_column_label (num any, value any) returns any,
method get_column_label (num any) returns any,
method get_column_label (col varchar) returns any,
--method set_column_add_style (num int, style any) returns any,
--method get_column_add_style (num int) returns any,
--method set_column_edit_style () returns any,
--method get_column_edit_style () returns any,
--method set_column_browse_style () returns any,
--method get_column_browse_style () returns any,
--method set_column_add_format () returns any,
--method get_column_add_format () returns any,
--method set_column_edit_format () returns any,
--method get_column_edit_format () returns any,
--method set_column_browse_format () returns any,
--method get_column_browse_format () returns any,
method set_item_value (row any, col any, value any) returns any,
method set_item_value (col varchar, value any) returns any,
method get_item_value (row any, col any) returns any,
method get_rb_item_value (row any, col any) returns any,
method get_item_value (col any) returns any,
method get_item_value (col varchar) returns any,
method set_expression (expression varchar) returns any,
method get_expression () returns varchar,
method set_expression_type (type varchar) returns any,
method get_expression_type () returns varchar,
method reset () returns any,
method ds_data_bind (e vspx_event) returns any,
method ds_make_statistic () returns any,
method ds_insert (e vspx_event) returns any,
method ds_update (e vspx_event) returns any,
method ds_delete (e vspx_event) returns any,
method ds_key_params (tbl varchar) returns any,
method ds_tbl_params (tbl varchar) returns any,
method get_current_row () returns any,
constructor method vspx_data_source (name varchar, parent vspx_control)
```

</div>

<div id="vc_ex_data_source" class="refsect1">

## Examples

<div id="vc_ex_data_source__0" class="example">

**Example 14.29.  Simple navigation form using invisible data-source
control**

<div class="example-contents">

This example will show a cell of the customers table from the Northwind
demo database. Allows to show different columns : name and phone.

``` screen
<v:page name="data_source__0" xmlns:v="http://http://example.com/vspx/">
<html>
<body>
<v:variable name="offset" default="0" type="int"/>
   <v:form name="f1" method="POST" type="simple">
   <div>There is a hidden data-source on "<?V self.datasource1.ds_sql ?>"</div>
   <v:data-source name="datasource1" expression-type="sql" nrows="10" initial-offset="--self.offset">
     <v:expression>
       select * from Demo.demo.Customers where CustomerID like ? order by CompanyName desc
     </v:expression>
     <v:param name="mask" value="--('L%')"/>
     <v:column name="CompanyName" label="Company Name" input-format="%s" output-format="%s"/>
     <v:column name="Phone" label="Telephone" input-format="%s" output-format="%s" />
   </v:data-source>
   <div>
   row #: <v:text name="r1" value="0" /><br />
   col #: <v:text name="c1" value="0" /><br />
   Seek : <v:button action="simple" name="b1" value="OK" />
   </div>
   <div>
   "<v:label name="l1" value="--self.datasource1.get_column_label (atoi(self.c1.ufl_value))" />" =
   <v:label name="l2" value="--self.datasource1.get_item_value (atoi(self.r1.ufl_value),atoi(self.c1.ufl_value))"/>
   </div>
    <v:on-post>
      self.l1.vc_data_bind (e);
      self.l2.vc_data_bind (e);
    </v:on-post>
   </v:form>
</body>
</html>
</v:page>
```

</div>

</div>

  

</div>

</div>
