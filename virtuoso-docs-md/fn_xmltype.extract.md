<div>

<div>

</div>

<div>

## Name

XMLType.extract — Evaluates given XPATH expression.

</div>

<div>

## Synopsis

<div>

|                              |                                  |
|------------------------------|----------------------------------|
| ` `**`XMLType.extract`**` (` | in `xpath_expn ` varchar ,       |
|                              | in `namespace_map ` varchar `)`; |

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
*`xpath_expn`* before the evaluation. The function returns the first
result of the XPATH evaluation or NULL if there are no results. If the
result is an XML entity then it is converted into a non-schema based
instance of XMLType.

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

The function returns a non-schema based XMLType instance, NULL or a
value of any other type

</div>

<div>

## Examples

<div>

**Example 24.548. A table with an XMLType column**

<div>

This populates a table with XML data and then selects 'ename' element
from the appropriate record.

``` screen
create table TEST_XMLS  (I integer primary key, XMLVAL XMLType);
insert into TEST_XMLS  values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'));
insert into TEST_XMLS  values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'));
insert into TEST_XMLS  values (3, XMLType('<oil-rig
xml:id="14a_01" water="0.413"/><oil-rig
xml:id="14b_01" water="0.402"/>'));
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

<a href="fn_xmltype.existsnode.html" class="link"
title="XMLType.existsNode"><code
class="function">XMLType.existsNode() </code></a>

</div>

</div>
