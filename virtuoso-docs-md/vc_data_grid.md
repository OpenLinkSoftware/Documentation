<div>

<div>

</div>

<div>

## Name

data-grid — Scrollable databound multi-row control.

</div>

<div>

## Synopsis

<div>

|                           |                               |
|---------------------------|-------------------------------|
| ` <`**`data-grid`**` />(` | `name` (required) ,           |
|                           | `annotation` (optional) ,     |
|                           | `initial-enable` (optional) , |
|                           | `enabled` (optional) ,        |
|                           | `instantiate` (optional) ,    |
|                           | `control-udt` (optional) ,    |
|                           | `xsd-stub-xhtml` (optional) , |
|                           | `width` (optional) ,          |
|                           | `height` (optional) ,         |
|                           | `data` (optional) ,           |
|                           | `meta` (optional) ,           |
|                           | `nrows` (optional) ,          |
|                           | `sql` (required) ,            |
|                           | `scrollable` (optional) ,     |
|                           | `cursor-type` (optional) ,    |
|                           | `edit` (optional) ,           |
|                           | `debug-srcfile` (optional) ,  |
|                           | `debug-srcline` (optional) ,  |
|                           | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is the generic multi-row database view control. It is used to show
repeating data, as from tables or procedure views. Allows scrolling
(paging) editing the data; adding a row or removal of existing rows.
Usually this control generates a PL scrollable cursor of type as
specified. The number of rows shown are configurable via nrows
attribute. Note also that column children elements are optional; they
can be omitted so then VSPX engine will compute them from specified SQL
statement in 'sql' attribute. Specific to this control is to have
row-template and frame-template, these are to present repeating and
non-repeating groups of children elements. The frame-template will
usually have a 'rowset' placeholder to designate the place where
repeating group (row-template) will be instantiated. The control expects
to find child controls with specific names. for scrolling buttons -
\[data-grid name\]'\_prev' and \[data-grid name\]'\_next'; for editing
buttons - \[data-grid name\]'\_edit' and \[data-grid name\]'\_delete'.

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

**data = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Expression which
returns an array of rowset data, this is an alternative to specifying an
SQL expression. The result then will be used to instantiate the
repeating group. An example of such data is the result returned by
'exec' function:

``` programlisting
(
  ("ALFKI" "Alfreds Futterkiste" "030-0074321" )
  ("ANATR" "Ana Trujillo Emparedados y helados" "(5) 555-4729" )
)
```

**meta = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This works with
combination of data attribute, this expression must return an array of
ro metadata. So when this is specified it needs to be an expression
returning meta-data for columns. In practice this is the same as 1st
element of metadata returned by 'exec()' :

``` programlisting
(
  ("CustomerID" 182 0 5 0 1 1 "Demo" "CustomerID" "demo" "Customers" 0 )
  ("CompanyName" 182 0 40 1 1 1 "Demo" "CompanyName" "demo" "Customers" 0 )
  ("Phone" 182 0 24 1 1 1 "Demo" "Phone" "demo" "Customers" 0 )
)
```

for details of metadata see 'exec()' function description.

**nrows = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** The maximum
number of replicas of the row template to be made for rows selected.
This is like the rowset size for a scrollable cursor.

**sql =
<a href="vc_type_sqlcode.html" class="link" title="SqlCode">SqlCode</a>
. ** The select statement that gets the data. Parameters to the
statement MUST be specified as SQL identifiers prefixed with a colon
(named parameter). The values are given in the control's vspx:param
children. These specify the parameter name and a data bound expression
for the value.

**scrollable. ** The setting controls whether next and previous page
buttons are presented. This can be on even if the cursor is not
scrollable as such.

**cursor-type. **

<div>

**Table 14.3. Allowed values of the 'cursor-type' attribute**

<div>

|         |                           |
|---------|---------------------------|
| static  | A static cursor is used.  |
| dynamic | A dynamic cursor is used. |
| keyset  | A keyset cursor is used.  |

</div>

</div>

  

**edit = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** Flags whether
editing features are enabled on data grid control

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_data_grid

Scrollable, Multi-Row data grid Class

