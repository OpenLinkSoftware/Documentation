<div id="fn_xmltype.getclobval" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.getClobVal — This function returns the serialization of the
current node like XPATH function 'serialize()', i.e. a text in XML
syntax.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.getclobval" class="funcsynopsis">

|                                 |      |
|---------------------------------|------|
| ` `**`XMLType.getClobVal`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.getclobval" class="refsect1">

## Description

This function returns the serialization of the current node. This is
similar to the XPATH function 'serialize()', i.e. a text in XML syntax.

</div>

<div id="ret_xmltype.getclobval" class="refsect1">

## Return Types

The function returns wide string.

</div>

<div id="examples_xmltype.getclobval" class="refsect1">

## Examples

<div id="ex_xmltype.getclobval" class="example">

**Example 24.549. A table with an XMLType column**

<div class="example-contents">

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

<div id="seealso_xmltype.getclobval" class="refsect1">

## See Also

<a href="fn_xmltype.getstringval.html" class="link"
title="XMLType.getStringVal"><code
class="function">XMLType.getStringVal() </code></a>

<a href="fn_xmltype.getnumval.html" class="link"
title="XMLType.getNumVal"><code
class="function">XMLType.getNumVal() </code></a>

</div>

</div>
