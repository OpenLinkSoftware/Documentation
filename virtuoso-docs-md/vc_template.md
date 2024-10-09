<div>

<div>

</div>

<div>

## Name

template — Container for a group of controls and/or HTML code.

</div>

<div>

## Synopsis

<div>

|                          |                               |
|--------------------------|-------------------------------|
| ` <`**`template`**` />(` | `name` (required) ,           |
|                          | `annotation` (optional) ,     |
|                          | `initial-enable` (optional) , |
|                          | `enabled` (optional) ,        |
|                          | `instantiate` (optional) ,    |
|                          | `control-udt` (optional) ,    |
|                          | `xsd-stub-xhtml` (optional) , |
|                          | `width` (optional) ,          |
|                          | `height` (optional) ,         |
|                          | `type` (optional) ,           |
|                          | `redirect` (optional) ,       |
|                          | `condition` (optional) ,      |
|                          | `name-to-remove` (optional) , |
|                          | `set-to-remove` (optional) ,  |
|                          | `title` (optional) ,          |
|                          | `debug-srcfile` (optional) ,  |
|                          | `debug-srcline` (optional) ,  |
|                          | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

The container for any optional, repeatable or otherwise grouped controls
or code. The type modifier is used to specify special kind of templates
(i.e. repeatable content or tree node representation)

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

**type. ** The behaviour of the template.

<div>

**Table 14.9. Allowed values of the 'type' attribute**

<div>

