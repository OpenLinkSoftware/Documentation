<div>

<div>

</div>

<div>

## Name

XMLInsertBefore — Modify an XML document by inserting new children
before the node specified by given entity.

</div>

<div>

## Synopsis

<div>

|                              |                           |
|------------------------------|---------------------------|
| ` `**`XMLInsertBefore`**` (` | inout `source ` any ,     |
|                              | in `insertion1 ` any ,    |
|                              | in `insertion2 ` any ,    |
|                              | `... ` ,                  |
|                              | in `insertionN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function modifies the XML document of the given *`source `* XML tree
entity by adding new siblings to the node specified by the entity.
Siblings will be added right before the node. The *`source`* entity
should be XML tree entity, not "persistent XML" entity. The value of
*`source`* should be a node entity; *`source`* can not be an attribute
entity or a root entity.

The values passed in parameters *`insertion1`* ... *`insertionN`* will
be converted into XML nodes according to rules described in section
<a href="xmldom.html#xmldomtypecasting" class="link"
title="15.11.1. Composing Document Fragments From DOM Function Arguments">Composing
Document Fragments From DOM Function Arguments.</a>

After calling the function, parameter *`source`* is still a valid XML
entity that points to the same node. The value passed as *`source`* can
be used in the rest of caller procedure.

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

**Example 24.505. XMLInsertBefore in a Virtuoso/PL procedure**

<div>

The sample procedure contains two calls of `XMLInsertBefore ` . First
call insert two new element nodes just before the given node; second
call demonstrates how text nodes can be merged.

``` screen
create procedure XMLInsertBefore_demo()
{
  declare DESCRIPTION varchar (40);
  declare ENTITY, ent any;
  result_names (DESCRIPTION, ENTITY);
  result ('EXAMPLE1', 'Plain inserting of some children');
  ent := xpath_eval ('//child0', xtree_doc ('<a><child0></child0></a>'));
  result ('The document to modify', xpath_eval ('/', ent));
  result ('The place of insertion', ent);
  XMLInsertBefore (ent, xtree_doc ('<child1/>'), xtree_doc ('<child2/>'));
  result ('The changed document', xpath_eval ('/', ent));
  result ('The original node is updated', ent);
  result ('EXAMPLE2', 'Insertion that cause concatenation of text nodes');
  ent := xpath_eval ('//b/text()', xtree_doc ('<a><b>world!</b></a>'));
  result ('The document to modify', xpath_eval ('/', ent));
  result ('The place of insertion', ent);
  XMLInsertBefore (ent, 'Hello, ');
  result ('The changed document', xpath_eval ('/', ent));
  result ('The original node is updated', ent);
}

Done. -- 00000 msec.

XMLInsertBefore_demo()
DESCRIPTION                               ENTITY
VARCHAR                                   VARCHAR
_______________________________________________________________________________

EXAMPLE1                                  Plain inserting of some children
The document to modify                    <a><child0 /></a>
The place of insertion                    <child0 />
The changed document                      <a><child1 /><child2 /><child0 /></a>
The original node is updated              <child0 />
EXAMPLE2                                  Insertion that cause concatenation of text nodes
The document to modify                    <a><b>world!</b></a>
The place of insertion                    world!
The changed document                      <a><b>Hello, world!</b></a>
The original node is updated              Hello, world!

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

<a href="fn_xmlappendchildren.html" class="link"
title="XMLAppendChildren"><code
class="function">XMLAppendChildren </code></a>

<a href="fn_xmlinsertafter.html" class="link"
title="XMLInsertAfter"><code class="function">XMLInsertAfter </code></a>

</div>

</div>
