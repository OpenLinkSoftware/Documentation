<div>

<div>

</div>

<div>

## Name

data-set — Scrollable, multi-row data bound grid.

</div>

<div>

## Synopsis

<div>

|                          |                               |
|--------------------------|-------------------------------|
| ` <`**`data-set`**` />(` | `name` (required) ,           |
|                          | `annotation` (optional) ,     |
|                          | `initial-enable` (optional) , |
|                          | `enabled` (optional) ,        |
|                          | `instantiate` (optional) ,    |
|                          | `control-udt` (optional) ,    |
|                          | `xsd-stub-xhtml` (optional) , |
|                          | `width` (optional) ,          |
|                          | `height` (optional) ,         |
|                          | `sql` (optional) ,            |
|                          | `data-source` (optional) ,    |
|                          | `data` (optional) ,           |
|                          | `meta` (optional) ,           |
|                          | `nrows` (optional) ,          |
|                          | `scrollable` (required) ,     |
|                          | `cursor-type` (optional) ,    |
|                          | `edit` (optional) ,           |
|                          | `debug-srcfile` (optional) ,  |
|                          | `debug-srcline` (optional) ,  |
|                          | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

A container for displaying and/or editing the content of a resultset.
This is the generic multi-row database view control. It is used to show
repeating data, as from tables or procedure views. Allows scrolling
(paging) editing the data; adding a row or removal of existing rows.
Usually this control generates a PL scrollable cursor of type. The
number of rows shown is configurable via nrows attribute. Note also that
column children elements are optional; they can be omitted so then VSPX
engine will compute them from the specified SQL statement in 'sql'
attribute. This control has the same functionality as the data-grid
control but has different syntax, better suited for editing via plugins
for 3-d party WYSWYG HTML authoring tools (as Addobe GoLive and
similar). Specific to this control is to have several templates to
present repeating and non-repeating groups of children elements. These
templates are as follows: two generic templates to represent header and
footer sections and one repeating template to enclose edit, add,
not-exists and row (browse) sections. All of those templates are
optional and their usage can be seen in examples. Also following the
convention for names of controls must be followed: for scrolling
buttons - \[data-set name\]'\_prev', \[data-set name\]'\_next',
\[data-set name\]'\_first' and \[data-set name\]'\_last'; for editing
buttons - \[data-set name\]'\_edit' and \[data-set name\]'\_delete'.

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

**sql =
<a href="vc_type_sqlcode.html" class="link" title="SqlCode">SqlCode</a>
. ** The select statement that gets the data. Parameters to the
statement MUST be specified as SQL identifiers prefixed with a colon.
The values are given in the control's vspx:param children. These specify
the parameter name and a data bound expression for the value.

**data-source =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** A reference to a data-source, which wil lbe used to bind the data
in data-set grid.

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

**nrows = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** The maximum
number of replicas of the row template to be made for rows selected. It
is like the rowset size for a scrollable cursor.

**scrollable. ** The setting controls whether next and previous page
buttons are presented. This can be on even if the cursor is not
scrollable as such.

**cursor-type. **

<div>

**Table 14.4. Allowed values of the 'cursor-type' attribute**

<div>

|         |                           |
|---------|---------------------------|
| static  | A static cursor is used.  |
| dynamic | A dynamic cursor is used. |
| keyset  | A keyset cursor is used.  |

</div>

</div>

  

**edit. ** Flags whether editing features are enabled on data grid
control

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_data_set

``` screen
create type vspx_data_set under vspx_form
as (
    ds_nrows int,     -- how many rows to show on single page
    ds_scrollable int,      -- scroll on form is enabled
    ds_editable int default 1,          -- disable edit/add on whole grid
    ds_row_meta any,      -- metadata
    ds_row_data any,      -- data coming from a function, rowset
    ds_current_row vspx_row_template,   -- current row template
    ds_rowno_edit int default null, -- last edited row in result set, to re-display the edit box on error
    ds_rows_fetched int default 0,  -- how many rows are fetched for current page
    ds_rows_total int default 0,  -- how many data rows do we have in total (for vector)
    ds_rows_offs    int default 0,  -- this is the zero-based index of the first row of the current page in the whole list
    ds_rows_offs_saved int default 0,  -- this is the value of ds_rows_offs that was saved in the page state.
    ds_scrolled     int default 0,
    ds_has_next_page int default 0, -- Flag if there are rows after the current page (so 'next page' button should be enabled).
    ds_prev_bookmark any default null, -- Bookmark of the record that was at the beginning of previous retrieval of the page (bmk of the first row of the displayed page)
    ds_last_bookmark any default null, -- Bookmark of the record that was at the end of previous retrieval of the page (bmk of the last row of the displayed page)
    ds_rows_cache any,
    ds_data_source vspx_data_source default null
   )  temporary self as ref
  method vc_templates_clean () returns any,
  method vc_reset () returns any,
  method ds_column_offset (name varchar) returns any,
  method ds_iterate_rows (inx int) returns any,
  constructor method vspx_data_set (name varchar, parent vspx_control),
  overriding method vc_set_view_state (e vspx_event) returns any,
  overriding method vc_view_state (stream any, n int) returns any
```

