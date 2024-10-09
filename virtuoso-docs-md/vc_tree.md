<div>

<div>

</div>

<div>

## Name

tree — A container for displaying a tree of nested nodes.

</div>

<div>

## Synopsis

<div>

|                      |                               |
|----------------------|-------------------------------|
| ` <`**`tree`**` />(` | `name` (required) ,           |
|                      | `annotation` (optional) ,     |
|                      | `initial-enable` (optional) , |
|                      | `enabled` (optional) ,        |
|                      | `instantiate` (optional) ,    |
|                      | `control-udt` (optional) ,    |
|                      | `xsd-stub-xhtml` (optional) , |
|                      | `width` (optional) ,          |
|                      | `height` (optional) ,         |
|                      | `show-root` (optional) ,      |
|                      | `multi-branch` (required) ,   |
|                      | `orientation` (required) ,    |
|                      | `root` (required) ,           |
|                      | `child-function` (required) , |
|                      | `start-path` (required) ,     |
|                      | `open-at` (optional) ,        |
|                      | `debug-srcfile` (optional) ,  |
|                      | `debug-srcline` (optional) ,  |
|                      | `debug-log` (optional) `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

This can be used for hierarchical tables of contents, directory
browsing, hierarchical menus and such. The tree can have either one or
more branches open at any time, up to the leaves. The tree has a root,
which may or may not be visible. The contents of the tree can either be
fixed, in which case these are an XML tree, or dynamic, in which case
these are generated level by level by SQL functions attached to the
tree. The tree can have various external appearences. The tree is
represented at run time by a vspx_tree instance. Nodes of the tree are
represented by vspx_tree_node objects, which are childs of the
vspx_tree. The nodes hold an identifier (vc_instance_name) of the
corresponding tree branch, which is used to retrieve children of the
node. These also hold a flag (tn_open member) indicating if the node is
open or not.

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

**show-root. ** This attribute is obsolete and has no effect.

**multi-branch. ** This determines whether more than one branches can be
open at one time. The values are 0 and 1 (true and false). The default
is 0 (false).

**orientation. ** This can be 'horizontal' or 'vertical', the default is
'vertical'. The tree can have different styles. The default is a
vertical arrangement with open levels indented, the children under the
parent node. Each node template is a single line. The horizontal style
shows each level on a separate line. In this case it is not allowed
multiple open branches. The children of the root will be shown on one
line. When one is opened, its children will fill the next line.

**root =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** This is a SQL expression which produces the root object. This can
be of any data type, a file system path is an example.

``` programlisting

create procedure root_node (in path varchar)
{
  declare i, l int;
  declare ret, arr any;
  arr :=
    vector_concat (sys_dirlist (path, 0), sys_dirlist (path, 1));

  return arr;
};
```

**child-function =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** Given the result of the root expression, this must generate an
array of similar elements corresponing to the children of the node in
question. This same function should be applicable to each element of the
array it returns. If the array is empty then the node in question is a
leaf.

``` programlisting

-- Example of this function

create procedure child_node (in node_name varchar, in node varchar)
{
  declare i, l int;
  declare ret, arr any;
  declare exit handler for sqlstate '*'
    {
      return vector ();
    };
  if (isstring (file_stat (node_name, 3)))
    return vector ();

  arr :=
    vector_concat (sys_dirlist (node_name, 0), sys_dirlist (node_name, 1));

  return arr;
}
;
```

**start-path = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is an
expression which will be evaluated and passed to the 'root' function as
argument.

**open-at = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** This is an
expression which will be used as XPath expression to designate which
branches of the tree are open and which are not initially.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_tree

``` screen
create type vspx_tree under vspx_control
as
  (
    vt_current_node int default -1,
    vt_node any default null,
    vt_open_at varchar default null,
    vt_xpath_id varchar default null
  )
temporary self as ref
overriding method vc_view_state (stream any, n int) returns any,
method vc_get_state () returns any,
method vc_open_at (path varchar) returns any,
constructor method vspx_tree (name varchar, parent vspx_control)
```

</div>

<div>

## Examples

<div>

**Example 14.44. **

<div>

``` screen
<v:page name="demo_tree" xmlns:v="http://http://example.com/vspx/">
<html>
 <body>
 <v:form name="f1" method="POST" type="simple">
 <div>
 <v:tree name="tree1" multi-branch="1" orientation="vertical"
         root="root_node" start-path="." child-function="child_node" >
  <v:node-template name="node_tmpl">
    <div STYLE="margin-left:1em;">
    <v:button name="tree1_toggle" action="simple" style="image" value="--case (control.vc_parent as vspx_tree_node).tn_open when 0 then 'plus.gif' else 'minus.gif' end" />
    <b><v:label name="label1" value="--(control.vc_parent as vspx_tree_node).tn_value" /></b>
    <v:node />
    </div>
  </v:node-template>
  <v:leaf-template name="leaf_tmpl">
    <div STYLE="margin-left:1em;">
    <v:label name="label2" value="--(control.vc_parent as vspx_tree_node).tn_value" />
    </div>
  </v:leaf-template>
 </v:tree>
 </div>
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
|                            | <a href="http://demo.openlinksw.com/tutorial/web/vx_s_4/tree.vspx" 
                              class="ulink" target="_top">VX-S-4</a>                              |

</div>

</div>

</div>
