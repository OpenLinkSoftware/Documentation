<div>

<div>

</div>

<div>

## Name

xml_cut — creates a new XML document which contains a copy of data
pointed by given XML tree- or XPER- entity

</div>

<div>

## Synopsis

<div>

|                      |                                           |
|----------------------|-------------------------------------------|
| ` `**`xml_cut`**` (` | in `source_entity ` any (XML entity) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

In some special cases, some part of XML document, being pointed by a XML
entity, should be copied into a new separate document with new entity
pointing to the top-level element or the root of this document. One
reason for doing this is optimization of XPER processing (see
<a href="fn_xper_cut.html" class="link" title="xper_cut">xper_cut</a> ).
Another way to use this functionality is passing of some XML entity to a
function, when function uses XPath operations with references to the
"document's root".

<div>

**Example 24.511. A sample of hidden bug**

<div>

``` screen
create procedure get_C (inout b any)
{
  return cast (xpath_eval('//C', b) as varchar);
}

create procedure hidden_bug_1()
{
  declare abc any;  -- some XML document
  declare b_list any;   -- a vector of all B elements of the doc
  declare c1 varchar;   -- a name of first variable
  declare c2 varchar;   -- a title of second variable
  abc := xtree_doc ('<A><B
xml:id="1_01"><C>One</C></B><B
xml:id="2_01"><C>Two</C></B></A>');
  b_list := xpath_eval ('//B', abc, 0);
  -- now b_list is a vector of two items, '<B
xml:id="1_02"><C>One</C></B>' and '<B
xml:id="2_02"><C>Two</C></B>'.
  c1 := get_C ( aref (b_list, 0));
  -- looks fine, c1 is '<C>One</C>'
  c2 := get_C ( aref (b_list, 1));
  -- looks strange fine, c2 is '<C>One</C>',
  -- while the expected value is '<C>Two</C>'.
}
      
```

The origin of the bug is '//C' path in get_C(), which returns not the "C
element inside given b element", but "C element inside the document
where given b element is located", thus get_C returns the first C
element in the whole document with any of two B elements given.

There are two ways to fix this bug. It is better to correct get_C():

``` screen
create procedure get_C (inout b any)
{
  return cast (xpath_eval('./C', b) as varchar);
}
      
```

If you cannot patch get_C() for some reason, xml_cut will help, but it
will waste both memory and CPU time for copying a branch of XML tree:

``` screen
create procedure hidden_bug_1()
{
...
  c1 := get_C ( xml_cut (aref (b_list, 0)));
...
}
      
```

</div>

</div>

  

The current node of the resulting entity is the node that is a copy of
the current node of the source entity. In common, the top-level node of
the copied subtree becomes the current node of the result. There are two
special cases, however. If the source entity is an attribute entity,
then the result is also an attribute entity and the attribute name
remains the same. If the source entity points to the root of the
document, the resulting entity also points to the root of the copied
document, not to its top-level node.

With XPER entity given, xml_cut() works exactly as xper_cut().

</div>

<div>

## Parameters

<div>

### source_xper

XML Entity to be converted into new document

</div>

</div>

<div>

## See Also

<a href="fn_xper_cut.html" class="link" title="xper_cut"><code
class="function">xper_cut() </code></a>

</div>

</div>
