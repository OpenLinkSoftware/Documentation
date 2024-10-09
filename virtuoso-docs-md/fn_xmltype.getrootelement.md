<div>

<div>

</div>

<div>

## Name

XMLType.getRootElement — Returns top-level element of the given instance
(NULL for fragment)

</div>

<div>

## Synopsis

<div>

|                                     |      |
|-------------------------------------|------|
| ` `**`XMLType.getRootElement`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

If the given instance is well-formed then this function will return the
top-level element of the document that is stored within the instance. If
the given instance is a fragment then NULL will be returned because
there may be no top-level elements or too many of them.

Note that in spite of this functions name this function actually returns
the a top-level node rather than not a root node. According to the W3C
XPATH standards, the root element is an implicit node whose children are
top-level elements, comments, processing instructions and maybe text
nodes. E.g. if a correct HTML document is started by tag `<HTML>` and
ended by corresponding `</HTML>` tag then the only top-level node is the
"`HTML` " element node and this node is a single child of the root node.

If the given instance is well-formed then the function returns a
top-level element of the document that is stored in the instance. If the
given instance is fragment then NULL is returned, because there may be
no top-level elements or too many of them.

If the given instance is schema-based then the returned instance is
based on the same schema.

</div>

<div>

## Return Types

The function returns an XMLType instance.

</div>

<div>

## Examples

<div>

**Example 24.552. A table with an XMLType column**

<div>

First select statement lists well-formed documents; second one lists the
only fragment in the table.

``` screen
create table TEST_XMLS  (I integer primary key, XMLVAL XMLType);
insert into TEST_XMLS  values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'));
insert into TEST_XMLS  values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'));
insert into TEST_XMLS  values (3, XMLType('<oil-rig
xml:id="14a_04" water="0.413"/><oil-rig
xml:id="14b_04" water="0.402"/>'));

select e.I, e.XMLVAL.getRootElement().getClobVal()
  from TEST_XMLS as e
  where e.XMLVAL.getRootElement() is not null
I                 callret
INTEGER NOT NULL  NVARCHAR
_______________________________________________________________________________

1                 <emp><empno>221</empno><ename>John</ename></emp>
2                 <po><pono>331</pono><poname>PO_1</poname></po>

2 Rows. -- 00000 msec.

select e.I, e.XMLVAL.getClobVal()
  from TEST_XMLS as e
  where e.XMLVAL.getRootElement() is null
I                 callret
INTEGER NOT NULL  NVARCHAR
_______________________________________________________________________________

3                 <oil-rig
xml:id="14a_05" water="0.413" /><oil-rig
xml:id="14b_05" water="0.402" />

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.isfragment.html" class="link"
title="XMLType.isFragment"><code
class="function">XMLType.isFragment() </code></a>

</div>

</div>
