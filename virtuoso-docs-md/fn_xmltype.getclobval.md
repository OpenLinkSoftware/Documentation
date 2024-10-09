<div>

<div>

</div>

<div>

## Name

XMLType.getClobVal — This function returns the serialization of the
current node like XPATH function 'serialize()', i.e. a text in XML
syntax.

</div>

<div>

## Synopsis

<div>

|                                 |      |
|---------------------------------|------|
| ` `**`XMLType.getClobVal`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the serialization of the current node. This is
similar to the XPATH function 'serialize()', i.e. a text in XML syntax.

</div>

<div>

## Return Types

The function returns wide string.

</div>

<div>

## Examples

<div>

**Example 24.549. A table with an XMLType column**

<div>

This populates a table with XML data and then selects string
representation of 'ename' element from the appropriate record.

``` screen
create table TEST_XMLS  (I integer primary key, XMLVAL XMLType);
insert into TEST_XMLS  values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'));
insert into TEST_XMLS  values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'));
insert into TEST_XMLS  values (3, XMLType('<oil-rig
xml:id="14a_02" water="0.413"/><oil-rig
xml:id="14b_02" water="0.402"/>'));
select e.XMLVAL.extract ('//ename').getCLobVal() as ENAME
  from TEST_XMLS  as e
 where e.XMLVAL.existsNode('/emp/empno')
ENAME
NVARCHAR
_______________________________________________________________________________

<ename>John</ename>

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.getstringval.html" class="link"
title="XMLType.getStringVal"><code
class="function">XMLType.getStringVal() </code></a>

<a href="fn_xmltype.getnumval.html" class="link"
title="XMLType.getNumVal"><code
class="function">XMLType.getNumVal() </code></a>

</div>

</div>
