<div id="fn_xmltype.getnumval" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.getNumVal — This function returns the integer-value of the
current node like XPATH function 'number()'.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.getnumval" class="funcsynopsis">

|                                |      |
|--------------------------------|------|
| ` `**`XMLType.getNumVal`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.getnumval" class="refsect1">

## Description

This function returns the integer-value of the current node. This is
similar to the XPATH function 'number()'.

</div>

<div id="ret_xmltype.getnumval" class="refsect1">

## Return Types

The member function returns integer.

</div>

<div id="examples_xmltype.getnumval" class="refsect1">

## Examples

<div id="ex_xmltype.getnumval" class="example">

**Example 24.551. A table with an XMLType column**

<div class="example-contents">

This populates a table with XML data and then selects the numeric value
of an 'empno' element from the appropriate record.

``` screen
create table TEST_XMLS  (I integer primary key, XMLVAL XMLType);
insert into TEST_XMLS  values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'));
insert into TEST_XMLS  values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'));
insert into TEST_XMLS  values (3, XMLType('<oil-rig
xml:id="14a_03" water="0.413"/><oil-rig
xml:id="14b_03" water="0.402"/>'));
select e.XMLVAL.extract ('//empno').getNumVal() as EMPNO
  from TEST_XMLS  as e
  where e.XMLVAL.existsNode('/emp/empno')
EMPNO
DECIMAL
_______________________________________________________________________________

221

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.getnumval" class="refsect1">

## See Also

<a href="fn_xmltype.getstringval.html" class="link"
title="XMLType.getStringVal"><code
class="function">XMLType.getStringVal() </code></a>

<a href="fn_xmltype.getclobval.html" class="link"
title="XMLType.getClobVal"><code
class="function">XMLType.getClobVal() </code></a>

</div>

</div>
