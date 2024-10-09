<div>

<div>

</div>

<div>

## Name

XMLUpdate — Create a changed copy of given document by replacing some
nodes.

</div>

<div>

## Synopsis

<div>

|                           |                             |
|---------------------------|-----------------------------|
| `any `**`XMLUpdate`**` (` | inout `source ` any ,       |
|                           | in `path1 ` varchar ,       |
|                           | in `replacement1 ` any ,    |
|                           | in `path2 ` varchar ,       |
|                           | in `replacement2 ` any ,    |
|                           | `... ` ,                    |
|                           | in `pathN ` varchar ,       |
|                           | in `replacementN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function takes of the XML document referenced by *`source`* XML tree
entity, makes a copy of that document; then it modifies the copy by
finding fragments that are values of *`path1`* , *`path2`* , ...,
*`pathN`* XPATH expressions and replacing them with values specified by
*`replacement1`* , *`replacement2`* , ...,*`replacementN`* ; the
modified copy is returned as the result of the function call.

Every *`pathI`* should be a string that is a correct XPATH expression.
Every such expression is evaluated according to the rules for XPATH
expressions in XSLT (attribute entities are not cast to their string
values). The context node is *`source`* , context size and position are
both equal to 1.

Every *`replacementI`* may be an XML tree entity, a NULL or a value of
some other type that will be converted to varchar before use.

For simplicity, consider the case when there is only one *`path1`* XPATH
expression parameter and only one *`replacement1`* . First of all, a
copy of the document of the *`source`* XML tree entity is created. Then
*`path1`* is evaluated.

If the result of evaluation is not an XML entity then no replacement is
made and the copy of the source document is returned unchanged. If the
result is an XML entity that is not in the source document (e.g. an
entity returned by the call of document(...) function.) then no
replacement is made either.

If the result of evaluation is an XML entity in the source document then
the function finds a node in the copied document that is a copy of the
node in the source that is returned by XPATH evaluation. This node in
the copied document will be referred to as a "highlighted" node.

If the result of evaluation is an attribute entity then the value of the
attribute in the highlighted node is changed. If *`replacement1`* is
NULL then the attribute is removed at all, otherwise its value is set to
the string value of the *`replacement1`* .

If the result of evaluation is not an attribute entity but a entity then
the highlighted node is replaced with the value of *`replacement1`* .
The method of replacement depends on the type of the replacement value.
If *`replacement1`* is NULL then the highlighted node is simply removed
from the result; if the node is the root or a single child of the root
then function immediately returns NULL instead of an XML entity (because
XML document can not be totally empty), otherwise the parent of the
highlighted node will simply have one child less. If *`replacement1`* is
an non-empty string then the highlighted node is replaced with a new
text node whose string value is equal to *`replacement1`* . If
*`replacement1`* is an empty string then the effect is exactly the same
as in case of NULL because the string value of a text node can not be
empty. If *`replacement1`* is an XML entity that is a root entity of
some document then the highlighted node is replaced with a sequence of
copies of all children of that root. If *`replacement1`* is an XML
entity of some other sort (XML element, text, comment etc.) then the
that is not a root entity of some document then the highlighted node is
replaced with a sequence of copies of all children of that root.

After editing the copied document, some normalization may happen. The
modified document may contain adjacent text nodes; every sequence of
such nodes is replaced with one text node whose string value is a
concatenation of string values of that nodes. E.g. if the highlighted
node is an element \<a/\> that resides between two text nodes "text1"
and "text2" and the highlighted node is removed, then these text nodes
become neighbors; normalization will replace them with a single text
node "text1text2"

Now consider the case of more than one replacement made in one function
call. If more than one pair of XPATH expression and replacement is given
then the function first finds all highlighted nodes, all together, then
it performs all replacements, then it performs an normalization. It is
very important to understand that the order of making replacements has
nothing to do with the order of pairs of parameters in the function
call. If some highlighted node is an ancestor of some other highlighted
node then the effect of the replacement of the descendant highlighted
node is void: the descendant is replaced first; then the ancestor is
replaced as a whole, no matter if some of its descendants are modified.
If a node is the result of two different XPATH expressions ("highlighted
more than once"), the order of parameters in the function call is used
to resolve ambiguity: the last pair of parameters will have a higher
priority.

</div>

<div>

## Parameters

<div>

### source

A source XML tree entity. It is an error to pass persistent XML entity
as an argument.

</div>

<div>

### pathI

A text of XPATH expression to be used in order to find nodes to replace.

</div>

<div>

### replacementI

A replacement value for XML nodes found by *`pathI `* ; it may be NULL
or XML tree entity or a string r anything else but not an persistent XML
entity.

</div>

</div>

<div>

## Return Types

If the *`source `* parameter is an XML tree entity then the function
returns an XML tree entity that points to the root of the modified copy
of the source document or a NULL. If the *`source`* is an instance of
XMLType then a non-schema based instance of XMLType is created from the
resulting XML tree entity.

</div>

<div>

## Examples

<div>

**Example 24.525. A simple replacement of one element with other**

<div>

The call of function `XMLUpdate ` replaces element 'c' with a copy of
element 'replacement'.

``` screen
select XMLUpdate (xtree_doc('<a><b><q/>-<c>Hello</c>-</b></a>'), '//c', xtree_doc('<replacement/>'))
callret
VARCHAR
_______________________________________________________________________________

<a>
<b>
<q />-
<replacement />-
</b>
</a>
```

</div>

</div>

  

<div>

**Example 24.526. Two replacements in parallel**

<div>

Elements titled 'c1' and 'c3' are replaced with text nodes.

``` screen
select XMLUpdate (xtree_doc('
<a>
<b>
<c1>Hello1
</c1>
<c2>Hello2
</c2>
<c3>Hello3
</c3>
</b>
</a>'), '//c1', 'world1', '//c3', 'world3')
callret
VARCHAR
_______________________________________________________________________________

<a>
<b>world1
<c2>Hello2
</c2>world3
</b>
</a>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmlreplace.html" class="link" title="XMLReplace"><code
class="function">XMLReplace </code></a>

<a href="fn_xmladdattribute.html" class="link"
title="XMLAddAttribute"><code
class="function">XMLAddAttribute </code></a>

<a href="fn_xmlappendchildren.html" class="link"
title="XMLAppendChildren"><code
class="function">XMLAppendChildren </code></a>

<a href="fn_xmlinsertbefore.html" class="link"
title="XMLInsertBefore"><code
class="function">XMLInsertBefore </code></a>

<a href="fn_xmlinsertafter.html" class="link"
title="XMLInsertAfter"><code class="function">XMLInsertAfter </code></a>

<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt </code></a>

</div>

</div>