``` screen
create type vspx_data_grid under vspx_form
as (
    dg_nrows int default -1,    -- how many rows to show on single page
    dg_scrollable int default 0,  -- scroll on form is enabled
    dg_editable int default 1,          -- disable edit/add on whole grid
    dg_row_meta any,      -- metadata
    dg_row_data any,      -- the data for procedure binding
    dg_current_row vspx_row_template,   -- current row template
    dg_rowno_edit int default null, -- last edited row in result set, to re-display the edit box on error
    dg_rows_fetched int default 0,  -- these are to keep state for scrolling
    dg_prev_bookmark any default null,
    dg_last_bookmark any default null
   )  temporary self as ref
  method vc_templates_clean () returns any,
  constructor method vspx_data_grid (name varchar, parent vspx_control),
  overriding method vc_set_view_state (e vspx_event) returns any,
  overriding method vc_view_state (stream any, n int) returns any
```

</div>

<div>

## Examples

<div>

**Example 14.24.  Editable multi-row data grid based on data-grid
control**

<div>

This example will show a list of customers from the Northwind demo
database. Allows editing, addtion and removal of existing records:

``` screen
<v:page name="data_grid__0" xmlns:v="http://http://example.com/vspx/">
<html>
  <body>
      <v:data-grid name="dg" nrows="5" sql="select CustomerID, CompanyName, Phone from Demo.demo.Customers where CustomerId like :mask" cursor-type="keyset" edit="1">
        <v:param name="mask" value="'%'"/>
        <v:template name="t1" type="frame">
          <div>
            <div>
              Action
                <v:label name="l1" value="--(control.vc_parent as vspx_data_grid).dg_row_meta[0]"/>
              <v:label name="l2" value="--(control.vc_parent as vspx_data_grid).dg_row_meta[1]"/>
              <v:label name="l3" value="--(control.vc_parent as vspx_data_grid).dg_row_meta[2]"/>
            </div>
            <v:rowset/>
            <v:form type="add"/>
            <div>
              <v:button name="dg_prev" action="simple" value="&lt;&lt;"/>
              <v:button name="dg_next" action="simple" value="&gt;&gt;"/>
            </div>
          </div>
        </v:template>
        <v:template name="t2" type="row">
          <div>
            <v:button name="dg_edit" action="simple" value="Edit"/>
            <v:button name="dg_delete" action="simple" value="Delete">
              <v:on-post>
              delete from Demo.demo.Customers where CustomerID = self.dg.dg_current_row.te_rowset[0];
              self.dg.vc_data_bind (e);
                </v:on-post>
            </v:button>
            <v:label name="label1" value="--(control.vc_parent as vspx_row_template).te_rowset[0]"/>
            <v:label name="label2" value="--(control.vc_parent as vspx_row_template).te_rowset[1]"/>
            <v:label name="label3" value="--(control.vc_parent as vspx_row_template).te_rowset[2]"/>
          </div>
        </v:template>
        <v:template name="t3" type="if-not-exists">
          <div>No rows selected</div>
        </v:template>
        <v:template name="t4" type="edit">
          <v:form name="u1" type="update" table="Demo.demo.Customers" if-not-exists="insert">
            <v:key column="CustomerID" value="--self.dg.dg_current_row.te_rowset[0]" default="null"/>
            <v:template type="if-exists" name="t5">
              <div>
                <v:button name="b1" action="submit" value="Update"/>
                <input type="submit" name="b2" value="Cancel"/>
                <v:text name="c_id1" column="CustomerID"/>
                <v:text name="c_name1" column="CompanyName"/>
                <v:text name="c_phone1" column="Phone"/>
              </div>
            </v:template>
          </v:form>
        </v:template>
        <v:template name="t6" type="add">
          <v:form type="update" name="a1" table="Demo.demo.Customers" if-not-exists="insert">
            <v:key column="CustomerID" value="--''" default="null"/>
            <v:template name="t7" type="if-exists">
              <v:button name="b3" action="submit" value="Add"/>
              <v:text name="c_id2" column="CustomerID"/>
              <v:text name="c_name2" column="CompanyName"/>
              <v:text name="c_phone2" column="Phone"/>
            </v:template>
          </v:form>
        </v:template>
      </v:data-grid>
  </body>
</html>
</v:page>
```

</div>

</div>

  

</div>

</div>