</div>

<div>

## Examples

<div>

**Example 14.27.  Editable multi-row data grid based on data-set
control**

<div>

This example will show a list of customers from the Northwind demo
database. Allows editing, addtion and removal of existing records.

``` screen
<v:page name="data_set__0" xmlns:v="http://http://example.com/vspx/">
<html>
  <body>
      <v:data-set name="ds" sql="select CustomerID, CompanyName, Phone from Demo.demo.Customers" nrows="10" scrollable="1" cursor-type="keyset">
        <v:template name="t1" type="simple">
          <div>
            Action
            <v:label name="l1" value="CustomerID" format="%s" width="80"/>
            <v:label name="l2" value="CompanyName" format="%s" width="80"/>
            <v:label name="l3" value="Phone" format="%s" width="80"/>
          </div>
        </v:template>
        <v:template name="t2" type="repeat">
          <v:template name="t7" type="if-not-exists">
            <div>No rows selected</div>
          </v:template>
          <v:template name="t5" type="edit">
            <v:form name="u1" type="update" table="Demo.demo.Customers" if-not-exists="insert">
              <v:key column="CustomerID" value="--self.ds.ds_current_row.te_rowset[0]" default="null"/>
              <v:template name="template6" type="simple">
                <div>
                  <v:button name="upd_button" action="submit" value="Update"/>
                  <input type="submit" name="ds_cancel" value="Cancel"/>
                  <v:text name="c_id1" column="CustomerID"/>
                  <v:text name="c_name1" column="CompanyName"/>
                  <v:text name="c_phone1" column="Phone"/>
                </div>
              </v:template>
            </v:form>
          </v:template>
          <v:template name="t8" type="add">
            <v:form name="a1" type="update" table="Demo.demo.Customers" if-not-exists="insert">
              <v:key column="CustomerID" value="--''" default="null"/>
              <v:template name="template9" type="simple">
                <div>
                  <v:button name="add_button" action="submit" value="Add"/>
                  <v:text name="c_id2" column="CustomerID"/>
                  <v:text name="c_name2" column="CompanyName"/>
                  <v:text name="c_phone2" column="Phone"/>
                </div>
              </v:template>
            </v:form>
          </v:template>
          <v:template name="t4" type="browse">
            <div>
              <v:button name="ds_edit" action="simple" value="Edit"/>
              <v:button name="ds_delete" action="simple" value="Delete">
                <v:on-post>
                      delete from Demo.demo.Customers where CustomerID = self.ds.ds_current_row.te_rowset[0];
                      self.ds.vc_data_bind(e);
                    </v:on-post>
              </v:button>
              <v:label name="l5" value="--(control.vc_parent as vspx_row_template).te_rowset[0]"/>
              <v:label name="l6" value="--(control.vc_parent as vspx_row_template).te_rowset[1]"/>
              <v:label name="l7" value="--(control.vc_parent as vspx_row_template).te_rowset[2]"/>
            </div>
          </v:template>
        </v:template>
        <v:template name="t3" type="simple">
          <div>
            <v:button name="ds_prev" action="simple" value="&lt;&lt;"/>
            <v:button name="ds_next" action="simple" value="&gt;&gt;"/>
          </div>
        </v:template>
      </v:data-set>
  </body>
</html>
</v:page>
```

</div>

</div>

  

<div>

**Example 14.28.  Simple multi-row data grid based on data-set control**

<div>

This example will show a list of customers from the Northwind demo
database. Allows scrolling only of existing records.

``` screen
<v:page name="data_set__0" xmlns:v="http://http://example.com/vspx/">
<html>
  <body>
      <v:data-set name="ds" sql="select CustomerID, CompanyName, Phone from Demo.demo.Customers" nrows="10" scrollable="1" cursor-type="keyset">
        <v:template name="t1" type="simple">
          <div>
            <v:label name="l1" value="CustomerID" format="%s" width="80"/>
            <v:label name="l2" value="CompanyName" format="%s" width="80"/>
            <v:label name="l3" value="Phone" format="%s" width="80"/>
          </div>
        </v:template>
        <v:template name="t2" type="repeat">
          <v:template name="t7" type="if-not-exists">
            <div>No rows selected</div>
          </v:template>
          <v:template name="t4" type="browse">
            <div>
              <v:label name="l5" value="--(control.vc_parent as vspx_row_template).te_rowset[0]"/>
              <v:label name="l6" value="--(control.vc_parent as vspx_row_template).te_rowset[1]"/>
              <v:label name="l7" value="--(control.vc_parent as vspx_row_template).te_rowset[2]"/>
            </div>
          </v:template>
        </v:template>
        <v:template name="t3" type="simple">
          <div>
            <v:button name="ds_prev" action="simple" value="&lt;&lt;"/>
            <v:button name="ds_next" action="simple" value="&gt;&gt;"/>
          </div>
        </v:template>
      </v:data-set>
  </body>
</html>
</v:page>
```

</div>

</div>

  

<div>

|                            |                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                          |
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_3/data_set.vspx" 
                              class="ulink" target="_top">VX-S-3</a>                                  |

</div>

</div>

</div>
