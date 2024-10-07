<div id="fn_xte_node_from_nodebld" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xte_node_from_nodebld — Returns the vector corresponding to a XML
element

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xte_node_from_nodebld" class="funcsynopsis">

|                                    |                           |
|------------------------------------|---------------------------|
| ` `**`xte_node_from_nodebld`**` (` | in `head ` any ,          |
|                                    | inout `element ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xte_node_from_nodebld" class="refsect1">

## Description

This function replaces the first item of the second argument by the
first argument and returns a vector corresponding to an XML element.

</div>

<div id="xte_node_from_nodebld" class="refsect1">

## Parameters

<div id="id121644" class="refsect2">

### head

This argument is a vector returned by xte_head() function

</div>

<div id="id121647" class="refsect2">

### element

This argument is a vector created by xte_nodebld \_int() function and
then filled by xte_nodebld_acc and xte_nodebld_final() functions

</div>

</div>

<div id="errors_xte_node_from_nodebld" class="refsect1">

## Errors

<div id="id121652" class="table">

**Table 24.123. Errors signalled by `xte_node_from_nodebld `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                              | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR349 </span> | <span class="errortext">Too few arguments for xte_node_from_nodebld </span>                                             |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR350 </span> | <span class="errortext">The second argument of xte_node_from_nodebld is not made by xte_nodebld_init() function </span> |             |

</div>

</div>

  

</div>

<div id="xte_node_from_nodebld_01" class="refsect1">

## Examples

<div id="ex_xte_node_from_nodebld" class="example">

**Example 24.489. Simple Use**

<div class="example-contents">

The vector res below is corresponding to the following XML element:

\<product\>\<supplier CompanyName="Seller"\>\</supplier\>\</product\>

``` screen
create procedure test_nodebld()
              {
                declare acc any;
        declare res any;
                xte_nodebld_init (acc);
                xte_nodebld_acc(acc,xte_node(xte_head ('supplier', 'CompanyName','Seller')));
        acc:=xte_nodebld_final(acc);
                res:=xte_node_from_nodebld(xte_head('product'), acc);
        result (length(res), xml_tree_doc (res));
          };
test_nodebld()
ResLen      Res
INTEGER     VARCHAR
_______________________________________________________________________________

2           <product><supplier CompanyName="Seller" /></product>
```

</div>

</div>

  

</div>

<div id="seealso_xte_node_from_nodebld" class="refsect1">

## See Also

<a href="fn_xte_head.html" class="link" title="xte_head">xte_head()</a>

<a href="fn_xte_node.html" class="link" title="xte_node">xte_node()</a>

<a href="fn_xte_nodebld_acc.html" class="link"
title="xte_nodebld_acc">xte_nodebld_acc()</a>

<a href="fn_xte_nodebld_final.html" class="link"
title="xte_nodebld_final">xte_nodebld_final()</a>

<a href="fn_xte_nodebld_init.html" class="link"
title="xte_nodebld_init">xte_nodebld_init()</a>

</div>

</div>
