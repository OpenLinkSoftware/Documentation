<div id="xpf_create_element" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

create-element — Creates an element with specified name, attributes and
children

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_create_element" class="funcsynopsis">

|                                 |                    |
|---------------------------------|--------------------|
| `node `**`create-element`**` (` | `head ` sequence , |
|                                 | `child1 ` any ,    |
|                                 | `child2 ` any ,    |
|                                 | `... ` ,           |
|                                 | `childN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_create_element" class="refsect1">

## Description

This is an internal XQUERY function and you will probably never need to
call it explicitly. It is not a part of library of standard XQUERY 1.0
functions.

This function creates a new "XML Tree" element whose name is a
string-value of the first item of *`head`* sequence, with attributes and
children specified by the rest of *`head`* sequence and by the list of
arguments *`child1`* , *`child2`* , ... *`childN`* .

First of all, a new element will be created, without attributes or
children. The name of element will be taken from the first item of the
*`head`* sequence. Then attributes will be created from the second and
third items of *`head`* , from fourth and fifth and so on. In every pair
of items will specify name and value of some attribute. Non-string items
will be converted to strings first. It is an error to specify the same
attribute name twice in *`head`* sequence.

When the "opening tag" of the element is prepared, children are added,
in the same order as they are specified by arguments *`child1`* ,
*`child2`* , ... *`childN`* . If the value of some argument is a
sequences (e.g. a node-set), items of the sequence are added as separate
children in the same order as they are in the sequence. Nodes are added
"as-is", numbers, strings and other "scalar" values are converted to
strings first and these strings are converted into PCDATA (text)
children.

"Attribute descriptor" objects are not converted to children elements;
if descriptor item is found, one attribute in the opening tag of the
created element is added or changed and the descriptor is removed from
the list of children.

When all children are prepared, some normalization is performed. If
there are two or more adjacent PCDATA (text) children, they are replaced
with one PCDATA children whose text is a concatenation of texts of all
that children.

</div>

<div id="xpf_params_create_element" class="refsect1">

## Parameters

<div id="id126564" class="refsect2">

### head

Name of the element or a sequence of name and attributes of the element.

</div>

<div id="id126567" class="refsect2">

### childI

Children node or sequence of children node.

</div>

</div>

<div id="xpf_ret_create_element" class="refsect1">

## Return Types

Node

</div>

<div id="xpf_errors_create_element" class="refsect1">

## Errors

<div id="id126575" class="table">

**Table 24.139. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                                                | Description                                                                                                             |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC0 </span> | <span class="errortext">At least one argument (name of element to be created) must be passed to create-element XPATH function. </span>                    | create-element is called without arguments.                                                                             |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC1 </span> | <span class="errortext">No name of element in the first argument of create-element XPATH function. </span>                                                | The *`head `* sequence is empty.                                                                                        |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC2 </span> | <span class="errortext">Last attribute has no value specified in the first argument of create-element XPATH function. </span>                             | The *`head `* sequence is of even length.                                                                               |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC3 </span> | <span class="errortext">Unsupported type of element of the first argument of create-element XPATH function. </span>                                       | Current version may create name and attributes of elements only from strings, entities and numbers.                     |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC4 </span> | <span class="errortext">Duplicate attribute names in first argument of create-element XPATH function. </span>                                             | Duplicate attribute names may appear in attribute descriptors but not in the *`head `* argument.                        |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC5 </span> | <span class="errortext">First argument of create-element XPATH function must be string, symbol or sequence of them. </span>                               | The function was unable to prepare name of element.                                                                     |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC6 </span> | <span class="errortext">Error in XPATH user extension function or internal error: sequence argument is not flat in create-element XPATH function. </span> | A value of XQUERY "sequence" type should not contain other sequences as its items, i.e. it must be "flat".              |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFC7 </span> | <span class="errortext">Invalid special entity found in argument of create-element XPATH function. </span>                                                | An invalid object (probably built by XPATH extension function) is specified as child entity.                            |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFCA </span> | <span class="errortext">Persistent XML entities are not fully supported by create-element XPATH function. </span>                                         | The function creates "XML Tree" element, "Persistent XML" entity can not become a children of "XML Tree".               |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFCB </span> | <span class="errortext">Unsupported type of argument in create-element XPATH function. </span>                                                            | Some argument or some item of an argument may not be converted to a string or a node, so a children may not be created. |

</div>

</div>

  

</div>

<div id="xpf_examples_create_element" class="refsect1">

## Examples

<div id="xpf_ex_create_element" class="example">

**Example 24.574. **

<div class="example-contents">

Two following XQUERY expressions are equivalent:

``` screen
<H1>{'Hello, '}<B>{'world'}</B></H1>
create-element('H1', 'Hello, ', create-element('B', 'world'))
```

</div>

</div>

  

</div>

<div id="xpf_seealso_create_element" class="refsect1">

## See Also

<a href="xpf_create_attribute.html" class="link"
title="create-attribute">create-attribute()</a>

<a href="xpf_create_comment.html" class="link"
title="create-comment">create-comment()</a>

<a href="xpf_create_pi.html" class="link"
title="create-pi">create-pi()</a>

</div>

</div>
