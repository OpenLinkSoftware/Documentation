<div>

<div>

</div>

<div>

## Name

XMLAppendChildren — Modify an XML document by adding new children to the
given entity.

</div>

<div>

## Synopsis

<div>

|                                |                           |
|--------------------------------|---------------------------|
| ` `**`XMLAppendChildren`**` (` | inout `source ` any ,     |
|                                | in `insertion1 ` any ,    |
|                                | in `insertion2 ` any ,    |
|                                | `... ` ,                  |
|                                | in `insertionN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function modifies the XML document of the given *`source `* XML tree
entity by adding new children to the node specified by the entity. The
*`source`* entity should be XML tree entity, not "persistent XML"
entity. The value of *`source`* can be either an element entity or a
root entity; *`source`* can not be an attribute entity or a leaf entity
like text or processing instruction.

The values passed in parameters *`insertion1`* ... *`insertionN`* will
be converted into XML nodes according to rules described in section
<a href="xmldom.html#xmldomtypecasting" class="link"
title="15.11.1. Composing Document Fragments From DOM Function Arguments">Composing
Document Fragments From DOM Function Arguments.</a>

After calling the function, parameter *`source`* is still a valid XML
entity that points to the modified node. The value passed as *`source`*
can be used in the rest of caller procedure.

</div>

<div>

## Parameters

<div>

### source

The XML tree entity whose document should be modified. This document
should not be locked (see <a href="xmldom.html" class="link"
title="15.11. Changing XML entities in DOM style">Changing XML Entities
in DOM Style</a> for details).

</div>

<div>

### parameterI

The value to be added as as child node of *`source `* .

</div>

</div>

<div>

## Return Types

The function returns NULL.

</div>

<div>

## Examples

<div>

**Example 24.498. XMLAppendChildren in a Virtuoso/PL procedure**

<div>

The sample procedure contains two calls of `XMLAppendChildren ` . First
call append three children to a node; second call demonstrates how text
nodes can be merged.

``` screen
create procedure XMLAppendChildren_demo()
{
  declare DESCRIPTION varchar (40);
  declare ENTITY, ent any;
  result_names (DESCRIPTION, ENTITY);
  result ('EXAMPLE1', 'Plain appending of some children');
  ent := xpath_eval ('//b', xtree_doc ('<a><b>Hello</b></a>'));
  result ('The document to modify', xpath_eval ('/', ent));
  result ('The node to be extended', ent);
  XMLAppendChildren (ent, xtree_doc ('<comma/>'), ' world', xtree_doc ('<excl/>'));
  result ('The changed document', xpath_eval ('/', ent));
  result ('The original entity is updated', ent);
  result ('EXAMPLE2', 'Appending that cause concatenation of text nodes');
  result_names (DESCRIPTION, ENTITY);
  ent := xpath_eval ('//b', xtree_doc ('<a><b>Hello</b></a>'));
  result ('The document to modify', xpath_eval ('/', ent));
  result ('The node to be extended', ent);
  XMLAppendChildren (ent, ', ', ' world', '!');
  result ('The changed document', xpath_eval ('/', ent));
  result ('The original entity is updated', ent);
}

Done. -- 00000 msec.

XMLAppendChildren_demo()
DESCRIPTION                               ENTITY
VARCHAR                                   VARCHAR
_______________________________________________________________________________

EXAMPLE1                                  Plain appending of some children
The document to modify                    <a><b>Hello</b></a>
The node to be extended                   <b>Hello</b>
The changed document                      <a><b>Hello<comma /> world<excl /></b></a>
The original entity is updated            <b>Hello<comma /> world<excl /></b>
EXAMPLE2                                  Appending that cause concatenation of text nodes
The document to modify                    <a><b>Hello</b></a>
The node to be extended                   <b>Hello</b>
The changed document                      <a><b>Hello,  world!</b></a>
The original entity is updated            <b>Hello,  world!</b>

10 Rows. -- 00000 msec.
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

<a href="fn_xmlinsertbefore.html" class="link"
title="XMLInsertBefore"><code
class="function">XMLInsertBefore </code></a>

<a href="fn_xmlinsertafter.html" class="link"
title="XMLInsertAfter"><code class="function">XMLInsertAfter </code></a>

</div>

</div>
