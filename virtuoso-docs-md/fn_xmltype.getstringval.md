<div id="fn_xmltype.getstringval" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.getStringVal — The function returns the string-value of the
current node like XPATH function 'string()'.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.getstringval" class="funcsynopsis">

|                                   |      |
|-----------------------------------|------|
| ` `**`XMLType.getStringVal`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.getstringval" class="refsect1">

## Description

The function returns the string-value of the current node. This is
similar to the XPATH function 'string()'.

</div>

<div id="ret_xmltype.getstringval" class="refsect1">

## Return Types

The member function returns wide string.

</div>

<div id="examples_xmltype.getstringval" class="refsect1">

## Examples

<div id="ex_xmltype.getstringval" class="example">

**Example 24.554. A table with an XMLType column**

<div class="example-contents">

This populates a table with XML data and then selects the string-value
of an 'ename' element from the appropriate record.

``` screen
create table TEST_XMLS  (I integer primary key, XMLVAL XMLType);
insert into TEST_XMLS  values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'));
insert into TEST_XMLS  values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'));
insert into TEST_XMLS  values (3, XMLType('<oil-rig
xml:id="14a_06" water="0.413"/><oil-rig
xml:id="14b_06" water="0.402"/>'));
select e.XMLVAL.extract ('//ename').getStringVal() as ENAME
  from TEST_XMLS  as e
  where e.XMLVAL.existsNode('/emp/empno')
ENAME
NVARCHAR
_______________________________________________________________________________

John

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.getstringval" class="refsect1">

## See Also

<a href="fn_xmltype.getnumval.html" class="link"
title="XMLType.getNumVal"><code
class="function">XMLType.getNumVal() </code></a>

<a href="fn_xmltype.getclobval.html" class="link"
title="XMLType.getClobVal"><code
class="function">XMLType.getClobVal() </code></a>

</div>

</div>