<table data-summary="Allowed values of the &#39;type&#39; attribute"
data-border="1">
<tbody>
<tr class="odd">
<td>simple</td>
<td><p>The template contains an arbitrary number of controls and HTML
tags and groups them together to control their processing, e.g. to
enable or disable them altogether depending on some condition.</p></td>
</tr>
<tr class="even">
<td>repeat</td>
<td><p>A repeating row of v:data-set. The template of this type will be
repeated for each row in the window of the data-set. It will be
instantiated, data bound, rendered. If the template contains forms and
submits, they get the post method called as one would expect. On data
binding, the parent of the template has its dg_current_row data member
set to an array representing the selected row from left to
right.</p></td>
</tr>
<tr class="odd">
<td>row</td>
<td><p>A repeating row of v:data-grid. The template of this type will be
repeated for each row in the window of the v:data-grid. It will be
instantiated, data bound, rendered. If the template contains forms and
submits, they get the post method called as one would expect. On data
binding, the parent of the template has its dg_current_row data member
set to an array representing the selected row from left to right.</p>
<p>The controls under this template (such as text, label, button etc.)
can access data in current row in order as columns are given by
referencing te_rowset member of row template.</p></td>
</tr>
<tr class="even">
<td>frame</td>
<td><p>A non-repeating static content of v:data-grid. Content of this
template represents view in page when rows are selected, position of
scroll buttons, rowset and form for adding a record.</p></td>
</tr>
<tr class="odd">
<td>if-exists</td>
<td><p>Template that is enabled only if the resultset is not empty in
v:data-set.</p></td>
</tr>
<tr class="even">
<td>if-not-exists</td>
<td><p>Template that is enabled only if the resultset is empty in
v:data-set.</p></td>
</tr>
<tr class="odd">
<td>add</td>
<td><p>Template that is enabled when user adds new record in the
resultset in v:data-set (if the resultset is not read-only). Similarly
to templates of type 'edit', the 'add' template contains a vspx:form of
type 'update' that is used to allow adding of rows in table as
specified. Usually this form is a vspx_form + vspx_text constrained to
columns and table selected in SQL expression of the parent vspx:data-set
control with value of key attributes set to null. Please remember to set
the 'if-not-exists' attribute of the form to 'insert'.</p></td>
</tr>
<tr class="even">
<td>browse</td>
<td><p>This type is meaningful only for templates right inside templates
of type 'repeat'. When the template of type 'repeat' is used multiple
times to display every row of a data-set, the template of type 'browse'
expands only for those rows that are not currently editable.</p></td>
</tr>
<tr class="odd">
<td>edit</td>
<td><p>Template that is enabled when user edits an existing record in
the resultset in v:data-set (if the resultset isnot read-only and if the
'edit' attribute of v:data-set is set to 'true'). The template of this
type usually contains a vspx:form of type 'update'; the 'table'
attribute of the form is the name of the table from 'sql' attribute of
the v:data-set where the 'edit' template is located; controls of the
form are usually constrained to columns of the SQL expression of that
'sql' attribute.</p></td>
</tr>
<tr class="even">
<td>if-login</td>
<td><p>Template that is enabled when user is logged in (e.g. for use in
v:login. If the login is valid, the contents of this child will be
instantiated. This can be for example a button with 'action' attribute
set to 'logout', a welcome message or such. When using the vspx:login
system, the user name is is obtained by connection_get
('vspx_user').</p></td>
</tr>
<tr class="odd">
<td>if-not-login</td>
<td><p>Template that is enabled when user is not yet logged in or is
already logged out (e.g. for use in v:login. The template specifies what
to do if there are no credentials with the page. If the 'redirect'
attribute is given, then the entire page containing this is not
processed at all but instead the page specified in the url is processed
instead, with the context being that of the invocation of this page. The
redirect page can thus ask for the login and having checked it return to
this page, since it knows the url for this. In this way it is possible
to bookmark places of which the uri's may expire, and accessing an
expired place will just prompt for the login before going to the page.
If the redirect is not specified, the content of the template is
instantiated and shown. The content can be arbitrary, e.g. the
vspx:login-form control can appear here, providing a standard login form
that prompts for a user name and password and has a submit
button.</p></td>
</tr>
<tr class="even">
<td>tree-node</td>
<td><p>Template for internal nodes of the tree in v:tree (i.e. for nodes
with children).</p></td>
</tr>
<tr class="odd">
<td>tree-leaf</td>
<td><p>Template for terminal nodes of the tree in v:tree (i.e. for nodes
without children).</p></td>
</tr>
<tr class="even">
<td>input</td>
<td><p>Template for input the SQL statement to execute it interactively
in v:isql element.</p></td>
</tr>
<tr class="odd">
<td>result</td>
<td><p>Template to show if v:isql returns result without an
error.</p></td>
</tr>
<tr class="even">
<td>error</td>
<td><p>Template to be shown by v:isql if the user entered the SQL query
and the execution of this query caused an error.</p></td>
</tr>
</tbody>
</table>

</div>

</div>

  

**redirect. ** The URL to which the user agent is redirected if not
authenticated, applicable only when type is 'if-no-login'.

**condition =
<a href="vc_type_sqlcode.html" class="link" title="SqlCode">SqlCode</a>
. ** This is a SQL expression to be tested for rendering the template

**name-to-remove. ** This works together with set-to-remove, see next.

**set-to-remove. ** This combined with name-to-remove gives posibility
to remove a HTML elements from output.

<div>

**Table 14.10. Allowed values of the 'set-to-remove' attribute**

<div>

|        |                                                                                                                                                                                                          |
|--------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| none   | The rendered output of the enclosing template will not be affected by the 'name-to-remove' attribute of the template.                                                                                    |
| top    | The rendered output of the enclosing template should not contain the first opening tag whose name is equal to the value of 'name-to-remove' attribute of the template.                                   |
| bottom | The rendered output of the enclosing template should not contain the last closing tag whose name is equal to the value of 'name-to-remove' attribute of the template.                                    |
| both   | The rendered output of the enclosing template should not contain the both the first opening tag and the last closing tag whose name is equal to the value of 'name-to-remove' attribute of the template. |

</div>

</div>

  

**title. ** When used inside tab control, this is used to show as label
of the selector

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_template

``` screen
create type vspx_template under vspx_control
  temporary self as ref
 constructor method vspx_template (name varchar, parent vspx_control)
```

</div>

</div>
