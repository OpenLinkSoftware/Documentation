<div id="fn_xmladdattribute" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLAddAttribute — Add an attribute to the given node of an XML tree
document

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmladdattribute" class="funcsynopsis">

|                                     |                           |
|-------------------------------------|---------------------------|
| `integer `**`XMLAddAttribute`**` (` | inout `source ` any ,     |
|                                     | in `mode ` integer ,      |
|                                     | in `attr_name ` any ,     |
|                                     | in `attr_value ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmladdattribute" class="refsect1">

## Description

The function modifies the `source ` document by adding an attribute to
the current node of `source` entity. The `source` should be an XML tree
entity, not "persistent XML" one, should be an element entity (not
attribute, text etc.) and should not be a root entity. Parameters
`attr_name` and `attr_value` can be of any types that can be casted to
string. `attr_name` can be an attribute entity, in this case both the
name and the value of `attr_name` attribute is used and `attr_value`
code must be omitted.

The `mode` specifies how to resolve duplicate attribute names, if an
`source` entity already has an attribute whose name is equal to
`attr_name` . Mode 0 is similar to "insert into": the function signals
an error if an attribute already exists. Mode 1 is similar to "insert
soft": the function do nothing if an attribute already exists and not
signalling an error. Mode 2 is similar to "insert replacing": the
function either adds a new attribute or replacing the value of existing
attribute.

</div>

<div id="params_xmladdattribute" class="refsect1">

## Parameters

<div id="id122064" class="refsect2">

### source

The XML tree entity to change.

</div>

<div id="id122067" class="refsect2">

### mode

The mode of resolving duplicate attribute names.

</div>

<div id="id122070" class="refsect2">

### attr_name

The name of a new attribute (or an attribute XML entity that specifies
both name and value of an attribute.

</div>

<div id="id122073" class="refsect2">

### attr_value

The value of a new attribute

</div>

</div>

<div id="ret_xmladdattribute" class="refsect1">

## Return Types

The function returns integer that indicate the actual operation
performed. The zero value means that there was no change ("insert soft"
when an attribute already exists). The value one means that a new
attribute was added, the value two means that an existing attribute was
replaced.

</div>

<div id="examples_xmladdattribute" class="refsect1">

## Examples

<div id="ex_xmladdattribute" class="example">

**Example 24.497. Different modes of calling XMLAddAttribute**

<div class="example-contents">

The sample procedure contains three calls of `XMLAddAttribute ` with
different values of `mode` , for "insert into", "insert soft" and
"insert replacing" behaviour.

``` screen
create procedure XMLAddAttribute_demo ()
{
  declare DESCRIPTION varchar (33);
  declare XMLENTITY, ent any;
  result_names (DESCRIPTION, XMLENTITY);
  result ('EXAMPLE 1', 'Adding a new attribute');
  ent := xpath_eval ('//b', xtree_doc('<a><b attrX="x" attrY="y"/></a>'));
  result ('The document to modify:', xpath_eval('/', ent));
  result ('An element node to change:', ent);
  XMLAddAttribute (ent, 0, 'attrZ', 'z');
  result ('The document after modification:', xpath_eval('/', ent));
  result ('EXAMPLE 2', 'Failed adding of an (existing) attribute');
  ent := xpath_eval ('//b', xtree_doc('<a><b attrX="x" attrY="y"/></a>'));
  result ('The document to modify:', xpath_eval('/', ent));
  result ('An element node to change:', ent);
  XMLAddAttribute (ent, 1, 'attrX', 'xNEW');
  result ('The document after modification:', xpath_eval('/', ent));
  result ('EXAMPLE 3', 'Successful replacing of an existing attribute');
  ent := xpath_eval ('//b', xtree_doc('<a><b attrX="x" attrY="y"/></a>'));
  result ('The document to modify:', xpath_eval('/', ent));
  result ('An element node to change:', ent);
  XMLAddAttribute (ent, 2, 'attrX', 'xNEW');
  result ('The document after modification:', xpath_eval('/', ent));
}
Done. -- 00000 msec.

XMLAddAttribute_demo()
DESCRIPTION                                  XMLENTITY
VARCHAR                                      VARCHAR
_______________________________________________________________________________

EXAMPLE 1                          Adding a new attribute
The document to modify:            <a><b attrX="x" attrY="y" /></a>
An element node to change:         <b attrX="x" attrY="y" />
The document after modification:   <a><b attrX="x" attrY="y" attrZ="z" /></a>
EXAMPLE 2                          Failed adding of an (existing) attribute
The document to modify:            <a><b attrX="x" attrY="y" /></a>
An element node to change:         <b attrX="x" attrY="y" />
The document after modification:   <a><b attrX="x" attrY="y" /></a>
EXAMPLE 3                          Successful replacing of an existing attribute
The document to modify:            <a><b attrX="x" attrY="y" /></a>
An element node to change:         <b attrX="x" attrY="y" />
The document after modification:   <a><b attrX="xNEW" attrY="y" /></a>

12 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xmladdattribute" class="refsect1">

## See Also

<a href="fn_xmlreplace.html" class="link" title="XMLReplace"><code
class="function">XMLReplace() </code></a>

<a href="fn_xmlappendchildren.html" class="link"
title="XMLAppendChildren"><code
class="function">XMLAppendChildren() </code></a>

<a href="fn_xmlinsertbefore.html" class="link"
title="XMLInsertBefore"><code
class="function">XMLInsertBefore() </code></a>

<a href="fn_xmlinsertafter.html" class="link"
title="XMLInsertAfter"><code
class="function">XMLInsertAfter() </code></a>

</div>

</div>
