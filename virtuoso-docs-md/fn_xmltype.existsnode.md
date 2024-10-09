<div>

<div>

</div>

<div>

## Name

XMLType.existsNode — Tests node existence having evaluated given XPATH
expression.

</div>

<div>

## Synopsis

<div>

|                                 |                                  |
|---------------------------------|----------------------------------|
| ` `**`XMLType.existsNode`**` (` | in `xpath_expn ` varchar ,       |
|                                 | in `namespace_map ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The member function calculates the given XPATH expression
*`xpath_expn `* using the XML entity of the instance as a context node.
If a *`namespace_map`* parameter is given then the function adds
namespace declarations from this parameter into the beginning of
*`xpath_expn`* before the evaluation. The function returns 1 if the
first result of XPATH evaluation is a node or 0 if there are no results
or if the first result is not a node.

</div>

<div>

## Parameters

<div>

### xpath_expn

A text of XPATH expression to evaluate.

</div>

<div>

### namespace_map

A string that is a list of namespace prefix declarations delimited by
whitespace characters. If the *`xpath_expn`* expression also contains a
list of declarations then these two lists are concatenated.

</div>

</div>

<div>

## Return Types

The function returns integer 1 or 0

</div>

<div>

## Examples

<div>

**Example 24.547. A table with an XMLType column**

<div>

This populates a table with XML data and then reports which rows contain
'empno' element inside 'emp'.

``` screen
create table TEST_XMLS  (I integer primary key, XMLVAL XMLType);
insert into TEST_XMLS  values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'));
insert into TEST_XMLS  values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'));
insert into TEST_XMLS  values (3, XMLType('<oil-rig
xml:id="14a" water="0.413"/><oil-rig
xml:id="14b" water="0.402"/>'));
select e.I, e.XMLVAL.existsNode('/emp/empno')
  from TEST_XMLS  as e
I                 callret
INTEGER NOT NULL  INTEGER
_______________________________________________________________________________

1                 1
2                 0
3                 0

3 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.extract.html" class="link"
title="XMLType.extract"><code
class="function">XMLType.extract() </code></a>

</div>

</div>
