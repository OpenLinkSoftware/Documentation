<div>

<div>

</div>

<div>

## Name

XMLReplace — Modify a given XML document by replacing some nodes.

</div>

<div>

## Synopsis

<div>

|                            |                             |
|----------------------------|-----------------------------|
| `any `**`XMLReplace`**` (` | inout `source ` any ,       |
|                            | in `location1 ` any ,       |
|                            | in `replacement1 ` any ,    |
|                            | in `location2 ` any ,       |
|                            | in `replacement2 ` any ,    |
|                            | in `... ` ,                 |
|                            | in `locationN ` any ,       |
|                            | in `replacementN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function takes of the XML document referenced by *`source`* XML tree
entity and modifies it by replacing nodes specified by *`location1`* ,
*`location2`* , ..., *`locationN`* with values specified by
*`replacement1`* , *`replacement2`* , ...,*`replacementN`* . At the end
of function call, the *`source`* points to the root of a modified
entity.

The *`source`* parameter should be an XML tree entity whose document is
not locked (see <a href="xmldom.html" class="link"
title="15.11. Changing XML entities in DOM style">Changing XML Entities
in DOM Style</a> for details).

Every *`replacementI`* may be an XML tree entity, a NULL or a value of
some other type that will be converted to varchar before use.

For simplicity, consider the case when there is only one *`location1`*
XML entity and only one *`replacement1`* . If the *`location1`* is an
XML entity that is not in the source document then no modifications is
made in *`source`* . If *`replacement1`* is an entity that is in the
source document then a temporary "cut" of *`replacement1`* is created,
like `xml_cut` is called).

If the *`location1`* is an attribute entity then the value of the
attribute is changed. If *`replacement1`* is NULL then the attribute is
removed at all, otherwise its value is set to the string value of the
*`replacement1`* .

If the *`location1`* is not an attribute entity but a entity then
*`location1`* is replaced with the value of *`replacement1`* . The
method of replacement depends on the type of the replacement value. If
*`replacement1`* is NULL then the *`location1`* node is simply removed
from the result; if the node is the root or a single child of the root
then function immediately returns NULL (because XML document can not be
totally empty), otherwise the parent of the *`location1`* will simply
have one child less. If *`replacement1`* is an non-empty string then
*`location1`* is replaced with a new text node whose string value is
equal to *`replacement1`* . If *`replacement1`* is an empty string then
the effect is exactly the same as in case of NULL because the string
value of a text node can not be empty. If *`replacement1`* is an XML
entity that is a root entity of some document then the highlighted node
is replaced with a sequence of copies of all children of that root. If
*`replacement1`* is an XML entity of some other sort (XML element, text,
comment etc.) then the that is not a root entity of some document then
the highlighted node is replaced with a sequence of copies of all
children of that root.

After changing the *`source`* , some normalization may happen. The
modified document may contain adjacent text nodes; every sequence of
such nodes is replaced with one text node whose string value is a
concatenation of string values of that nodes. E.g. if the *`location1`*
is an element \<a/\> that resides between two text nodes "text1" and
"text2" and it is removed (by replacing with NULL) then these text nodes
become neighbors; normalization will replace them with a single text
node "text1text2"

Now consider the case of more than one replacement made in one function
call. If more than one pair of location and replacement is given then
the function first finds all locations, then it performs all
replacements, then it performs an normalization. It is very important to
understand that the order of making replacements has nothing to do with
the order of pairs of parameters in the function call. If some location
node is an ancestor of some other location node then the effect of the
replacement of the descendant location node is void: the descendant is
replaced first; then the ancestor is replaced as a whole, no matter if
some of its descendants are modified. The order of parameters in the
function call is used to resolve ambiguity If two locations are equal:
the last pair of parameters will have a higher priority.

If the *`source`* is an instance of XMLType then its inner XML document
is changed and "is validated" flag is reset to 0 indicating that there
is no warranty that the modified version of document matches the
declared schema even if the original document matched.

</div>

<div>

## Parameters

<div>

### source

A source XML tree entity. It is an error to pass persistent XML entity
as an argument.

</div>

<div>

### locationI

An XML entity that points to the node to replace. For compatibility with
other implementations, it can be NULL, a pair of arguments is silently
ignored in this case.

</div>

<div>

### replacementI

A replacement value for XML node pointed by *`locationI `* ; it may be
NULL or XML tree entity or a string or anything else but not an
persistent XML entity.

</div>

</div>

<div>

## Return Types

The function returns NULL.

</div>

<div>

## Examples

<div>

**Example 24.506. XMLReplace in a Virtuoso/PL procedure**

<div>

The sample procedure contains two calls of `XMLReplace ` . First call
replaces element 'c' with a copy of element 'replacement'. Second call
demonstrates two replacements in parallel: elements titled 'c1' and 'c3'
are replaced with text nodes.

``` screen
create procedure XMLReplace_demo ()
{
  declare DESCRIPTION varchar(42);
  declare XMLENTITY, ent, ent2, ent_to_corrupt any;
  result_names (DESCRIPTION, XMLENTITY);
  ent := xtree_doc('<a><b><q/>-<c>Hello</c>-</b></a>');
  result ('EXAMPLE 1', 'A simple replacement of one element with other');
  result ('The document to modify:', ent);
  ent_to_corrupt := xquery_eval ('//c', ent);
  result ('Node to be replaced:', ent_to_corrupt);
  XMLReplace (ent, ent_to_corrupt, xtree_doc('<replacement/>'));
  result ('The document after modification:', ent);
  result ('Node to be replaced is outdated:', ent_to_corrupt);
  result ('...e.g. it'' not a descendant of its root:', xpath_eval('/', ent_to_corrupt));
  result ('EXAMPLE 2', 'Two replacements in parallel');
  ent2 := xtree_doc('<a><b><c1>Hello1</c1><c2>Hello2</c2><c3>Hello3</c3></b></a>');
  result ('The document to modify:', ent2);
  XMLReplace (ent2, xquery_eval('//c1', ent2), 'world1', xquery_eval('//c3', ent2), 'world3');
  result ('The document after modification:', ent2);
}

Done. -- 00000 msec.

XMLReplace_demo()
DESCRIPTION                                XMLENTITY
VARCHAR                                    VARCHAR
_______________________________________________________________________________

EXAMPLE 1                                  A simple replacement of one element with other
The document to modify:                    <a><b><q />-<c>Hello</c>-</b></a>
Node to be replaced:                       <c>Hello</c>
The document after modification:           <a><b><q />-<replacement />-</b></a>
Node to be replaced is outdated:           <c>Hello</c>
...e.g. it' not a descendant of its root:  <a><b><q />-<replacement />-</b></a>
EXAMPLE 2                                  Two replacements in parallel
The document to modify:                    <a><b><c1>Hello1</c1><c2>Hello2</c2><c3>Hello3</c3></b></a>
The document after modification:           <a><b>world1<c2>Hello2</c2>world3</b></a>

9 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmlupdate.html" class="link" title="XMLUpdate"><code
class="function">XMLUpdate </code></a>

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
